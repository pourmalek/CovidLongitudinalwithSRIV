
clear all

cd "$pathCovidLongitudinal/countries/Slovenia"

capture log close 

log using "log CovidLongitudinal Slovenia 4 IMPE.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Slovenia 4 IMPE.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Slovenia <<----                                                                 
***************************************************************************


** model = IMPE ** <<-- modify 1
* lcolor magenta

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together


* input data files: "IMPE Slovenia.dta"
* output data files: "IMPE Slovenia error.dta" (with error measures saved)

* output data dictionary files: "IMPE Slovenia error data dictionary.csv"


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
* "graph 03 Slovenia IMPE C19 daily deaths error.pdf"
* "graph 04 Slovenia IMPE C19 daily deaths absolute error.pdf"
* "graph 05 Slovenia IMPE C19 daily deaths percent error.pdf"
* "graph 06 Slovenia IMPE C19 daily deaths absolute percent error.pdf"

* "graph 07 Slovenia IMPE C19 daily deaths average median error.pdf"
* "graph 08 Slovenia IMPE C19 daily deaths average median absolute error.pdf"
* "graph 09 Slovenia IMPE C19 daily deaths average median percent error.pdf"
* "graph 10 Slovenia IMPE C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Slovenia IMPE C19 daily deaths Average MAPE over updates and calendar months.pdf"


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







use "IMPE Slovenia.dta", clear 




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
20200601 ///
20200603 ///
20200606 ///
20200614 ///
20200616 ///
20200619 ///
20200623 ///
20200702 ///
20200703 ///
20200704 ///
20200707 ///
20200711 ///
20200714 ///
20200715 ///
20200718 ///
20200720 ///
20200722 ///
20200725 ///
20200727 ///
20200731 ///
20200808 ///
20200810 ///
20200811 ///
20200813 ///
20200814 ///
20200817 ///
20200823 ///
20200825 ///
20200827 ///
20200831 ///
20200902 ///
20200906 ///
20200908 ///
20200912 ///
20200915 ///
20200919 ///
20200923 ///
20200925 ///
20201003 ///
20201006 ///
20201012 ///
20201019 ///
20201025 ///
20201028 ///
20201101 ///
20201110 ///
20201114 ///
20201118 ///
20201123 ///
20201129 ///
20201204 ///
20201212 ///
20201220 ///
20201226 ///
20210104 ///
20210110 ///
20210112 ///
20210118 ///
20210124 ///
20210130 ///
20210203 ///
20210210 ///
20210217 ///
20210226 ///
20210305 ///
20210312 ///
20210319 ///
20210329 ///
20210406 ///
20210417 ///
20210424 ///
20210510 ///
20210516 ///
20210522 ///
20210527 ///
20210604 ///
20210611 ///
20210618 ///
20210626 ///
20210702 ///
20210709 ///
20210719 ///
20210806 ///
20210819 ///
20210825 ///
20210909 ///
20210924 ///
20211006 ///
20211021 ///
20211027 ///
20211103 ///
20211115 ///
20211121 ///
20211129 ///
20211205 ///
20211213 ///
20211226 ///
20220102 ///
20220315 ///
20220530 ///
20220620 ///
20220703 ///
20220712 ///
20220728 ///
20220808 ///
20220901 ///
20221225


sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorIMPE`update'
gen DDErrorIMPE`update' = - (DayDeaMeSmJOHN - DayDeaMeFoIMPE`update')
label var DDErrorIMPE`update' "DayDeaMeFoIMPE`update' error"
qui replace DDErrorIMPE`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorIMPE`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorIMPE`update' = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia
                                                            // <<-- modify 3
capture drop DDAbsErrIMPE`update'
gen DDAbsErrIMPE`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoIMPE`update'))
label var DDAbsErrIMPE`update' "DayDeaMeFoIMPE`update' absolute error"
qui replace DDAbsErrIMPE`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrIMPE`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrIMPE`update' = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

capture drop DDPerErrIMPE`update'
gen DDPerErrIMPE`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoIMPE`update'))) / DayDeaMeSmJOHN
label var DDPerErrIMPE`update' "DayDeaMeFoIMPE`update' percent error"
qui replace DDPerErrIMPE`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrIMPE`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrIMPE`update' = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

capture drop DDAbPeErIMPE`update'
gen DDAbPeErIMPE`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoIMPE`update'))) / DayDeaMeSmJOHN
label var DDAbPeErIMPE`update' "DayDeaMeFoIMPE`update' absolute percent error" 
qui replace DDAbPeErIMPE`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErIMPE`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErIMPE`update' = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorIMPE`update'_Med1
bysort yearmonth : egen DDErrorIMPE`update'_Med1 = median(DDErrorIMPE`update')
label var DDErrorIMPE`update'_Med1 "DayDeaIMPE median error by calendar months and updates"
qui replace DDErrorIMPE`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorIMPE`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorIMPE`update'_Med1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

