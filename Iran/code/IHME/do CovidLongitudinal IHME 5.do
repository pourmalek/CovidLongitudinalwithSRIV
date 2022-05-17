
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 5.do"

* Project: Longitudinal assessment of C19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* run calculations - daily deaths: four error types (graphs 3 to 11), updates together

* graph 3 Error
* graph 4 Absolute Error
* graph 5 Percent Error
* graph 6 Absolute Percent Error

* graph 7 mean over updates of median error by calendar months
* graph 8 Daily deaths, mean over updates of median absolute error by calendar months
* graph 9 Daily deaths, mean over updates of median % error by calendar months
* graph 10 Daily deaths, mean over updates of median absolute % error by calendar months
* (7, 8, 9, 10) (a, b); a = not smoothed, b = smoothed for better viewing

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

* input data files: "CovidLongitudinal IHME.dta"
* output data files: "CovidLongitudinal IHME 2.dta" (with error measures saved)





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




use "CovidLongitudinal IHME.dta", clear 




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



egen yearmonth = concat(yearstr monthstr), p(m)

replace yearmonth = "" if yearmonth == "2022m01"

gen provincestate = " National"

sort provincestate date yearmonth 

isid date

*





local list ///
20200625 ///
20200629 ///
20200707 ///
20200714 ///
20200722 ///
20200730 ///
20200806 ///
20200821 ///
20200827 ///
20200903 ///
20200911 ///
20200918 ///
20200924 ///
20201002 ///
20201009 ///
20201015 ///
20201022 ///
20201029 ///
20201112 ///
20201119 ///
20201203 ///
20201210 ///
20201217 ///
20201223 ///
20210115 ///
20210122 ///
20210128 ///
20210204 ///
20210212 ///
20210220 ///
20210225 ///
20210306 ///
20210311 ///
20210317 ///
20210325 ///
20210401 ///
20210409 ///
20210416 ///
20210423 ///
20210506 ///
20210514 ///
20210521 ///
20210528 ///
20210604 ///
20210610 ///
20210618 ///
20210625 ///
20210702 ///
20210715 ///
20210723 ///
20210730 ///
20210806 ///
20210820 ///
20210826 ///
20210902 ///
20210910 ///
20210916 ///
20210923 ///
20210930 ///
20211015 ///
20211021 ///
20211104 ///
20211221 ///


sort provincestate date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorA02`update'
gen DDErrorA02`update' = - (DayDeaMeSmA00 - DayDeaFOREA02`update')
label var DDErrorA02`update' "DayDeaFOREA02`update' error"
qui replace DDErrorA02`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA02`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA02`update' = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran
qui replace DDErrorA02`update' = . if date < epoch`update' // before epoch`update' for this update	

capture drop DDAbsErrA02`update'
gen DDAbsErrA02`update' = abs(- (DayDeaMeSmA00 - DayDeaFOREA02`update'))
label var DDAbsErrA02`update' "DayDeaFOREA02`update' absolute error"
qui replace DDAbsErrA02`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA02`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA02`update' = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran
qui replace DDAbsErrA02`update' = . if date < epoch`update' // before epoch`update' for this update	

capture drop DDPerErrA02`update'
gen DDPerErrA02`update' = (100 * (- (DayDeaMeSmA00 - DayDeaFOREA02`update'))) / DayDeaMeSmA00
label var DDPerErrA02`update' "DayDeaFOREA02`update' percent error"
qui replace DDPerErrA02`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA02`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA02`update' = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran
qui replace DDPerErrA02`update' = . if date < epoch`update' // before epoch`update' for this update	

capture drop DDAbPeErA02`update'
gen DDAbPeErA02`update' = (100 * abs(- (DayDeaMeSmA00 - DayDeaFOREA02`update'))) / DayDeaMeSmA00
label var DDAbPeErA02`update' "DayDeaFOREA02`update' absolute percent error" 
qui replace DDAbPeErA02`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA02`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA02`update' = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran
qui replace DDAbPeErA02`update' = . if date < epoch`update' // before epoch`update' for this update	

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorA02`update'_Med1
bysort yearmonth : egen DDErrorA02`update'_Med1 = median(DDErrorA02`update')
label var DDErrorA02`update'_Med1 "DayDeaA02 median error by calendar months and updates"
qui replace DDErrorA02`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA02`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA02`update'_Med1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran

