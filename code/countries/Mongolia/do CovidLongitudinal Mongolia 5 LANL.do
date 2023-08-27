
clear all

cd "$pathCovidLongitudinal/countries/Mongolia"

capture log close 

log using "log CovidLongitudinal Mongolia 5 LANL.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Mongolia 5 LANL.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Mongolia <<----                                                                 
***************************************************************************


** model = LANL ** <<-- modify 1
* lcolor brown

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together


* input data files: "LANL Mongolia.dta"
* output data files: "LANL Mongolia error.dta" (with error measures saved)

* output data dictionary files: "LANL Mongolia error data dictionary.csv"


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
* "graph 03 Mongolia LANL C19 daily deaths error.pdf"
* "graph 04 Mongolia LANL C19 daily deaths absolute error.pdf"
* "graph 05 Mongolia LANL C19 daily deaths percent error.pdf"
* "graph 06 Mongolia LANL C19 daily deaths absolute percent error.pdf"

* "graph 07 Mongolia LANL C19 daily deaths average median error.pdf"
* "graph 08 Mongolia LANL C19 daily deaths average median absolute error.pdf"
* "graph 09 Mongolia LANL C19 daily deaths average median percent error.pdf"
* "graph 10 Mongolia LANL C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Mongolia LANL C19 daily deaths Average MAPE over updates and calendar months


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







use "LANL Mongolia.dta", clear 




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
20210411 ///
20210414 ///
20210418 ///
20210421 ///
20210425 ///
20210428 ///
20210502 ///
20210505 ///
20210509 ///
20210512 ///
20210516 ///
20210519 ///
20210523 ///
20210526 ///
20210602 ///
20210606 ///
20210613 ///
20210620 ///
20210627 ///
20210704 ///
20210711 ///
20210718 ///
20210725 ///
20210801 ///
20210808 ///
20210815 ///
20210822 ///
20210829 ///
20210905 ///
20210912 ///
20210919 ///
20210926



sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorLANL`update'
gen DDErrorLANL`update' = - (DayDeaMeSmJOHN - DayDeaMeFoLANL`update')
label var DDErrorLANL`update' "DayDeaMeFoLANL`update' error"
qui replace DDErrorLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL`update' = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia
                                                            // <<-- modify 3
capture drop DDAbsErrLANL`update'
gen DDAbsErrLANL`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))
label var DDAbsErrLANL`update' "DayDeaMeFoLANL`update' absolute error"
qui replace DDAbsErrLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL`update' = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

capture drop DDPerErrLANL`update'
gen DDPerErrLANL`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))) / DayDeaMeSmJOHN
label var DDPerErrLANL`update' "DayDeaMeFoLANL`update' percent error"
qui replace DDPerErrLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL`update' = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

capture drop DDAbPeErLANL`update'
gen DDAbPeErLANL`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))) / DayDeaMeSmJOHN
label var DDAbPeErLANL`update' "DayDeaMeFoLANL`update' absolute percent error" 
qui replace DDAbPeErLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL`update' = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorLANL`update'_Med1
bysort yearmonth : egen DDErrorLANL`update'_Med1 = median(DDErrorLANL`update')
label var DDErrorLANL`update'_Med1 "DayDeaLANL median error by calendar months and updates"
qui replace DDErrorLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL`update'_Med1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

capture drop DDAbsErrLANL`update'_Med1
bysort yearmonth : egen DDAbsErrLANL`update'_Med1 = median(DDAbsErrLANL`update')
label var DDAbsErrLANL`update'_Med1 "DayDeaLANL median absolute error by calendar months and updates"
qui replace DDAbsErrLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL`update'_Med1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

capture drop DDPerErrLANL`update'_Med1
bysort yearmonth : egen DDPerErrLANL`update'_Med1 = median(DDPerErrLANL`update')
label var DDPerErrLANL`update'_Med1 "DayDeaLANL median % error by calendar months and updates"
qui replace DDPerErrLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL`update'_Med1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

