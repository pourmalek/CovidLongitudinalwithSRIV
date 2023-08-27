
clear all

cd "$pathCovidLongitudinal/countries/Korea South"

capture log close 

log using "log CovidLongitudinal Korea South 8 YYGU.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Korea South 8 YYGU.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run calculations for error measures
	* for each country ---->> Korea South <<----                                                                 
***************************************************************************


** model = YYGU ** <<-- modify 1 
* lcolor gold

* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together

* input data files: "YYGU Korea South.dta"
* output data files: "YYGU Korea South error.dta" (with error measures saved)

* output data dictionary files: "YYGU Korea South error data dictionary.csv"


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
* "graph 03 Korea South YYGU C19 daily deaths error.pdf"
* "graph 04 Korea South YYGU C19 daily deaths absolute error.pdf"
* "graph 05 Korea South YYGU C19 daily deaths percent error.pdf"
* "graph 06 Korea South YYGU C19 daily deaths absolute percent error.pdf"

* "graph 07 Korea South YYGU C19 daily deaths average median error.pdf"
* "graph 08 Korea South YYGU C19 daily deaths average median absolute error.pdf"
* "graph 09 Korea South YYGU C19 daily deaths average median percent error.pdf"
* "graph 10 Korea South YYGU C19 daily deaths average median absolute percent error.pdf"

* "graph 11 Korea South YYGU C19 daily deaths Average MAPE over updates and calendar months


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







use "YYGU Korea South.dta", clear 




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
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200518 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200605 ///
20200606 ///
20200607 ///
20200608 ///
20200609 ///
20200610 ///
20200611 ///
20200612 ///
20200613 ///
20200614 ///
20200615 ///
20200616 ///
20200617 ///
20200618 ///
20200619 ///
20200620 ///
20200621 ///
20200622 ///
20200623 ///
20200624 ///
20200625 ///
20200626 ///
20200627 ///
20200628 ///
20200629 ///
20200630 ///
20200701 ///
20200702 ///
20200703 ///
20200704 ///
20200705 ///
20200706 ///
20200707 ///
20200708 ///
20200709 ///
20200710 ///
20200711 ///
20200712 ///
20200713 ///
20200714 ///
20200715 ///
20200716 ///
20200717 ///
20200718 ///
20200719 ///
20200720 ///
20200721 ///
20200722 ///
20200723 ///
20200724 ///
20200725 ///
20200726 ///
20200727 ///
20200728 ///
20200729 ///
20200730 ///
20200731 ///
20200801 ///
20200802 ///
20200803 ///
20200804 ///
20200805 ///
20200806 ///
20200807 ///
20200808 ///
20200809 ///
20200810 ///
20200811 ///
20200812 ///
20200813 ///
20200814 ///
20200815 ///
20200816 ///
20200817 ///
20200818 ///
20200819 ///
20200820 ///
20200821 ///
20200822 ///
20200823 ///
20200824 ///
20200825 ///
20200826 ///
20200827 ///
20200828 ///
20200829 ///
20200830 ///
20200831 ///
20200901 ///
20200902 ///
20200903 ///
20200904 ///
20200905 ///
20200906 ///
20200907 ///
20200908 ///
20200909 ///
20200910 ///
20200911 ///
20200912 ///
20200913 ///
20200914 ///
20200915 ///
20200916 ///
20200917 ///
20200918 ///
20200919 ///
20200920 ///
20200921 ///
20200922 ///
20200923 ///
20200924 ///
20200925 ///
20200926 ///
20200927 ///
20200928 ///
20200929 ///
20200930 ///
20201001 ///
20201002 ///
20201003 ///
20201004



sort date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorYYGU`update'
gen DDErrorYYGU`update' = - (DayDeaMeSmJOHN - DayDeaMeFoYYGU`update')
label var DDErrorYYGU`update' "DayDeaMeFoYYGU`update' error"
qui replace DDErrorYYGU`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorYYGU`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorYYGU`update' = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South
                                                            // <<-- modify 3
capture drop DDAbsErrYYGU`update'
gen DDAbsErrYYGU`update' = abs(- (DayDeaMeSmJOHN - DayDeaMeFoYYGU`update'))
label var DDAbsErrYYGU`update' "DayDeaMeFoYYGU`update' absolute error"
qui replace DDAbsErrYYGU`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrYYGU`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrYYGU`update' = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

capture drop DDPerErrYYGU`update'
gen DDPerErrYYGU`update' = (100 * (- (DayDeaMeSmJOHN - DayDeaMeFoYYGU`update'))) / DayDeaMeSmJOHN
label var DDPerErrYYGU`update' "DayDeaMeFoYYGU`update' percent error"
qui replace DDPerErrYYGU`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrYYGU`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrYYGU`update' = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

capture drop DDAbPeErYYGU`update'
gen DDAbPeErYYGU`update' = (100 * abs(- (DayDeaMeSmJOHN - DayDeaMeFoYYGU`update'))) / DayDeaMeSmJOHN
label var DDAbPeErYYGU`update' "DayDeaMeFoYYGU`update' absolute percent error" 
qui replace DDAbPeErYYGU`update' = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErYYGU`update' = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErYYGU`update' = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorYYGU`update'_Med1
bysort yearmonth : egen DDErrorYYGU`update'_Med1 = median(DDErrorYYGU`update')
label var DDErrorYYGU`update'_Med1 "DayDeaYYGU median error by calendar months and updates"
qui replace DDErrorYYGU`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorYYGU`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorYYGU`update'_Med1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

capture drop DDAbsErrYYGU`update'_Med1
bysort yearmonth : egen DDAbsErrYYGU`update'_Med1 = median(DDAbsErrYYGU`update')
label var DDAbsErrYYGU`update'_Med1 "DayDeaYYGU median absolute error by calendar months and updates"
qui replace DDAbsErrYYGU`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrYYGU`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrYYGU`update'_Med1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

capture drop DDPerErrYYGU`update'_Med1
bysort yearmonth : egen DDPerErrYYGU`update'_Med1 = median(DDPerErrYYGU`update')
label var DDPerErrYYGU`update'_Med1 "DayDeaYYGU median % error by calendar months and updates"
qui replace DDPerErrYYGU`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrYYGU`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrYYGU`update'_Med1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