capture drop DDAbsErrA02`update'_Med1
bysort yearmonth : egen DDAbsErrA02`update'_Med1 = median(DDAbsErrA02`update')
label var DDAbsErrA02`update'_Med1 "DayDeaA02 median absolute error by calendar months and updates"
qui replace DDAbsErrA02`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA02`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA02`update'_Med1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran

capture drop DDPerErrA02`update'_Med1
bysort yearmonth : egen DDPerErrA02`update'_Med1 = median(DDPerErrA02`update')
label var DDPerErrA02`update'_Med1 "DayDeaA02 median % error by calendar months and updates"
qui replace DDPerErrA02`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA02`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA02`update'_Med1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran

capture drop DDAbPeErA02`update'_Med1
bysort yearmonth : egen DDAbPeErA02`update'_Med1 = median(DDAbPeErA02`update')
label var DDAbPeErA02`update'_Med1 "DayDeaA02 median absolute % error by calendar months and updates" 
qui replace DDAbPeErA02`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA02`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA02`update'_Med1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorA02_Mean1

order DDErrorA0220200625_Med1
order DDErrorA0220200629_Med1
order DDErrorA0220200707_Med1
order DDErrorA0220200714_Med1
order DDErrorA0220200722_Med1
order DDErrorA0220200730_Med1
order DDErrorA0220200806_Med1
order DDErrorA0220200821_Med1
order DDErrorA0220200827_Med1
order DDErrorA0220200903_Med1
order DDErrorA0220200911_Med1
order DDErrorA0220200918_Med1
order DDErrorA0220200924_Med1
order DDErrorA0220201002_Med1
order DDErrorA0220201009_Med1
order DDErrorA0220201015_Med1
order DDErrorA0220201022_Med1
order DDErrorA0220201029_Med1
order DDErrorA0220201112_Med1
order DDErrorA0220201119_Med1
order DDErrorA0220201203_Med1
order DDErrorA0220201210_Med1
order DDErrorA0220201217_Med1
order DDErrorA0220201223_Med1
order DDErrorA0220210115_Med1
order DDErrorA0220210122_Med1
order DDErrorA0220210128_Med1
order DDErrorA0220210204_Med1
order DDErrorA0220210212_Med1
order DDErrorA0220210220_Med1
order DDErrorA0220210225_Med1
order DDErrorA0220210306_Med1
order DDErrorA0220210311_Med1
order DDErrorA0220210317_Med1
order DDErrorA0220210325_Med1
order DDErrorA0220210401_Med1
order DDErrorA0220210409_Med1
order DDErrorA0220210416_Med1
order DDErrorA0220210423_Med1
order DDErrorA0220210506_Med1
order DDErrorA0220210514_Med1
order DDErrorA0220210521_Med1
order DDErrorA0220210528_Med1
order DDErrorA0220210604_Med1
order DDErrorA0220210610_Med1
order DDErrorA0220210618_Med1
order DDErrorA0220210625_Med1
order DDErrorA0220210702_Med1
order DDErrorA0220210715_Med1
order DDErrorA0220210723_Med1
order DDErrorA0220210730_Med1
order DDErrorA0220210806_Med1
order DDErrorA0220210820_Med1
order DDErrorA0220210826_Med1
order DDErrorA0220210902_Med1
order DDErrorA0220210910_Med1
order DDErrorA0220210916_Med1
order DDErrorA0220210923_Med1
order DDErrorA0220210930_Med1
order DDErrorA0220211015_Med1
order DDErrorA0220211021_Med1
order DDErrorA0220211104_Med1
order DDErrorA0220211221_Med1
		
		
capture drop DDErrorA02_Mean1		
egen DDErrorA02_Mean1 = rowmean(DDErrorA0220211221_Med1-DDErrorA0220200625_Med1) 
label var DDErrorA02_Mean1 "DDErrorA02 mean over updates of median error by calendar months"
qui replace DDErrorA02_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA02_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA02_Mean1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran






* gen DDAbsErrA02_Mean1


