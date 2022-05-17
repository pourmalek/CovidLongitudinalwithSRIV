
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 5.do"

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

* input data files: "CovidLongitudinal DELP.dta"
* output data files: "CovidLongitudinal DELP 2.dta" (with error measures saved)





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




use "CovidLongitudinal DELP.dta", clear 




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

sort provincestate date yearmonth 

isid date

*





local list ///
20200417 ///
20200424 ///
20200501 ///
20200509 ///
20200517 ///
20200524 ///
20200531 ///
20200607 ///
20200614 ///
20200621 ///
20200628 ///
20200704 ///
20200718 ///
20200723 ///
20200801 ///
20200815 ///
20200829 ///
20200912 ///
20200926 ///
20201008 ///
20201022 ///
20201105 ///
20201119 ///
20201119 ///
20201203 ///
20201217 ///
20201231 ///
20210114 ///
20210128 ///
20210211 ///
20210225 ///
20210311 ///
20210325 ///
20210408 ///
20210422 ///
20210506 ///
20210520 ///
20210603 ///
20210610 ///
20210617 ///
20210624 ///
20210701 ///
20210708 ///
20210715 ///
20210722 ///
20210729 ///
20210805 ///
20210812 ///
20210819 ///
20210826 ///
20210902 ///
20210909 ///
20210916 ///
20210923 ///
20210930 ///
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 



sort provincestate date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorA01`update'
gen DDErrorA01`update' = - (DayDeaMeSmA00 - DayDeaFOREA01`update')
label var DDErrorA01`update' "DayDeaFOREA01`update' error"
qui replace DDErrorA01`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA01`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA01`update' = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

capture drop DDAbsErrA01`update'
gen DDAbsErrA01`update' = abs(- (DayDeaMeSmA00 - DayDeaFOREA01`update'))
label var DDAbsErrA01`update' "DayDeaFOREA01`update' absolute error"
qui replace DDAbsErrA01`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA01`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA01`update' = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

capture drop DDPerErrA01`update'
gen DDPerErrA01`update' = (100 * (- (DayDeaMeSmA00 - DayDeaFOREA01`update'))) / DayDeaMeSmA00
label var DDPerErrA01`update' "DayDeaFOREA01`update' percent error"
qui replace DDPerErrA01`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA01`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA01`update' = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

capture drop DDAbPeErA01`update'
gen DDAbPeErA01`update' = (100 * abs(- (DayDeaMeSmA00 - DayDeaFOREA01`update'))) / DayDeaMeSmA00
label var DDAbPeErA01`update' "DayDeaFOREA01`update' absolute percent error" 
qui replace DDAbPeErA01`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA01`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA01`update' = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorA01`update'_Med1
bysort yearmonth : egen DDErrorA01`update'_Med1 = median(DDErrorA01`update')
label var DDErrorA01`update'_Med1 "DayDeaA01 median error by calendar months and updates"
qui replace DDErrorA01`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA01`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA01`update'_Med1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

capture drop DDAbsErrA01`update'_Med1
bysort yearmonth : egen DDAbsErrA01`update'_Med1 = median(DDAbsErrA01`update')
label var DDAbsErrA01`update'_Med1 "DayDeaA01 median absolute error by calendar months and updates"
qui replace DDAbsErrA01`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA01`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA01`update'_Med1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

capture drop DDPerErrA01`update'_Med1
bysort yearmonth : egen DDPerErrA01`update'_Med1 = median(DDPerErrA01`update')
label var DDPerErrA01`update'_Med1 "DayDeaA01 median % error by calendar months and updates"
qui replace DDPerErrA01`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA01`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA01`update'_Med1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

capture drop DDAbPeErA01`update'_Med1
bysort yearmonth : egen DDAbPeErA01`update'_Med1 = median(DDAbPeErA01`update')
label var DDAbPeErA01`update'_Med1 "DayDeaA01 median absolute % error by calendar months and updates" 
qui replace DDAbPeErA01`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA01`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA01`update'_Med1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorA01_Mean1

