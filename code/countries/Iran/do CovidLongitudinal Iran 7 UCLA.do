
clear all

cd "$pathCovidLongitudinal/countries/Iran"

capture log close 

log using "log CovidLongitudinal Iran 7 UCLA.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Iran 7 UCLA.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Iran <<----                                                                 
***************************************************************************


** model = UCLA ** <<-- modify 1 
* lcolor blue

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together

* input data files: "UCLA Iran.dta"
* output data files: "UCLA Iran error.dta" (with error measures saved)

* output data dictionary files: "UCLA Iran error data dictionary.csv"


* graph 03 Error
* graph 04 Absolute Error
* graph 05 Percent Error
* graph 06 Absolute Percent Error

* graph 07 mean over updates of median error by calendar months
* graph 08 Daily deaths, mean over updates of median absolute error by calendar months
* graph 09 Daily deaths, mean over updates of median % error by calendar months
* graph 10 Daily deaths, mean over updates of median absolute % error by calendar months

* graph 11 Daily deaths, Average MAPE over updates and calendar months




** graphs:
* "graph 03 Iran UCLA C19 daily deaths error.pdf"
* "graph 04 Iran UCLA C19 daily deaths absolute error.pdf"
* "graph 05 Iran UCLA C19 daily deaths percent error.pdf"
* "graph 06 Iran UCLA C19 daily deaths absolute percent error.pdf"

* "graph 07 Iran UCLA C19 daily deaths average median error.pdf"
* "graph 08 Iran UCLA C19 daily deaths average median absolute error.pdf"
* "graph 09 Iran UCLA C19 daily deaths average median percent error.pdf"
* "graph 10 Iran UCLA C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Iran UCLA C19 daily deaths Average MAPE over updates and calendar months


*********************

/*


CALCULATIONS:

Error = minus (Reference minus Model) 

Absolute error = | minus (Reference minus Model) |

Percent error = 100 * (minus (Reference minus Model)) / Reference

Absolute percent error = 100 * | minus (Reference minus Model) | / Reference




Error = - (Reference - Model)

Absolute error = | - (Reference - Model) |

Percent error = 100 * (- (Reference - Model)) / Reference

Absolute percent error = 100 * | - (Reference - Model)| / Reference

*/







use "UCLA Iran.dta", clear 




* gen months time bin


gen month = month(date)

gen monthstr = ""
replace monthstr = "01" if month == 1
replace monthstr = "02" if month == 2
replace monthstr = "03" if month == 3

replace monthstr = "04" if month == 4
replace monthstr = "05" if month == 5
replace monthstr = "06" if month == 6

replace monthstr = "07" if month == 7
replace monthstr = "08" if month == 8
replace monthstr = "09" if month == 9

replace monthstr = "10" if month == 10
replace monthstr = "11" if month == 11
replace monthstr = "12" if month == 12



gen year = year(date)

gen yearstr = ""
replace yearstr = "2020" if year == 2020
replace yearstr = "2021" if year == 2021
replace yearstr = "2022" if year == 2022
replace yearstr = "2023" if year == 2023


egen yearmonth = concat(yearstr monthstr), p(m)

replace yearmonth = "" if yearmonth == "2023m01"

sort date yearmonth 

isid date

label var month "calendar month"

label var monthstr "calendar month string"

label var year "calendar year"

label var yearstr "calendar year string" 

label var yearmonth "calendar year and month"

*


// <<-- modify 2

local list ///
20210103 ///
20210110 ///
20210206 ///
20210307 ///
20210315 ///
20210328 ///
20210404 ///
20210712 ///
20210719 ///
20210726 ///
20210802 ///
20210809 ///
20210816 ///
20210823 ///
20210830 ///
20210906 ///
20210913 ///
20210920 ///
20210927 ///
20211004 ///
20211011 ///
20211018 ///
20211025 ///
20211101 ///
20211108 ///
20211122 ///
20211129 ///
20211206 ///
20211213 ///
20211220


sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorUCLA`update'
gen DDErrorUCLA`update' = - (DayDeaMeSmJOHN - DayDeaMeFoUCLA`update')
label var DDErrorUCLA`update' "DayDeaMeFoUCLA`update' error"
qui replace DDErrorUCLA`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorUCLA`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorUCLA`update' = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran
                                                            // <<-- modify 3
capture drop DDAbsErrUCLA`update'
gen DDAbsErrUCLA`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoUCLA`update'))
label var DDAbsErrUCLA`update' "DayDeaMeFoUCLA`update' absolute error"
qui replace DDAbsErrUCLA`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrUCLA`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrUCLA`update' = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

capture drop DDPerErrUCLA`update'
gen DDPerErrUCLA`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoUCLA`update'))) / DayDeaMeSmJOHN
label var DDPerErrUCLA`update' "DayDeaMeFoUCLA`update' percent error"
qui replace DDPerErrUCLA`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrUCLA`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrUCLA`update' = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

capture drop DDAbPeErUCLA`update'
gen DDAbPeErUCLA`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoUCLA`update'))) / DayDeaMeSmJOHN
label var DDAbPeErUCLA`update' "DayDeaMeFoUCLA`update' absolute percent error" 
qui replace DDAbPeErUCLA`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErUCLA`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErUCLA`update' = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorUCLA`update'_Med1
bysort yearmonth : egen DDErrorUCLA`update'_Med1 = median(DDErrorUCLA`update')
label var DDErrorUCLA`update'_Med1 "DayDeaUCLA median error by calendar months and updates"
qui replace DDErrorUCLA`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorUCLA`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorUCLA`update'_Med1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

capture drop DDAbsErrUCLA`update'_Med1
bysort yearmonth : egen DDAbsErrUCLA`update'_Med1 = median(DDAbsErrUCLA`update')
label var DDAbsErrUCLA`update'_Med1 "DayDeaUCLA median absolute error by calendar months and updates"
qui replace DDAbsErrUCLA`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrUCLA`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrUCLA`update'_Med1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

capture drop DDPerErrUCLA`update'_Med1
bysort yearmonth : egen DDPerErrUCLA`update'_Med1 = median(DDPerErrUCLA`update')
label var DDPerErrUCLA`update'_Med1 "DayDeaUCLA median % error by calendar months and updates"
qui replace DDPerErrUCLA`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrUCLA`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrUCLA`update'_Med1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

capture drop DDAbPeErUCLA`update'_Med1
bysort yearmonth : egen DDAbPeErUCLA`update'_Med1 = median(DDAbPeErUCLA`update')
label var DDAbPeErUCLA`update'_Med1 "DayDeaUCLA median absolute % error by calendar months and updates" 
qui replace DDAbPeErUCLA`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErUCLA`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErUCLA`update'_Med1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorUCLA_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorUCLA20210103_Med1
order DDErrorUCLA20210110_Med1
order DDErrorUCLA20210206_Med1
order DDErrorUCLA20210307_Med1
order DDErrorUCLA20210315_Med1
order DDErrorUCLA20210328_Med1
order DDErrorUCLA20210404_Med1
order DDErrorUCLA20210712_Med1
order DDErrorUCLA20210719_Med1
order DDErrorUCLA20210726_Med1
order DDErrorUCLA20210802_Med1
order DDErrorUCLA20210809_Med1
order DDErrorUCLA20210816_Med1
order DDErrorUCLA20210823_Med1
order DDErrorUCLA20210830_Med1
order DDErrorUCLA20210906_Med1
order DDErrorUCLA20210913_Med1
order DDErrorUCLA20210920_Med1
order DDErrorUCLA20210927_Med1
order DDErrorUCLA20211004_Med1
order DDErrorUCLA20211011_Med1
order DDErrorUCLA20211018_Med1
order DDErrorUCLA20211025_Med1
order DDErrorUCLA20211101_Med1
order DDErrorUCLA20211108_Med1
order DDErrorUCLA20211122_Med1
order DDErrorUCLA20211129_Med1
order DDErrorUCLA20211206_Med1
order DDErrorUCLA20211213_Med1
order DDErrorUCLA20211220_Med1

		
capture drop DDErrorUCLA_Mean1 // "DDErrorUCLA mean over updates of median error by calendar months"
egen DDErrorUCLA_Mean1 = rowmean(DDErrorUCLA20211220_Med1-DDErrorUCLA20210103_Med1) // <<-- modify 5
label var DDErrorUCLA_Mean1 "DDErrorUCLA mean over updates of median error by calendar months"
qui replace DDErrorUCLA_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorUCLA_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorUCLA_Mean1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran






* gen DDAbsErrUCLA_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrUCLA20210103_Med1
order DDAbsErrUCLA20210110_Med1
order DDAbsErrUCLA20210206_Med1
order DDAbsErrUCLA20210307_Med1
order DDAbsErrUCLA20210315_Med1
order DDAbsErrUCLA20210328_Med1
order DDAbsErrUCLA20210404_Med1
order DDAbsErrUCLA20210712_Med1
order DDAbsErrUCLA20210719_Med1
order DDAbsErrUCLA20210726_Med1
order DDAbsErrUCLA20210802_Med1
order DDAbsErrUCLA20210809_Med1
order DDAbsErrUCLA20210816_Med1
order DDAbsErrUCLA20210823_Med1
order DDAbsErrUCLA20210830_Med1
order DDAbsErrUCLA20210906_Med1
order DDAbsErrUCLA20210913_Med1
order DDAbsErrUCLA20210920_Med1
order DDAbsErrUCLA20210927_Med1
order DDAbsErrUCLA20211004_Med1
order DDAbsErrUCLA20211011_Med1
order DDAbsErrUCLA20211018_Med1
order DDAbsErrUCLA20211025_Med1
order DDAbsErrUCLA20211101_Med1
order DDAbsErrUCLA20211108_Med1
order DDAbsErrUCLA20211122_Med1
order DDAbsErrUCLA20211129_Med1
order DDAbsErrUCLA20211206_Med1
order DDAbsErrUCLA20211213_Med1
order DDAbsErrUCLA20211220_Med1


capture drop DDAbsErrUCLA_Mean1 // "DDAbsErrUCLA mean over updates of median absolute error by calendar months"
egen DDAbsErrUCLA_Mean1 = rowmean(DDAbsErrUCLA20211220_Med1-DDAbsErrUCLA20210103_Med1) // <<-- modify 7
label var DDAbsErrUCLA_Mean1 "DDAbsErrUCLA mean over updates of median absolute error by calendar months"
qui replace DDAbsErrUCLA_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrUCLA_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrUCLA_Mean1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran







* gen DDPerErrUCLA_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrUCLA20210103_Med1
order DDPerErrUCLA20210110_Med1
order DDPerErrUCLA20210206_Med1
order DDPerErrUCLA20210307_Med1
order DDPerErrUCLA20210315_Med1
order DDPerErrUCLA20210328_Med1
order DDPerErrUCLA20210404_Med1
order DDPerErrUCLA20210712_Med1
order DDPerErrUCLA20210719_Med1
order DDPerErrUCLA20210726_Med1
order DDPerErrUCLA20210802_Med1
order DDPerErrUCLA20210809_Med1
order DDPerErrUCLA20210816_Med1
order DDPerErrUCLA20210823_Med1
order DDPerErrUCLA20210830_Med1
order DDPerErrUCLA20210906_Med1
order DDPerErrUCLA20210913_Med1
order DDPerErrUCLA20210920_Med1
order DDPerErrUCLA20210927_Med1
order DDPerErrUCLA20211004_Med1
order DDPerErrUCLA20211011_Med1
order DDPerErrUCLA20211018_Med1
order DDPerErrUCLA20211025_Med1
order DDPerErrUCLA20211101_Med1
order DDPerErrUCLA20211108_Med1
order DDPerErrUCLA20211122_Med1
order DDPerErrUCLA20211129_Med1
order DDPerErrUCLA20211206_Med1
order DDPerErrUCLA20211213_Med1
order DDPerErrUCLA20211220_Med1