order DDAbsErrA0220200625_Med1
order DDAbsErrA0220200629_Med1
order DDAbsErrA0220200707_Med1
order DDAbsErrA0220200714_Med1
order DDAbsErrA0220200722_Med1
order DDAbsErrA0220200730_Med1
order DDAbsErrA0220200806_Med1
order DDAbsErrA0220200821_Med1
order DDAbsErrA0220200827_Med1
order DDAbsErrA0220200903_Med1
order DDAbsErrA0220200911_Med1
order DDAbsErrA0220200918_Med1
order DDAbsErrA0220200924_Med1
order DDAbsErrA0220201002_Med1
order DDAbsErrA0220201009_Med1
order DDAbsErrA0220201015_Med1
order DDAbsErrA0220201022_Med1
order DDAbsErrA0220201029_Med1
order DDAbsErrA0220201112_Med1
order DDAbsErrA0220201119_Med1
order DDAbsErrA0220201203_Med1
order DDAbsErrA0220201210_Med1
order DDAbsErrA0220201217_Med1
order DDAbsErrA0220201223_Med1
order DDAbsErrA0220210115_Med1
order DDAbsErrA0220210122_Med1
order DDAbsErrA0220210128_Med1
order DDAbsErrA0220210204_Med1
order DDAbsErrA0220210212_Med1
order DDAbsErrA0220210220_Med1
order DDAbsErrA0220210225_Med1
order DDAbsErrA0220210306_Med1
order DDAbsErrA0220210311_Med1
order DDAbsErrA0220210317_Med1
order DDAbsErrA0220210325_Med1
order DDAbsErrA0220210401_Med1
order DDAbsErrA0220210409_Med1
order DDAbsErrA0220210416_Med1
order DDAbsErrA0220210423_Med1
order DDAbsErrA0220210506_Med1
order DDAbsErrA0220210514_Med1
order DDAbsErrA0220210521_Med1
order DDAbsErrA0220210528_Med1
order DDAbsErrA0220210604_Med1
order DDAbsErrA0220210610_Med1
order DDAbsErrA0220210618_Med1
order DDAbsErrA0220210625_Med1
order DDAbsErrA0220210702_Med1
order DDAbsErrA0220210715_Med1
order DDAbsErrA0220210723_Med1
order DDAbsErrA0220210730_Med1
order DDAbsErrA0220210806_Med1
order DDAbsErrA0220210820_Med1
order DDAbsErrA0220210826_Med1
order DDAbsErrA0220210902_Med1
order DDAbsErrA0220210910_Med1
order DDAbsErrA0220210916_Med1
order DDAbsErrA0220210923_Med1
order DDAbsErrA0220210930_Med1
order DDAbsErrA0220211015_Med1
order DDAbsErrA0220211021_Med1
order DDAbsErrA0220211104_Med1
order DDAbsErrA0220211221_Med1


capture drop DDAbsErrA02_Mean1
egen DDAbsErrA02_Mean1 = rowmean(DDAbsErrA0220211221_Med1-DDAbsErrA0220200625_Med1) 
label var DDAbsErrA02_Mean1 "DDAbsErrA02 mean over updates of median absolute error by calendar months"
qui replace DDAbsErrA02_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA02_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA02_Mean1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran







* gen DDPerErrA02_Mean1