capture drop DDAbsErrIMPE`update'_Med1
bysort yearmonth : egen DDAbsErrIMPE`update'_Med1 = median(DDAbsErrIMPE`update')
label var DDAbsErrIMPE`update'_Med1 "DayDeaIMPE median absolute error by calendar months and updates"
qui replace DDAbsErrIMPE`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrIMPE`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrIMPE`update'_Med1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

capture drop DDPerErrIMPE`update'_Med1
bysort yearmonth : egen DDPerErrIMPE`update'_Med1 = median(DDPerErrIMPE`update')
label var DDPerErrIMPE`update'_Med1 "DayDeaIMPE median % error by calendar months and updates"
qui replace DDPerErrIMPE`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrIMPE`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrIMPE`update'_Med1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

capture drop DDAbPeErIMPE`update'_Med1
bysort yearmonth : egen DDAbPeErIMPE`update'_Med1 = median(DDAbPeErIMPE`update')
label var DDAbPeErIMPE`update'_Med1 "DayDeaIMPE median absolute % error by calendar months and updates" 
qui replace DDAbPeErIMPE`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErIMPE`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErIMPE`update'_Med1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorIMPE_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorIMPE20200601_Med1
order DDErrorIMPE20200603_Med1
order DDErrorIMPE20200606_Med1
order DDErrorIMPE20200614_Med1
order DDErrorIMPE20200616_Med1
order DDErrorIMPE20200619_Med1
order DDErrorIMPE20200623_Med1
order DDErrorIMPE20200702_Med1
order DDErrorIMPE20200703_Med1
order DDErrorIMPE20200704_Med1
order DDErrorIMPE20200707_Med1
order DDErrorIMPE20200711_Med1
order DDErrorIMPE20200714_Med1
order DDErrorIMPE20200715_Med1
order DDErrorIMPE20200718_Med1
order DDErrorIMPE20200720_Med1
order DDErrorIMPE20200722_Med1
order DDErrorIMPE20200725_Med1
order DDErrorIMPE20200727_Med1
order DDErrorIMPE20200731_Med1
order DDErrorIMPE20200808_Med1
order DDErrorIMPE20200810_Med1
order DDErrorIMPE20200811_Med1
order DDErrorIMPE20200813_Med1
order DDErrorIMPE20200814_Med1
order DDErrorIMPE20200817_Med1
order DDErrorIMPE20200823_Med1
order DDErrorIMPE20200825_Med1
order DDErrorIMPE20200827_Med1
order DDErrorIMPE20200831_Med1
order DDErrorIMPE20200902_Med1
order DDErrorIMPE20200906_Med1
order DDErrorIMPE20200908_Med1
order DDErrorIMPE20200912_Med1
order DDErrorIMPE20200915_Med1
order DDErrorIMPE20200919_Med1
order DDErrorIMPE20200923_Med1
order DDErrorIMPE20200925_Med1
order DDErrorIMPE20201003_Med1
order DDErrorIMPE20201006_Med1
order DDErrorIMPE20201012_Med1
order DDErrorIMPE20201019_Med1
order DDErrorIMPE20201025_Med1
order DDErrorIMPE20201028_Med1
order DDErrorIMPE20201101_Med1
order DDErrorIMPE20201110_Med1
order DDErrorIMPE20201114_Med1
order DDErrorIMPE20201118_Med1
order DDErrorIMPE20201123_Med1
order DDErrorIMPE20201129_Med1
order DDErrorIMPE20201204_Med1
order DDErrorIMPE20201212_Med1
order DDErrorIMPE20201220_Med1
order DDErrorIMPE20201226_Med1
order DDErrorIMPE20210104_Med1
order DDErrorIMPE20210110_Med1
order DDErrorIMPE20210112_Med1
order DDErrorIMPE20210118_Med1
order DDErrorIMPE20210124_Med1
order DDErrorIMPE20210130_Med1
order DDErrorIMPE20210203_Med1
order DDErrorIMPE20210210_Med1
order DDErrorIMPE20210217_Med1
order DDErrorIMPE20210226_Med1
order DDErrorIMPE20210305_Med1
order DDErrorIMPE20210312_Med1
order DDErrorIMPE20210319_Med1
order DDErrorIMPE20210329_Med1
order DDErrorIMPE20210406_Med1
order DDErrorIMPE20210417_Med1
order DDErrorIMPE20210424_Med1
order DDErrorIMPE20210510_Med1
order DDErrorIMPE20210516_Med1
order DDErrorIMPE20210522_Med1
order DDErrorIMPE20210527_Med1
order DDErrorIMPE20210604_Med1
order DDErrorIMPE20210611_Med1
order DDErrorIMPE20210618_Med1
order DDErrorIMPE20210626_Med1
order DDErrorIMPE20210702_Med1
order DDErrorIMPE20210709_Med1
order DDErrorIMPE20210719_Med1
order DDErrorIMPE20210806_Med1
order DDErrorIMPE20210819_Med1
order DDErrorIMPE20210825_Med1
order DDErrorIMPE20210909_Med1
order DDErrorIMPE20210924_Med1
order DDErrorIMPE20211006_Med1
order DDErrorIMPE20211021_Med1
order DDErrorIMPE20211027_Med1
order DDErrorIMPE20211103_Med1
order DDErrorIMPE20211115_Med1
order DDErrorIMPE20211121_Med1
order DDErrorIMPE20211129_Med1
order DDErrorIMPE20211205_Med1
order DDErrorIMPE20211213_Med1
order DDErrorIMPE20211226_Med1
order DDErrorIMPE20220102_Med1
order DDErrorIMPE20220315_Med1
order DDErrorIMPE20220530_Med1
order DDErrorIMPE20220620_Med1
order DDErrorIMPE20220703_Med1
order DDErrorIMPE20220712_Med1
order DDErrorIMPE20220728_Med1
order DDErrorIMPE20220808_Med1
order DDErrorIMPE20220901_Med1
order DDErrorIMPE20221225_Med1

		
capture drop DDErrorIMPE_Mean1 // "DDErrorIMPE mean over updates of median error by calendar months"
egen DDErrorIMPE_Mean1 = rowmean(DDErrorIMPE20221225_Med1-DDErrorIMPE20200601_Med1) // <<-- modify 5
label var DDErrorIMPE_Mean1 "DDErrorIMPE mean over updates of median error by calendar months"
qui replace DDErrorIMPE_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorIMPE_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorIMPE_Mean1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia






* gen DDAbsErrIMPE_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrIMPE20200601_Med1
order DDAbsErrIMPE20200603_Med1
order DDAbsErrIMPE20200606_Med1
order DDAbsErrIMPE20200614_Med1
order DDAbsErrIMPE20200616_Med1
order DDAbsErrIMPE20200619_Med1
order DDAbsErrIMPE20200623_Med1
order DDAbsErrIMPE20200702_Med1
order DDAbsErrIMPE20200703_Med1
order DDAbsErrIMPE20200704_Med1
order DDAbsErrIMPE20200707_Med1
order DDAbsErrIMPE20200711_Med1
order DDAbsErrIMPE20200714_Med1
order DDAbsErrIMPE20200715_Med1
order DDAbsErrIMPE20200718_Med1
order DDAbsErrIMPE20200720_Med1
order DDAbsErrIMPE20200722_Med1
order DDAbsErrIMPE20200725_Med1
order DDAbsErrIMPE20200727_Med1
order DDAbsErrIMPE20200731_Med1
order DDAbsErrIMPE20200808_Med1
order DDAbsErrIMPE20200810_Med1
order DDAbsErrIMPE20200811_Med1
order DDAbsErrIMPE20200813_Med1
order DDAbsErrIMPE20200814_Med1
order DDAbsErrIMPE20200817_Med1
order DDAbsErrIMPE20200823_Med1
order DDAbsErrIMPE20200825_Med1
order DDAbsErrIMPE20200827_Med1
order DDAbsErrIMPE20200831_Med1
order DDAbsErrIMPE20200902_Med1
order DDAbsErrIMPE20200906_Med1
order DDAbsErrIMPE20200908_Med1
order DDAbsErrIMPE20200912_Med1
order DDAbsErrIMPE20200915_Med1
order DDAbsErrIMPE20200919_Med1
order DDAbsErrIMPE20200923_Med1
order DDAbsErrIMPE20200925_Med1
order DDAbsErrIMPE20201003_Med1
order DDAbsErrIMPE20201006_Med1
order DDAbsErrIMPE20201012_Med1
order DDAbsErrIMPE20201019_Med1
order DDAbsErrIMPE20201025_Med1
order DDAbsErrIMPE20201028_Med1
order DDAbsErrIMPE20201101_Med1
order DDAbsErrIMPE20201110_Med1
order DDAbsErrIMPE20201114_Med1
order DDAbsErrIMPE20201118_Med1
order DDAbsErrIMPE20201123_Med1
order DDAbsErrIMPE20201129_Med1
order DDAbsErrIMPE20201204_Med1
order DDAbsErrIMPE20201212_Med1
order DDAbsErrIMPE20201220_Med1
order DDAbsErrIMPE20201226_Med1
order DDAbsErrIMPE20210104_Med1
order DDAbsErrIMPE20210110_Med1
order DDAbsErrIMPE20210112_Med1
order DDAbsErrIMPE20210118_Med1
order DDAbsErrIMPE20210124_Med1
order DDAbsErrIMPE20210130_Med1
order DDAbsErrIMPE20210203_Med1
order DDAbsErrIMPE20210210_Med1
order DDAbsErrIMPE20210217_Med1
order DDAbsErrIMPE20210226_Med1
order DDAbsErrIMPE20210305_Med1
order DDAbsErrIMPE20210312_Med1
order DDAbsErrIMPE20210319_Med1
order DDAbsErrIMPE20210329_Med1
order DDAbsErrIMPE20210406_Med1
order DDAbsErrIMPE20210417_Med1
order DDAbsErrIMPE20210424_Med1
order DDAbsErrIMPE20210510_Med1
order DDAbsErrIMPE20210516_Med1
order DDAbsErrIMPE20210522_Med1
order DDAbsErrIMPE20210527_Med1
order DDAbsErrIMPE20210604_Med1
order DDAbsErrIMPE20210611_Med1
order DDAbsErrIMPE20210618_Med1
order DDAbsErrIMPE20210626_Med1
order DDAbsErrIMPE20210702_Med1
order DDAbsErrIMPE20210709_Med1
order DDAbsErrIMPE20210719_Med1
order DDAbsErrIMPE20210806_Med1
order DDAbsErrIMPE20210819_Med1
order DDAbsErrIMPE20210825_Med1
order DDAbsErrIMPE20210909_Med1
order DDAbsErrIMPE20210924_Med1
order DDAbsErrIMPE20211006_Med1
order DDAbsErrIMPE20211021_Med1
order DDAbsErrIMPE20211027_Med1
order DDAbsErrIMPE20211103_Med1
order DDAbsErrIMPE20211115_Med1
order DDAbsErrIMPE20211121_Med1
order DDAbsErrIMPE20211129_Med1
order DDAbsErrIMPE20211205_Med1
order DDAbsErrIMPE20211213_Med1
order DDAbsErrIMPE20211226_Med1
order DDAbsErrIMPE20220102_Med1
order DDAbsErrIMPE20220315_Med1
order DDAbsErrIMPE20220530_Med1
order DDAbsErrIMPE20220620_Med1
order DDAbsErrIMPE20220703_Med1
order DDAbsErrIMPE20220712_Med1
order DDAbsErrIMPE20220728_Med1
order DDAbsErrIMPE20220808_Med1
order DDAbsErrIMPE20220901_Med1
order DDAbsErrIMPE20221225_Med1


