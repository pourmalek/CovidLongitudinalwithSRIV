
clear all

cd "$pathCovidLongitudinal"

cd LANL

capture log close 

log using "log CovidLongitudinal LANL 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
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

* input data files: "CovidLongitudinal LANL 2.dta"
* output data files: "CovidLongitudinal LANL 3.dta" (error measures saved)







use "CovidLongitudinal LANL 2.dta", clear


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



sort provincestate date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorA04`update'
gen DDErrorA04`update' = - (DayDeaMeSmA00 - DayDeaFOREA04`update')
label var DDErrorA04`update' "DayDeaFOREA04`update' error"
qui replace DDErrorA04`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA04`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA04`update' = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDErrorA04`update' = . if date > td(13nov2021) // last date in last update

capture drop DDAbsErrA04`update'
gen DDAbsErrA04`update' = abs(- (DayDeaMeSmA00 - DayDeaFOREA04`update'))
label var DDAbsErrA04`update' "DayDeaFOREA04`update' absolute error"
qui replace DDAbsErrA04`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA04`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA04`update' = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDAbsErrA04`update' = . if date > td(13nov2021) // last date in last update

capture drop DDPerErrA04`update'
gen DDPerErrA04`update' = (100 * (- (DayDeaMeSmA00 - DayDeaFOREA04`update'))) / DayDeaMeSmA00
label var DDPerErrA04`update' "DayDeaFOREA04`update' percent error"
qui replace DDPerErrA04`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA04`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA04`update' = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDPerErrA04`update' = . if date > td(13nov2021) // last date in last update

capture drop DDAbPeErA04`update'
gen DDAbPeErA04`update' = (100 * abs(- (DayDeaMeSmA00 - DayDeaFOREA04`update'))) / DayDeaMeSmA00
label var DDAbPeErA04`update' "DayDeaFOREA04`update' absolute percent error" 
qui replace DDAbPeErA04`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA04`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA04`update' = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDAbPeErA04`update' = . if date > td(13nov2021) // last date in last update

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorA04`update'_Med1
bysort yearmonth : egen DDErrorA04`update'_Med1 = median(DDErrorA04`update')
label var DDErrorA04`update'_Med1 "DayDeaA04 median error by calendar months and updates"
qui replace DDErrorA04`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA04`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA04`update'_Med1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDErrorA04`update'_Med1 = . if date > td(13nov2021) // last date in last update

capture drop DDAbsErrA04`update'_Med1
bysort yearmonth : egen DDAbsErrA04`update'_Med1 = median(DDAbsErrA04`update')
label var DDAbsErrA04`update'_Med1 "DayDeaA04 median absolute error by calendar months and updates"
qui replace DDAbsErrA04`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA04`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA04`update'_Med1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDAbsErrA04`update'_Med1 = . if date > td(13nov2021) // last date in last update

capture drop DDPerErrA04`update'_Med1
bysort yearmonth : egen DDPerErrA04`update'_Med1 = median(DDPerErrA04`update')
label var DDPerErrA04`update'_Med1 "DayDeaA04 median % error by calendar months and updates"
qui replace DDPerErrA04`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA04`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA04`update'_Med1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDPerErrA04`update'_Med1 = . if date > td(13nov2021) // last date in last update

