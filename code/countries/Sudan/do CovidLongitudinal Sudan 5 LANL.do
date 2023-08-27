
clear all

cd "$pathCovidLongitudinal/countries/Sudan"

capture log close 

log using "log CovidLongitudinal Sudan 5 LANL.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Sudan 5 LANL.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Sudan <<----                                                                 
***************************************************************************


** model = LANL ** <<-- modify 1
* lcolor brown

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together


* input data files: "LANL Sudan.dta"
* output data files: "LANL Sudan error.dta" (with error measures saved)

* output data dictionary files: "LANL Sudan error data dictionary.csv"


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
* "graph 03 Sudan LANL C19 daily deaths error.pdf"
* "graph 04 Sudan LANL C19 daily deaths absolute error.pdf"
* "graph 05 Sudan LANL C19 daily deaths percent error.pdf"
* "graph 06 Sudan LANL C19 daily deaths absolute percent error.pdf"

* "graph 07 Sudan LANL C19 daily deaths average median error.pdf"
* "graph 08 Sudan LANL C19 daily deaths average median absolute error.pdf"
* "graph 09 Sudan LANL C19 daily deaths average median percent error.pdf"
* "graph 10 Sudan LANL C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Sudan LANL C19 daily deaths Average MAPE over updates and calendar months


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







use "LANL Sudan.dta", clear 




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
20200426 ///
20200429 ///
20200506 ///
20200510 ///
20200513 ///
20200517 ///
20200520 ///
20200524 ///
20200527 ///
20200531 ///
20200603 ///
20200607 ///
20200610 ///
20200613 ///
20200617 ///
20200621 ///
20200623 ///
20200628 ///
20200701 ///
20200705 ///
20200708 ///
20200712 ///
20200715 ///
20200719 ///
20200722 ///
20200726 ///
20200729 ///
20200802 ///
20200805 ///
20200809 ///
20200812 ///
20200816 ///
20200819 ///
20200823 ///
20200826 ///
20200830 ///
20200902 ///
20200906 ///
20200909 ///
20200913 ///
20200916 ///
20200920 ///
20200923 ///
20200927 ///
20200930 ///
20201004 ///
20201007 ///
20201011 ///
20201014 ///
20201018 ///
20201021 ///
20201025 ///
20201028 ///
20201101 ///
20201104 ///
20201108 ///
20201111 ///
20201115 ///
20201118 ///
20201122 ///
20201125 ///
20201129 ///
20201202 ///
20201206 ///
20201209 ///
20201213 ///
20201216 ///
20201220 ///
20201223 ///
20210103 ///
20210105 ///
20210110 ///
20210113 ///
20210117 ///
20210120 ///
20210124 ///
20210127 ///
20210131 ///
20210203 ///
20210207 ///
20210210 ///
20210214 ///
20210217 ///
20210221 ///
20210224 ///
20210228 ///
20210303 ///
20210307 ///
20210310 ///
20210314 ///
20210321 ///
20210324 ///
20210328 ///
20210331 ///
20210404 ///
20210407 ///
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
qui replace DDErrorLANL`update' = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan
                                                            // <<-- modify 3
capture drop DDAbsErrLANL`update'
gen DDAbsErrLANL`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))
label var DDAbsErrLANL`update' "DayDeaMeFoLANL`update' absolute error"
qui replace DDAbsErrLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL`update' = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

capture drop DDPerErrLANL`update'
gen DDPerErrLANL`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))) / DayDeaMeSmJOHN
label var DDPerErrLANL`update' "DayDeaMeFoLANL`update' percent error"
qui replace DDPerErrLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL`update' = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

capture drop DDAbPeErLANL`update'
gen DDAbPeErLANL`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoLANL`update'))) / DayDeaMeSmJOHN
label var DDAbPeErLANL`update' "DayDeaMeFoLANL`update' absolute percent error" 
qui replace DDAbPeErLANL`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL`update' = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

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
qui replace DDErrorLANL`update'_Med1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

capture drop DDAbsErrLANL`update'_Med1
bysort yearmonth : egen DDAbsErrLANL`update'_Med1 = median(DDAbsErrLANL`update')
label var DDAbsErrLANL`update'_Med1 "DayDeaLANL median absolute error by calendar months and updates"
qui replace DDAbsErrLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL`update'_Med1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

