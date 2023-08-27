
clear all

cd "$pathCovidLongitudinal/countries/Lesotho"

capture log close 

log using "log CovidLongitudinal Lesotho 3 IHME.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Lesotho 3 IHME.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Lesotho <<----                                                                 
***************************************************************************


** model = IHME ** <<-- modify 1
* lcolor black

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together


* input data files: "IHME Lesotho.dta"
* output data files: "IHME Lesotho error.dta" (with error measures saved)

* output data dictionary files: "IHME Lesotho error data dictionary.csv"


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
* "graph 03 Lesotho IHME C19 daily deaths error.pdf"
* "graph 04 Lesotho IHME C19 daily deaths absolute error.pdf"
* "graph 05 Lesotho IHME C19 daily deaths percent error.pdf"
* "graph 06 Lesotho IHME C19 daily deaths absolute percent error.pdf"

* "graph 07 Lesotho IHME C19 daily deaths average median error.pdf"
* "graph 08 Lesotho IHME C19 daily deaths average median absolute error.pdf"
* "graph 09 Lesotho IHME C19 daily deaths average median percent error.pdf"
* "graph 10 Lesotho IHME C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Lesotho IHME C19 daily deaths Average MAPE over updates and calendar months.pdf"


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







use "IHME Lesotho.dta", clear 


label var location_id "location id IHME"

// label var deaths_data_type "deaths data type IHME"




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
20220218 ///
20220321 ///
20220408 ///
20220506 ///
20220610 ///
20220719 ///
20220912 ///
20221024 ///
20221118 ///
20221216


sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorIHME`update'
gen DDErrorIHME`update' = - (DayDeaMeSmJOHN - DayDeaMeFoIHME`update')
label var DDErrorIHME`update' "DayDeaMeFoIHME`update' error"
qui replace DDErrorIHME`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorIHME`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorIHME`update' = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho
                                                            // <<-- modify 3
capture drop DDAbsErrIHME`update'
gen DDAbsErrIHME`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoIHME`update'))
label var DDAbsErrIHME`update' "DayDeaMeFoIHME`update' absolute error"
qui replace DDAbsErrIHME`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrIHME`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrIHME`update' = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

capture drop DDPerErrIHME`update'
gen DDPerErrIHME`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoIHME`update'))) / DayDeaMeSmJOHN
label var DDPerErrIHME`update' "DayDeaMeFoIHME`update' percent error"
qui replace DDPerErrIHME`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrIHME`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrIHME`update' = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

capture drop DDAbPeErIHME`update'
gen DDAbPeErIHME`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoIHME`update'))) / DayDeaMeSmJOHN
label var DDAbPeErIHME`update' "DayDeaMeFoIHME`update' absolute percent error" 
qui replace DDAbPeErIHME`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErIHME`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErIHME`update' = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorIHME`update'_Med1
bysort yearmonth : egen DDErrorIHME`update'_Med1 = median(DDErrorIHME`update')
label var DDErrorIHME`update'_Med1 "DayDeaIHME median error by calendar months and updates"
qui replace DDErrorIHME`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorIHME`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorIHME`update'_Med1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

capture drop DDAbsErrIHME`update'_Med1
bysort yearmonth : egen DDAbsErrIHME`update'_Med1 = median(DDAbsErrIHME`update')
label var DDAbsErrIHME`update'_Med1 "DayDeaIHME median absolute error by calendar months and updates"
qui replace DDAbsErrIHME`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrIHME`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrIHME`update'_Med1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

capture drop DDPerErrIHME`update'_Med1
bysort yearmonth : egen DDPerErrIHME`update'_Med1 = median(DDPerErrIHME`update')
label var DDPerErrIHME`update'_Med1 "DayDeaIHME median % error by calendar months and updates"
qui replace DDPerErrIHME`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrIHME`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrIHME`update'_Med1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