capture drop DDAbPeErLANL`update'_Med1
bysort yearmonth : egen DDAbPeErLANL`update'_Med1 = median(DDAbPeErLANL`update')
label var DDAbPeErLANL`update'_Med1 "DayDeaLANL median absolute % error by calendar months and updates" 
qui replace DDAbPeErLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL`update'_Med1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorLANL20210411_Med1
order DDErrorLANL20210414_Med1
order DDErrorLANL20210418_Med1
order DDErrorLANL20210421_Med1
order DDErrorLANL20210425_Med1
order DDErrorLANL20210428_Med1
order DDErrorLANL20210502_Med1
order DDErrorLANL20210505_Med1
order DDErrorLANL20210509_Med1
order DDErrorLANL20210512_Med1
order DDErrorLANL20210516_Med1
order DDErrorLANL20210519_Med1
order DDErrorLANL20210523_Med1
order DDErrorLANL20210526_Med1
order DDErrorLANL20210602_Med1
order DDErrorLANL20210606_Med1
order DDErrorLANL20210613_Med1
order DDErrorLANL20210620_Med1
order DDErrorLANL20210627_Med1
order DDErrorLANL20210704_Med1
order DDErrorLANL20210711_Med1
order DDErrorLANL20210718_Med1
order DDErrorLANL20210725_Med1
order DDErrorLANL20210801_Med1
order DDErrorLANL20210808_Med1
order DDErrorLANL20210815_Med1
order DDErrorLANL20210822_Med1
order DDErrorLANL20210829_Med1
order DDErrorLANL20210905_Med1
order DDErrorLANL20210912_Med1
order DDErrorLANL20210919_Med1
order DDErrorLANL20210926_Med1

		
capture drop DDErrorLANL_Mean1 // "DDErrorLANL mean over updates of median error by calendar months"
egen DDErrorLANL_Mean1 = rowmean(DDErrorLANL20210926_Med1-DDErrorLANL20210411_Med1) // <<-- modify 5
label var DDErrorLANL_Mean1 "DDErrorLANL mean over updates of median error by calendar months"
qui replace DDErrorLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL_Mean1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia






* gen DDAbsErrLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrLANL20210411_Med1
order DDAbsErrLANL20210414_Med1
order DDAbsErrLANL20210418_Med1
order DDAbsErrLANL20210421_Med1
order DDAbsErrLANL20210425_Med1
order DDAbsErrLANL20210428_Med1
order DDAbsErrLANL20210502_Med1
order DDAbsErrLANL20210505_Med1
order DDAbsErrLANL20210509_Med1
order DDAbsErrLANL20210512_Med1
order DDAbsErrLANL20210516_Med1
order DDAbsErrLANL20210519_Med1
order DDAbsErrLANL20210523_Med1
order DDAbsErrLANL20210526_Med1
order DDAbsErrLANL20210602_Med1
order DDAbsErrLANL20210606_Med1
order DDAbsErrLANL20210613_Med1
order DDAbsErrLANL20210620_Med1
order DDAbsErrLANL20210627_Med1
order DDAbsErrLANL20210704_Med1
order DDAbsErrLANL20210711_Med1
order DDAbsErrLANL20210718_Med1
order DDAbsErrLANL20210725_Med1
order DDAbsErrLANL20210801_Med1
order DDAbsErrLANL20210808_Med1
order DDAbsErrLANL20210815_Med1
order DDAbsErrLANL20210822_Med1
order DDAbsErrLANL20210829_Med1
order DDAbsErrLANL20210905_Med1
order DDAbsErrLANL20210912_Med1
order DDAbsErrLANL20210919_Med1
order DDAbsErrLANL20210926_Med1


capture drop DDAbsErrLANL_Mean1 // "DDAbsErrLANL mean over updates of median absolute error by calendar months"
egen DDAbsErrLANL_Mean1 = rowmean(DDAbsErrLANL20210926_Med1-DDAbsErrLANL20210411_Med1) // <<-- modify 7
label var DDAbsErrLANL_Mean1 "DDAbsErrLANL mean over updates of median absolute error by calendar months"
qui replace DDAbsErrLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL_Mean1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia







* gen DDPerErrLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrLANL20210411_Med1
order DDPerErrLANL20210414_Med1
order DDPerErrLANL20210418_Med1
order DDPerErrLANL20210421_Med1
order DDPerErrLANL20210425_Med1
order DDPerErrLANL20210428_Med1
order DDPerErrLANL20210502_Med1
order DDPerErrLANL20210505_Med1
order DDPerErrLANL20210509_Med1
order DDPerErrLANL20210512_Med1
order DDPerErrLANL20210516_Med1
order DDPerErrLANL20210519_Med1
order DDPerErrLANL20210523_Med1
order DDPerErrLANL20210526_Med1
order DDPerErrLANL20210602_Med1
order DDPerErrLANL20210606_Med1
order DDPerErrLANL20210613_Med1
order DDPerErrLANL20210620_Med1
order DDPerErrLANL20210627_Med1
order DDPerErrLANL20210704_Med1
order DDPerErrLANL20210711_Med1
order DDPerErrLANL20210718_Med1
order DDPerErrLANL20210725_Med1
order DDPerErrLANL20210801_Med1
order DDPerErrLANL20210808_Med1
order DDPerErrLANL20210815_Med1
order DDPerErrLANL20210822_Med1
order DDPerErrLANL20210829_Med1
order DDPerErrLANL20210905_Med1
order DDPerErrLANL20210912_Med1
order DDPerErrLANL20210919_Med1
order DDPerErrLANL20210926_Med1


capture drop DDPerErrLANL_Mean1 // "DDPerErrLANL mean over updates of median absolute % error by calendar months"
egen DDPerErrLANL_Mean1 = rowmean(DDPerErrLANL20210926_Med1-DDPerErrLANL20210411_Med1) // <<-- modify 9
label var DDPerErrLANL_Mean1 "DDPerErrLANL mean over updates of median % error by calendar months"
qui replace DDPerErrLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL_Mean1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

 
 
 

* gen DDAbPeErLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErLANL20210411_Med1
order DDAbPeErLANL20210414_Med1
order DDAbPeErLANL20210418_Med1
order DDAbPeErLANL20210421_Med1
order DDAbPeErLANL20210425_Med1
order DDAbPeErLANL20210428_Med1
order DDAbPeErLANL20210502_Med1
order DDAbPeErLANL20210505_Med1
order DDAbPeErLANL20210509_Med1
order DDAbPeErLANL20210512_Med1
order DDAbPeErLANL20210516_Med1
order DDAbPeErLANL20210519_Med1
order DDAbPeErLANL20210523_Med1
order DDAbPeErLANL20210526_Med1
order DDAbPeErLANL20210602_Med1
order DDAbPeErLANL20210606_Med1
order DDAbPeErLANL20210613_Med1
order DDAbPeErLANL20210620_Med1
order DDAbPeErLANL20210627_Med1
order DDAbPeErLANL20210704_Med1
order DDAbPeErLANL20210711_Med1
order DDAbPeErLANL20210718_Med1
order DDAbPeErLANL20210725_Med1
order DDAbPeErLANL20210801_Med1
order DDAbPeErLANL20210808_Med1
order DDAbPeErLANL20210815_Med1
order DDAbPeErLANL20210822_Med1
order DDAbPeErLANL20210829_Med1
order DDAbPeErLANL20210905_Med1
order DDAbPeErLANL20210912_Med1
order DDAbPeErLANL20210919_Med1
order DDAbPeErLANL20210926_Med1