capture drop DDAbPeErYYGU`update'_Med1
bysort yearmonth : egen DDAbPeErYYGU`update'_Med1 = median(DDAbPeErYYGU`update')
label var DDAbPeErYYGU`update'_Med1 "DayDeaYYGU median absolute % error by calendar months and updates" 
qui replace DDAbPeErYYGU`update'_Med1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErYYGU`update'_Med1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErYYGU`update'_Med1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorYYGU_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 4
 
order DDErrorYYGU20200512_Med1
order DDErrorYYGU20200513_Med1
order DDErrorYYGU20200514_Med1
order DDErrorYYGU20200515_Med1
order DDErrorYYGU20200516_Med1
order DDErrorYYGU20200517_Med1
order DDErrorYYGU20200518_Med1
order DDErrorYYGU20200519_Med1
order DDErrorYYGU20200520_Med1
order DDErrorYYGU20200521_Med1
order DDErrorYYGU20200522_Med1
order DDErrorYYGU20200523_Med1
order DDErrorYYGU20200524_Med1
order DDErrorYYGU20200525_Med1
order DDErrorYYGU20200526_Med1
order DDErrorYYGU20200527_Med1
order DDErrorYYGU20200528_Med1
order DDErrorYYGU20200529_Med1
order DDErrorYYGU20200530_Med1
order DDErrorYYGU20200531_Med1
order DDErrorYYGU20200601_Med1
order DDErrorYYGU20200602_Med1
order DDErrorYYGU20200603_Med1
order DDErrorYYGU20200604_Med1
order DDErrorYYGU20200605_Med1
order DDErrorYYGU20200606_Med1
order DDErrorYYGU20200607_Med1
order DDErrorYYGU20200608_Med1
order DDErrorYYGU20200609_Med1
order DDErrorYYGU20200610_Med1
order DDErrorYYGU20200611_Med1
order DDErrorYYGU20200612_Med1
order DDErrorYYGU20200613_Med1
order DDErrorYYGU20200614_Med1
order DDErrorYYGU20200615_Med1
order DDErrorYYGU20200616_Med1
order DDErrorYYGU20200617_Med1
order DDErrorYYGU20200618_Med1
order DDErrorYYGU20200619_Med1
order DDErrorYYGU20200620_Med1
order DDErrorYYGU20200621_Med1
order DDErrorYYGU20200622_Med1
order DDErrorYYGU20200623_Med1
order DDErrorYYGU20200624_Med1
order DDErrorYYGU20200625_Med1
order DDErrorYYGU20200626_Med1
order DDErrorYYGU20200627_Med1
order DDErrorYYGU20200628_Med1
order DDErrorYYGU20200629_Med1
order DDErrorYYGU20200630_Med1
order DDErrorYYGU20200701_Med1
order DDErrorYYGU20200702_Med1
order DDErrorYYGU20200703_Med1
order DDErrorYYGU20200704_Med1
order DDErrorYYGU20200705_Med1
order DDErrorYYGU20200706_Med1
order DDErrorYYGU20200707_Med1
order DDErrorYYGU20200708_Med1
order DDErrorYYGU20200709_Med1
order DDErrorYYGU20200710_Med1
order DDErrorYYGU20200711_Med1
order DDErrorYYGU20200712_Med1
order DDErrorYYGU20200713_Med1
order DDErrorYYGU20200714_Med1
order DDErrorYYGU20200715_Med1
order DDErrorYYGU20200716_Med1
order DDErrorYYGU20200717_Med1
order DDErrorYYGU20200718_Med1
order DDErrorYYGU20200719_Med1
order DDErrorYYGU20200720_Med1
order DDErrorYYGU20200721_Med1
order DDErrorYYGU20200722_Med1
order DDErrorYYGU20200723_Med1
order DDErrorYYGU20200724_Med1
order DDErrorYYGU20200725_Med1
order DDErrorYYGU20200726_Med1
order DDErrorYYGU20200727_Med1
order DDErrorYYGU20200728_Med1
order DDErrorYYGU20200729_Med1
order DDErrorYYGU20200730_Med1
order DDErrorYYGU20200731_Med1
order DDErrorYYGU20200801_Med1
order DDErrorYYGU20200802_Med1
order DDErrorYYGU20200803_Med1
order DDErrorYYGU20200804_Med1
order DDErrorYYGU20200805_Med1
order DDErrorYYGU20200806_Med1
order DDErrorYYGU20200807_Med1
order DDErrorYYGU20200808_Med1
order DDErrorYYGU20200809_Med1
order DDErrorYYGU20200810_Med1
order DDErrorYYGU20200811_Med1
order DDErrorYYGU20200812_Med1
order DDErrorYYGU20200813_Med1
order DDErrorYYGU20200814_Med1
order DDErrorYYGU20200815_Med1
order DDErrorYYGU20200816_Med1
order DDErrorYYGU20200817_Med1
order DDErrorYYGU20200818_Med1
order DDErrorYYGU20200819_Med1
order DDErrorYYGU20200820_Med1
order DDErrorYYGU20200821_Med1
order DDErrorYYGU20200822_Med1
order DDErrorYYGU20200823_Med1
order DDErrorYYGU20200824_Med1
order DDErrorYYGU20200825_Med1
order DDErrorYYGU20200826_Med1
order DDErrorYYGU20200827_Med1
order DDErrorYYGU20200828_Med1
order DDErrorYYGU20200829_Med1
order DDErrorYYGU20200830_Med1
order DDErrorYYGU20200831_Med1
order DDErrorYYGU20200901_Med1
order DDErrorYYGU20200902_Med1
order DDErrorYYGU20200903_Med1
order DDErrorYYGU20200904_Med1
order DDErrorYYGU20200905_Med1
order DDErrorYYGU20200906_Med1
order DDErrorYYGU20200907_Med1
order DDErrorYYGU20200908_Med1
order DDErrorYYGU20200909_Med1
order DDErrorYYGU20200910_Med1
order DDErrorYYGU20200911_Med1
order DDErrorYYGU20200912_Med1
order DDErrorYYGU20200913_Med1
order DDErrorYYGU20200914_Med1
order DDErrorYYGU20200915_Med1
order DDErrorYYGU20200916_Med1
order DDErrorYYGU20200917_Med1
order DDErrorYYGU20200918_Med1
order DDErrorYYGU20200919_Med1
order DDErrorYYGU20200920_Med1
order DDErrorYYGU20200921_Med1
order DDErrorYYGU20200922_Med1
order DDErrorYYGU20200923_Med1
order DDErrorYYGU20200924_Med1
order DDErrorYYGU20200925_Med1
order DDErrorYYGU20200926_Med1
order DDErrorYYGU20200927_Med1
order DDErrorYYGU20200928_Med1
order DDErrorYYGU20200929_Med1
order DDErrorYYGU20200930_Med1
order DDErrorYYGU20201001_Med1
order DDErrorYYGU20201002_Med1
order DDErrorYYGU20201003_Med1
order DDErrorYYGU20201004_Med1

		
capture drop DDErrorYYGU_Mean1 // "DDErrorYYGU mean over updates of median error by calendar months"
egen DDErrorYYGU_Mean1 = rowmean(DDErrorYYGU20201004_Med1-DDErrorYYGU20200512_Med1) // <<-- modify 5
label var DDErrorYYGU_Mean1 "DDErrorYYGU mean over updates of median error by calendar months"
qui replace DDErrorYYGU_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDErrorYYGU_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDErrorYYGU_Mean1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South






* gen DDAbsErrYYGU_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 6
 
order DDAbsErrYYGU20200512_Med1
order DDAbsErrYYGU20200513_Med1
order DDAbsErrYYGU20200514_Med1
order DDAbsErrYYGU20200515_Med1
order DDAbsErrYYGU20200516_Med1
order DDAbsErrYYGU20200517_Med1
order DDAbsErrYYGU20200518_Med1
order DDAbsErrYYGU20200519_Med1
order DDAbsErrYYGU20200520_Med1
order DDAbsErrYYGU20200521_Med1
order DDAbsErrYYGU20200522_Med1
order DDAbsErrYYGU20200523_Med1
order DDAbsErrYYGU20200524_Med1
order DDAbsErrYYGU20200525_Med1
order DDAbsErrYYGU20200526_Med1
order DDAbsErrYYGU20200527_Med1
order DDAbsErrYYGU20200528_Med1
order DDAbsErrYYGU20200529_Med1
order DDAbsErrYYGU20200530_Med1
order DDAbsErrYYGU20200531_Med1
order DDAbsErrYYGU20200601_Med1
order DDAbsErrYYGU20200602_Med1
order DDAbsErrYYGU20200603_Med1
order DDAbsErrYYGU20200604_Med1
order DDAbsErrYYGU20200605_Med1
order DDAbsErrYYGU20200606_Med1
order DDAbsErrYYGU20200607_Med1
order DDAbsErrYYGU20200608_Med1
order DDAbsErrYYGU20200609_Med1
order DDAbsErrYYGU20200610_Med1
order DDAbsErrYYGU20200611_Med1
order DDAbsErrYYGU20200612_Med1
order DDAbsErrYYGU20200613_Med1
order DDAbsErrYYGU20200614_Med1
order DDAbsErrYYGU20200615_Med1
order DDAbsErrYYGU20200616_Med1
order DDAbsErrYYGU20200617_Med1
order DDAbsErrYYGU20200618_Med1
order DDAbsErrYYGU20200619_Med1
order DDAbsErrYYGU20200620_Med1
order DDAbsErrYYGU20200621_Med1
order DDAbsErrYYGU20200622_Med1
order DDAbsErrYYGU20200623_Med1
order DDAbsErrYYGU20200624_Med1
order DDAbsErrYYGU20200625_Med1
order DDAbsErrYYGU20200626_Med1
order DDAbsErrYYGU20200627_Med1
order DDAbsErrYYGU20200628_Med1
order DDAbsErrYYGU20200629_Med1
order DDAbsErrYYGU20200630_Med1
order DDAbsErrYYGU20200701_Med1
order DDAbsErrYYGU20200702_Med1
order DDAbsErrYYGU20200703_Med1
order DDAbsErrYYGU20200704_Med1
order DDAbsErrYYGU20200705_Med1
order DDAbsErrYYGU20200706_Med1
order DDAbsErrYYGU20200707_Med1
order DDAbsErrYYGU20200708_Med1
order DDAbsErrYYGU20200709_Med1
order DDAbsErrYYGU20200710_Med1
order DDAbsErrYYGU20200711_Med1
order DDAbsErrYYGU20200712_Med1
order DDAbsErrYYGU20200713_Med1
order DDAbsErrYYGU20200714_Med1
order DDAbsErrYYGU20200715_Med1
order DDAbsErrYYGU20200716_Med1
order DDAbsErrYYGU20200717_Med1
order DDAbsErrYYGU20200718_Med1
order DDAbsErrYYGU20200719_Med1
order DDAbsErrYYGU20200720_Med1
order DDAbsErrYYGU20200721_Med1
order DDAbsErrYYGU20200722_Med1
order DDAbsErrYYGU20200723_Med1
order DDAbsErrYYGU20200724_Med1
order DDAbsErrYYGU20200725_Med1
order DDAbsErrYYGU20200726_Med1
order DDAbsErrYYGU20200727_Med1
order DDAbsErrYYGU20200728_Med1
order DDAbsErrYYGU20200729_Med1
order DDAbsErrYYGU20200730_Med1
order DDAbsErrYYGU20200731_Med1
order DDAbsErrYYGU20200801_Med1
order DDAbsErrYYGU20200802_Med1
order DDAbsErrYYGU20200803_Med1
order DDAbsErrYYGU20200804_Med1
order DDAbsErrYYGU20200805_Med1
order DDAbsErrYYGU20200806_Med1
order DDAbsErrYYGU20200807_Med1
order DDAbsErrYYGU20200808_Med1
order DDAbsErrYYGU20200809_Med1
order DDAbsErrYYGU20200810_Med1
order DDAbsErrYYGU20200811_Med1
order DDAbsErrYYGU20200812_Med1
order DDAbsErrYYGU20200813_Med1
order DDAbsErrYYGU20200814_Med1
order DDAbsErrYYGU20200815_Med1
order DDAbsErrYYGU20200816_Med1
order DDAbsErrYYGU20200817_Med1
order DDAbsErrYYGU20200818_Med1
order DDAbsErrYYGU20200819_Med1
order DDAbsErrYYGU20200820_Med1
order DDAbsErrYYGU20200821_Med1
order DDAbsErrYYGU20200822_Med1
order DDAbsErrYYGU20200823_Med1
order DDAbsErrYYGU20200824_Med1
order DDAbsErrYYGU20200825_Med1
order DDAbsErrYYGU20200826_Med1
order DDAbsErrYYGU20200827_Med1
order DDAbsErrYYGU20200828_Med1
order DDAbsErrYYGU20200829_Med1
order DDAbsErrYYGU20200830_Med1
order DDAbsErrYYGU20200831_Med1
order DDAbsErrYYGU20200901_Med1
order DDAbsErrYYGU20200902_Med1
order DDAbsErrYYGU20200903_Med1
order DDAbsErrYYGU20200904_Med1
order DDAbsErrYYGU20200905_Med1
order DDAbsErrYYGU20200906_Med1
order DDAbsErrYYGU20200907_Med1
order DDAbsErrYYGU20200908_Med1
order DDAbsErrYYGU20200909_Med1
order DDAbsErrYYGU20200910_Med1
order DDAbsErrYYGU20200911_Med1
order DDAbsErrYYGU20200912_Med1
order DDAbsErrYYGU20200913_Med1
order DDAbsErrYYGU20200914_Med1
order DDAbsErrYYGU20200915_Med1
order DDAbsErrYYGU20200916_Med1
order DDAbsErrYYGU20200917_Med1
order DDAbsErrYYGU20200918_Med1
order DDAbsErrYYGU20200919_Med1
order DDAbsErrYYGU20200920_Med1
order DDAbsErrYYGU20200921_Med1
order DDAbsErrYYGU20200922_Med1
order DDAbsErrYYGU20200923_Med1
order DDAbsErrYYGU20200924_Med1
order DDAbsErrYYGU20200925_Med1
order DDAbsErrYYGU20200926_Med1
order DDAbsErrYYGU20200927_Med1
order DDAbsErrYYGU20200928_Med1
order DDAbsErrYYGU20200929_Med1
order DDAbsErrYYGU20200930_Med1
order DDAbsErrYYGU20201001_Med1
order DDAbsErrYYGU20201002_Med1
order DDAbsErrYYGU20201003_Med1
order DDAbsErrYYGU20201004_Med1


capture drop DDAbsErrYYGU_Mean1 // "DDAbsErrYYGU mean over updates of median absolute error by calendar months"
egen DDAbsErrYYGU_Mean1 = rowmean(DDAbsErrYYGU20201004_Med1-DDAbsErrYYGU20200512_Med1) // <<-- modify 7
label var DDAbsErrYYGU_Mean1 "DDAbsErrYYGU mean over updates of median absolute error by calendar months"
qui replace DDAbsErrYYGU_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbsErrYYGU_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbsErrYYGU_Mean1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South







* gen DDPerErrYYGU_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

// <<-- modify 8

order DDPerErrYYGU20200512_Med1
order DDPerErrYYGU20200513_Med1
order DDPerErrYYGU20200514_Med1
order DDPerErrYYGU20200515_Med1
order DDPerErrYYGU20200516_Med1
order DDPerErrYYGU20200517_Med1
order DDPerErrYYGU20200518_Med1
order DDPerErrYYGU20200519_Med1
order DDPerErrYYGU20200520_Med1
order DDPerErrYYGU20200521_Med1
order DDPerErrYYGU20200522_Med1
order DDPerErrYYGU20200523_Med1
order DDPerErrYYGU20200524_Med1
order DDPerErrYYGU20200525_Med1
order DDPerErrYYGU20200526_Med1
order DDPerErrYYGU20200527_Med1
order DDPerErrYYGU20200528_Med1
order DDPerErrYYGU20200529_Med1
order DDPerErrYYGU20200530_Med1
order DDPerErrYYGU20200531_Med1
order DDPerErrYYGU20200601_Med1
order DDPerErrYYGU20200602_Med1
order DDPerErrYYGU20200603_Med1
order DDPerErrYYGU20200604_Med1
order DDPerErrYYGU20200605_Med1
order DDPerErrYYGU20200606_Med1
order DDPerErrYYGU20200607_Med1
order DDPerErrYYGU20200608_Med1
order DDPerErrYYGU20200609_Med1
order DDPerErrYYGU20200610_Med1
order DDPerErrYYGU20200611_Med1
order DDPerErrYYGU20200612_Med1
order DDPerErrYYGU20200613_Med1
order DDPerErrYYGU20200614_Med1
order DDPerErrYYGU20200615_Med1
order DDPerErrYYGU20200616_Med1
order DDPerErrYYGU20200617_Med1
order DDPerErrYYGU20200618_Med1
order DDPerErrYYGU20200619_Med1
order DDPerErrYYGU20200620_Med1
order DDPerErrYYGU20200621_Med1
order DDPerErrYYGU20200622_Med1
order DDPerErrYYGU20200623_Med1
order DDPerErrYYGU20200624_Med1
order DDPerErrYYGU20200625_Med1
order DDPerErrYYGU20200626_Med1
order DDPerErrYYGU20200627_Med1
order DDPerErrYYGU20200628_Med1
order DDPerErrYYGU20200629_Med1
order DDPerErrYYGU20200630_Med1
order DDPerErrYYGU20200701_Med1
order DDPerErrYYGU20200702_Med1
order DDPerErrYYGU20200703_Med1
order DDPerErrYYGU20200704_Med1
order DDPerErrYYGU20200705_Med1
order DDPerErrYYGU20200706_Med1
order DDPerErrYYGU20200707_Med1
order DDPerErrYYGU20200708_Med1
order DDPerErrYYGU20200709_Med1
order DDPerErrYYGU20200710_Med1
order DDPerErrYYGU20200711_Med1
order DDPerErrYYGU20200712_Med1
order DDPerErrYYGU20200713_Med1
order DDPerErrYYGU20200714_Med1
order DDPerErrYYGU20200715_Med1
order DDPerErrYYGU20200716_Med1
order DDPerErrYYGU20200717_Med1
order DDPerErrYYGU20200718_Med1
order DDPerErrYYGU20200719_Med1
order DDPerErrYYGU20200720_Med1
order DDPerErrYYGU20200721_Med1
order DDPerErrYYGU20200722_Med1
order DDPerErrYYGU20200723_Med1
order DDPerErrYYGU20200724_Med1
order DDPerErrYYGU20200725_Med1
order DDPerErrYYGU20200726_Med1
order DDPerErrYYGU20200727_Med1
order DDPerErrYYGU20200728_Med1
order DDPerErrYYGU20200729_Med1
order DDPerErrYYGU20200730_Med1
order DDPerErrYYGU20200731_Med1
order DDPerErrYYGU20200801_Med1
order DDPerErrYYGU20200802_Med1
order DDPerErrYYGU20200803_Med1
order DDPerErrYYGU20200804_Med1
order DDPerErrYYGU20200805_Med1
order DDPerErrYYGU20200806_Med1
order DDPerErrYYGU20200807_Med1
order DDPerErrYYGU20200808_Med1
order DDPerErrYYGU20200809_Med1
order DDPerErrYYGU20200810_Med1
order DDPerErrYYGU20200811_Med1
order DDPerErrYYGU20200812_Med1
order DDPerErrYYGU20200813_Med1
order DDPerErrYYGU20200814_Med1
order DDPerErrYYGU20200815_Med1
order DDPerErrYYGU20200816_Med1
order DDPerErrYYGU20200817_Med1
order DDPerErrYYGU20200818_Med1
order DDPerErrYYGU20200819_Med1
order DDPerErrYYGU20200820_Med1
order DDPerErrYYGU20200821_Med1
order DDPerErrYYGU20200822_Med1
order DDPerErrYYGU20200823_Med1
order DDPerErrYYGU20200824_Med1
order DDPerErrYYGU20200825_Med1
order DDPerErrYYGU20200826_Med1
order DDPerErrYYGU20200827_Med1
order DDPerErrYYGU20200828_Med1
order DDPerErrYYGU20200829_Med1
order DDPerErrYYGU20200830_Med1
order DDPerErrYYGU20200831_Med1
order DDPerErrYYGU20200901_Med1
order DDPerErrYYGU20200902_Med1
order DDPerErrYYGU20200903_Med1
order DDPerErrYYGU20200904_Med1
order DDPerErrYYGU20200905_Med1
order DDPerErrYYGU20200906_Med1
order DDPerErrYYGU20200907_Med1
order DDPerErrYYGU20200908_Med1
order DDPerErrYYGU20200909_Med1
order DDPerErrYYGU20200910_Med1
order DDPerErrYYGU20200911_Med1
order DDPerErrYYGU20200912_Med1
order DDPerErrYYGU20200913_Med1
order DDPerErrYYGU20200914_Med1
order DDPerErrYYGU20200915_Med1
order DDPerErrYYGU20200916_Med1
order DDPerErrYYGU20200917_Med1
order DDPerErrYYGU20200918_Med1
order DDPerErrYYGU20200919_Med1
order DDPerErrYYGU20200920_Med1
order DDPerErrYYGU20200921_Med1
order DDPerErrYYGU20200922_Med1
order DDPerErrYYGU20200923_Med1
order DDPerErrYYGU20200924_Med1
order DDPerErrYYGU20200925_Med1
order DDPerErrYYGU20200926_Med1
order DDPerErrYYGU20200927_Med1
order DDPerErrYYGU20200928_Med1
order DDPerErrYYGU20200929_Med1
order DDPerErrYYGU20200930_Med1
order DDPerErrYYGU20201001_Med1
order DDPerErrYYGU20201002_Med1
order DDPerErrYYGU20201003_Med1
order DDPerErrYYGU20201004_Med1


capture drop DDPerErrYYGU_Mean1 // "DDPerErrYYGU mean over updates of median absolute % error by calendar months"
egen DDPerErrYYGU_Mean1 = rowmean(DDPerErrYYGU20201004_Med1-DDPerErrYYGU20200512_Med1) // <<-- modify 9
label var DDPerErrYYGU_Mean1 "DDPerErrYYGU mean over updates of median % error by calendar months"
qui replace DDPerErrYYGU_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDPerErrYYGU_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDPerErrYYGU_Mean1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

 
 
 

* gen DDAbPeErYYGU_Mean1 // gen AVERAGE over updates of MEDIAN of error types by calendar months

 // <<-- modify 10
 

order DDAbPeErYYGU20200512_Med1
order DDAbPeErYYGU20200513_Med1
order DDAbPeErYYGU20200514_Med1
order DDAbPeErYYGU20200515_Med1
order DDAbPeErYYGU20200516_Med1
order DDAbPeErYYGU20200517_Med1
order DDAbPeErYYGU20200518_Med1
order DDAbPeErYYGU20200519_Med1
order DDAbPeErYYGU20200520_Med1
order DDAbPeErYYGU20200521_Med1
order DDAbPeErYYGU20200522_Med1
order DDAbPeErYYGU20200523_Med1
order DDAbPeErYYGU20200524_Med1
order DDAbPeErYYGU20200525_Med1
order DDAbPeErYYGU20200526_Med1
order DDAbPeErYYGU20200527_Med1
order DDAbPeErYYGU20200528_Med1
order DDAbPeErYYGU20200529_Med1
order DDAbPeErYYGU20200530_Med1
order DDAbPeErYYGU20200531_Med1
order DDAbPeErYYGU20200601_Med1
order DDAbPeErYYGU20200602_Med1
order DDAbPeErYYGU20200603_Med1
order DDAbPeErYYGU20200604_Med1
order DDAbPeErYYGU20200605_Med1
order DDAbPeErYYGU20200606_Med1
order DDAbPeErYYGU20200607_Med1
order DDAbPeErYYGU20200608_Med1
order DDAbPeErYYGU20200609_Med1
order DDAbPeErYYGU20200610_Med1
order DDAbPeErYYGU20200611_Med1
order DDAbPeErYYGU20200612_Med1
order DDAbPeErYYGU20200613_Med1
order DDAbPeErYYGU20200614_Med1
order DDAbPeErYYGU20200615_Med1
order DDAbPeErYYGU20200616_Med1
order DDAbPeErYYGU20200617_Med1
order DDAbPeErYYGU20200618_Med1
order DDAbPeErYYGU20200619_Med1
order DDAbPeErYYGU20200620_Med1
order DDAbPeErYYGU20200621_Med1
order DDAbPeErYYGU20200622_Med1
order DDAbPeErYYGU20200623_Med1
order DDAbPeErYYGU20200624_Med1
order DDAbPeErYYGU20200625_Med1
order DDAbPeErYYGU20200626_Med1
order DDAbPeErYYGU20200627_Med1
order DDAbPeErYYGU20200628_Med1
order DDAbPeErYYGU20200629_Med1
order DDAbPeErYYGU20200630_Med1
order DDAbPeErYYGU20200701_Med1
order DDAbPeErYYGU20200702_Med1
order DDAbPeErYYGU20200703_Med1
order DDAbPeErYYGU20200704_Med1
order DDAbPeErYYGU20200705_Med1
order DDAbPeErYYGU20200706_Med1
order DDAbPeErYYGU20200707_Med1
order DDAbPeErYYGU20200708_Med1
order DDAbPeErYYGU20200709_Med1
order DDAbPeErYYGU20200710_Med1
order DDAbPeErYYGU20200711_Med1
order DDAbPeErYYGU20200712_Med1
order DDAbPeErYYGU20200713_Med1
order DDAbPeErYYGU20200714_Med1
order DDAbPeErYYGU20200715_Med1
order DDAbPeErYYGU20200716_Med1
order DDAbPeErYYGU20200717_Med1
order DDAbPeErYYGU20200718_Med1
order DDAbPeErYYGU20200719_Med1
order DDAbPeErYYGU20200720_Med1
order DDAbPeErYYGU20200721_Med1
order DDAbPeErYYGU20200722_Med1
order DDAbPeErYYGU20200723_Med1
order DDAbPeErYYGU20200724_Med1
order DDAbPeErYYGU20200725_Med1
order DDAbPeErYYGU20200726_Med1
order DDAbPeErYYGU20200727_Med1
order DDAbPeErYYGU20200728_Med1
order DDAbPeErYYGU20200729_Med1
order DDAbPeErYYGU20200730_Med1
order DDAbPeErYYGU20200731_Med1
order DDAbPeErYYGU20200801_Med1
order DDAbPeErYYGU20200802_Med1
order DDAbPeErYYGU20200803_Med1
order DDAbPeErYYGU20200804_Med1
order DDAbPeErYYGU20200805_Med1
order DDAbPeErYYGU20200806_Med1
order DDAbPeErYYGU20200807_Med1
order DDAbPeErYYGU20200808_Med1
order DDAbPeErYYGU20200809_Med1
order DDAbPeErYYGU20200810_Med1
order DDAbPeErYYGU20200811_Med1
order DDAbPeErYYGU20200812_Med1
order DDAbPeErYYGU20200813_Med1
order DDAbPeErYYGU20200814_Med1
order DDAbPeErYYGU20200815_Med1
order DDAbPeErYYGU20200816_Med1
order DDAbPeErYYGU20200817_Med1
order DDAbPeErYYGU20200818_Med1
order DDAbPeErYYGU20200819_Med1
order DDAbPeErYYGU20200820_Med1
order DDAbPeErYYGU20200821_Med1
order DDAbPeErYYGU20200822_Med1
order DDAbPeErYYGU20200823_Med1
order DDAbPeErYYGU20200824_Med1
order DDAbPeErYYGU20200825_Med1
order DDAbPeErYYGU20200826_Med1
order DDAbPeErYYGU20200827_Med1
order DDAbPeErYYGU20200828_Med1
order DDAbPeErYYGU20200829_Med1
order DDAbPeErYYGU20200830_Med1
order DDAbPeErYYGU20200831_Med1
order DDAbPeErYYGU20200901_Med1
order DDAbPeErYYGU20200902_Med1
order DDAbPeErYYGU20200903_Med1
order DDAbPeErYYGU20200904_Med1
order DDAbPeErYYGU20200905_Med1
order DDAbPeErYYGU20200906_Med1
order DDAbPeErYYGU20200907_Med1
order DDAbPeErYYGU20200908_Med1
order DDAbPeErYYGU20200909_Med1
order DDAbPeErYYGU20200910_Med1
order DDAbPeErYYGU20200911_Med1
order DDAbPeErYYGU20200912_Med1
order DDAbPeErYYGU20200913_Med1
order DDAbPeErYYGU20200914_Med1
order DDAbPeErYYGU20200915_Med1
order DDAbPeErYYGU20200916_Med1
order DDAbPeErYYGU20200917_Med1
order DDAbPeErYYGU20200918_Med1
order DDAbPeErYYGU20200919_Med1
order DDAbPeErYYGU20200920_Med1
order DDAbPeErYYGU20200921_Med1
order DDAbPeErYYGU20200922_Med1
order DDAbPeErYYGU20200923_Med1
order DDAbPeErYYGU20200924_Med1
order DDAbPeErYYGU20200925_Med1
order DDAbPeErYYGU20200926_Med1
order DDAbPeErYYGU20200927_Med1
order DDAbPeErYYGU20200928_Med1
order DDAbPeErYYGU20200929_Med1
order DDAbPeErYYGU20200930_Med1
order DDAbPeErYYGU20201001_Med1
order DDAbPeErYYGU20201002_Med1
order DDAbPeErYYGU20201003_Med1
order DDAbPeErYYGU20201004_Med1


capture drop DDAbPeErYYGU_Mean1 // "DDAbPeErYYGU mean over updates of median absolute % error by calendar months"
egen DDAbPeErYYGU_Mean1 = rowmean(DDAbPeErYYGU20201004_Med1-DDAbPeErYYGU20200512_Med1) // <<-- modify 11
label var DDAbPeErYYGU_Mean1 "DDAbPeErYYGU mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErYYGU_Mean1 = . if DayDeaMeSmJOHN == . // before location was added to the estimates for the country
qui replace DDAbPeErYYGU_Mean1 = . if date == td(01jan2023) // 01jan2023 is not included in this study
qui replace DDAbPeErYYGU_Mean1 = . if date < td(12may2020) // 12may2020 is the earliest date of YYGU forecasts for Korea South

 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorYYGU_Mean2 = mean(DDErrorYYGU_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorYYGU_Mean2 "DDErrorYYGU Mean over calendar months of median error over updates"

egen DDAbsErrYYGU_Mean2 = mean(DDAbsErrYYGU_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrYYGU_Mean2 "DDAbsErrYYGU Mean over calendar months of median absolute error over updates"

egen DDPerErrYYGU_Mean2 = mean(DDPerErrYYGU_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrYYGU_Mean2 "DDPerErrYYGU Mean over calendar months of median % error over updates"

egen DDAbPeErYYGU_Mean2 = mean(DDAbPeErYYGU_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErYYGU_Mean2 "DDAbPeErYYGU Mean over calendar months of median absolute % error over updates"





drop if date < td(01jan2020)

drop if date > td(01jan2023)


qui compress




******
* graph 03 Daily deaths, Error // <<-- modify 12

twoway ///
(line DDErrorYYGU20200512 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200513 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200514 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200515 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200516 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200517 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200518 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200519 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200520 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200521 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200522 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200523 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200524 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200525 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200526 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200527 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200528 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200529 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200530 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200531 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200601 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200602 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200603 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200604 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200605 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200606 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200607 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200608 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200609 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200610 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200611 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200612 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200613 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200614 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200615 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200616 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200617 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200618 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200619 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200620 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200621 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200622 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200623 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200624 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200625 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200626 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200627 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200628 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200629 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200630 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200701 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200702 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200703 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200704 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200705 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200706 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200707 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200708 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200709 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200710 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200711 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200712 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200713 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200714 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200715 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200716 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200717 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200718 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200719 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200720 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200721 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200722 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200723 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200724 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200725 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200726 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200727 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200728 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200729 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200730 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200731 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200801 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200802 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200803 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200804 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200805 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200806 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200807 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200808 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200809 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200810 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200811 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200812 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200813 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200814 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200815 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200816 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200817 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200818 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200819 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200820 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200821 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200822 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200823 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200824 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200825 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200826 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200827 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200828 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200829 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200830 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200831 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200901 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200902 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200903 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200904 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200905 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200906 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200907 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200908 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200909 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200910 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200911 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200912 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200913 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200914 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200915 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200916 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200917 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200918 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200919 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200920 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200921 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200922 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200923 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200924 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200925 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200926 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200927 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200928 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200929 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20200930 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20201001 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20201002 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20201003 date, sort lcolor(gold) lwidth(thin)) ///
(line DDErrorYYGU20201004 date, sort lcolor(gold) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Korea South, YYGU, all updates, forecast only", size(small)) 

qui graph export "graph 03 Korea South YYGU C19 daily deaths error.pdf", replace





******
* graph 04 Daily deaths, Absolute Error // <<-- modify 13

twoway ///
(line DDAbsErrYYGU20200512 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200513 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200514 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200515 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200516 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200517 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200518 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200519 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200520 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200521 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200522 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200523 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200524 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200525 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200526 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200527 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200528 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200529 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200530 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200531 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200601 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200602 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200603 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200604 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200605 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200606 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200607 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200608 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200609 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200610 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200611 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200612 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200613 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200614 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200615 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200616 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200617 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200618 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200619 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200620 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200621 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200622 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200623 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200624 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200625 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200626 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200627 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200628 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200629 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200630 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200701 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200702 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200703 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200704 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200705 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200706 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200707 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200708 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200709 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200710 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200711 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200712 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200713 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200714 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200715 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200716 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200717 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200718 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200719 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200720 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200721 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200722 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200723 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200724 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200725 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200726 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200727 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200728 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200729 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200730 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200731 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200801 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200802 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200803 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200804 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200805 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200806 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200807 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200808 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200809 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200810 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200811 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200812 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200813 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200814 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200815 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200816 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200817 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200818 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200819 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200820 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200821 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200822 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200823 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200824 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200825 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200826 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200827 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200828 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200829 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200830 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200831 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200901 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200902 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200903 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200904 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200905 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200906 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200907 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200908 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200909 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200910 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200911 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200912 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200913 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200914 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200915 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200916 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200917 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200918 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200919 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200920 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200921 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200922 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200923 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200924 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200925 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200926 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200927 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200928 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200929 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20200930 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20201001 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20201002 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20201003 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbsErrYYGU20201004 date, sort lcolor(gold) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Korea South, YYGU, all updates, forecast only", size(small))

qui graph export "graph 04 Korea South YYGU C19 daily deaths absolute error.pdf", replace








******
* graph 05 Daily deaths, Percent Error <<-- modify 14

twoway ///
(line DDPerErrYYGU20200512 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200513 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200514 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200515 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200516 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200517 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200518 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200519 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200520 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200521 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200522 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200523 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200524 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200525 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200526 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200527 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200528 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200529 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200530 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200531 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200601 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200602 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200603 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200604 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200605 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200606 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200607 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200608 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200609 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200610 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200611 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200612 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200613 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200614 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200615 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200616 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200617 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200618 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200619 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200620 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200621 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200622 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200623 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200624 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200625 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200626 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200627 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200628 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200629 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200630 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200701 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200702 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200703 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200704 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200705 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200706 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200707 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200708 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200709 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200710 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200711 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200712 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200713 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200714 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200715 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200716 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200717 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200718 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200719 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200720 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200721 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200722 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200723 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200724 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200725 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200726 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200727 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200728 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200729 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200730 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200731 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200801 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200802 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200803 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200804 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200805 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200806 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200807 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200808 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200809 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200810 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200811 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200812 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200813 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200814 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200815 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200816 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200817 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200818 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200819 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200820 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200821 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200822 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200823 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200824 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200825 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200826 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200827 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200828 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200829 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200830 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200831 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200901 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200902 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200903 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200904 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200905 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200906 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200907 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200908 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200909 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200910 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200911 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200912 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200913 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200914 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200915 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200916 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200917 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200918 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200919 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200920 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200921 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200922 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200923 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200924 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200925 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200926 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200927 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200928 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200929 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20200930 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20201001 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20201002 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20201003 date, sort lcolor(gold) lwidth(thin)) ///
(line DDPerErrYYGU20201004 date, sort lcolor(gold) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Korea South, YYGU, all updates, forecast only", size(small))

qui graph export "graph 05 Korea South YYGU C19 daily deaths percent error.pdf", replace








******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 15

* YYGU lcolor gold // <<-- modify 16

twoway ///
(line DDAbPeErYYGU20200512 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200513 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200514 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200515 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200516 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200517 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200518 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200519 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200520 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200521 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200522 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200523 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200524 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200525 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200526 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200527 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200528 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200529 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200530 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200531 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200601 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200602 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200603 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200604 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200605 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200606 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200607 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200608 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200609 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200610 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200611 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200612 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200613 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200614 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200615 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200616 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200617 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200618 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200619 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200620 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200621 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200622 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200623 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200624 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200625 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200626 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200627 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200628 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200629 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200630 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200701 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200702 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200703 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200704 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200705 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200706 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200707 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200708 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200709 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200710 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200711 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200712 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200713 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200714 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200715 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200716 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200717 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200718 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200719 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200720 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200721 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200722 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200723 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200724 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200725 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200726 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200727 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200728 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200729 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200730 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200731 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200801 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200802 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200803 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200804 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200805 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200806 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200807 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200808 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200809 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200810 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200811 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200812 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200813 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200814 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200815 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200816 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200817 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200818 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200819 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200820 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200821 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200822 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200823 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200824 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200825 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200826 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200827 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200828 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200829 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200830 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200831 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200901 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200902 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200903 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200904 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200905 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200906 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200907 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200908 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200909 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200910 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200911 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200912 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200913 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200914 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200915 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200916 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200917 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200918 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200919 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200920 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200921 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200922 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200923 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200924 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200925 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200926 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200927 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200928 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200929 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20200930 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20201001 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20201002 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20201003 date, sort lcolor(gold) lwidth(thin)) ///
(line DDAbPeErYYGU20201004 date, sort lcolor(gold) lwidth(thin)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("Korea South, YYGU, all updates, forecast only", size(small))

qui graph export "graph 06 Korea South YYGU C19 daily deaths absolute percent error.pdf", replace











***************************************************************
* graph 07 Daily deaths, average median error 

twoway ///
(line DDErrorYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Korea South, YYGU, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 07 Korea South YYGU C19 daily deaths average median error.pdf", replace





*********************
* smooth median error for better viewing 

tsset date, daily   

tssmooth ma DDErrorYYGU_Mean1_window = DDErrorYYGU_Mean1, window(3 1 3)

tssmooth ma DDErrorYYGU_Mean1_sm = DDErrorYYGU_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorYYGU_Mean1_sm "Daily deaths YYGU average median error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 08 Daily deaths, average median absolute error 

twoway ///
(line DDAbsErrYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Korea South, YYGU, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 08 Korea South YYGU C19 daily deaths average median absolute error.pdf", replace






*********************
* smooth median absolute error for better viewing 

// tsset date, daily   

tssmooth ma DDAbsErrYYGU_Mean1_window = DDAbsErrYYGU_Mean1, window(3 1 3)

tssmooth ma DDAbsErrYYGU_Mean1_sm = DDAbsErrYYGU_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrYYGU_Mean1_sm "Daily deaths YYGU average median absolute error smooth"

drop *_window

// tsset, clear

*











***************************************************************
* graph 09 Daily deaths, average median percent error 

twoway ///
(line DDPerErrYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Korea South, YYGU, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 09 Korea South YYGU C19 daily deaths average median percent error.pdf", replace





*********************
* smooth median percent error for better viewing 

// tsset date, daily   

tssmooth ma DDPerErrYYGU_Mean1_window = DDPerErrYYGU_Mean1, window(3 1 3)

tssmooth ma DDPerErrYYGU_Mean1_sm = DDPerErrYYGU_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrYYGU_Mean1_sm "Daily deaths YYGU average median percent error smooth"

drop *_window

// tsset, clear

*












***************************************************************
* graph 10 Daily deaths, average median absolute percent error

twoway ///
(line DDAbPeErYYGU_Mean1 date, sort lcolor(gold) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Korea South, YYGU, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 Korea South YYGU C19 daily deaths average median absolute percent error.pdf", replace





*********************
* smooth median absolute % error for better viewing 

// tsset date, daily   

tssmooth ma DDAbPeErYYGU_Mean1_window = DDAbPeErYYGU_Mean1, window(3 1 3)

tssmooth ma DDAbPeErYYGU_Mean1_sm = DDAbPeErYYGU_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErYYGU_Mean1_sm "Daily deaths YYGU average median absolute percent error smooth"

drop *_window

tsset, clear

*






***********************************************

capture drop *2str

summ DDAbPeErYYGU_Mean2, meanonly

local DDAbPeErYYGU_Mean2str = string(r(mean),"%8.1f")

gen DDAbPeErYYGU_Mean2str = `DDAbPeErYYGU_Mean2str'
    

* graph 11 Daily deaths, Average MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErYYGU_Mean2str /// 
, bar(1, fcolor(gold) lcolor(gold)) ///
blabel(bar, format(%30.0fc)) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("Korea South, YYGU, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) ylabel(, labsize(small) angle(forty_five) format(%30.0fc))

qui graph export "graph 11 Korea South YYGU C19 daily deaths Average MAPE over updates and calendar months.pdf", replace










******

qui compress 

save "YYGU Korea South error.dta", replace 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "YYGU Korea South error data dictionary.csv", replace 
	
restore



view "log CovidLongitudinal Korea South 8 YYGU.smcl"

log close

exit, clear