capture drop DDAbPeErIHME`update'_Med1
bysort yearmonth : egen DDAbPeErIHME`update'_Med1 = median(DDAbPeErIHME`update')
label var DDAbPeErIHME`update'_Med1 "DayDeaIHME median absolute % error by calendar months and updates" 
qui replace DDAbPeErIHME`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErIHME`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErIHME`update'_Med1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorIHME_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorIHME20220218_Med1
order DDErrorIHME20220321_Med1
order DDErrorIHME20220408_Med1
order DDErrorIHME20220506_Med1
order DDErrorIHME20220610_Med1
order DDErrorIHME20220719_Med1
order DDErrorIHME20220912_Med1
order DDErrorIHME20221024_Med1
order DDErrorIHME20221118_Med1
order DDErrorIHME20221216_Med1

		
capture drop DDErrorIHME_Mean1 // "DDErrorIHME mean over updates of median error by calendar months"
egen DDErrorIHME_Mean1 = rowmean(DDErrorIHME20221216_Med1-DDErrorIHME20220218_Med1) // <<-- modify 5
label var DDErrorIHME_Mean1 "DDErrorIHME mean over updates of median error by calendar months"
qui replace DDErrorIHME_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorIHME_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorIHME_Mean1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho






* gen DDAbsErrIHME_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrIHME20220218_Med1
order DDAbsErrIHME20220321_Med1
order DDAbsErrIHME20220408_Med1
order DDAbsErrIHME20220506_Med1
order DDAbsErrIHME20220610_Med1
order DDAbsErrIHME20220719_Med1
order DDAbsErrIHME20220912_Med1
order DDAbsErrIHME20221024_Med1
order DDAbsErrIHME20221118_Med1
order DDAbsErrIHME20221216_Med1


capture drop DDAbsErrIHME_Mean1 // "DDAbsErrIHME mean over updates of median absolute error by calendar months"
egen DDAbsErrIHME_Mean1 = rowmean(DDAbsErrIHME20221216_Med1-DDAbsErrIHME20220218_Med1) // <<-- modify 7
label var DDAbsErrIHME_Mean1 "DDAbsErrIHME mean over updates of median absolute error by calendar months"
qui replace DDAbsErrIHME_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrIHME_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrIHME_Mean1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho







* gen DDPerErrIHME_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrIHME20220218_Med1
order DDPerErrIHME20220321_Med1
order DDPerErrIHME20220408_Med1
order DDPerErrIHME20220506_Med1
order DDPerErrIHME20220610_Med1
order DDPerErrIHME20220719_Med1
order DDPerErrIHME20220912_Med1
order DDPerErrIHME20221024_Med1
order DDPerErrIHME20221118_Med1
order DDPerErrIHME20221216_Med1
		

capture drop DDPerErrIHME_Mean1 // "DDPerErrIHME mean over updates of median % error by calendar months"
egen DDPerErrIHME_Mean1 = rowmean(DDPerErrIHME20221216_Med1-DDPerErrIHME20220218_Med1) // <<-- modify 9
label var DDPerErrIHME_Mean1 "DDPerErrIHME mean over updates of median % error by calendar months"
qui replace DDPerErrIHME_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrIHME_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrIHME_Mean1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho








* gen DDAbPeErIHME_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 
order DDAbPeErIHME20220218_Med1
order DDAbPeErIHME20220321_Med1
order DDAbPeErIHME20220408_Med1
order DDAbPeErIHME20220506_Med1
order DDAbPeErIHME20220610_Med1
order DDAbPeErIHME20220719_Med1
order DDAbPeErIHME20220912_Med1
order DDAbPeErIHME20221024_Med1
order DDAbPeErIHME20221118_Med1
order DDAbPeErIHME20221216_Med1