capture drop DDAbPeErA04`update'_Med1
bysort yearmonth : egen DDAbPeErA04`update'_Med1 = median(DDAbPeErA04`update')
label var DDAbPeErA04`update'_Med1 "DayDeaA04 median absolute % error by calendar months and updates" 
qui replace DDAbPeErA04`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA04`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA04`update'_Med1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran
qui replace DDAbPeErA04`update'_Med1 = . if date > td(13nov2021) // last date in last update

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorA04_Mean1

order DDErrorA0420200426_Med1
order DDErrorA0420200429_Med1
order DDErrorA0420200506_Med1
order DDErrorA0420200510_Med1
order DDErrorA0420200513_Med1
order DDErrorA0420200517_Med1
order DDErrorA0420200520_Med1
order DDErrorA0420200524_Med1
order DDErrorA0420200527_Med1
order DDErrorA0420200531_Med1
order DDErrorA0420200603_Med1
order DDErrorA0420200607_Med1
order DDErrorA0420200610_Med1
order DDErrorA0420200613_Med1
order DDErrorA0420200617_Med1
order DDErrorA0420200621_Med1
order DDErrorA0420200623_Med1
order DDErrorA0420200628_Med1
order DDErrorA0420200701_Med1
order DDErrorA0420200705_Med1
order DDErrorA0420200708_Med1
order DDErrorA0420200712_Med1
order DDErrorA0420200715_Med1
order DDErrorA0420200719_Med1
order DDErrorA0420200722_Med1
order DDErrorA0420200726_Med1
order DDErrorA0420200729_Med1
order DDErrorA0420200802_Med1
order DDErrorA0420200805_Med1
order DDErrorA0420200809_Med1
order DDErrorA0420200812_Med1
order DDErrorA0420200816_Med1
order DDErrorA0420200819_Med1
order DDErrorA0420200823_Med1
order DDErrorA0420200826_Med1
order DDErrorA0420200830_Med1
order DDErrorA0420200902_Med1
order DDErrorA0420200906_Med1
order DDErrorA0420200909_Med1
order DDErrorA0420200913_Med1
order DDErrorA0420200916_Med1
order DDErrorA0420200920_Med1
order DDErrorA0420200923_Med1
order DDErrorA0420200927_Med1
order DDErrorA0420200930_Med1
order DDErrorA0420201004_Med1
order DDErrorA0420201007_Med1
order DDErrorA0420201011_Med1
order DDErrorA0420201014_Med1
order DDErrorA0420201018_Med1
order DDErrorA0420201021_Med1
order DDErrorA0420201025_Med1
order DDErrorA0420201028_Med1
order DDErrorA0420201101_Med1
order DDErrorA0420201104_Med1
order DDErrorA0420201108_Med1
order DDErrorA0420201111_Med1
order DDErrorA0420201115_Med1
order DDErrorA0420201118_Med1
order DDErrorA0420201122_Med1
order DDErrorA0420201125_Med1
order DDErrorA0420201129_Med1
order DDErrorA0420201202_Med1
order DDErrorA0420201206_Med1
order DDErrorA0420201209_Med1
order DDErrorA0420201213_Med1
order DDErrorA0420201216_Med1
order DDErrorA0420201220_Med1
order DDErrorA0420201223_Med1
order DDErrorA0420210103_Med1
order DDErrorA0420210105_Med1
order DDErrorA0420210110_Med1
order DDErrorA0420210113_Med1
order DDErrorA0420210117_Med1
order DDErrorA0420210120_Med1
order DDErrorA0420210124_Med1
order DDErrorA0420210127_Med1
order DDErrorA0420210131_Med1
order DDErrorA0420210203_Med1
order DDErrorA0420210207_Med1
order DDErrorA0420210210_Med1
order DDErrorA0420210214_Med1
order DDErrorA0420210217_Med1
order DDErrorA0420210221_Med1
order DDErrorA0420210224_Med1
order DDErrorA0420210228_Med1
order DDErrorA0420210303_Med1
order DDErrorA0420210307_Med1
order DDErrorA0420210310_Med1
order DDErrorA0420210314_Med1
order DDErrorA0420210321_Med1
order DDErrorA0420210324_Med1
order DDErrorA0420210328_Med1
order DDErrorA0420210331_Med1
order DDErrorA0420210404_Med1
order DDErrorA0420210407_Med1
order DDErrorA0420210411_Med1
order DDErrorA0420210414_Med1
order DDErrorA0420210418_Med1
order DDErrorA0420210421_Med1
order DDErrorA0420210425_Med1
order DDErrorA0420210428_Med1
order DDErrorA0420210502_Med1
order DDErrorA0420210505_Med1
order DDErrorA0420210509_Med1
order DDErrorA0420210512_Med1
order DDErrorA0420210516_Med1
order DDErrorA0420210519_Med1
order DDErrorA0420210523_Med1
order DDErrorA0420210526_Med1
order DDErrorA0420210602_Med1
order DDErrorA0420210606_Med1
order DDErrorA0420210613_Med1
order DDErrorA0420210620_Med1
order DDErrorA0420210627_Med1
order DDErrorA0420210704_Med1
order DDErrorA0420210711_Med1
order DDErrorA0420210718_Med1
order DDErrorA0420210725_Med1
order DDErrorA0420210801_Med1
order DDErrorA0420210808_Med1
order DDErrorA0420210815_Med1
order DDErrorA0420210822_Med1
order DDErrorA0420210829_Med1
order DDErrorA0420210905_Med1
order DDErrorA0420210912_Med1
order DDErrorA0420210919_Med1
order DDErrorA0420210926_Med1
		
		
capture drop DDErrorA04_Mean1		
egen DDErrorA04_Mean1 = rowmean(DDErrorA0420210926_Med1-DDErrorA0420200426_Med1) 
label var DDErrorA04_Mean1 "DDErrorA04 mean over updates of median error by calendar months"
qui replace DDErrorA04_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA04_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA04_Mean1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran






* gen DDAbsErrA04_Mean1


order DDAbsErrA0420200426_Med1
order DDAbsErrA0420200429_Med1
order DDAbsErrA0420200506_Med1
order DDAbsErrA0420200510_Med1
order DDAbsErrA0420200513_Med1
order DDAbsErrA0420200517_Med1
order DDAbsErrA0420200520_Med1
order DDAbsErrA0420200524_Med1
order DDAbsErrA0420200527_Med1
order DDAbsErrA0420200531_Med1
order DDAbsErrA0420200603_Med1
order DDAbsErrA0420200607_Med1
order DDAbsErrA0420200610_Med1
order DDAbsErrA0420200613_Med1
order DDAbsErrA0420200617_Med1
order DDAbsErrA0420200621_Med1
order DDAbsErrA0420200623_Med1
order DDAbsErrA0420200628_Med1
order DDAbsErrA0420200701_Med1
order DDAbsErrA0420200705_Med1
order DDAbsErrA0420200708_Med1
order DDAbsErrA0420200712_Med1
order DDAbsErrA0420200715_Med1
order DDAbsErrA0420200719_Med1
order DDAbsErrA0420200722_Med1
order DDAbsErrA0420200726_Med1
order DDAbsErrA0420200729_Med1
order DDAbsErrA0420200802_Med1
order DDAbsErrA0420200805_Med1
order DDAbsErrA0420200809_Med1
order DDAbsErrA0420200812_Med1
order DDAbsErrA0420200816_Med1
order DDAbsErrA0420200819_Med1
order DDAbsErrA0420200823_Med1
order DDAbsErrA0420200826_Med1
order DDAbsErrA0420200830_Med1
order DDAbsErrA0420200902_Med1
order DDAbsErrA0420200906_Med1
order DDAbsErrA0420200909_Med1
order DDAbsErrA0420200913_Med1
order DDAbsErrA0420200916_Med1
order DDAbsErrA0420200920_Med1
order DDAbsErrA0420200923_Med1
order DDAbsErrA0420200927_Med1
order DDAbsErrA0420200930_Med1
order DDAbsErrA0420201004_Med1
order DDAbsErrA0420201007_Med1
order DDAbsErrA0420201011_Med1
order DDAbsErrA0420201014_Med1
order DDAbsErrA0420201018_Med1
order DDAbsErrA0420201021_Med1
order DDAbsErrA0420201025_Med1
order DDAbsErrA0420201028_Med1
order DDAbsErrA0420201101_Med1
order DDAbsErrA0420201104_Med1
order DDAbsErrA0420201108_Med1
order DDAbsErrA0420201111_Med1
order DDAbsErrA0420201115_Med1
order DDAbsErrA0420201118_Med1
order DDAbsErrA0420201122_Med1
order DDAbsErrA0420201125_Med1
order DDAbsErrA0420201129_Med1
order DDAbsErrA0420201202_Med1
order DDAbsErrA0420201206_Med1
order DDAbsErrA0420201209_Med1
order DDAbsErrA0420201213_Med1
order DDAbsErrA0420201216_Med1
order DDAbsErrA0420201220_Med1
order DDAbsErrA0420201223_Med1
order DDAbsErrA0420210103_Med1
order DDAbsErrA0420210105_Med1
order DDAbsErrA0420210110_Med1
order DDAbsErrA0420210113_Med1
order DDAbsErrA0420210117_Med1
order DDAbsErrA0420210120_Med1
order DDAbsErrA0420210124_Med1
order DDAbsErrA0420210127_Med1
order DDAbsErrA0420210131_Med1
order DDAbsErrA0420210203_Med1
order DDAbsErrA0420210207_Med1
order DDAbsErrA0420210210_Med1
order DDAbsErrA0420210214_Med1
order DDAbsErrA0420210217_Med1
order DDAbsErrA0420210221_Med1
order DDAbsErrA0420210224_Med1
order DDAbsErrA0420210228_Med1
order DDAbsErrA0420210303_Med1
order DDAbsErrA0420210307_Med1
order DDAbsErrA0420210310_Med1
order DDAbsErrA0420210314_Med1
order DDAbsErrA0420210321_Med1
order DDAbsErrA0420210324_Med1
order DDAbsErrA0420210328_Med1
order DDAbsErrA0420210331_Med1
order DDAbsErrA0420210404_Med1
order DDAbsErrA0420210407_Med1
order DDAbsErrA0420210411_Med1
order DDAbsErrA0420210414_Med1
order DDAbsErrA0420210418_Med1
order DDAbsErrA0420210421_Med1
order DDAbsErrA0420210425_Med1
order DDAbsErrA0420210428_Med1
order DDAbsErrA0420210502_Med1
order DDAbsErrA0420210505_Med1
order DDAbsErrA0420210509_Med1
order DDAbsErrA0420210512_Med1
order DDAbsErrA0420210516_Med1
order DDAbsErrA0420210519_Med1
order DDAbsErrA0420210523_Med1
order DDAbsErrA0420210526_Med1
order DDAbsErrA0420210602_Med1
order DDAbsErrA0420210606_Med1
order DDAbsErrA0420210613_Med1
order DDAbsErrA0420210620_Med1
order DDAbsErrA0420210627_Med1
order DDAbsErrA0420210704_Med1
order DDAbsErrA0420210711_Med1
order DDAbsErrA0420210718_Med1
order DDAbsErrA0420210725_Med1
order DDAbsErrA0420210801_Med1
order DDAbsErrA0420210808_Med1
order DDAbsErrA0420210815_Med1
order DDAbsErrA0420210822_Med1
order DDAbsErrA0420210829_Med1
order DDAbsErrA0420210905_Med1
order DDAbsErrA0420210912_Med1
order DDAbsErrA0420210919_Med1
order DDAbsErrA0420210926_Med1


capture drop DDAbsErrA04_Mean1
egen DDAbsErrA04_Mean1 = rowmean(DDAbsErrA0420210926_Med1-DDAbsErrA0420200426_Med1) 
label var DDAbsErrA04_Mean1 "DDAbsErrA04 mean over updates of median absolute error by calendar months"
qui replace DDAbsErrA04_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA04_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA04_Mean1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran







* gen DDPerErrA04_Mean1


order DDPerErrA0420200426_Med1
order DDPerErrA0420200429_Med1
order DDPerErrA0420200506_Med1
order DDPerErrA0420200510_Med1
order DDPerErrA0420200513_Med1
order DDPerErrA0420200517_Med1
order DDPerErrA0420200520_Med1
order DDPerErrA0420200524_Med1
order DDPerErrA0420200527_Med1
order DDPerErrA0420200531_Med1
order DDPerErrA0420200603_Med1
order DDPerErrA0420200607_Med1
order DDPerErrA0420200610_Med1
order DDPerErrA0420200613_Med1
order DDPerErrA0420200617_Med1
order DDPerErrA0420200621_Med1
order DDPerErrA0420200623_Med1
order DDPerErrA0420200628_Med1
order DDPerErrA0420200701_Med1
order DDPerErrA0420200705_Med1
order DDPerErrA0420200708_Med1
order DDPerErrA0420200712_Med1
order DDPerErrA0420200715_Med1
order DDPerErrA0420200719_Med1
order DDPerErrA0420200722_Med1
order DDPerErrA0420200726_Med1
order DDPerErrA0420200729_Med1
order DDPerErrA0420200802_Med1
order DDPerErrA0420200805_Med1
order DDPerErrA0420200809_Med1
order DDPerErrA0420200812_Med1
order DDPerErrA0420200816_Med1
order DDPerErrA0420200819_Med1
order DDPerErrA0420200823_Med1
order DDPerErrA0420200826_Med1
order DDPerErrA0420200830_Med1
order DDPerErrA0420200902_Med1
order DDPerErrA0420200906_Med1
order DDPerErrA0420200909_Med1
order DDPerErrA0420200913_Med1
order DDPerErrA0420200916_Med1
order DDPerErrA0420200920_Med1
order DDPerErrA0420200923_Med1
order DDPerErrA0420200927_Med1
order DDPerErrA0420200930_Med1
order DDPerErrA0420201004_Med1
order DDPerErrA0420201007_Med1
order DDPerErrA0420201011_Med1
order DDPerErrA0420201014_Med1
order DDPerErrA0420201018_Med1
order DDPerErrA0420201021_Med1
order DDPerErrA0420201025_Med1
order DDPerErrA0420201028_Med1
order DDPerErrA0420201101_Med1
order DDPerErrA0420201104_Med1
order DDPerErrA0420201108_Med1
order DDPerErrA0420201111_Med1
order DDPerErrA0420201115_Med1
order DDPerErrA0420201118_Med1
order DDPerErrA0420201122_Med1
order DDPerErrA0420201125_Med1
order DDPerErrA0420201129_Med1
order DDPerErrA0420201202_Med1
order DDPerErrA0420201206_Med1
order DDPerErrA0420201209_Med1
order DDPerErrA0420201213_Med1
order DDPerErrA0420201216_Med1
order DDPerErrA0420201220_Med1
order DDPerErrA0420201223_Med1
order DDPerErrA0420210103_Med1
order DDPerErrA0420210105_Med1
order DDPerErrA0420210110_Med1
order DDPerErrA0420210113_Med1
order DDPerErrA0420210117_Med1
order DDPerErrA0420210120_Med1
order DDPerErrA0420210124_Med1
order DDPerErrA0420210127_Med1
order DDPerErrA0420210131_Med1
order DDPerErrA0420210203_Med1
order DDPerErrA0420210207_Med1
order DDPerErrA0420210210_Med1
order DDPerErrA0420210214_Med1
order DDPerErrA0420210217_Med1
order DDPerErrA0420210221_Med1
order DDPerErrA0420210224_Med1
order DDPerErrA0420210228_Med1
order DDPerErrA0420210303_Med1
order DDPerErrA0420210307_Med1
order DDPerErrA0420210310_Med1
order DDPerErrA0420210314_Med1
order DDPerErrA0420210321_Med1
order DDPerErrA0420210324_Med1
order DDPerErrA0420210328_Med1
order DDPerErrA0420210331_Med1
order DDPerErrA0420210404_Med1
order DDPerErrA0420210407_Med1
order DDPerErrA0420210411_Med1
order DDPerErrA0420210414_Med1
order DDPerErrA0420210418_Med1
order DDPerErrA0420210421_Med1
order DDPerErrA0420210425_Med1
order DDPerErrA0420210428_Med1
order DDPerErrA0420210502_Med1
order DDPerErrA0420210505_Med1
order DDPerErrA0420210509_Med1
order DDPerErrA0420210512_Med1
order DDPerErrA0420210516_Med1
order DDPerErrA0420210519_Med1
order DDPerErrA0420210523_Med1
order DDPerErrA0420210526_Med1
order DDPerErrA0420210602_Med1
order DDPerErrA0420210606_Med1
order DDPerErrA0420210613_Med1
order DDPerErrA0420210620_Med1
order DDPerErrA0420210627_Med1
order DDPerErrA0420210704_Med1
order DDPerErrA0420210711_Med1
order DDPerErrA0420210718_Med1
order DDPerErrA0420210725_Med1
order DDPerErrA0420210801_Med1
order DDPerErrA0420210808_Med1
order DDPerErrA0420210815_Med1
order DDPerErrA0420210822_Med1
order DDPerErrA0420210829_Med1
order DDPerErrA0420210905_Med1
order DDPerErrA0420210912_Med1
order DDPerErrA0420210919_Med1
order DDPerErrA0420210926_Med1


capture drop DDPerErrA04_Mean1
egen DDPerErrA04_Mean1 = rowmean(DDPerErrA0420210926_Med1-DDPerErrA0420200426_Med1) 
label var DDPerErrA04_Mean1 "DDPerErrA04 mean over updates of median % error by calendar months"
qui replace DDPerErrA04_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA04_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA04_Mean1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran








* gen DDAbPeErA04_Mean1


order DDAbPeErA0420200426_Med1
order DDAbPeErA0420200429_Med1
order DDAbPeErA0420200506_Med1
order DDAbPeErA0420200510_Med1
order DDAbPeErA0420200513_Med1
order DDAbPeErA0420200517_Med1
order DDAbPeErA0420200520_Med1
order DDAbPeErA0420200524_Med1
order DDAbPeErA0420200527_Med1
order DDAbPeErA0420200531_Med1
order DDAbPeErA0420200603_Med1
order DDAbPeErA0420200607_Med1
order DDAbPeErA0420200610_Med1
order DDAbPeErA0420200613_Med1
order DDAbPeErA0420200617_Med1
order DDAbPeErA0420200621_Med1
order DDAbPeErA0420200623_Med1
order DDAbPeErA0420200628_Med1
order DDAbPeErA0420200701_Med1
order DDAbPeErA0420200705_Med1
order DDAbPeErA0420200708_Med1
order DDAbPeErA0420200712_Med1
order DDAbPeErA0420200715_Med1
order DDAbPeErA0420200719_Med1
order DDAbPeErA0420200722_Med1
order DDAbPeErA0420200726_Med1
order DDAbPeErA0420200729_Med1
order DDAbPeErA0420200802_Med1
order DDAbPeErA0420200805_Med1
order DDAbPeErA0420200809_Med1
order DDAbPeErA0420200812_Med1
order DDAbPeErA0420200816_Med1
order DDAbPeErA0420200819_Med1
order DDAbPeErA0420200823_Med1
order DDAbPeErA0420200826_Med1
order DDAbPeErA0420200830_Med1
order DDAbPeErA0420200902_Med1
order DDAbPeErA0420200906_Med1
order DDAbPeErA0420200909_Med1
order DDAbPeErA0420200913_Med1
order DDAbPeErA0420200916_Med1
order DDAbPeErA0420200920_Med1
order DDAbPeErA0420200923_Med1
order DDAbPeErA0420200927_Med1
order DDAbPeErA0420200930_Med1
order DDAbPeErA0420201004_Med1
order DDAbPeErA0420201007_Med1
order DDAbPeErA0420201011_Med1
order DDAbPeErA0420201014_Med1
order DDAbPeErA0420201018_Med1
order DDAbPeErA0420201021_Med1
order DDAbPeErA0420201025_Med1
order DDAbPeErA0420201028_Med1
order DDAbPeErA0420201101_Med1
order DDAbPeErA0420201104_Med1
order DDAbPeErA0420201108_Med1
order DDAbPeErA0420201111_Med1
order DDAbPeErA0420201115_Med1
order DDAbPeErA0420201118_Med1
order DDAbPeErA0420201122_Med1
order DDAbPeErA0420201125_Med1
order DDAbPeErA0420201129_Med1
order DDAbPeErA0420201202_Med1
order DDAbPeErA0420201206_Med1
order DDAbPeErA0420201209_Med1
order DDAbPeErA0420201213_Med1
order DDAbPeErA0420201216_Med1
order DDAbPeErA0420201220_Med1
order DDAbPeErA0420201223_Med1
order DDAbPeErA0420210103_Med1
order DDAbPeErA0420210105_Med1
order DDAbPeErA0420210110_Med1
order DDAbPeErA0420210113_Med1
order DDAbPeErA0420210117_Med1
order DDAbPeErA0420210120_Med1
order DDAbPeErA0420210124_Med1
order DDAbPeErA0420210127_Med1
order DDAbPeErA0420210131_Med1
order DDAbPeErA0420210203_Med1
order DDAbPeErA0420210207_Med1
order DDAbPeErA0420210210_Med1
order DDAbPeErA0420210214_Med1
order DDAbPeErA0420210217_Med1
order DDAbPeErA0420210221_Med1
order DDAbPeErA0420210224_Med1
order DDAbPeErA0420210228_Med1
order DDAbPeErA0420210303_Med1
order DDAbPeErA0420210307_Med1
order DDAbPeErA0420210310_Med1
order DDAbPeErA0420210314_Med1
order DDAbPeErA0420210321_Med1
order DDAbPeErA0420210324_Med1
order DDAbPeErA0420210328_Med1
order DDAbPeErA0420210331_Med1
order DDAbPeErA0420210404_Med1
order DDAbPeErA0420210407_Med1
order DDAbPeErA0420210411_Med1
order DDAbPeErA0420210414_Med1
order DDAbPeErA0420210418_Med1
order DDAbPeErA0420210421_Med1
order DDAbPeErA0420210425_Med1
order DDAbPeErA0420210428_Med1
order DDAbPeErA0420210502_Med1
order DDAbPeErA0420210505_Med1
order DDAbPeErA0420210509_Med1
order DDAbPeErA0420210512_Med1
order DDAbPeErA0420210516_Med1
order DDAbPeErA0420210519_Med1
order DDAbPeErA0420210523_Med1
order DDAbPeErA0420210526_Med1
order DDAbPeErA0420210602_Med1
order DDAbPeErA0420210606_Med1
order DDAbPeErA0420210613_Med1
order DDAbPeErA0420210620_Med1
order DDAbPeErA0420210627_Med1
order DDAbPeErA0420210704_Med1
order DDAbPeErA0420210711_Med1
order DDAbPeErA0420210718_Med1
order DDAbPeErA0420210725_Med1
order DDAbPeErA0420210801_Med1
order DDAbPeErA0420210808_Med1
order DDAbPeErA0420210815_Med1
order DDAbPeErA0420210822_Med1
order DDAbPeErA0420210829_Med1
order DDAbPeErA0420210905_Med1
order DDAbPeErA0420210912_Med1
order DDAbPeErA0420210919_Med1
order DDAbPeErA0420210926_Med1


capture drop DDAbPeErA04_Mean1
egen DDAbPeErA04_Mean1 = rowmean(DDAbPeErA0420210926_Med1-DDAbPeErA0420200426_Med1) 
label var DDAbPeErA04_Mean1 "DDAbPeErA04 mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErA04_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA04_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA04_Mean1 = . if date < td(26Apr2020) // 26Apr2020 is the earliest date of LANL forecasts for Iran


 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorA04_Mean2 = mean(DDErrorA04_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorA04_Mean2 "DDErrorA04 Mean over calendar months of median error over updates"

egen DDAbsErrA04_Mean2 = mean(DDAbsErrA04_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrA04_Mean2 "DDAbsErrA04 Mean over calendar months of median absolute error over updates"

egen DDPerErrA04_Mean2 = mean(DDPerErrA04_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrA04_Mean2 "DDPerErrA04 Mean over calendar months of median % error over updates"

egen DDAbPeErA04_Mean2 = mean(DDAbPeErA04_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErA04_Mean2 "DDAbPeErA04 Mean over calendar months of median absolute % error over updates"





*

grstyle init

grstyle color background white



******
* graph 3 Daily deaths, Error

twoway ///
(line DDErrorA0420200426 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200429 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200506 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200510 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200513 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200517 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200520 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200524 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200527 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200531 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200603 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200607 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200610 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200617 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200621 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200623 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200628 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200701 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200705 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200708 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200712 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200715 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200719 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200722 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200726 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200729 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200802 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200805 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200809 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200812 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200816 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200819 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200823 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200826 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200830 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200902 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200906 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200909 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200913 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200916 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200920 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200923 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200927 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420200930 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201004 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201007 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201011 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201014 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201018 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201021 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201025 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201028 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201101 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201104 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201108 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201111 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201115 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201118 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201122 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201125 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201129 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201202 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201206 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201209 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201213 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201216 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201220 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420201223 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210103 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210105 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210110 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210113 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210117 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210120 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210124 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210127 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210131 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210203 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210207 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210210 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210214 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210217 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210221 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210224 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210228 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210303 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210307 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210310 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210314 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210321 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210324 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210328 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210331 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210404 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210407 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210411 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210414 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210418 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210421 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210425 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210428 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210502 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210505 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210509 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210512 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210516 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210519 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210523 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210526 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210602 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210606 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210620 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210627 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210704 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210711 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210718 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210725 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210801 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210808 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210815 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210822 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210829 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210905 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210912 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210919 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDErrorA0420210926 date, sort lcolor(brown) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, LANL, all updates, forecast only", size(small)) 

qui graph export "graph 3 C19 daily deaths error, $country, LANL, all updates.pdf", replace





******
* graph 4 Daily deaths, Absolute Error

twoway ///
(line DDAbsErrA0420200426 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200429 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200506 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200510 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200513 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200517 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200520 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200524 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200527 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200531 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200603 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200607 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200610 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200617 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200621 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200623 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200628 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200701 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200705 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200708 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200712 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200715 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200719 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200722 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200726 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200729 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200802 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200805 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200809 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200812 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200816 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200819 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200823 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200826 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200830 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200902 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200906 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200909 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200913 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200916 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200920 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200923 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200927 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420200930 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201004 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201007 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201011 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201014 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201018 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201021 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201025 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201028 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201101 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201104 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201108 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201111 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201115 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201118 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201122 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201125 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201129 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201202 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201206 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201209 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201213 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201216 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201220 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420201223 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210103 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210105 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210110 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210113 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210117 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210120 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210124 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210127 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210131 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210203 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210207 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210210 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210214 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210217 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210221 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210224 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210228 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210303 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210307 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210310 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210314 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210321 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210324 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210328 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210331 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210404 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210407 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210411 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210414 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210418 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210421 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210425 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210428 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210502 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210505 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210509 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210512 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210516 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210519 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210523 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210526 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210602 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210606 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210620 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210627 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210704 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210711 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210718 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210725 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210801 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210808 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210815 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210822 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210829 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210905 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210912 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210919 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbsErrA0420210926 date, sort lcolor(brown) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, LANL, all updates, forecast only", size(small))

qui graph export "graph 4 C19 daily deaths absolute error, $country, LANL, all updates.pdf", replace








******
* graph 5 Daily deaths, % Error

twoway ///
(line DDPerErrA0420200426 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200429 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200506 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200510 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200513 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200517 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200520 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200524 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200527 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200531 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200603 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200607 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200610 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200617 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200621 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200623 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200628 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200701 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200705 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200708 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200712 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200715 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200719 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200722 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200726 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200729 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200802 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200805 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200809 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200812 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200816 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200819 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200823 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200826 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200830 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200902 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200906 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200909 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200913 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200916 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200920 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200923 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200927 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420200930 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201004 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201007 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201011 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201014 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201018 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201021 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201025 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201028 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201101 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201104 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201108 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201111 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201115 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201118 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201122 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201125 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201129 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201202 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201206 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201209 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201213 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201216 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201220 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420201223 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210103 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210105 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210110 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210113 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210117 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210120 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210124 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210127 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210131 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210203 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210207 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210210 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210214 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210217 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210221 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210224 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210228 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210303 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210307 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210310 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210314 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210321 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210324 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210328 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210331 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210404 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210407 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210411 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210414 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210418 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210421 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210425 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210428 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210502 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210505 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210509 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210512 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210516 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210519 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210523 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210526 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210602 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210606 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210620 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210627 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210704 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210711 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210718 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210725 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210801 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210808 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210815 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210822 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210829 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210905 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210912 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210919 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDPerErrA0420210926 date, sort lcolor(brown) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, LANL, all updates, forecast only", size(small))

qui graph export "graph 5 C19 daily deaths % error, $country, LANL, all updates.pdf", replace








******
* graph 6 Daily deaths, Absolute % Error

twoway ///
(line DDAbPeErA0420200426 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200429 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200506 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200510 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200513 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200517 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200520 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200524 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200527 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200531 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200603 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200607 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200610 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200617 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200621 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200623 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200628 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200701 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200705 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200708 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200712 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200715 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200719 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200722 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200726 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200729 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200802 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200805 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200809 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200812 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200816 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200819 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200823 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200826 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200830 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200902 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200906 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200909 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200913 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200916 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200920 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200923 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200927 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420200930 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201004 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201007 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201011 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201014 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201018 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201021 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201025 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201028 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201101 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201104 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201108 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201111 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201115 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201118 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201122 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201125 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201129 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201202 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201206 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201209 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201213 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201216 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201220 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420201223 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210103 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210105 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210110 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210113 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210117 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210120 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210124 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210127 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210131 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210203 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210207 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210210 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210214 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210217 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210221 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210224 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210228 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210303 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210307 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210310 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210314 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210321 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210324 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210328 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210331 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210404 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210407 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210411 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210414 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210418 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210421 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210425 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210428 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210502 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210505 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210509 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210512 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210516 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210519 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210523 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210526 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210602 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210606 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210613 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210620 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210627 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210704 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210711 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210718 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210725 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210801 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210808 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210815 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210822 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210829 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210905 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210912 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210919 date, sort lcolor(brown) lwidth(thin)) /// 
(line DDAbPeErA0420210926 date, sort lcolor(brown) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, LANL, all updates, forecast only", size(small))

qui graph export "graph 6 C19 daily deaths absolute % error, $country, LANL, all updates.pdf", replace











***************************************************************
* graph 7 a Daily deaths, average median errors 

twoway ///
(line DDErrorA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 a C19 daily deaths error, $country, LANL, Error Mean1.pdf", replace




*********************
* smooth median error for better viewing 

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   

tssmooth ma DDErrorA04_Mean1_window = DDErrorA04_Mean1, window(3 1 3)

tssmooth ma DDErrorA04_Mean1_sm = DDErrorA04_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorA04_Mean1_sm "Daily deaths LANL average median errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*




***************************************************************
* graph 7 b Daily deaths, average median errors 

twoway ///
(line DDErrorA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 b C19 daily deaths error, $country, LANL, Error Mean1 smooth.pdf", replace










***************************************************************
* graph 8 a Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 a C19 daily deaths error, $country, LANL, Absolute Error Mean1.pdf", replace





*********************
* smooth median absolute error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbsErrA04_Mean1_window = DDAbsErrA04_Mean1, window(3 1 3)

tssmooth ma DDAbsErrA04_Mean1_sm = DDAbsErrA04_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrA04_Mean1_sm "Daily deaths LANL average median absolute errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 8 b Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 b C19 daily deaths error, $country, LANL, Absolute Error Mean1 smooth.pdf", replace







***************************************************************
* graph 9 a Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 a C19 daily deaths error, $country, LANL, % Error Mean1.pdf", replace




*********************
* smooth median percent error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDPerErrA04_Mean1_window = DDPerErrA04_Mean1, window(3 1 3)

tssmooth ma DDPerErrA04_Mean1_sm = DDPerErrA04_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrA04_Mean1_sm "Daily deaths LANL average median percent errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 9 b Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 b C19 daily deaths error, $country, LANL, % Error Mean1 smooth.pdf", replace










***************************************************************
* graph 10 a Daily deaths, average median absolute percent errors

twoway ///
(line DDAbPeErA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 a C19 daily deaths error, $country, LANL, Absolute % Error Mean1.pdf", replace




*********************
* smooth median absolute % error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbPeErA04_Mean1_window = DDAbPeErA04_Mean1, window(3 1 3)

tssmooth ma DDAbPeErA04_Mean1_sm = DDAbPeErA04_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErA04_Mean1_sm "Daily deaths LANL average median absolute percent errors smooth"

drop *_window

drop provincestate_encoded

tsset, clear

*



***************************************************************
* graph 10 b Daily deaths, average median absolute percent errors, smooth

twoway ///
(line DDAbPeErA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, LANL, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 b C19 daily deaths error, $country, LANL, Absolute % Error Mean1 smooth.pdf", replace








***********************************************

capture drop *2r

gen DDAbPeErA04_Mean2r = round(DDAbPeErA04_Mean2,0.1)
    

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA04_Mean2r /// 
, bar(1, fcolor(brown) lcolor(brown)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("$country, LANL, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) 

qui graph export "graph 11 C19 daily deaths, $country, LANL, Average MAPE.pdf", replace








qui compress

save "CovidLongitudinal LANL 3.dta", replace



view "log CovidLongitudinal LANL 4.smcl"

log close