order DDPerErrA0220200625_Med1
order DDPerErrA0220200629_Med1
order DDPerErrA0220200707_Med1
order DDPerErrA0220200714_Med1
order DDPerErrA0220200722_Med1
order DDPerErrA0220200730_Med1
order DDPerErrA0220200806_Med1
order DDPerErrA0220200821_Med1
order DDPerErrA0220200827_Med1
order DDPerErrA0220200903_Med1
order DDPerErrA0220200911_Med1
order DDPerErrA0220200918_Med1
order DDPerErrA0220200924_Med1
order DDPerErrA0220201002_Med1
order DDPerErrA0220201009_Med1
order DDPerErrA0220201015_Med1
order DDPerErrA0220201022_Med1
order DDPerErrA0220201029_Med1
order DDPerErrA0220201112_Med1
order DDPerErrA0220201119_Med1
order DDPerErrA0220201203_Med1
order DDPerErrA0220201210_Med1
order DDPerErrA0220201217_Med1
order DDPerErrA0220201223_Med1
order DDPerErrA0220210115_Med1
order DDPerErrA0220210122_Med1
order DDPerErrA0220210128_Med1
order DDPerErrA0220210204_Med1
order DDPerErrA0220210212_Med1
order DDPerErrA0220210220_Med1
order DDPerErrA0220210225_Med1
order DDPerErrA0220210306_Med1
order DDPerErrA0220210311_Med1
order DDPerErrA0220210317_Med1
order DDPerErrA0220210325_Med1
order DDPerErrA0220210401_Med1
order DDPerErrA0220210409_Med1
order DDPerErrA0220210416_Med1
order DDPerErrA0220210423_Med1
order DDPerErrA0220210506_Med1
order DDPerErrA0220210514_Med1
order DDPerErrA0220210521_Med1
order DDPerErrA0220210528_Med1
order DDPerErrA0220210604_Med1
order DDPerErrA0220210610_Med1
order DDPerErrA0220210618_Med1
order DDPerErrA0220210625_Med1
order DDPerErrA0220210702_Med1
order DDPerErrA0220210715_Med1
order DDPerErrA0220210723_Med1
order DDPerErrA0220210730_Med1
order DDPerErrA0220210806_Med1
order DDPerErrA0220210820_Med1
order DDPerErrA0220210826_Med1
order DDPerErrA0220210902_Med1
order DDPerErrA0220210910_Med1
order DDPerErrA0220210916_Med1
order DDPerErrA0220210923_Med1
order DDPerErrA0220210930_Med1
order DDPerErrA0220211015_Med1
order DDPerErrA0220211021_Med1
order DDPerErrA0220211104_Med1
order DDPerErrA0220211221_Med1
		

capture drop DDPerErrA02_Mean1
egen DDPerErrA02_Mean1 = rowmean(DDPerErrA0220211221_Med1-DDPerErrA0220200625_Med1) 
label var DDPerErrA02_Mean1 "DDPerErrA02 mean over updates of median % error by calendar months"
qui replace DDPerErrA02_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA02_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA02_Mean1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran








* gen DDAbPeErA02_Mean1


order DDAbPeErA0220200625_Med1
order DDAbPeErA0220200629_Med1
order DDAbPeErA0220200707_Med1
order DDAbPeErA0220200714_Med1
order DDAbPeErA0220200722_Med1
order DDAbPeErA0220200730_Med1
order DDAbPeErA0220200806_Med1
order DDAbPeErA0220200821_Med1
order DDAbPeErA0220200827_Med1
order DDAbPeErA0220200903_Med1
order DDAbPeErA0220200911_Med1
order DDAbPeErA0220200918_Med1
order DDAbPeErA0220200924_Med1
order DDAbPeErA0220201002_Med1
order DDAbPeErA0220201009_Med1
order DDAbPeErA0220201015_Med1
order DDAbPeErA0220201022_Med1
order DDAbPeErA0220201029_Med1
order DDAbPeErA0220201112_Med1
order DDAbPeErA0220201119_Med1
order DDAbPeErA0220201203_Med1
order DDAbPeErA0220201210_Med1
order DDAbPeErA0220201217_Med1
order DDAbPeErA0220201223_Med1
order DDAbPeErA0220210115_Med1
order DDAbPeErA0220210122_Med1
order DDAbPeErA0220210128_Med1
order DDAbPeErA0220210204_Med1
order DDAbPeErA0220210212_Med1
order DDAbPeErA0220210220_Med1
order DDAbPeErA0220210225_Med1
order DDAbPeErA0220210306_Med1
order DDAbPeErA0220210311_Med1
order DDAbPeErA0220210317_Med1
order DDAbPeErA0220210325_Med1
order DDAbPeErA0220210401_Med1
order DDAbPeErA0220210409_Med1
order DDAbPeErA0220210416_Med1
order DDAbPeErA0220210423_Med1
order DDAbPeErA0220210506_Med1
order DDAbPeErA0220210514_Med1
order DDAbPeErA0220210521_Med1
order DDAbPeErA0220210528_Med1
order DDAbPeErA0220210604_Med1
order DDAbPeErA0220210610_Med1
order DDAbPeErA0220210618_Med1
order DDAbPeErA0220210625_Med1
order DDAbPeErA0220210702_Med1
order DDAbPeErA0220210715_Med1
order DDAbPeErA0220210723_Med1
order DDAbPeErA0220210730_Med1
order DDAbPeErA0220210806_Med1
order DDAbPeErA0220210820_Med1
order DDAbPeErA0220210826_Med1
order DDAbPeErA0220210902_Med1
order DDAbPeErA0220210910_Med1
order DDAbPeErA0220210916_Med1
order DDAbPeErA0220210923_Med1
order DDAbPeErA0220210930_Med1
order DDAbPeErA0220211015_Med1
order DDAbPeErA0220211021_Med1
order DDAbPeErA0220211104_Med1
order DDAbPeErA0220211221_Med1