capture drop DDAbsErrIMPE_Mean1 // "DDAbsErrIMPE mean over updates of median absolute error by calendar months"
egen DDAbsErrIMPE_Mean1 = rowmean(DDAbsErrIMPE20221225_Med1-DDAbsErrIMPE20200601_Med1) // <<-- modify 7
label var DDAbsErrIMPE_Mean1 "DDAbsErrIMPE mean over updates of median absolute error by calendar months"
qui replace DDAbsErrIMPE_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrIMPE_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrIMPE_Mean1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia







* gen DDPerErrIMPE_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrIMPE20200601_Med1
order DDPerErrIMPE20200603_Med1
order DDPerErrIMPE20200606_Med1
order DDPerErrIMPE20200614_Med1
order DDPerErrIMPE20200616_Med1
order DDPerErrIMPE20200619_Med1
order DDPerErrIMPE20200623_Med1
order DDPerErrIMPE20200702_Med1
order DDPerErrIMPE20200703_Med1
order DDPerErrIMPE20200704_Med1
order DDPerErrIMPE20200707_Med1
order DDPerErrIMPE20200711_Med1
order DDPerErrIMPE20200714_Med1
order DDPerErrIMPE20200715_Med1
order DDPerErrIMPE20200718_Med1
order DDPerErrIMPE20200720_Med1
order DDPerErrIMPE20200722_Med1
order DDPerErrIMPE20200725_Med1
order DDPerErrIMPE20200727_Med1
order DDPerErrIMPE20200731_Med1
order DDPerErrIMPE20200808_Med1
order DDPerErrIMPE20200810_Med1
order DDPerErrIMPE20200811_Med1
order DDPerErrIMPE20200813_Med1
order DDPerErrIMPE20200814_Med1
order DDPerErrIMPE20200817_Med1
order DDPerErrIMPE20200823_Med1
order DDPerErrIMPE20200825_Med1
order DDPerErrIMPE20200827_Med1
order DDPerErrIMPE20200831_Med1
order DDPerErrIMPE20200902_Med1
order DDPerErrIMPE20200906_Med1
order DDPerErrIMPE20200908_Med1
order DDPerErrIMPE20200912_Med1
order DDPerErrIMPE20200915_Med1
order DDPerErrIMPE20200919_Med1
order DDPerErrIMPE20200923_Med1
order DDPerErrIMPE20200925_Med1
order DDPerErrIMPE20201003_Med1
order DDPerErrIMPE20201006_Med1
order DDPerErrIMPE20201012_Med1
order DDPerErrIMPE20201019_Med1
order DDPerErrIMPE20201025_Med1
order DDPerErrIMPE20201028_Med1
order DDPerErrIMPE20201101_Med1
order DDPerErrIMPE20201110_Med1
order DDPerErrIMPE20201114_Med1
order DDPerErrIMPE20201118_Med1
order DDPerErrIMPE20201123_Med1
order DDPerErrIMPE20201129_Med1
order DDPerErrIMPE20201204_Med1
order DDPerErrIMPE20201212_Med1
order DDPerErrIMPE20201220_Med1
order DDPerErrIMPE20201226_Med1
order DDPerErrIMPE20210104_Med1
order DDPerErrIMPE20210110_Med1
order DDPerErrIMPE20210112_Med1
order DDPerErrIMPE20210118_Med1
order DDPerErrIMPE20210124_Med1
order DDPerErrIMPE20210130_Med1
order DDPerErrIMPE20210203_Med1
order DDPerErrIMPE20210210_Med1
order DDPerErrIMPE20210217_Med1
order DDPerErrIMPE20210226_Med1
order DDPerErrIMPE20210305_Med1
order DDPerErrIMPE20210312_Med1
order DDPerErrIMPE20210319_Med1
order DDPerErrIMPE20210329_Med1
order DDPerErrIMPE20210406_Med1
order DDPerErrIMPE20210417_Med1
order DDPerErrIMPE20210424_Med1
order DDPerErrIMPE20210510_Med1
order DDPerErrIMPE20210516_Med1
order DDPerErrIMPE20210522_Med1
order DDPerErrIMPE20210527_Med1
order DDPerErrIMPE20210604_Med1
order DDPerErrIMPE20210611_Med1
order DDPerErrIMPE20210618_Med1
order DDPerErrIMPE20210626_Med1
order DDPerErrIMPE20210702_Med1
order DDPerErrIMPE20210709_Med1
order DDPerErrIMPE20210719_Med1
order DDPerErrIMPE20210806_Med1
order DDPerErrIMPE20210819_Med1
order DDPerErrIMPE20210825_Med1
order DDPerErrIMPE20210909_Med1
order DDPerErrIMPE20210924_Med1
order DDPerErrIMPE20211006_Med1
order DDPerErrIMPE20211021_Med1
order DDPerErrIMPE20211027_Med1
order DDPerErrIMPE20211103_Med1
order DDPerErrIMPE20211115_Med1
order DDPerErrIMPE20211121_Med1
order DDPerErrIMPE20211129_Med1
order DDPerErrIMPE20211205_Med1
order DDPerErrIMPE20211213_Med1
order DDPerErrIMPE20211226_Med1
order DDPerErrIMPE20220102_Med1
order DDPerErrIMPE20220315_Med1
order DDPerErrIMPE20220530_Med1
order DDPerErrIMPE20220620_Med1
order DDPerErrIMPE20220703_Med1
order DDPerErrIMPE20220712_Med1
order DDPerErrIMPE20220728_Med1
order DDPerErrIMPE20220808_Med1
order DDPerErrIMPE20220901_Med1
order DDPerErrIMPE20221225_Med1