order DDErrorA0120200417_Med1
order DDErrorA0120200424_Med1
order DDErrorA0120200501_Med1
order DDErrorA0120200509_Med1
order DDErrorA0120200517_Med1
order DDErrorA0120200524_Med1
order DDErrorA0120200531_Med1
order DDErrorA0120200607_Med1
order DDErrorA0120200614_Med1
order DDErrorA0120200621_Med1
order DDErrorA0120200628_Med1
order DDErrorA0120200704_Med1
order DDErrorA0120200718_Med1
order DDErrorA0120200723_Med1
order DDErrorA0120200801_Med1
order DDErrorA0120200815_Med1
order DDErrorA0120200829_Med1
order DDErrorA0120200912_Med1
order DDErrorA0120200926_Med1
order DDErrorA0120201008_Med1
order DDErrorA0120201022_Med1
order DDErrorA0120201105_Med1
order DDErrorA0120201119_Med1
order DDErrorA0120201119_Med1
order DDErrorA0120201203_Med1
order DDErrorA0120201217_Med1
order DDErrorA0120201231_Med1
order DDErrorA0120210114_Med1
order DDErrorA0120210128_Med1
order DDErrorA0120210211_Med1
order DDErrorA0120210225_Med1
order DDErrorA0120210311_Med1
order DDErrorA0120210325_Med1
order DDErrorA0120210408_Med1
order DDErrorA0120210422_Med1
order DDErrorA0120210506_Med1
order DDErrorA0120210520_Med1
order DDErrorA0120210603_Med1
order DDErrorA0120210610_Med1
order DDErrorA0120210617_Med1
order DDErrorA0120210624_Med1
order DDErrorA0120210701_Med1
order DDErrorA0120210708_Med1
order DDErrorA0120210715_Med1
order DDErrorA0120210722_Med1
order DDErrorA0120210729_Med1
order DDErrorA0120210805_Med1
order DDErrorA0120210812_Med1
order DDErrorA0120210819_Med1
order DDErrorA0120210826_Med1
order DDErrorA0120210902_Med1
order DDErrorA0120210909_Med1
order DDErrorA0120210916_Med1
order DDErrorA0120210923_Med1
order DDErrorA0120210930_Med1
order DDErrorA0120211007_Med1
order DDErrorA0120211014_Med1
order DDErrorA0120211021_Med1
order DDErrorA0120211028_Med1
order DDErrorA0120211104_Med1
order DDErrorA0120211111_Med1
order DDErrorA0120211118_Med1
order DDErrorA0120211125_Med1
order DDErrorA0120211202_Med1
order DDErrorA0120211209_Med1
order DDErrorA0120211216_Med1
order DDErrorA0120211223_Med1
order DDErrorA0120211230_Med1
		
		
capture drop DDErrorA01_Mean1		
egen DDErrorA01_Mean1 = rowmean(DDErrorA0120211230_Med1-DDErrorA0120200417_Med1) 
label var DDErrorA01_Mean1 "DDErrorA01 mean over updates of median error by calendar months"
qui replace DDErrorA01_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA01_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA01_Mean1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran






* gen DDAbsErrA01_Mean1