capture drop DDAbPeErIHME_Mean1 // "DDAbPeErIHME mean over updates of median absolute % error by calendar months"
egen DDAbPeErIHME_Mean1 = rowmean(DDAbPeErIHME20221216_Med1-DDAbPeErIHME20220218_Med1) // <<-- modify 11
label var DDAbPeErIHME_Mean1 "DDAbPeErIHME mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErIHME_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErIHME_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErIHME_Mean1 = . if date < td(18feb2022) // 18feb2022 is the earliest date of IHME forecasts for Lesotho


 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorIHME_Mean2 = mean(DDErrorIHME_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorIHME_Mean2 "DDErrorIHME Mean over calendar months of median error over updates"

egen DDAbsErrIHME_Mean2 = mean(DDAbsErrIHME_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrIHME_Mean2 "DDAbsErrIHME Mean over calendar months of median absolute error over updates"

egen DDPerErrIHME_Mean2 = mean(DDPerErrIHME_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrIHME_Mean2 "DDPerErrIHME Mean over calendar months of median % error over updates"

egen DDAbPeErIHME_Mean2 = mean(DDAbPeErIHME_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErIHME_Mean2 "DDAbPeErIHME Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorIHME20220218 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20220321 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20220408 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20220506 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20220610 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20220719 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20220912 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20221024 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20221118 date, sort lcolor(black) lwidth(thin)) ///
(line DDErrorIHME20221216 date, sort lcolor(black) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Lesotho, IHME, all updates, forecast only", size(small)) 

qui graph export "graph 03 Lesotho IHME C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrIHME20220218 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20220321 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20220408 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20220506 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20220610 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20220719 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20220912 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20221024 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20221118 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbsErrIHME20221216 date, sort lcolor(black) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Lesotho, IHME, all updates, forecast only", size(small))

qui graph export "graph 04 Lesotho IHME C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrIHME20220218 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20220321 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20220408 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20220506 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20220610 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20220719 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20220912 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20221024 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20221118 date, sort lcolor(black) lwidth(thin)) ///
(line DDPerErrIHME20221216 date, sort lcolor(black) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Lesotho, IHME, all updates, forecast only", size(small))

qui graph export "graph 05 Lesotho IHME C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* IHME lcolor black // <<-- modify 16

twoway ///
(line DDAbPeErIHME20220218 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20220321 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20220408 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20220506 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20220610 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20220719 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20220912 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20221024 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20221118 date, sort lcolor(black) lwidth(thin)) ///
(line DDAbPeErIHME20221216 date, sort lcolor(black) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Lesotho, IHME, all updates, forecast only", size(small))

qui graph export "graph 06 Lesotho IHME C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Lesotho, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Lesotho IHME C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorIHME_Mean1_window = DDErrorIHME_Mean1, window(3 1 3)

tssmooth ma DDErrorIHME_Mean1_sm = DDErrorIHME_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorIHME_Mean1_sm "Daily deaths IHME average median error smooth"

drop *_window

// tsset, clear

*













***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.1fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Lesotho, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Lesotho IHME C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrIHME_Mean1_window = DDAbsErrIHME_Mean1, window(3 1 3)

tssmooth ma DDAbsErrIHME_Mean1_sm = DDAbsErrIHME_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrIHME_Mean1_sm "Daily deaths IHME average median absolute error smooth"

drop *_window

// tsset, clear

*











***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Lesotho, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Lesotho IHME C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrIHME_Mean1_window = DDPerErrIHME_Mean1, window(3 1 3)

tssmooth ma DDPerErrIHME_Mean1_sm = DDPerErrIHME_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrIHME_Mean1_sm "Daily deaths IHME average median percent error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Lesotho, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Lesotho IHME C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErIHME_Mean1_window = DDAbPeErIHME_Mean1, window(3 1 3)

tssmooth ma DDAbPeErIHME_Mean1_sm = DDAbPeErIHME_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErIHME_Mean1_sm "Daily deaths IHME average median absolute percent error smooth"

drop *_window

tsset, clear

*






***********************************************

capture drop *2str

summ DDAbPeErIHME_Mean2, meanonly

local DDAbPeErIHME_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErIHME_Mean2str = `DDAbPeErIHME_Mean2str'

label var DDAbPeErIHME_Mean2str "DDAbPeErIHME Mean over calendar months of median absolute % error over updates string"
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErIHME_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Lesotho, IHME, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Lesotho IHME C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "IHME Lesotho error.dta", replace 




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IHME Lesotho error data dictionary.csv", replace 
	
restore




view "log CovidLongitudinal Lesotho 3 IHME.smcl"

log close

exit, clear