capture drop DDPerErrUCLA_Mean1 // "DDPerErrUCLA mean over updates of median absolute % error by calendar months"
egen DDPerErrUCLA_Mean1 = rowmean(DDPerErrUCLA20211220_Med1-DDPerErrUCLA20210103_Med1) // <<-- modify 9
label var DDPerErrUCLA_Mean1 "DDPerErrUCLA mean over updates of median % error by calendar months"
qui replace DDPerErrUCLA_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrUCLA_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrUCLA_Mean1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

 
 
 

* gen DDAbPeErUCLA_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErUCLA20210103_Med1
order DDAbPeErUCLA20210110_Med1
order DDAbPeErUCLA20210206_Med1
order DDAbPeErUCLA20210307_Med1
order DDAbPeErUCLA20210315_Med1
order DDAbPeErUCLA20210328_Med1
order DDAbPeErUCLA20210404_Med1
order DDAbPeErUCLA20210712_Med1
order DDAbPeErUCLA20210719_Med1
order DDAbPeErUCLA20210726_Med1
order DDAbPeErUCLA20210802_Med1
order DDAbPeErUCLA20210809_Med1
order DDAbPeErUCLA20210816_Med1
order DDAbPeErUCLA20210823_Med1
order DDAbPeErUCLA20210830_Med1
order DDAbPeErUCLA20210906_Med1
order DDAbPeErUCLA20210913_Med1
order DDAbPeErUCLA20210920_Med1
order DDAbPeErUCLA20210927_Med1
order DDAbPeErUCLA20211004_Med1
order DDAbPeErUCLA20211011_Med1
order DDAbPeErUCLA20211018_Med1
order DDAbPeErUCLA20211025_Med1
order DDAbPeErUCLA20211101_Med1
order DDAbPeErUCLA20211108_Med1
order DDAbPeErUCLA20211122_Med1
order DDAbPeErUCLA20211129_Med1
order DDAbPeErUCLA20211206_Med1
order DDAbPeErUCLA20211213_Med1
order DDAbPeErUCLA20211220_Med1