capture drop DDPerErrLANL`update'_Med1
bysort yearmonth : egen DDPerErrLANL`update'_Med1 = median(DDPerErrLANL`update')
label var DDPerErrLANL`update'_Med1 "DayDeaLANL median % error by calendar months and updates"
qui replace DDPerErrLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL`update'_Med1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

capture drop DDAbPeErLANL`update'_Med1
bysort yearmonth : egen DDAbPeErLANL`update'_Med1 = median(DDAbPeErLANL`update')
label var DDAbPeErLANL`update'_Med1 "DayDeaLANL median absolute % error by calendar months and updates" 
qui replace DDAbPeErLANL`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL`update'_Med1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorLANL20200426_Med1
order DDErrorLANL20200429_Med1
order DDErrorLANL20200506_Med1
order DDErrorLANL20200510_Med1
order DDErrorLANL20200513_Med1
order DDErrorLANL20200517_Med1
order DDErrorLANL20200520_Med1
order DDErrorLANL20200524_Med1
order DDErrorLANL20200527_Med1
order DDErrorLANL20200531_Med1
order DDErrorLANL20200603_Med1
order DDErrorLANL20200607_Med1
order DDErrorLANL20200610_Med1
order DDErrorLANL20200613_Med1
order DDErrorLANL20200617_Med1
order DDErrorLANL20200621_Med1
order DDErrorLANL20200623_Med1
order DDErrorLANL20200628_Med1
order DDErrorLANL20200701_Med1
order DDErrorLANL20200705_Med1
order DDErrorLANL20200708_Med1
order DDErrorLANL20200712_Med1
order DDErrorLANL20200715_Med1
order DDErrorLANL20200719_Med1
order DDErrorLANL20200722_Med1
order DDErrorLANL20200726_Med1
order DDErrorLANL20200729_Med1
order DDErrorLANL20200802_Med1
order DDErrorLANL20200805_Med1
order DDErrorLANL20200809_Med1
order DDErrorLANL20200812_Med1
order DDErrorLANL20200816_Med1
order DDErrorLANL20200819_Med1
order DDErrorLANL20200823_Med1
order DDErrorLANL20200826_Med1
order DDErrorLANL20200830_Med1
order DDErrorLANL20200902_Med1
order DDErrorLANL20200906_Med1
order DDErrorLANL20200909_Med1
order DDErrorLANL20200913_Med1
order DDErrorLANL20200916_Med1
order DDErrorLANL20200920_Med1
order DDErrorLANL20200923_Med1
order DDErrorLANL20200927_Med1
order DDErrorLANL20200930_Med1
order DDErrorLANL20201004_Med1
order DDErrorLANL20201007_Med1
order DDErrorLANL20201011_Med1
order DDErrorLANL20201014_Med1
order DDErrorLANL20201018_Med1
order DDErrorLANL20201021_Med1
order DDErrorLANL20201025_Med1
order DDErrorLANL20201028_Med1
order DDErrorLANL20201101_Med1
order DDErrorLANL20201104_Med1
order DDErrorLANL20201108_Med1
order DDErrorLANL20201111_Med1
order DDErrorLANL20201115_Med1
order DDErrorLANL20201118_Med1
order DDErrorLANL20201122_Med1
order DDErrorLANL20201125_Med1
order DDErrorLANL20201129_Med1
order DDErrorLANL20201202_Med1
order DDErrorLANL20201206_Med1
order DDErrorLANL20201209_Med1
order DDErrorLANL20201213_Med1
order DDErrorLANL20201216_Med1
order DDErrorLANL20201220_Med1
order DDErrorLANL20201223_Med1
order DDErrorLANL20210103_Med1
order DDErrorLANL20210105_Med1
order DDErrorLANL20210110_Med1
order DDErrorLANL20210113_Med1
order DDErrorLANL20210117_Med1
order DDErrorLANL20210120_Med1
order DDErrorLANL20210124_Med1
order DDErrorLANL20210127_Med1
order DDErrorLANL20210131_Med1
order DDErrorLANL20210203_Med1
order DDErrorLANL20210207_Med1
order DDErrorLANL20210210_Med1
order DDErrorLANL20210214_Med1
order DDErrorLANL20210217_Med1
order DDErrorLANL20210221_Med1
order DDErrorLANL20210224_Med1
order DDErrorLANL20210228_Med1
order DDErrorLANL20210303_Med1
order DDErrorLANL20210307_Med1
order DDErrorLANL20210310_Med1
order DDErrorLANL20210314_Med1
order DDErrorLANL20210321_Med1
order DDErrorLANL20210324_Med1
order DDErrorLANL20210328_Med1
order DDErrorLANL20210331_Med1
order DDErrorLANL20210404_Med1
order DDErrorLANL20210407_Med1
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
egen DDErrorLANL_Mean1 = rowmean(DDErrorLANL20210926_Med1-DDErrorLANL20200426_Med1) // <<-- modify 5
label var DDErrorLANL_Mean1 "DDErrorLANL mean over updates of median error by calendar months"
qui replace DDErrorLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorLANL_Mean1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan






* gen DDAbsErrLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrLANL20200426_Med1
order DDAbsErrLANL20200429_Med1
order DDAbsErrLANL20200506_Med1
order DDAbsErrLANL20200510_Med1
order DDAbsErrLANL20200513_Med1
order DDAbsErrLANL20200517_Med1
order DDAbsErrLANL20200520_Med1
order DDAbsErrLANL20200524_Med1
order DDAbsErrLANL20200527_Med1
order DDAbsErrLANL20200531_Med1
order DDAbsErrLANL20200603_Med1
order DDAbsErrLANL20200607_Med1
order DDAbsErrLANL20200610_Med1
order DDAbsErrLANL20200613_Med1
order DDAbsErrLANL20200617_Med1
order DDAbsErrLANL20200621_Med1
order DDAbsErrLANL20200623_Med1
order DDAbsErrLANL20200628_Med1
order DDAbsErrLANL20200701_Med1
order DDAbsErrLANL20200705_Med1
order DDAbsErrLANL20200708_Med1
order DDAbsErrLANL20200712_Med1
order DDAbsErrLANL20200715_Med1
order DDAbsErrLANL20200719_Med1
order DDAbsErrLANL20200722_Med1
order DDAbsErrLANL20200726_Med1
order DDAbsErrLANL20200729_Med1
order DDAbsErrLANL20200802_Med1
order DDAbsErrLANL20200805_Med1
order DDAbsErrLANL20200809_Med1
order DDAbsErrLANL20200812_Med1
order DDAbsErrLANL20200816_Med1
order DDAbsErrLANL20200819_Med1
order DDAbsErrLANL20200823_Med1
order DDAbsErrLANL20200826_Med1
order DDAbsErrLANL20200830_Med1
order DDAbsErrLANL20200902_Med1
order DDAbsErrLANL20200906_Med1
order DDAbsErrLANL20200909_Med1
order DDAbsErrLANL20200913_Med1
order DDAbsErrLANL20200916_Med1
order DDAbsErrLANL20200920_Med1
order DDAbsErrLANL20200923_Med1
order DDAbsErrLANL20200927_Med1
order DDAbsErrLANL20200930_Med1
order DDAbsErrLANL20201004_Med1
order DDAbsErrLANL20201007_Med1
order DDAbsErrLANL20201011_Med1
order DDAbsErrLANL20201014_Med1
order DDAbsErrLANL20201018_Med1
order DDAbsErrLANL20201021_Med1
order DDAbsErrLANL20201025_Med1
order DDAbsErrLANL20201028_Med1
order DDAbsErrLANL20201101_Med1
order DDAbsErrLANL20201104_Med1
order DDAbsErrLANL20201108_Med1
order DDAbsErrLANL20201111_Med1
order DDAbsErrLANL20201115_Med1
order DDAbsErrLANL20201118_Med1
order DDAbsErrLANL20201122_Med1
order DDAbsErrLANL20201125_Med1
order DDAbsErrLANL20201129_Med1
order DDAbsErrLANL20201202_Med1
order DDAbsErrLANL20201206_Med1
order DDAbsErrLANL20201209_Med1
order DDAbsErrLANL20201213_Med1
order DDAbsErrLANL20201216_Med1
order DDAbsErrLANL20201220_Med1
order DDAbsErrLANL20201223_Med1
order DDAbsErrLANL20210103_Med1
order DDAbsErrLANL20210105_Med1
order DDAbsErrLANL20210110_Med1
order DDAbsErrLANL20210113_Med1
order DDAbsErrLANL20210117_Med1
order DDAbsErrLANL20210120_Med1
order DDAbsErrLANL20210124_Med1
order DDAbsErrLANL20210127_Med1
order DDAbsErrLANL20210131_Med1
order DDAbsErrLANL20210203_Med1
order DDAbsErrLANL20210207_Med1
order DDAbsErrLANL20210210_Med1
order DDAbsErrLANL20210214_Med1
order DDAbsErrLANL20210217_Med1
order DDAbsErrLANL20210221_Med1
order DDAbsErrLANL20210224_Med1
order DDAbsErrLANL20210228_Med1
order DDAbsErrLANL20210303_Med1
order DDAbsErrLANL20210307_Med1
order DDAbsErrLANL20210310_Med1
order DDAbsErrLANL20210314_Med1
order DDAbsErrLANL20210321_Med1
order DDAbsErrLANL20210324_Med1
order DDAbsErrLANL20210328_Med1
order DDAbsErrLANL20210331_Med1
order DDAbsErrLANL20210404_Med1
order DDAbsErrLANL20210407_Med1
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
egen DDAbsErrLANL_Mean1 = rowmean(DDAbsErrLANL20210926_Med1-DDAbsErrLANL20200426_Med1) // <<-- modify 7
label var DDAbsErrLANL_Mean1 "DDAbsErrLANL mean over updates of median absolute error by calendar months"
qui replace DDAbsErrLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrLANL_Mean1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan







* gen DDPerErrLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrLANL20200426_Med1
order DDPerErrLANL20200429_Med1
order DDPerErrLANL20200506_Med1
order DDPerErrLANL20200510_Med1
order DDPerErrLANL20200513_Med1
order DDPerErrLANL20200517_Med1
order DDPerErrLANL20200520_Med1
order DDPerErrLANL20200524_Med1
order DDPerErrLANL20200527_Med1
order DDPerErrLANL20200531_Med1
order DDPerErrLANL20200603_Med1
order DDPerErrLANL20200607_Med1
order DDPerErrLANL20200610_Med1
order DDPerErrLANL20200613_Med1
order DDPerErrLANL20200617_Med1
order DDPerErrLANL20200621_Med1
order DDPerErrLANL20200623_Med1
order DDPerErrLANL20200628_Med1
order DDPerErrLANL20200701_Med1
order DDPerErrLANL20200705_Med1
order DDPerErrLANL20200708_Med1
order DDPerErrLANL20200712_Med1
order DDPerErrLANL20200715_Med1
order DDPerErrLANL20200719_Med1
order DDPerErrLANL20200722_Med1
order DDPerErrLANL20200726_Med1
order DDPerErrLANL20200729_Med1
order DDPerErrLANL20200802_Med1
order DDPerErrLANL20200805_Med1
order DDPerErrLANL20200809_Med1
order DDPerErrLANL20200812_Med1
order DDPerErrLANL20200816_Med1
order DDPerErrLANL20200819_Med1
order DDPerErrLANL20200823_Med1
order DDPerErrLANL20200826_Med1
order DDPerErrLANL20200830_Med1
order DDPerErrLANL20200902_Med1
order DDPerErrLANL20200906_Med1
order DDPerErrLANL20200909_Med1
order DDPerErrLANL20200913_Med1
order DDPerErrLANL20200916_Med1
order DDPerErrLANL20200920_Med1
order DDPerErrLANL20200923_Med1
order DDPerErrLANL20200927_Med1
order DDPerErrLANL20200930_Med1
order DDPerErrLANL20201004_Med1
order DDPerErrLANL20201007_Med1
order DDPerErrLANL20201011_Med1
order DDPerErrLANL20201014_Med1
order DDPerErrLANL20201018_Med1
order DDPerErrLANL20201021_Med1
order DDPerErrLANL20201025_Med1
order DDPerErrLANL20201028_Med1
order DDPerErrLANL20201101_Med1
order DDPerErrLANL20201104_Med1
order DDPerErrLANL20201108_Med1
order DDPerErrLANL20201111_Med1
order DDPerErrLANL20201115_Med1
order DDPerErrLANL20201118_Med1
order DDPerErrLANL20201122_Med1
order DDPerErrLANL20201125_Med1
order DDPerErrLANL20201129_Med1
order DDPerErrLANL20201202_Med1
order DDPerErrLANL20201206_Med1
order DDPerErrLANL20201209_Med1
order DDPerErrLANL20201213_Med1
order DDPerErrLANL20201216_Med1
order DDPerErrLANL20201220_Med1
order DDPerErrLANL20201223_Med1
order DDPerErrLANL20210103_Med1
order DDPerErrLANL20210105_Med1
order DDPerErrLANL20210110_Med1
order DDPerErrLANL20210113_Med1
order DDPerErrLANL20210117_Med1
order DDPerErrLANL20210120_Med1
order DDPerErrLANL20210124_Med1
order DDPerErrLANL20210127_Med1
order DDPerErrLANL20210131_Med1
order DDPerErrLANL20210203_Med1
order DDPerErrLANL20210207_Med1
order DDPerErrLANL20210210_Med1
order DDPerErrLANL20210214_Med1
order DDPerErrLANL20210217_Med1
order DDPerErrLANL20210221_Med1
order DDPerErrLANL20210224_Med1
order DDPerErrLANL20210228_Med1
order DDPerErrLANL20210303_Med1
order DDPerErrLANL20210307_Med1
order DDPerErrLANL20210310_Med1
order DDPerErrLANL20210314_Med1
order DDPerErrLANL20210321_Med1
order DDPerErrLANL20210324_Med1
order DDPerErrLANL20210328_Med1
order DDPerErrLANL20210331_Med1
order DDPerErrLANL20210404_Med1
order DDPerErrLANL20210407_Med1
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
egen DDPerErrLANL_Mean1 = rowmean(DDPerErrLANL20210926_Med1-DDPerErrLANL20200426_Med1) // <<-- modify 9
label var DDPerErrLANL_Mean1 "DDPerErrLANL mean over updates of median % error by calendar months"
qui replace DDPerErrLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrLANL_Mean1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

 
 
 

* gen DDAbPeErLANL_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErLANL20200426_Med1
order DDAbPeErLANL20200429_Med1
order DDAbPeErLANL20200506_Med1
order DDAbPeErLANL20200510_Med1
order DDAbPeErLANL20200513_Med1
order DDAbPeErLANL20200517_Med1
order DDAbPeErLANL20200520_Med1
order DDAbPeErLANL20200524_Med1
order DDAbPeErLANL20200527_Med1
order DDAbPeErLANL20200531_Med1
order DDAbPeErLANL20200603_Med1
order DDAbPeErLANL20200607_Med1
order DDAbPeErLANL20200610_Med1
order DDAbPeErLANL20200613_Med1
order DDAbPeErLANL20200617_Med1
order DDAbPeErLANL20200621_Med1
order DDAbPeErLANL20200623_Med1
order DDAbPeErLANL20200628_Med1
order DDAbPeErLANL20200701_Med1
order DDAbPeErLANL20200705_Med1
order DDAbPeErLANL20200708_Med1
order DDAbPeErLANL20200712_Med1
order DDAbPeErLANL20200715_Med1
order DDAbPeErLANL20200719_Med1
order DDAbPeErLANL20200722_Med1
order DDAbPeErLANL20200726_Med1
order DDAbPeErLANL20200729_Med1
order DDAbPeErLANL20200802_Med1
order DDAbPeErLANL20200805_Med1
order DDAbPeErLANL20200809_Med1
order DDAbPeErLANL20200812_Med1
order DDAbPeErLANL20200816_Med1
order DDAbPeErLANL20200819_Med1
order DDAbPeErLANL20200823_Med1
order DDAbPeErLANL20200826_Med1
order DDAbPeErLANL20200830_Med1
order DDAbPeErLANL20200902_Med1
order DDAbPeErLANL20200906_Med1
order DDAbPeErLANL20200909_Med1
order DDAbPeErLANL20200913_Med1
order DDAbPeErLANL20200916_Med1
order DDAbPeErLANL20200920_Med1
order DDAbPeErLANL20200923_Med1
order DDAbPeErLANL20200927_Med1
order DDAbPeErLANL20200930_Med1
order DDAbPeErLANL20201004_Med1
order DDAbPeErLANL20201007_Med1
order DDAbPeErLANL20201011_Med1
order DDAbPeErLANL20201014_Med1
order DDAbPeErLANL20201018_Med1
order DDAbPeErLANL20201021_Med1
order DDAbPeErLANL20201025_Med1
order DDAbPeErLANL20201028_Med1
order DDAbPeErLANL20201101_Med1
order DDAbPeErLANL20201104_Med1
order DDAbPeErLANL20201108_Med1
order DDAbPeErLANL20201111_Med1
order DDAbPeErLANL20201115_Med1
order DDAbPeErLANL20201118_Med1
order DDAbPeErLANL20201122_Med1
order DDAbPeErLANL20201125_Med1
order DDAbPeErLANL20201129_Med1
order DDAbPeErLANL20201202_Med1
order DDAbPeErLANL20201206_Med1
order DDAbPeErLANL20201209_Med1
order DDAbPeErLANL20201213_Med1
order DDAbPeErLANL20201216_Med1
order DDAbPeErLANL20201220_Med1
order DDAbPeErLANL20201223_Med1
order DDAbPeErLANL20210103_Med1
order DDAbPeErLANL20210105_Med1
order DDAbPeErLANL20210110_Med1
order DDAbPeErLANL20210113_Med1
order DDAbPeErLANL20210117_Med1
order DDAbPeErLANL20210120_Med1
order DDAbPeErLANL20210124_Med1
order DDAbPeErLANL20210127_Med1
order DDAbPeErLANL20210131_Med1
order DDAbPeErLANL20210203_Med1
order DDAbPeErLANL20210207_Med1
order DDAbPeErLANL20210210_Med1
order DDAbPeErLANL20210214_Med1
order DDAbPeErLANL20210217_Med1
order DDAbPeErLANL20210221_Med1
order DDAbPeErLANL20210224_Med1
order DDAbPeErLANL20210228_Med1
order DDAbPeErLANL20210303_Med1
order DDAbPeErLANL20210307_Med1
order DDAbPeErLANL20210310_Med1
order DDAbPeErLANL20210314_Med1
order DDAbPeErLANL20210321_Med1
order DDAbPeErLANL20210324_Med1
order DDAbPeErLANL20210328_Med1
order DDAbPeErLANL20210331_Med1
order DDAbPeErLANL20210404_Med1
order DDAbPeErLANL20210407_Med1
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
egen DDAbPeErLANL_Mean1 = rowmean(DDAbPeErLANL20210926_Med1-DDAbPeErLANL20200426_Med1) // <<-- modify 11
label var DDAbPeErLANL_Mean1 "DDAbPeErLANL mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErLANL_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErLANL_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErLANL_Mean1 = . if date < td(26apr2020) // 26apr2020 is the earliest date of LANL forecasts for Sudan

 
 
 
 
 
 




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
(line DDErrorLANL20200426 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200429 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200506 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200510 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200513 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200517 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200520 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200524 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200527 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200531 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200603 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200607 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200610 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200617 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200621 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200623 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200628 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200701 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200705 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200708 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200712 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200715 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200719 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200722 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200726 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200729 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200802 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200805 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200809 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200812 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200816 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200819 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200823 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200826 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200830 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200902 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200906 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200909 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200913 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200916 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200920 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200923 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200927 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20200930 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201004 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201007 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201011 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201014 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201018 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201021 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201025 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201028 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201101 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201104 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201108 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201111 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201115 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201118 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201122 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201125 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201129 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201202 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201206 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201209 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201213 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201216 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201220 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20201223 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210103 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210105 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210110 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210113 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210117 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210120 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210124 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210127 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210131 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210203 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210207 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210210 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210214 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210217 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210221 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210224 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210228 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210303 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210307 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210310 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210314 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210321 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210324 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210328 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210331 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210404 date, sort lcolor(brown) lwidth(thin)) ///
(line DDErrorLANL20210407 date, sort lcolor(brown) lwidth(thin)) ///
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
subtitle("Sudan, LANL, all updates, forecast only", size(small)) 

qui graph export "graph 03 Sudan LANL C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrLANL20200426 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200429 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200506 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200510 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200513 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200517 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200520 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200524 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200527 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200531 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200603 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200607 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200610 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200617 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200621 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200623 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200628 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200701 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200705 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200708 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200712 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200715 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200719 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200722 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200726 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200729 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200802 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200805 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200809 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200812 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200816 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200819 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200823 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200826 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200830 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200902 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200906 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200909 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200913 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200916 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200920 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200923 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200927 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20200930 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201004 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201007 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201011 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201014 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201018 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201021 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201025 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201028 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201101 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201104 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201108 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201111 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201115 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201118 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201122 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201125 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201129 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201202 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201206 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201209 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201213 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201216 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201220 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20201223 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210103 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210105 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210110 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210113 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210117 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210120 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210124 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210127 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210131 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210203 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210207 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210210 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210214 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210217 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210221 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210224 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210228 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210303 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210307 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210310 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210314 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210321 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210324 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210328 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210331 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210404 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbsErrLANL20210407 date, sort lcolor(brown) lwidth(thin)) ///
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
subtitle("Sudan, LANL, all updates, forecast only", size(small))

qui graph export "graph 04 Sudan LANL C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrLANL20200426 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200429 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200506 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200510 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200513 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200517 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200520 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200524 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200527 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200531 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200603 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200607 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200610 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200617 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200621 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200623 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200628 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200701 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200705 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200708 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200712 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200715 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200719 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200722 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200726 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200729 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200802 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200805 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200809 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200812 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200816 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200819 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200823 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200826 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200830 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200902 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200906 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200909 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200913 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200916 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200920 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200923 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200927 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20200930 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201004 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201007 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201011 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201014 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201018 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201021 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201025 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201028 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201101 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201104 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201108 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201111 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201115 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201118 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201122 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201125 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201129 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201202 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201206 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201209 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201213 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201216 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201220 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20201223 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210103 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210105 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210110 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210113 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210117 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210120 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210124 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210127 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210131 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210203 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210207 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210210 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210214 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210217 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210221 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210224 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210228 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210303 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210307 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210310 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210314 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210321 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210324 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210328 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210331 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210404 date, sort lcolor(brown) lwidth(thin)) ///
(line DDPerErrLANL20210407 date, sort lcolor(brown) lwidth(thin)) ///
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
subtitle("Sudan, LANL, all updates, forecast only", size(small))

qui graph export "graph 05 Sudan LANL C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* LANL lcolor brown // <<-- modify 16

twoway ///
(line DDAbPeErLANL20200426 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200429 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200506 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200510 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200513 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200517 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200520 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200524 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200527 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200531 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200603 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200607 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200610 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200613 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200617 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200621 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200623 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200628 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200701 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200705 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200708 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200712 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200715 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200719 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200722 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200726 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200729 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200802 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200805 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200809 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200812 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200816 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200819 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200823 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200826 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200830 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200902 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200906 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200909 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200913 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200916 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200920 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200923 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200927 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20200930 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201004 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201007 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201011 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201014 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201018 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201021 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201025 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201028 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201101 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201104 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201108 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201111 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201115 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201118 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201122 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201125 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201129 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201202 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201206 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201209 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201213 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201216 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201220 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20201223 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210103 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210105 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210110 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210113 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210117 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210120 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210124 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210127 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210131 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210203 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210207 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210210 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210214 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210217 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210221 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210224 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210228 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210303 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210307 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210310 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210314 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210321 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210324 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210328 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210331 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210404 date, sort lcolor(brown) lwidth(thin)) ///
(line DDAbPeErLANL20210407 date, sort lcolor(brown) lwidth(thin)) ///
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
subtitle("Sudan, LANL, all updates, forecast only", size(small))

qui graph export "graph 06 Sudan LANL C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Sudan, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Sudan LANL C19 daily deaths average median error.pdf", replace





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
subtitle("Sudan, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Sudan LANL C19 daily deaths average median absolute error.pdf", replace






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
subtitle("Sudan, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Sudan LANL C19 daily deaths average median percent error.pdf", replace





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
subtitle("Sudan, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Sudan LANL C19 daily deaths average median absolute percent error.pdf", replace





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
subtitle("Sudan, LANL, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Sudan LANL C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "LANL Sudan error.dta", replace 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Sudan error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Sudan 5 LANL.smcl"

log close

exit, clear