capture drop DDAbPeErLANL_Mean1 // "DDAbPeErLANL mean over updates of median absolute % error by calendar months"
egen DDAbPeErLANL_Mean1 = rowmean(DDAbPeErLANL20210926_Med1-DDAbPeErLANL20210411_Med1) // <<-- modify 11
label var DDAbPeErLANL_Mean1 "DDAbPeErLANL mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL_Mean1 = . if date < td(11apr2021) // 11apr2021 is the earliest date of LANL forecasts for Mongolia

 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorLANL_Mean2 = mean(DDErrorLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorLANL_Mean2 "DDErrorLANL Mean over calendar months of median error over updates"

egen DDAbsErrLANL_Mean2 = mean(DDAbsErrLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrLANL_Mean2 "DDAbsErrLANL Mean over calendar months of median absolute error over updates"

egen DDPerErrLANL_Mean2 = mean(DDPerErrLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrLANL_Mean2 "DDPerErrLANL Mean over calendar months of median % error over updates"

egen DDAbPeErLANL_Mean2 = mean(DDAbPeErLANL_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErLANL_Mean2 "DDAbPeErLANL Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorLANL20210411 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210414 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210418 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210421 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210425 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210428 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210502 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210505 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210509 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210512 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210516 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210519 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210523 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210526 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210602 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210606 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210620 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210627 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210704 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210711 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210718 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210725 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210801 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210808 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210815 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210822 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210829 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210905 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Mongolia, LANL, all updates, forecast only", size(small)) 

qui graph export "graph 03 Mongolia LANL C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrLANL20210411 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210414 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210418 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210421 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210425 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210428 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210502 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210505 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210509 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210512 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210516 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210519 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210523 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210526 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210602 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210606 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210620 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210627 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210704 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210711 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210718 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210725 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210801 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210808 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210815 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210822 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210829 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210905 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Mongolia, LANL, all updates, forecast only", size(small))

qui graph export "graph 04 Mongolia LANL C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrLANL20210411 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210414 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210418 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210421 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210425 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210428 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210502 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210505 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210509 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210512 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210516 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210519 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210523 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210526 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210602 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210606 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210620 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210627 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210704 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210711 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210718 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210725 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210801 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210808 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210815 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210822 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210829 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210905 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Mongolia, LANL, all updates, forecast only", size(small))

qui graph export "graph 05 Mongolia LANL C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* LANL lcolor brown // <<-- modify 16

twoway ///
(line DDAbPeErLANL20210411 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210414 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210418 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210421 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210425 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210428 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210502 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210505 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210509 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210512 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210516 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210519 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210523 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210526 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210602 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210606 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210620 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210627 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210704 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210711 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210718 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210725 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210801 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210808 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210815 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210822 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210829 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210905 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210912 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210919 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210926 date, sort lcolor(brown) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Mongolia, LANL, all updates, forecast only", size(small))

qui graph export "graph 06 Mongolia LANL C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Mongolia, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Mongolia LANL C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorLANL_Mean1_window = DDErrorLANL_Mean1, window(3 1 3)

tssmooth ma DDErrorLANL_Mean1_sm = DDErrorLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorLANL_Mean1_sm "Daily deaths LANL average median error smooth"

drop *_window

// tsset, clear

*













***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Mongolia, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Mongolia LANL C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrLANL_Mean1_window = DDAbsErrLANL_Mean1, window(3 1 3)

tssmooth ma DDAbsErrLANL_Mean1_sm = DDAbsErrLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrLANL_Mean1_sm "Daily deaths LANL average median absolute error smooth"

drop *_window

// tsset, clear

*










***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Mongolia, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Mongolia LANL C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrLANL_Mean1_window = DDPerErrLANL_Mean1, window(3 1 3)

tssmooth ma DDPerErrLANL_Mean1_sm = DDPerErrLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrLANL_Mean1_sm "Daily deaths LANL average median percent error smooth"

drop *_window

// tsset, clear

*













***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Mongolia, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Mongolia LANL C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErLANL_Mean1_window = DDAbPeErLANL_Mean1, window(3 1 3)

tssmooth ma DDAbPeErLANL_Mean1_sm = DDAbPeErLANL_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErLANL_Mean1_sm "Daily deaths LANL average median absolute percent error smooth"

drop *_window

tsset, clear

*





***********************************************

capture drop *2str

summ DDAbPeErLANL_Mean2, meanonly

local DDAbPeErLANL_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErLANL_Mean2str = `DDAbPeErLANL_Mean2str'
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErLANL_Mean2str /// 
, bar(1, fcolor(brown) lcolor(brown)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Mongolia, LANL, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Mongolia LANL C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "LANL Mongolia error.dta", replace 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Mongolia error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Mongolia 5 LANL.smcl"

log close

exit, clear

