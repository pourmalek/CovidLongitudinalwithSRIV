
clear all

cd "$pathCovidLongitudinal/download/JOHN"

capture log close 

log using "log CovidLongitudinal JOHN.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal JOHN.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         

* Objective: Download data files for JOHN                                                                    
***************************************************************************


* input data files: "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

* output data files: "CovidLongitudinal JOHN.dta"

* output data dictionary files: "CovidLongitudinal JOHN data dictionary.csv"




****************************************
****************************************

* get Johns Hopkins data for deaths


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(1:2)

save "time_series_covid19_deaths_global col 2.dta", replace


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(5)

save "time_series_covid19_deaths_global col 5 on.dta", replace


use "time_series_covid19_deaths_global col 2.dta", clear 

merge 1:1 _n using "time_series_covid19_deaths_global col 5 on.dta"

drop _merge

order provincestate countryregion, last

count

qui destring v*, replace

collapse (sum) v*, by(countryregion) // sum to add subnational estimates to national level and omit subnational estimates

count

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name


gen counter = _n

reshape long v, i(counter) 


rename v TotDeaMeRaJOHN

label var TotDeaMeRaJOHN "Total deaths raw JOHN JOHN"

bysort loc_grand_name: gen DayDeaMeRaJOHN =  TotDeaMeRaJOHN[_n] - TotDeaMeRaJOHN[_n-1]

label var DayDeaMeRaJOHN "Daily deaths raw JOHN JOHN"

drop TotDeaMeRaJOHN



* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

bysort loc_grand_name: replace date = date + _j - 1

format date %td

label var date "calendar date"

codebook date

drop counter _j


replace DayDeaMeRaJOHN = 0 if date == td(22jan2020)
	
replace DayDeaMeRaJOHN = 17 if date == td(22jan2020) & loc_grand_name == "China" // first day report frpm China



* change JOHN country names to loc_grand_name country names

replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo" if loc_grand_name == "Congo (Brazzaville)"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Congo (Kinshasa)"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "Korea, North"

replace loc_grand_name = "Korea South" if loc_grand_name == "Korea, South"
replace loc_grand_name = "Myanmar" if loc_grand_name == "Burma"
replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza"
replace loc_grand_name = "Taiwan" if loc_grand_name == "Taiwan*"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"

replace loc_grand_name = "United States of America" if loc_grand_name == "US"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"





* drop non-countries

drop if loc_grand_name == "Antarctica"
drop if loc_grand_name == "Diamond Princess"
drop if loc_grand_name == "MS Zaandam"
drop if loc_grand_name == "Summer Olympics 2020"
drop if loc_grand_name == "Winter Olympics 2022"

codebook loc_grand_name



qui compress

save "CovidLongitudinal JOHN interim.dta", replace


shell rm -r "time_series_covid19_deaths_global col 2.dta"
shell rm -r "time_series_covid19_deaths_global col 5 on.dta"





use "CovidLongitudinal JOHN interim.dta", clear 

merge m:m loc_grand_name using "$pathCovidLongitudinal/master/loc_grand_name.dta"

keep if _merge == 3

drop _merge



* smooth

sort loc_grand_name date

encode loc_grand_name, gen(loc_grand_name_encoded)

qui tsset loc_grand_name_encoded date, daily   

	levelsof loc_grand_iso, local(levels) 
		
	foreach iso of local levels {
			
		di "Smoothing Daily Deaths; The current country iso is: " "`iso'"
					
		qui tssmooth ma DayDeaMeRaJOHN`iso'`update'_window = DayDeaMeRaJOHN`update' if DayDeaMeRaJOHN`update' >= 0 & loc_grand_iso == "`iso'", window(3 1 3) 

		qui tssmooth ma DayDeaMeSmJOHN`iso'`update' = DayDeaMeRaJOHN`iso'`update'_window if loc_grand_iso == "`iso'", weights( 1 2 3 <4> 3 2 1) replace

		drop *_window
		
		qui label var DayDeaMeSmJOHN`iso'`update' "Daily deaths smooth mean JOHN `iso'" 
		
}
*

drop DayDeaMeRaJOHN

qui compress

save "CovidLongitudinal JOHN.dta", replace







* gen calendar file

clear

di td(01jan2020) // 21915

di td(01jan2023) // 23011

di td(01jan2023) - td(01jan2020) + 1 // 1097



set obs 1097

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/1097

format date %tdDDMonCCYY

codebook date

save "calendar file.dta", replace

merge m:m date using "CovidLongitudinal JOHN.dta"

drop _merge


isid loc_grand_name date, sort missok


	
save "CovidLongitudinal JOHN.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "CovidLongitudinal JOHN data dictionary.csv", replace 
	
restore





view "log CovidLongitudinal JOHN.smcl"

log close

exit, clear