capture drop DDPerErrIMPE_Mean1 // "DDPerErrIMPE mean over updates of median absolute % error by calendar months"
egen DDPerErrIMPE_Mean1 = rowmean(DDPerErrIMPE20221225_Med1-DDPerErrIMPE20200601_Med1) // <<-- modify 9
label var DDPerErrIMPE_Mean1 "DDPerErrIMPE mean over updates of median % error by calendar months"
qui replace DDPerErrIMPE_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrIMPE_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrIMPE_Mean1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

 
 
 

* gen DDAbPeErIMPE_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErIMPE20200601_Med1
order DDAbPeErIMPE20200603_Med1
order DDAbPeErIMPE20200606_Med1
order DDAbPeErIMPE20200614_Med1
order DDAbPeErIMPE20200616_Med1
order DDAbPeErIMPE20200619_Med1
order DDAbPeErIMPE20200623_Med1
order DDAbPeErIMPE20200702_Med1
order DDAbPeErIMPE20200703_Med1
order DDAbPeErIMPE20200704_Med1
order DDAbPeErIMPE20200707_Med1
order DDAbPeErIMPE20200711_Med1
order DDAbPeErIMPE20200714_Med1
order DDAbPeErIMPE20200715_Med1
order DDAbPeErIMPE20200718_Med1
order DDAbPeErIMPE20200720_Med1
order DDAbPeErIMPE20200722_Med1
order DDAbPeErIMPE20200725_Med1
order DDAbPeErIMPE20200727_Med1
order DDAbPeErIMPE20200731_Med1
order DDAbPeErIMPE20200808_Med1
order DDAbPeErIMPE20200810_Med1
order DDAbPeErIMPE20200811_Med1
order DDAbPeErIMPE20200813_Med1
order DDAbPeErIMPE20200814_Med1
order DDAbPeErIMPE20200817_Med1
order DDAbPeErIMPE20200823_Med1
order DDAbPeErIMPE20200825_Med1
order DDAbPeErIMPE20200827_Med1
order DDAbPeErIMPE20200831_Med1
order DDAbPeErIMPE20200902_Med1
order DDAbPeErIMPE20200906_Med1
order DDAbPeErIMPE20200908_Med1
order DDAbPeErIMPE20200912_Med1
order DDAbPeErIMPE20200915_Med1
order DDAbPeErIMPE20200919_Med1
order DDAbPeErIMPE20200923_Med1
order DDAbPeErIMPE20200925_Med1
order DDAbPeErIMPE20201003_Med1
order DDAbPeErIMPE20201006_Med1
order DDAbPeErIMPE20201012_Med1
order DDAbPeErIMPE20201019_Med1
order DDAbPeErIMPE20201025_Med1
order DDAbPeErIMPE20201028_Med1
order DDAbPeErIMPE20201101_Med1
order DDAbPeErIMPE20201110_Med1
order DDAbPeErIMPE20201114_Med1
order DDAbPeErIMPE20201118_Med1
order DDAbPeErIMPE20201123_Med1
order DDAbPeErIMPE20201129_Med1
order DDAbPeErIMPE20201204_Med1
order DDAbPeErIMPE20201212_Med1
order DDAbPeErIMPE20201220_Med1
order DDAbPeErIMPE20201226_Med1
order DDAbPeErIMPE20210104_Med1
order DDAbPeErIMPE20210110_Med1
order DDAbPeErIMPE20210112_Med1
order DDAbPeErIMPE20210118_Med1
order DDAbPeErIMPE20210124_Med1
order DDAbPeErIMPE20210130_Med1
order DDAbPeErIMPE20210203_Med1
order DDAbPeErIMPE20210210_Med1
order DDAbPeErIMPE20210217_Med1
order DDAbPeErIMPE20210226_Med1
order DDAbPeErIMPE20210305_Med1
order DDAbPeErIMPE20210312_Med1
order DDAbPeErIMPE20210319_Med1
order DDAbPeErIMPE20210329_Med1
order DDAbPeErIMPE20210406_Med1
order DDAbPeErIMPE20210417_Med1
order DDAbPeErIMPE20210424_Med1
order DDAbPeErIMPE20210510_Med1
order DDAbPeErIMPE20210516_Med1
order DDAbPeErIMPE20210522_Med1
order DDAbPeErIMPE20210527_Med1
order DDAbPeErIMPE20210604_Med1
order DDAbPeErIMPE20210611_Med1
order DDAbPeErIMPE20210618_Med1
order DDAbPeErIMPE20210626_Med1
order DDAbPeErIMPE20210702_Med1
order DDAbPeErIMPE20210709_Med1
order DDAbPeErIMPE20210719_Med1
order DDAbPeErIMPE20210806_Med1
order DDAbPeErIMPE20210819_Med1
order DDAbPeErIMPE20210825_Med1
order DDAbPeErIMPE20210909_Med1
order DDAbPeErIMPE20210924_Med1
order DDAbPeErIMPE20211006_Med1
order DDAbPeErIMPE20211021_Med1
order DDAbPeErIMPE20211027_Med1
order DDAbPeErIMPE20211103_Med1
order DDAbPeErIMPE20211115_Med1
order DDAbPeErIMPE20211121_Med1
order DDAbPeErIMPE20211129_Med1
order DDAbPeErIMPE20211205_Med1
order DDAbPeErIMPE20211213_Med1
order DDAbPeErIMPE20211226_Med1
order DDAbPeErIMPE20220102_Med1
order DDAbPeErIMPE20220315_Med1
order DDAbPeErIMPE20220530_Med1
order DDAbPeErIMPE20220620_Med1
order DDAbPeErIMPE20220703_Med1
order DDAbPeErIMPE20220712_Med1
order DDAbPeErIMPE20220728_Med1
order DDAbPeErIMPE20220808_Med1
order DDAbPeErIMPE20220901_Med1
order DDAbPeErIMPE20221225_Med1