capture drop DDAbPeErUCLA_Mean1 // "DDAbPeErUCLA mean over updates of median absolute % error by calendar months"
egen DDAbPeErUCLA_Mean1 = rowmean(DDAbPeErUCLA20211220_Med1-DDAbPeErUCLA20210103_Med1) // <<-- modify 11
label var DDAbPeErUCLA_Mean1 "DDAbPeErUCLA mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErUCLA_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErUCLA_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErUCLA_Mean1 = . if date < td(03jan2021) // 03jan2021 is the earliest date of UCLA forecasts for Iran

 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorUCLA_Mean2 = mean(DDErrorUCLA_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorUCLA_Mean2 "DDErrorUCLA Mean over calendar months of median error over updates"

egen DDAbsErrUCLA_Mean2 = mean(DDAbsErrUCLA_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrUCLA_Mean2 "DDAbsErrUCLA Mean over calendar months of median absolute error over updates"

egen DDPerErrUCLA_Mean2 = mean(DDPerErrUCLA_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrUCLA_Mean2 "DDPerErrUCLA Mean over calendar months of median % error over updates"

egen DDAbPeErUCLA_Mean2 = mean(DDAbPeErUCLA_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErUCLA_Mean2 "DDAbPeErUCLA Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorUCLA20210103 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210110 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210307 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210315 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210328 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210404 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210712 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210719 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210726 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210802 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210809 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210816 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210823 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210830 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210906 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210913 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210920 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20210927 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211004 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211011 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211018 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211025 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211101 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211108 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211122 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211129 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211213 date, sort lcolor(blue) lwidth(thin)) ///
(line DDErrorUCLA20211220 date, sort lcolor(blue) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Iran, UCLA, all updates, forecast only", size(small)) 

qui graph export "graph 03 Iran UCLA C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrUCLA20210103 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210110 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210307 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210315 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210328 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210404 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210712 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210719 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210726 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210802 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210809 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210816 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210823 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210830 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210906 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210913 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210920 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20210927 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211004 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211011 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211018 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211025 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211101 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211108 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211122 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211129 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211213 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbsErrUCLA20211220 date, sort lcolor(blue) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Iran, UCLA, all updates, forecast only", size(small))

qui graph export "graph 04 Iran UCLA C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrUCLA20210103 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210110 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210307 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210315 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210328 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210404 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210712 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210719 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210726 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210802 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210809 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210816 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210823 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210830 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210906 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210913 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210920 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20210927 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211004 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211011 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211018 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211025 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211101 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211108 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211122 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211129 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211213 date, sort lcolor(blue) lwidth(thin)) ///
(line DDPerErrUCLA20211220 date, sort lcolor(blue) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Iran, UCLA, all updates, forecast only", size(small))

qui graph export "graph 05 Iran UCLA C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* UCLA lcolor blue // <<-- modify 16

twoway ///
(line DDAbPeErUCLA20210103 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210110 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210307 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210315 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210328 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210404 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210712 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210719 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210726 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210802 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210809 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210816 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210823 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210830 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210906 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210913 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210920 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20210927 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211004 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211011 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211018 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211025 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211101 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211108 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211122 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211129 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211206 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211213 date, sort lcolor(blue) lwidth(thin)) ///
(line DDAbPeErUCLA20211220 date, sort lcolor(blue) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Iran, UCLA, all updates, forecast only", size(small))

qui graph export "graph 06 Iran UCLA C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Iran, UCLA, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Iran UCLA C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorUCLA_Mean1_window = DDErrorUCLA_Mean1, window(3 1 3)

tssmooth ma DDErrorUCLA_Mean1_sm = DDErrorUCLA_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorUCLA_Mean1_sm "Daily deaths UCLA average median error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Iran, UCLA, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Iran UCLA C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrUCLA_Mean1_window = DDAbsErrUCLA_Mean1, window(3 1 3)

tssmooth ma DDAbsErrUCLA_Mean1_sm = DDAbsErrUCLA_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrUCLA_Mean1_sm "Daily deaths UCLA average median absolute error smooth"

drop *_window

// tsset, clear

*











***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Iran, UCLA, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Iran UCLA C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrUCLA_Mean1_window = DDPerErrUCLA_Mean1, window(3 1 3)

tssmooth ma DDPerErrUCLA_Mean1_sm = DDPerErrUCLA_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrUCLA_Mean1_sm "Daily deaths UCLA average median percent error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErUCLA_Mean1 date, sort lcolor(blue) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Iran, UCLA, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Iran UCLA C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErUCLA_Mean1_window = DDAbPeErUCLA_Mean1, window(3 1 3)

tssmooth ma DDAbPeErUCLA_Mean1_sm = DDAbPeErUCLA_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErUCLA_Mean1_sm "Daily deaths UCLA average median absolute percent error smooth"

drop *_window

tsset, clear

*






***********************************************

capture drop *2str

summ DDAbPeErUCLA_Mean2, meanonly

local DDAbPeErUCLA_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErUCLA_Mean2str = `DDAbPeErUCLA_Mean2str'
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErUCLA_Mean2str /// 
, bar(1, fcolor(blue) lcolor(blue)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Iran, UCLA, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Iran UCLA C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "UCLA Iran error.dta", replace 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "UCLA Iran error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Iran 7 UCLA.smcl"

log close

exit, clear

