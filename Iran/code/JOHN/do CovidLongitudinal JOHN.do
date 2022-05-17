
clear all

cd "$pathCovidLongitudinal"

cd JOHN

capture log close 

log using "log CovidLongitudinal JOHN.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal JOHN.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* get Johns Hopkins data for deaths
* input data files: csv files on web site "time_series_covid19_deaths_global.csv"
* output data files: "CovidLongitudinal JOHN.dta"


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(2:2)

save "time_series_covid19_deaths_global col 2.dta", replace


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(5)


save "time_series_covid19_deaths_global col 5 on.dta", replace


use "time_series_covid19_deaths_global col 2.dta", clear 

merge 1:1 _n using "time_series_covid19_deaths_global col 5 on.dta"


rename countryregion loc_grand_name

label var loc_grand_name "location grand name"

keep if regexm(loc_grand_name,"$country") == 1

order loc_grand_name, last

gen counter = _n

reshape long v, i(counter) 

drop counter 

codebook _j



gen date = date("22 Jan 2020", "DMY")

replace date = date + _j - 1

format date %td

codebook date

order date 

rename v TotDeaMeRaA00S00

label var TotDeaMeRaA00S00 "Total Deaths JOHN"

destring TotDeaMeRaA00S00, replace

list TotDeaMeRaA00S00 if date == td(19feb2020) 

gen DayDeaMeRaA00S00 =  TotDeaMeRaA00S00[_n] - TotDeaMeRaA00S00[_n-1]

label var DayDeaMeRaA00S00 "Daily Deaths JOHN"

replace DayDeaMeRaA00S00 = TotDeaMeRaA00S00 if _j == 1

replace TotDeaMeRaA00S00 = . if date < td(19feb2020)

replace DayDeaMeRaA00S00 = . if date < td(19feb2020)

drop _j _merge



order date loc_grand_name DayDeaMeRaA00S00 TotDeaMeRaA00S00 
					

sort date

isid date


save "country JOHN deaths.dta", replace












****** add obs 01 Jan 2020 to 21 Jan 2020 for better graphing

codebook date

expand 22 in 1

sort date

rename date date_original 

gen date = .

replace date = td(01Jan2020) in 1

replace date = date[_n-1] + 1 in 2/l

format date %tdDDMonCCYY

codebook date

drop date_original

order date

isid date


codebook date




* smooth 

tsset date, daily   


tssmooth ma DayDeaMeRaA00S00_window = DayDeaMeRaA00S00 if DayDeaMeRaA00S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA00S00 = DayDeaMeRaA00S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA00S00 "Daily deaths smooth A00 JOHN"

drop DayDeaMeRaA00S00_window

tsset, clear




* omit smoothed values that appear before the date that the raw values start 
replace DayDeaMeSmA00S00 = . if DayDeaMeRaA00S00 == .










***************************

/*
Smoothed daily deaths and daily cases with very small values 
lead to unduly inflated Percent Error and Absolute Percent Error. 
To remedy this problem, smoothed daily deaths and daily cases with 
values > 0 and < 0.05 are replace with 0.05.
Similarly, non-missing smoothed daily deaths and daily cases with values of zero
are replaced with 0.01.
*/

replace DayDeaMeSmA00S00 = 0.05 if DayDeaMeSmA00S00 > 0 & DayDeaMeSmA00S00 < 0.05

replace DayDeaMeSmA00S00 = 0.01 if DayDeaMeSmA00S00 == 0






drop if date > td(01Jan2022)



qui compress

sort date loc_grand_name


save "CovidLongitudinal JOHN.dta", replace

isid date


* graphs

grstyle init

grstyle color background white



twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(gray*.5)) /// 
(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, National, JOHN, 2020 on", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth") rows(1) size(small))  

qui graph export "graph 1 C19 daily deaths, $country, JOHN, 2020 on.pdf", replace




view "log CovidLongitudinal JOHN.smcl"

log close

exit, clear