order DDAbsErrA0120200417_Med1
order DDAbsErrA0120200424_Med1
order DDAbsErrA0120200501_Med1
order DDAbsErrA0120200509_Med1
order DDAbsErrA0120200517_Med1
order DDAbsErrA0120200524_Med1
order DDAbsErrA0120200531_Med1
order DDAbsErrA0120200607_Med1
order DDAbsErrA0120200614_Med1
order DDAbsErrA0120200621_Med1
order DDAbsErrA0120200628_Med1
order DDAbsErrA0120200704_Med1
order DDAbsErrA0120200718_Med1
order DDAbsErrA0120200723_Med1
order DDAbsErrA0120200801_Med1
order DDAbsErrA0120200815_Med1
order DDAbsErrA0120200829_Med1
order DDAbsErrA0120200912_Med1
order DDAbsErrA0120200926_Med1
order DDAbsErrA0120201008_Med1
order DDAbsErrA0120201022_Med1
order DDAbsErrA0120201105_Med1
order DDAbsErrA0120201119_Med1
order DDAbsErrA0120201119_Med1
order DDAbsErrA0120201203_Med1
order DDAbsErrA0120201217_Med1
order DDAbsErrA0120201231_Med1
order DDAbsErrA0120210114_Med1
order DDAbsErrA0120210128_Med1
order DDAbsErrA0120210211_Med1
order DDAbsErrA0120210225_Med1
order DDAbsErrA0120210311_Med1
order DDAbsErrA0120210325_Med1
order DDAbsErrA0120210408_Med1
order DDAbsErrA0120210422_Med1
order DDAbsErrA0120210506_Med1
order DDAbsErrA0120210520_Med1
order DDAbsErrA0120210603_Med1
order DDAbsErrA0120210610_Med1
order DDAbsErrA0120210617_Med1
order DDAbsErrA0120210624_Med1
order DDAbsErrA0120210701_Med1
order DDAbsErrA0120210708_Med1
order DDAbsErrA0120210715_Med1
order DDAbsErrA0120210722_Med1
order DDAbsErrA0120210729_Med1
order DDAbsErrA0120210805_Med1
order DDAbsErrA0120210812_Med1
order DDAbsErrA0120210819_Med1
order DDAbsErrA0120210826_Med1
order DDAbsErrA0120210902_Med1
order DDAbsErrA0120210909_Med1
order DDAbsErrA0120210916_Med1
order DDAbsErrA0120210923_Med1
order DDAbsErrA0120210930_Med1
order DDAbsErrA0120211007_Med1
order DDAbsErrA0120211014_Med1
order DDAbsErrA0120211021_Med1
order DDAbsErrA0120211028_Med1
order DDAbsErrA0120211104_Med1
order DDAbsErrA0120211111_Med1
order DDAbsErrA0120211118_Med1
order DDAbsErrA0120211125_Med1
order DDAbsErrA0120211202_Med1
order DDAbsErrA0120211209_Med1
order DDAbsErrA0120211216_Med1
order DDAbsErrA0120211223_Med1
order DDAbsErrA0120211230_Med1


capture drop DDAbsErrA01_Mean1
egen DDAbsErrA01_Mean1 = rowmean(DDAbsErrA0120211230_Med1-DDAbsErrA0120200417_Med1) 
label var DDAbsErrA01_Mean1 "DDAbsErrA01 mean over updates of median absolute error by calendar months"
qui replace DDAbsErrA01_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA01_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA01_Mean1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran







* gen DDPerErrA01_Mean1


order DDPerErrA0120200417_Med1
order DDPerErrA0120200424_Med1
order DDPerErrA0120200501_Med1
order DDPerErrA0120200509_Med1
order DDPerErrA0120200517_Med1
order DDPerErrA0120200524_Med1
order DDPerErrA0120200531_Med1
order DDPerErrA0120200607_Med1
order DDPerErrA0120200614_Med1
order DDPerErrA0120200621_Med1
order DDPerErrA0120200628_Med1
order DDPerErrA0120200704_Med1
order DDPerErrA0120200718_Med1
order DDPerErrA0120200723_Med1
order DDPerErrA0120200801_Med1
order DDPerErrA0120200815_Med1
order DDPerErrA0120200829_Med1
order DDPerErrA0120200912_Med1
order DDPerErrA0120200926_Med1
order DDPerErrA0120201008_Med1
order DDPerErrA0120201022_Med1
order DDPerErrA0120201105_Med1
order DDPerErrA0120201119_Med1
order DDPerErrA0120201119_Med1
order DDPerErrA0120201203_Med1
order DDPerErrA0120201217_Med1
order DDPerErrA0120201231_Med1
order DDPerErrA0120210114_Med1
order DDPerErrA0120210128_Med1
order DDPerErrA0120210211_Med1
order DDPerErrA0120210225_Med1
order DDPerErrA0120210311_Med1
order DDPerErrA0120210325_Med1
order DDPerErrA0120210408_Med1
order DDPerErrA0120210422_Med1
order DDPerErrA0120210506_Med1
order DDPerErrA0120210520_Med1
order DDPerErrA0120210603_Med1
order DDPerErrA0120210610_Med1
order DDPerErrA0120210617_Med1
order DDPerErrA0120210624_Med1
order DDPerErrA0120210701_Med1
order DDPerErrA0120210708_Med1
order DDPerErrA0120210715_Med1
order DDPerErrA0120210722_Med1
order DDPerErrA0120210729_Med1
order DDPerErrA0120210805_Med1
order DDPerErrA0120210812_Med1
order DDPerErrA0120210819_Med1
order DDPerErrA0120210826_Med1
order DDPerErrA0120210902_Med1
order DDPerErrA0120210909_Med1
order DDPerErrA0120210916_Med1
order DDPerErrA0120210923_Med1
order DDPerErrA0120210930_Med1
order DDPerErrA0120211007_Med1
order DDPerErrA0120211014_Med1
order DDPerErrA0120211021_Med1
order DDPerErrA0120211028_Med1
order DDPerErrA0120211104_Med1
order DDPerErrA0120211111_Med1
order DDPerErrA0120211118_Med1
order DDPerErrA0120211125_Med1
order DDPerErrA0120211202_Med1
order DDPerErrA0120211209_Med1
order DDPerErrA0120211216_Med1
order DDPerErrA0120211223_Med1
order DDPerErrA0120211230_Med1
		