capture drop DDAbPeErA02_Mean1
egen DDAbPeErA02_Mean1 = rowmean(DDAbPeErA0220211221_Med1-DDAbPeErA0220200625_Med1) 
label var DDAbPeErA02_Mean1 "DDAbPeErA02 mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErA02_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA02_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA02_Mean1 = . if date < td(21jun2020) // 21jun2020 is the earliest date of IHME forecasts for Iran


 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorA02_Mean2 = mean(DDErrorA02_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorA02_Mean2 "DDErrorA02 Mean over calendar months of median error over updates"

egen DDAbsErrA02_Mean2 = mean(DDAbsErrA02_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrA02_Mean2 "DDAbsErrA02 Mean over calendar months of median absolute error over updates"

egen DDPerErrA02_Mean2 = mean(DDPerErrA02_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrA02_Mean2 "DDPerErrA02 Mean over calendar months of median % error over updates"

egen DDAbPeErA02_Mean2 = mean(DDAbPeErA02_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErA02_Mean2 "DDAbPeErA02 Mean over calendar months of median absolute % error over updates"







******
* graph 3 Daily deaths, Error

twoway ///
(line DDErrorA0220200625 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200629 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200707 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200714 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200722 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200730 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200806 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200821 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200827 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200903 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200911 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200918 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220200924 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201002 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201009 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201015 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201022 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201029 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201112 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201119 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201203 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201210 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201217 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220201223 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210115 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210122 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210128 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210204 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210212 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210220 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210225 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210306 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210311 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210317 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210325 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210401 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210409 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210416 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210423 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210506 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210514 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210521 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210528 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210604 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210610 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210618 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210625 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210702 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210715 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210723 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210730 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210806 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210820 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210826 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210902 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210910 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210916 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210923 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220210930 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220211015 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220211021 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220211104 date, sort lcolor(black) lwidth(thin)) /// 
(line DDErrorA0220211221 date, sort lcolor(black) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IHME, all updates, forecast only", size(small)) 

qui graph export "graph 3 C19 daily deaths error, $country, IHME, all updates.pdf", replace





******
* graph 4 Daily deaths, Absolute Error

twoway ///
(line DDAbsErrA0220200625 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200629 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200707 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200714 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200722 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200730 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200806 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200821 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200827 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200903 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200911 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200918 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220200924 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201002 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201009 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201015 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201022 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201029 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201112 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201119 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201203 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201210 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201217 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220201223 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210115 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210122 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210128 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210204 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210212 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210220 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210225 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210306 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210311 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210317 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210325 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210401 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210409 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210416 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210423 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210506 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210514 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210521 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210528 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210604 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210610 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210618 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210625 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210702 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210715 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210723 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210730 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210806 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210820 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210826 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210902 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210910 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210916 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210923 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220210930 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220211015 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220211021 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220211104 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbsErrA0220211221 date, sort lcolor(black) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IHME, all updates, forecast only", size(small))

qui graph export "graph 4 C19 daily deaths absolute error, $country, IHME, all updates.pdf", replace








******
* graph 5 Daily deaths, % Error

twoway ///
(line DDPerErrA0220200625 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200629 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200707 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200714 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200722 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200730 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200806 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200821 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200827 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200903 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200911 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200918 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220200924 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201002 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201009 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201015 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201022 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201029 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201112 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201119 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201203 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201210 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201217 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220201223 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210115 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210122 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210128 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210204 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210212 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210220 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210225 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210306 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210311 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210317 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210325 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210401 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210409 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210416 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210423 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210506 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210514 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210521 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210528 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210604 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210610 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210618 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210625 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210702 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210715 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210723 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210730 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210806 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210820 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210826 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210902 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210910 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210916 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210923 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220210930 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220211015 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220211021 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220211104 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA0220211221 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IHME, all updates, forecast only", size(small))

qui graph export "graph 5 C19 daily deaths % error, $country, IHME, all updates.pdf", replace








******
* graph 6 Daily deaths, Absolute % Error

twoway ///
(line DDAbPeErA0220200625 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200629 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200707 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200714 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200722 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200730 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200806 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200821 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200827 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200903 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200911 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200918 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220200924 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201002 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201009 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201015 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201022 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201029 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201112 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201119 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201203 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201210 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201217 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220201223 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210115 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210122 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210128 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210204 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210212 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210220 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210225 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210306 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210311 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210317 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210325 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210401 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210409 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210416 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210423 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210506 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210514 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210521 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210528 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210604 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210610 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210618 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210625 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210702 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210715 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210723 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210730 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210806 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210820 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210826 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210902 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210910 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210916 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210923 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220210930 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220211015 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220211021 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220211104 date, sort lcolor(black) lwidth(thin)) /// 
(line DDAbPeErA0220211221 date, sort lcolor(black) lwidth(thin)) ///  
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IHME, all updates, forecast only", size(small))

qui graph export "graph 6 C19 daily deaths absolute % error, $country, IHME, all updates.pdf", replace











***************************************************************
* graph 7 a Daily deaths, average median errors 

twoway ///
(line DDErrorA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 a C19 daily deaths error, $country, IHME, Error Mean1.pdf", replace




*********************
* smooth median error for better viewing 

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   

tssmooth ma DDErrorA02_Mean1_window = DDErrorA02_Mean1, window(3 1 3)

tssmooth ma DDErrorA02_Mean1_sm = DDErrorA02_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorA02_Mean1_sm "Daily deaths IHME average median errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*




***************************************************************
* graph 7 b Daily deaths, average median errors 

twoway ///
(line DDErrorA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 b C19 daily deaths error, $country, IHME, Error Mean1 smooth.pdf", replace










***************************************************************
* graph 8 a Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 a C19 daily deaths error, $country, IHME, Absolute Error Mean1.pdf", replace





*********************
* smooth median absolute error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbsErrA02_Mean1_window = DDAbsErrA02_Mean1, window(3 1 3)

tssmooth ma DDAbsErrA02_Mean1_sm = DDAbsErrA02_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrA02_Mean1_sm "Daily deaths IHME average median absolute errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 8 b Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 b C19 daily deaths error, $country, IHME, Absolute Error Mean1 smooth.pdf", replace







***************************************************************
* graph 9 a Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 a C19 daily deaths error, $country, IHME, % Error Mean1.pdf", replace




*********************
* smooth median percent error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDPerErrA02_Mean1_window = DDPerErrA02_Mean1, window(3 1 3)

tssmooth ma DDPerErrA02_Mean1_sm = DDPerErrA02_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrA02_Mean1_sm "Daily deaths IHME average median percent errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 9 b Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 b C19 daily deaths error, $country, IHME, % Error Mean1 smooth.pdf", replace










***************************************************************
* graph 10 a Daily deaths, average median absolute percent errors

twoway ///
(line DDAbPeErA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 a C19 daily deaths error, $country, IHME, Absolute % Error Mean1.pdf", replace




*********************
* smooth median absolute % error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbPeErA02_Mean1_window = DDAbPeErA02_Mean1, window(3 1 3)

tssmooth ma DDAbPeErA02_Mean1_sm = DDAbPeErA02_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErA02_Mean1_sm "Daily deaths IHME average median absolute percent errors smooth"

drop *_window

drop provincestate_encoded

tsset, clear

*



***************************************************************
* graph 10 b Daily deaths, average median absolute percent errors, smooth

twoway ///
(line DDAbPeErA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, IHME, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 b C19 daily deaths error, $country, IHME, Absolute % Error Mean1 smooth.pdf", replace








***********************************************

capture drop *2r

gen DDAbPeErA02_Mean2r = round(DDAbPeErA02_Mean2,0.1)
    

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA02_Mean2r /// 
, bar(1, fcolor(black) lcolor(black)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("$country, IHME, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) 

qui graph export "graph 11 C19 daily deaths, $country, IHME, Average MAPE.pdf", replace








******

qui compress 

save "CovidLongitudinal IHME 2.dta", replace 






view "log CovidLongitudinal IHME 5.smcl"

log close

exit, clear