capture drop DDAbPeErIMPE_Mean1 // "DDAbPeErIMPE mean over updates of median absolute % error by calendar months"
egen DDAbPeErIMPE_Mean1 = rowmean(DDAbPeErIMPE20221225_Med1-DDAbPeErIMPE20200601_Med1) // <<-- modify 11
label var DDAbPeErIMPE_Mean1 "DDAbPeErIMPE mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErIMPE_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErIMPE_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErIMPE_Mean1 = . if date < td(01jun2020) // 01jun2020 is the earliest date of IMPE forecasts for Slovenia

 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorIMPE_Mean2 = mean(DDErrorIMPE_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorIMPE_Mean2 "DDErrorIMPE Mean over calendar months of median error over updates"

egen DDAbsErrIMPE_Mean2 = mean(DDAbsErrIMPE_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrIMPE_Mean2 "DDAbsErrIMPE Mean over calendar months of median absolute error over updates"

egen DDPerErrIMPE_Mean2 = mean(DDPerErrIMPE_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrIMPE_Mean2 "DDPerErrIMPE Mean over calendar months of median % error over updates"

egen DDAbPeErIMPE_Mean2 = mean(DDAbPeErIMPE_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErIMPE_Mean2 "DDAbPeErIMPE Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorIMPE20200601 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200603 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200606 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200614 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200616 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200619 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200623 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200704 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200707 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200711 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200714 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200715 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200718 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200720 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200722 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200725 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200727 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200731 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200810 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200811 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200813 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200814 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200817 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200823 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200827 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200831 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200902 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200906 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200908 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200912 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200915 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200919 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200923 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20200925 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201003 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201012 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201019 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201025 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201028 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201101 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201114 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201123 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201204 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201212 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201220 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20201226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210104 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210112 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210124 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210130 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210203 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210210 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210217 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210305 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210312 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210319 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210329 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210406 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210417 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210424 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210510 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210516 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210522 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210527 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210604 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210611 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210618 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210626 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210709 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210719 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210806 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210819 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210909 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20210924 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211021 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211027 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211103 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211115 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211121 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211205 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211213 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20211226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220102 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220315 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220530 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220620 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220712 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220728 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20220901 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDErrorIMPE20221225 date, sort lcolor(magenta) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Slovenia, IMPE, all updates, forecast only", size(small)) 

qui graph export "graph 03 Slovenia IMPE C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrIMPE20200601 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200603 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200606 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200614 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200616 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200619 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200623 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200704 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200707 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200711 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200714 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200715 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200718 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200720 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200722 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200725 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200727 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200731 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200810 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200811 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200813 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200814 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200817 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200823 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200827 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200831 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200902 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200906 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200908 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200912 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200915 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200919 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200923 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20200925 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201003 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201012 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201019 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201025 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201028 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201101 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201114 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201123 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201204 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201212 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201220 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20201226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210104 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210112 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210124 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210130 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210203 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210210 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210217 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210305 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210312 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210319 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210329 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210406 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210417 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210424 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210510 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210516 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210522 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210527 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210604 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210611 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210618 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210626 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210709 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210719 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210806 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210819 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210909 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20210924 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211021 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211027 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211103 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211115 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211121 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211205 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211213 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20211226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220102 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220315 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220530 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220620 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220712 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220728 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20220901 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbsErrIMPE20221225 date, sort lcolor(magenta) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Slovenia, IMPE, all updates, forecast only", size(small))

qui graph export "graph 04 Slovenia IMPE C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrIMPE20200601 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200603 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200606 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200614 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200616 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200619 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200623 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200704 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200707 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200711 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200714 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200715 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200718 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200720 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200722 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200725 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200727 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200731 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200810 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200811 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200813 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200814 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200817 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200823 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200827 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200831 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200902 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200906 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200908 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200912 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200915 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200919 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200923 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20200925 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201003 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201012 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201019 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201025 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201028 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201101 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201114 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201123 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201204 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201212 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201220 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20201226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210104 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210112 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210124 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210130 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210203 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210210 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210217 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210305 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210312 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210319 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210329 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210406 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210417 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210424 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210510 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210516 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210522 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210527 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210604 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210611 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210618 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210626 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210709 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210719 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210806 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210819 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210909 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20210924 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211021 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211027 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211103 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211115 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211121 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211205 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211213 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20211226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220102 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220315 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220530 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220620 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220712 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220728 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20220901 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDPerErrIMPE20221225 date, sort lcolor(magenta) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Slovenia, IMPE, all updates, forecast only", size(small))

qui graph export "graph 05 Slovenia IMPE C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* IMPE lcolor magenta // <<-- modify 16

twoway ///
(line DDAbPeErIMPE20200601 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200603 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200606 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200614 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200616 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200619 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200623 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200704 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200707 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200711 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200714 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200715 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200718 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200720 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200722 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200725 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200727 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200731 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200810 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200811 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200813 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200814 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200817 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200823 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200827 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200831 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200902 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200906 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200908 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200912 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200915 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200919 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200923 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20200925 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201003 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201012 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201019 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201025 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201028 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201101 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201114 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201123 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201204 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201212 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201220 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20201226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210104 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210110 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210112 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210118 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210124 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210130 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210203 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210210 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210217 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210305 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210312 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210319 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210329 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210406 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210417 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210424 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210510 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210516 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210522 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210527 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210604 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210611 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210618 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210626 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210702 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210709 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210719 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210806 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210819 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210825 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210909 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20210924 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211006 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211021 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211027 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211103 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211115 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211121 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211129 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211205 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211213 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20211226 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220102 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220315 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220530 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220620 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220703 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220712 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220728 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220808 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20220901 date, sort lcolor(magenta) lwidth(thin)) ///
(line DDAbPeErIMPE20221225 date, sort lcolor(magenta) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Slovenia, IMPE, all updates, forecast only", size(small))

qui graph export "graph 06 Slovenia IMPE C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five))ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Slovenia, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Slovenia IMPE C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorIMPE_Mean1_window = DDErrorIMPE_Mean1, window(3 1 3)

tssmooth ma DDErrorIMPE_Mean1_sm = DDErrorIMPE_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorIMPE_Mean1_sm "Daily deaths IMPE average median error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Slovenia, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Slovenia IMPE C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrIMPE_Mean1_window = DDAbsErrIMPE_Mean1, window(3 1 3)

tssmooth ma DDAbsErrIMPE_Mean1_sm = DDAbsErrIMPE_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrIMPE_Mean1_sm "Daily deaths IMPE average median absolute error smooth"

drop *_window

// tsset, clear

*











***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Slovenia, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Slovenia IMPE C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrIMPE_Mean1_window = DDPerErrIMPE_Mean1, window(3 1 3)

tssmooth ma DDPerErrIMPE_Mean1_sm = DDPerErrIMPE_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrIMPE_Mean1_sm "Daily deaths IMPE average median percent error smooth"

drop *_window

// tsset, clear

*













***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Slovenia, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Slovenia IMPE C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErIMPE_Mean1_window = DDAbPeErIMPE_Mean1, window(3 1 3)

tssmooth ma DDAbPeErIMPE_Mean1_sm = DDAbPeErIMPE_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErIMPE_Mean1_sm "Daily deaths IMPE average median absolute percent error smooth"

drop *_window

tsset, clear

*






***********************************************

capture drop *2str

summ DDAbPeErIMPE_Mean2, meanonly

local DDAbPeErIMPE_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErIMPE_Mean2str = `DDAbPeErIMPE_Mean2str'
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErIMPE_Mean2str /// 
, bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Slovenia, IMPE, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Slovenia IMPE C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "IMPE Slovenia error.dta", replace 




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IMPE Slovenia error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Slovenia 4 IMPE.smcl"

log close

exit, clear