capture drop DDPerErrA01_Mean1
egen DDPerErrA01_Mean1 = rowmean(DDPerErrA0120211230_Med1-DDPerErrA0120200417_Med1) 
label var DDPerErrA01_Mean1 "DDPerErrA01 mean over updates of median % error by calendar months"
qui replace DDPerErrA01_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA01_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA01_Mean1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran








* gen DDAbPeErA01_Mean1


order DDAbPeErA0120200417_Med1
order DDAbPeErA0120200424_Med1
order DDAbPeErA0120200501_Med1
order DDAbPeErA0120200509_Med1
order DDAbPeErA0120200517_Med1
order DDAbPeErA0120200524_Med1
order DDAbPeErA0120200531_Med1
order DDAbPeErA0120200607_Med1
order DDAbPeErA0120200614_Med1
order DDAbPeErA0120200621_Med1
order DDAbPeErA0120200628_Med1
order DDAbPeErA0120200704_Med1
order DDAbPeErA0120200718_Med1
order DDAbPeErA0120200723_Med1
order DDAbPeErA0120200801_Med1
order DDAbPeErA0120200815_Med1
order DDAbPeErA0120200829_Med1
order DDAbPeErA0120200912_Med1
order DDAbPeErA0120200926_Med1
order DDAbPeErA0120201008_Med1
order DDAbPeErA0120201022_Med1
order DDAbPeErA0120201105_Med1
order DDAbPeErA0120201119_Med1
order DDAbPeErA0120201119_Med1
order DDAbPeErA0120201203_Med1
order DDAbPeErA0120201217_Med1
order DDAbPeErA0120201231_Med1
order DDAbPeErA0120210114_Med1
order DDAbPeErA0120210128_Med1
order DDAbPeErA0120210211_Med1
order DDAbPeErA0120210225_Med1
order DDAbPeErA0120210311_Med1
order DDAbPeErA0120210325_Med1
order DDAbPeErA0120210408_Med1
order DDAbPeErA0120210422_Med1
order DDAbPeErA0120210506_Med1
order DDAbPeErA0120210520_Med1
order DDAbPeErA0120210603_Med1
order DDAbPeErA0120210610_Med1
order DDAbPeErA0120210617_Med1
order DDAbPeErA0120210624_Med1
order DDAbPeErA0120210701_Med1
order DDAbPeErA0120210708_Med1
order DDAbPeErA0120210715_Med1
order DDAbPeErA0120210722_Med1
order DDAbPeErA0120210729_Med1
order DDAbPeErA0120210805_Med1
order DDAbPeErA0120210812_Med1
order DDAbPeErA0120210819_Med1
order DDAbPeErA0120210826_Med1
order DDAbPeErA0120210902_Med1
order DDAbPeErA0120210909_Med1
order DDAbPeErA0120210916_Med1
order DDAbPeErA0120210923_Med1
order DDAbPeErA0120210930_Med1
order DDAbPeErA0120211007_Med1
order DDAbPeErA0120211014_Med1
order DDAbPeErA0120211021_Med1
order DDAbPeErA0120211028_Med1
order DDAbPeErA0120211104_Med1
order DDAbPeErA0120211111_Med1
order DDAbPeErA0120211118_Med1
order DDAbPeErA0120211125_Med1
order DDAbPeErA0120211202_Med1
order DDAbPeErA0120211209_Med1
order DDAbPeErA0120211216_Med1
order DDAbPeErA0120211223_Med1
order DDAbPeErA0120211230_Med1


capture drop DDAbPeErA01_Mean1
egen DDAbPeErA01_Mean1 = rowmean(DDAbPeErA0120211230_Med1-DDAbPeErA0120200417_Med1) 
label var DDAbPeErA01_Mean1 "DDAbPeErA01 mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErA01_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA01_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA01_Mean1 = . if date < td(17Apr2020) // 17Apr2020 is the earliest date of DELP forecasts for Iran


 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorA01_Mean2 = mean(DDErrorA01_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorA01_Mean2 "DDErrorA01 Mean over calendar months of median error over updates"

egen DDAbsErrA01_Mean2 = mean(DDAbsErrA01_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrA01_Mean2 "DDAbsErrA01 Mean over calendar months of median absolute error over updates"

egen DDPerErrA01_Mean2 = mean(DDPerErrA01_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrA01_Mean2 "DDPerErrA01 Mean over calendar months of median % error over updates"

egen DDAbPeErA01_Mean2 = mean(DDAbPeErA01_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErA01_Mean2 "DDAbPeErA01 Mean over calendar months of median absolute % error over updates"







******
* graph 3 Daily deaths, Error

twoway ///
(line DDErrorA0120200417 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200424 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200501 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200509 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200517 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200524 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200531 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200607 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200614 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200621 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200628 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200704 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200718 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200723 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200801 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200815 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200829 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200912 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120200926 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201008 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201022 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201105 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201203 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201217 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120201231 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210114 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210128 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210211 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210225 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210311 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210325 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210408 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210422 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210506 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210520 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210603 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210610 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210617 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210624 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210701 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210708 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210715 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210722 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210729 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210805 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210812 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210819 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210826 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210902 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210909 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210916 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210923 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120210930 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211007 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211014 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211021 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211028 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211104 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211111 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211118 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211125 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211202 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211209 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211216 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211223 date, sort lcolor(red) lwidth(thin)) /// 
(line DDErrorA0120211230 date, sort lcolor(red) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, DELP, all updates, forecast only", size(small)) 

qui graph export "graph 3 C19 daily deaths error, $country, DELP, all updates.pdf", replace





******
* graph 4 Daily deaths, Absolute Error

twoway ///
(line DDAbsErrA0120200417 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200424 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200501 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200509 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200517 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200524 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200531 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200607 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200614 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200621 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200628 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200704 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200718 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200723 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200801 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200815 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200829 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200912 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120200926 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201008 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201022 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201105 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201203 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201217 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120201231 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210114 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210128 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210211 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210225 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210311 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210325 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210408 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210422 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210506 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210520 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210603 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210610 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210617 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210624 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210701 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210708 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210715 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210722 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210729 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210805 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210812 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210819 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210826 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210902 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210909 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210916 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210923 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120210930 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211007 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211014 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211021 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211028 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211104 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211111 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211118 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211125 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211202 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211209 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211216 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211223 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbsErrA0120211230 date, sort lcolor(red) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, DELP, all updates, forecast only", size(small))

qui graph export "graph 4 C19 daily deaths absolute error, $country, DELP, all updates.pdf", replace








******
* graph 5 Daily deaths, % Error

twoway ///
(line DDPerErrA0120200417 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200424 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200501 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200509 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200517 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200524 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200531 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200607 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200614 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200621 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200628 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200704 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200718 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200723 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200801 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200815 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200829 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200912 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120200926 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201008 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201022 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201105 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201203 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201217 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120201231 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210114 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210128 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210211 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210225 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210311 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210325 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210408 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210422 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210506 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210520 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210603 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210610 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210617 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210624 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210701 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210708 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210715 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210722 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210729 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210805 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210812 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210819 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210826 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210902 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210909 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210916 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210923 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120210930 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211007 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211014 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211021 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211028 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211104 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211111 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211118 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211125 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211202 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211209 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211216 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211223 date, sort lcolor(red) lwidth(thin)) /// 
(line DDPerErrA0120211230 date, sort lcolor(red) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, DELP, all updates, forecast only", size(small))

qui graph export "graph 5 C19 daily deaths % error, $country, DELP, all updates.pdf", replace








******
* graph 6 Daily deaths, Absolute % Error

twoway ///
(line DDAbPeErA0120200417 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200424 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200501 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200509 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200517 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200524 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200531 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200607 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200614 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200621 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200628 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200704 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200718 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200723 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200801 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200815 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200829 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200912 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120200926 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201008 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201022 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201105 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201119 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201203 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201217 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120201231 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210114 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210128 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210211 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210225 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210311 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210325 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210408 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210422 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210506 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210520 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210603 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210610 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210617 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210624 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210701 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210708 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210715 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210722 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210729 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210805 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210812 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210819 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210826 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210902 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210909 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210916 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210923 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120210930 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211007 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211014 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211021 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211028 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211104 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211111 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211118 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211125 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211202 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211209 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211216 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211223 date, sort lcolor(red) lwidth(thin)) /// 
(line DDAbPeErA0120211230 date, sort lcolor(red) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, DELP, all updates, forecast only", size(small))

qui graph export "graph 6 C19 daily deaths absolute % error, $country, DELP, all updates.pdf", replace











***************************************************************
* graph 7 a Daily deaths, average median errors 

twoway ///
(line DDErrorA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 a C19 daily deaths error, $country, DELP, Error Mean1.pdf", replace




*********************
* smooth median error for better viewing 

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   

tssmooth ma DDErrorA01_Mean1_window = DDErrorA01_Mean1, window(3 1 3)

tssmooth ma DDErrorA01_Mean1_sm = DDErrorA01_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorA01_Mean1_sm "Daily deaths DELP average median errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*




***************************************************************
* graph 7 b Daily deaths, average median errors 

twoway ///
(line DDErrorA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 b C19 daily deaths error, $country, DELP, Error Mean1 smooth.pdf", replace










***************************************************************
* graph 8 a Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 a C19 daily deaths error, $country, DELP, Absolute Error Mean1.pdf", replace





*********************
* smooth median absolute error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbsErrA01_Mean1_window = DDAbsErrA01_Mean1, window(3 1 3)

tssmooth ma DDAbsErrA01_Mean1_sm = DDAbsErrA01_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrA01_Mean1_sm "Daily deaths DELP average median absolute errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 8 b Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 b C19 daily deaths error, $country, DELP, Absolute Error Mean1 smooth.pdf", replace







***************************************************************
* graph 9 a Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 a C19 daily deaths error, $country, DELP, % Error Mean1.pdf", replace




*********************
* smooth median percent error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDPerErrA01_Mean1_window = DDPerErrA01_Mean1, window(3 1 3)

tssmooth ma DDPerErrA01_Mean1_sm = DDPerErrA01_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrA01_Mean1_sm "Daily deaths DELP average median percent errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 9 b Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 b C19 daily deaths error, $country, DELP, % Error Mean1 smooth.pdf", replace










***************************************************************
* graph 10 a Daily deaths, average median absolute percent errors

twoway ///
(line DDAbPeErA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 a C19 daily deaths error, $country, DELP, Absolute % Error Mean1.pdf", replace




*********************
* smooth median absolute % error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbPeErA01_Mean1_window = DDAbPeErA01_Mean1, window(3 1 3)

tssmooth ma DDAbPeErA01_Mean1_sm = DDAbPeErA01_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErA01_Mean1_sm "Daily deaths DELP average median absolute percent errors smooth"

drop *_window

drop provincestate_encoded

tsset, clear

*



***************************************************************
* graph 10 b Daily deaths, average median absolute percent errors, smooth

twoway ///
(line DDAbPeErA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, DELP, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 b C19 daily deaths error, $country, DELP, Absolute % Error Mean1 smooth.pdf", replace








***********************************************

capture drop *2r

gen DDAbPeErA01_Mean2r = round(DDAbPeErA01_Mean2,0.1)
    

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA01_Mean2r /// 
, bar(1, fcolor(red) lcolor(red)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("$country, DELP, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) 

qui graph export "graph 11 C19 daily deaths, $country, DELP, Average MAPE.pdf", replace








******

qui compress 

save "CovidLongitudinal DELP 2.dta", replace 






view "log CovidLongitudinal DELP 5.smcl"

log close

exit, clear

