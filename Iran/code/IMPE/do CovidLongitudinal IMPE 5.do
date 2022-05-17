
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Percent Error
* 6 Absolute Percent Error

* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months

* input data files: "CovidLongitudinal IMPE 2.dta"
* output data files: "CovidLongitudinal IMPE 3.dta" (error masures saved)





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





use "CovidLongitudinal IMPE 2.dta", clear





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
20211226 







sort provincestate date


* (1) gen error TYPES by calendar months and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

capture drop DDErrorA03`update'
gen DDErrorA03`update' = - (DayDeaMeSmA00 - DayDeaFOREA03`update')
label var DDErrorA03`update' "DayDeaFOREA03`update' error"
qui replace DDErrorA03`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA03`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study

capture drop DDAbsErrA03`update'
gen DDAbsErrA03`update' = abs(- (DayDeaMeSmA00 - DayDeaFOREA03`update'))
label var DDAbsErrA03`update' "DayDeaFOREA03`update' absolute error"
qui replace DDAbsErrA03`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA03`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA03`update' = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran

capture drop DDPerErrA03`update'
gen DDPerErrA03`update' = (100 * (- (DayDeaMeSmA00 - DayDeaFOREA03`update'))) / DayDeaMeSmA00
label var DDPerErrA03`update' "DayDeaFOREA03`update' percent error"
qui replace DDPerErrA03`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA03`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA03`update' = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran

capture drop DDAbPeErA03`update'
gen DDAbPeErA03`update' = (100 * abs(- (DayDeaMeSmA00 - DayDeaFOREA03`update'))) / DayDeaMeSmA00
label var DDAbPeErA03`update' "DayDeaFOREA03`update' absolute percent error" 
qui replace DDAbPeErA03`update' = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA03`update' = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA03`update' = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran

}
*





* (2) gen MEDIAN of error types by calendar months and updates = _Med1

* Wait note: wait ...

foreach update of local list {
		
capture drop DDErrorA03`update'_Med1
bysort yearmonth : egen DDErrorA03`update'_Med1 = median(DDErrorA03`update')
label var DDErrorA03`update'_Med1 "DayDeaA03 median error by calendar months and updates"
qui replace DDErrorA03`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA03`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study

capture drop DDAbsErrA03`update'_Med1
bysort yearmonth : egen DDAbsErrA03`update'_Med1 = median(DDAbsErrA03`update')
label var DDAbsErrA03`update'_Med1 "DayDeaA03 median absolute error by calendar months and updates"
qui replace DDAbsErrA03`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA03`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA03`update'_Med1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran

capture drop DDPerErrA03`update'_Med1
bysort yearmonth : egen DDPerErrA03`update'_Med1 = median(DDPerErrA03`update')
label var DDPerErrA03`update'_Med1 "DayDeaA03 median % error by calendar months and updates"
qui replace DDPerErrA03`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA03`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA03`update'_Med1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran

capture drop DDAbPeErA03`update'_Med1
bysort yearmonth : egen DDAbPeErA03`update'_Med1 = median(DDAbPeErA03`update')
label var DDAbPeErA03`update'_Med1 "DayDeaA03 median absolute % error by calendar months and updates" 
qui replace DDAbPeErA03`update'_Med1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA03`update'_Med1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA03`update'_Med1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1

* Wait note: wait ...



* gen DDErrorA03_Mean1

order DDErrorA0320200614_Med1
order DDErrorA0320200616_Med1
order DDErrorA0320200619_Med1
order DDErrorA0320200623_Med1
order DDErrorA0320200702_Med1
order DDErrorA0320200703_Med1
order DDErrorA0320200704_Med1
order DDErrorA0320200707_Med1
order DDErrorA0320200711_Med1
order DDErrorA0320200714_Med1
order DDErrorA0320200715_Med1
order DDErrorA0320200718_Med1
order DDErrorA0320200720_Med1
order DDErrorA0320200722_Med1
order DDErrorA0320200725_Med1
order DDErrorA0320200727_Med1
order DDErrorA0320200731_Med1
order DDErrorA0320200808_Med1
order DDErrorA0320200810_Med1
order DDErrorA0320200811_Med1
order DDErrorA0320200813_Med1
order DDErrorA0320200814_Med1
order DDErrorA0320200817_Med1
order DDErrorA0320200823_Med1
order DDErrorA0320200825_Med1
order DDErrorA0320200827_Med1
order DDErrorA0320200831_Med1
order DDErrorA0320200902_Med1
order DDErrorA0320200906_Med1
order DDErrorA0320200908_Med1
order DDErrorA0320200912_Med1
order DDErrorA0320200915_Med1
order DDErrorA0320200919_Med1
order DDErrorA0320200923_Med1
order DDErrorA0320200925_Med1
order DDErrorA0320201003_Med1
order DDErrorA0320201006_Med1
order DDErrorA0320201012_Med1
order DDErrorA0320201019_Med1
order DDErrorA0320201025_Med1
order DDErrorA0320201028_Med1
order DDErrorA0320201101_Med1
order DDErrorA0320201110_Med1
order DDErrorA0320201114_Med1
order DDErrorA0320201118_Med1
order DDErrorA0320201123_Med1
order DDErrorA0320201129_Med1
order DDErrorA0320201204_Med1
order DDErrorA0320201212_Med1
order DDErrorA0320201220_Med1
order DDErrorA0320201226_Med1
order DDErrorA0320210110_Med1
order DDErrorA0320210112_Med1
order DDErrorA0320210118_Med1
order DDErrorA0320210124_Med1
order DDErrorA0320210130_Med1
order DDErrorA0320210203_Med1
order DDErrorA0320210210_Med1
order DDErrorA0320210217_Med1
order DDErrorA0320210226_Med1
order DDErrorA0320210305_Med1
order DDErrorA0320210312_Med1
order DDErrorA0320210319_Med1
order DDErrorA0320210329_Med1
order DDErrorA0320210406_Med1
order DDErrorA0320210417_Med1
order DDErrorA0320210424_Med1
order DDErrorA0320210510_Med1
order DDErrorA0320210516_Med1
order DDErrorA0320210522_Med1
order DDErrorA0320210527_Med1
order DDErrorA0320210604_Med1
order DDErrorA0320210611_Med1
order DDErrorA0320210618_Med1
order DDErrorA0320210626_Med1
order DDErrorA0320210702_Med1
order DDErrorA0320210709_Med1
order DDErrorA0320210719_Med1
order DDErrorA0320210806_Med1
order DDErrorA0320210819_Med1
order DDErrorA0320210825_Med1
order DDErrorA0320210909_Med1
order DDErrorA0320210924_Med1
order DDErrorA0320211006_Med1
order DDErrorA0320211021_Med1
order DDErrorA0320211027_Med1
order DDErrorA0320211103_Med1
order DDErrorA0320211115_Med1
order DDErrorA0320211121_Med1
order DDErrorA0320211129_Med1
order DDErrorA0320211205_Med1
order DDErrorA0320211213_Med1
order DDErrorA0320211226_Med1
		
		
capture drop DDErrorA03_Mean1		
egen DDErrorA03_Mean1 = rowmean(DDErrorA0320211226_Med1-DDErrorA0320200614_Med1) 
label var DDErrorA03_Mean1 "DDErrorA03 mean over updates of median error by calendar months"
qui replace DDErrorA03_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDErrorA03_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDErrorA03_Mean1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran






* gen DDAbsErrA03_Mean1


order DDAbsErrA0320200614_Med1
order DDAbsErrA0320200616_Med1
order DDAbsErrA0320200619_Med1
order DDAbsErrA0320200623_Med1
order DDAbsErrA0320200702_Med1
order DDAbsErrA0320200703_Med1
order DDAbsErrA0320200704_Med1
order DDAbsErrA0320200707_Med1
order DDAbsErrA0320200711_Med1
order DDAbsErrA0320200714_Med1
order DDAbsErrA0320200715_Med1
order DDAbsErrA0320200718_Med1
order DDAbsErrA0320200720_Med1
order DDAbsErrA0320200722_Med1
order DDAbsErrA0320200725_Med1
order DDAbsErrA0320200727_Med1
order DDAbsErrA0320200731_Med1
order DDAbsErrA0320200808_Med1
order DDAbsErrA0320200810_Med1
order DDAbsErrA0320200811_Med1
order DDAbsErrA0320200813_Med1
order DDAbsErrA0320200814_Med1
order DDAbsErrA0320200817_Med1
order DDAbsErrA0320200823_Med1
order DDAbsErrA0320200825_Med1
order DDAbsErrA0320200827_Med1
order DDAbsErrA0320200831_Med1
order DDAbsErrA0320200902_Med1
order DDAbsErrA0320200906_Med1
order DDAbsErrA0320200908_Med1
order DDAbsErrA0320200912_Med1
order DDAbsErrA0320200915_Med1
order DDAbsErrA0320200919_Med1
order DDAbsErrA0320200923_Med1
order DDAbsErrA0320200925_Med1
order DDAbsErrA0320201003_Med1
order DDAbsErrA0320201006_Med1
order DDAbsErrA0320201012_Med1
order DDAbsErrA0320201019_Med1
order DDAbsErrA0320201025_Med1
order DDAbsErrA0320201028_Med1
order DDAbsErrA0320201101_Med1
order DDAbsErrA0320201110_Med1
order DDAbsErrA0320201114_Med1
order DDAbsErrA0320201118_Med1
order DDAbsErrA0320201123_Med1
order DDAbsErrA0320201129_Med1
order DDAbsErrA0320201204_Med1
order DDAbsErrA0320201212_Med1
order DDAbsErrA0320201220_Med1
order DDAbsErrA0320201226_Med1
order DDAbsErrA0320210110_Med1
order DDAbsErrA0320210112_Med1
order DDAbsErrA0320210118_Med1
order DDAbsErrA0320210124_Med1
order DDAbsErrA0320210130_Med1
order DDAbsErrA0320210203_Med1
order DDAbsErrA0320210210_Med1
order DDAbsErrA0320210217_Med1
order DDAbsErrA0320210226_Med1
order DDAbsErrA0320210305_Med1
order DDAbsErrA0320210312_Med1
order DDAbsErrA0320210319_Med1
order DDAbsErrA0320210329_Med1
order DDAbsErrA0320210406_Med1
order DDAbsErrA0320210417_Med1
order DDAbsErrA0320210424_Med1
order DDAbsErrA0320210510_Med1
order DDAbsErrA0320210516_Med1
order DDAbsErrA0320210522_Med1
order DDAbsErrA0320210527_Med1
order DDAbsErrA0320210604_Med1
order DDAbsErrA0320210611_Med1
order DDAbsErrA0320210618_Med1
order DDAbsErrA0320210626_Med1
order DDAbsErrA0320210702_Med1
order DDAbsErrA0320210709_Med1
order DDAbsErrA0320210719_Med1
order DDAbsErrA0320210806_Med1
order DDAbsErrA0320210819_Med1
order DDAbsErrA0320210825_Med1
order DDAbsErrA0320210909_Med1
order DDAbsErrA0320210924_Med1
order DDAbsErrA0320211006_Med1
order DDAbsErrA0320211021_Med1
order DDAbsErrA0320211027_Med1
order DDAbsErrA0320211103_Med1
order DDAbsErrA0320211115_Med1
order DDAbsErrA0320211121_Med1
order DDAbsErrA0320211129_Med1
order DDAbsErrA0320211205_Med1
order DDAbsErrA0320211213_Med1
order DDAbsErrA0320211226_Med1


capture drop DDAbsErrA03_Mean1
egen DDAbsErrA03_Mean1 = rowmean(DDAbsErrA0320211226_Med1-DDAbsErrA0320200614_Med1) 
label var DDAbsErrA03_Mean1 "DDAbsErrA03 mean over updates of median absolute error by calendar months"
qui replace DDAbsErrA03_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbsErrA03_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbsErrA03_Mean1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran







* gen DDPerErrA03_Mean1


order DDPerErrA0320200614_Med1
order DDPerErrA0320200616_Med1
order DDPerErrA0320200619_Med1
order DDPerErrA0320200623_Med1
order DDPerErrA0320200702_Med1
order DDPerErrA0320200703_Med1
order DDPerErrA0320200704_Med1
order DDPerErrA0320200707_Med1
order DDPerErrA0320200711_Med1
order DDPerErrA0320200714_Med1
order DDPerErrA0320200715_Med1
order DDPerErrA0320200718_Med1
order DDPerErrA0320200720_Med1
order DDPerErrA0320200722_Med1
order DDPerErrA0320200725_Med1
order DDPerErrA0320200727_Med1
order DDPerErrA0320200731_Med1
order DDPerErrA0320200808_Med1
order DDPerErrA0320200810_Med1
order DDPerErrA0320200811_Med1
order DDPerErrA0320200813_Med1
order DDPerErrA0320200814_Med1
order DDPerErrA0320200817_Med1
order DDPerErrA0320200823_Med1
order DDPerErrA0320200825_Med1
order DDPerErrA0320200827_Med1
order DDPerErrA0320200831_Med1
order DDPerErrA0320200902_Med1
order DDPerErrA0320200906_Med1
order DDPerErrA0320200908_Med1
order DDPerErrA0320200912_Med1
order DDPerErrA0320200915_Med1
order DDPerErrA0320200919_Med1
order DDPerErrA0320200923_Med1
order DDPerErrA0320200925_Med1
order DDPerErrA0320201003_Med1
order DDPerErrA0320201006_Med1
order DDPerErrA0320201012_Med1
order DDPerErrA0320201019_Med1
order DDPerErrA0320201025_Med1
order DDPerErrA0320201028_Med1
order DDPerErrA0320201101_Med1
order DDPerErrA0320201110_Med1
order DDPerErrA0320201114_Med1
order DDPerErrA0320201118_Med1
order DDPerErrA0320201123_Med1
order DDPerErrA0320201129_Med1
order DDPerErrA0320201204_Med1
order DDPerErrA0320201212_Med1
order DDPerErrA0320201220_Med1
order DDPerErrA0320201226_Med1
order DDPerErrA0320210110_Med1
order DDPerErrA0320210112_Med1
order DDPerErrA0320210118_Med1
order DDPerErrA0320210124_Med1
order DDPerErrA0320210130_Med1
order DDPerErrA0320210203_Med1
order DDPerErrA0320210210_Med1
order DDPerErrA0320210217_Med1
order DDPerErrA0320210226_Med1
order DDPerErrA0320210305_Med1
order DDPerErrA0320210312_Med1
order DDPerErrA0320210319_Med1
order DDPerErrA0320210329_Med1
order DDPerErrA0320210406_Med1
order DDPerErrA0320210417_Med1
order DDPerErrA0320210424_Med1
order DDPerErrA0320210510_Med1
order DDPerErrA0320210516_Med1
order DDPerErrA0320210522_Med1
order DDPerErrA0320210527_Med1
order DDPerErrA0320210604_Med1
order DDPerErrA0320210611_Med1
order DDPerErrA0320210618_Med1
order DDPerErrA0320210626_Med1
order DDPerErrA0320210702_Med1
order DDPerErrA0320210709_Med1
order DDPerErrA0320210719_Med1
order DDPerErrA0320210806_Med1
order DDPerErrA0320210819_Med1
order DDPerErrA0320210825_Med1
order DDPerErrA0320210909_Med1
order DDPerErrA0320210924_Med1
order DDPerErrA0320211006_Med1
order DDPerErrA0320211021_Med1
order DDPerErrA0320211027_Med1
order DDPerErrA0320211103_Med1
order DDPerErrA0320211115_Med1
order DDPerErrA0320211121_Med1
order DDPerErrA0320211129_Med1
order DDPerErrA0320211205_Med1
order DDPerErrA0320211213_Med1
order DDPerErrA0320211226_Med1
		

capture drop DDPerErrA03_Mean1
egen DDPerErrA03_Mean1 = rowmean(DDPerErrA0320211226_Med1-DDPerErrA0320200614_Med1) 
label var DDPerErrA03_Mean1 "DDPerErrA03 mean over updates of median % error by calendar months"
qui replace DDPerErrA03_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDPerErrA03_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDPerErrA03_Mean1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran








* gen DDAbPeErA03_Mean1


order DDAbPeErA0320200614_Med1
order DDAbPeErA0320200616_Med1
order DDAbPeErA0320200619_Med1
order DDAbPeErA0320200623_Med1
order DDAbPeErA0320200702_Med1
order DDAbPeErA0320200703_Med1
order DDAbPeErA0320200704_Med1
order DDAbPeErA0320200707_Med1
order DDAbPeErA0320200711_Med1
order DDAbPeErA0320200714_Med1
order DDAbPeErA0320200715_Med1
order DDAbPeErA0320200718_Med1
order DDAbPeErA0320200720_Med1
order DDAbPeErA0320200722_Med1
order DDAbPeErA0320200725_Med1
order DDAbPeErA0320200727_Med1
order DDAbPeErA0320200731_Med1
order DDAbPeErA0320200808_Med1
order DDAbPeErA0320200810_Med1
order DDAbPeErA0320200811_Med1
order DDAbPeErA0320200813_Med1
order DDAbPeErA0320200814_Med1
order DDAbPeErA0320200817_Med1
order DDAbPeErA0320200823_Med1
order DDAbPeErA0320200825_Med1
order DDAbPeErA0320200827_Med1
order DDAbPeErA0320200831_Med1
order DDAbPeErA0320200902_Med1
order DDAbPeErA0320200906_Med1
order DDAbPeErA0320200908_Med1
order DDAbPeErA0320200912_Med1
order DDAbPeErA0320200915_Med1
order DDAbPeErA0320200919_Med1
order DDAbPeErA0320200923_Med1
order DDAbPeErA0320200925_Med1
order DDAbPeErA0320201003_Med1
order DDAbPeErA0320201006_Med1
order DDAbPeErA0320201012_Med1
order DDAbPeErA0320201019_Med1
order DDAbPeErA0320201025_Med1
order DDAbPeErA0320201028_Med1
order DDAbPeErA0320201101_Med1
order DDAbPeErA0320201110_Med1
order DDAbPeErA0320201114_Med1
order DDAbPeErA0320201118_Med1
order DDAbPeErA0320201123_Med1
order DDAbPeErA0320201129_Med1
order DDAbPeErA0320201204_Med1
order DDAbPeErA0320201212_Med1
order DDAbPeErA0320201220_Med1
order DDAbPeErA0320201226_Med1
order DDAbPeErA0320210110_Med1
order DDAbPeErA0320210112_Med1
order DDAbPeErA0320210118_Med1
order DDAbPeErA0320210124_Med1
order DDAbPeErA0320210130_Med1
order DDAbPeErA0320210203_Med1
order DDAbPeErA0320210210_Med1
order DDAbPeErA0320210217_Med1
order DDAbPeErA0320210226_Med1
order DDAbPeErA0320210305_Med1
order DDAbPeErA0320210312_Med1
order DDAbPeErA0320210319_Med1
order DDAbPeErA0320210329_Med1
order DDAbPeErA0320210406_Med1
order DDAbPeErA0320210417_Med1
order DDAbPeErA0320210424_Med1
order DDAbPeErA0320210510_Med1
order DDAbPeErA0320210516_Med1
order DDAbPeErA0320210522_Med1
order DDAbPeErA0320210527_Med1
order DDAbPeErA0320210604_Med1
order DDAbPeErA0320210611_Med1
order DDAbPeErA0320210618_Med1
order DDAbPeErA0320210626_Med1
order DDAbPeErA0320210702_Med1
order DDAbPeErA0320210709_Med1
order DDAbPeErA0320210719_Med1
order DDAbPeErA0320210806_Med1
order DDAbPeErA0320210819_Med1
order DDAbPeErA0320210825_Med1
order DDAbPeErA0320210909_Med1
order DDAbPeErA0320210924_Med1
order DDAbPeErA0320211006_Med1
order DDAbPeErA0320211021_Med1
order DDAbPeErA0320211027_Med1
order DDAbPeErA0320211103_Med1
order DDAbPeErA0320211115_Med1
order DDAbPeErA0320211121_Med1
order DDAbPeErA0320211129_Med1
order DDAbPeErA0320211205_Med1
order DDAbPeErA0320211213_Med1
order DDAbPeErA0320211226_Med1


capture drop DDAbPeErA03_Mean1
egen DDAbPeErA03_Mean1 = rowmean(DDAbPeErA0320211226_Med1-DDAbPeErA0320200614_Med1) 
label var DDAbPeErA03_Mean1 "DDAbPeErA03 mean over updates of median absolute % error by calendar months"
qui replace DDAbPeErA03_Mean1 = . if DayDeaMeSmA00 == . // before location was added to the estimates for the country
qui replace DDAbPeErA03_Mean1 = . if date == td(01jan2022) // 01jan2022 is not included in this study
qui replace DDAbPeErA03_Mean1 = . if date < td(14Jun2020) // 14Jun2020 is the earliest date of IMPE forecasts for Iran


 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1  = _Mean2

* Wait note: wait ...

		
egen DDErrorA03_Mean2 = mean(DDErrorA03_Mean1) // get mean for all calendar months of _Mean1
label var DDErrorA03_Mean2 "DDErrorA03 Mean over calendar months of median error over updates"

egen DDAbsErrA03_Mean2 = mean(DDAbsErrA03_Mean1) // get mean for all calendar months of _Mean1
label var DDAbsErrA03_Mean2 "DDAbsErrA03 Mean over calendar months of median absolute error over updates"

egen DDPerErrA03_Mean2 = mean(DDPerErrA03_Mean1) // get mean for all calendar months of _Mean1
label var DDPerErrA03_Mean2 "DDPerErrA03 Mean over calendar months of median % error over updates"

egen DDAbPeErA03_Mean2 = mean(DDAbPeErA03_Mean1) // get mean for all calendar months of _Mean1
label var DDAbPeErA03_Mean2 "DDAbPeErA03 Mean over calendar months of median absolute % error over updates"







******
* graph 3 Daily deaths, Error

twoway ///
(line DDErrorA0320200614 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200616 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200619 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200623 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200703 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200704 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200707 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200711 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200714 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200715 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200718 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200720 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200722 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200725 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200727 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200731 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200808 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200810 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200811 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200813 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200814 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200817 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200823 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200827 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200831 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200902 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200906 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200908 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200912 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200915 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200919 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200923 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320200925 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201003 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201012 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201019 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201025 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201028 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201101 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201114 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201123 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201204 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201212 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201220 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320201226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210112 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210124 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210130 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210203 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210210 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210217 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210305 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210312 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210319 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210329 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210406 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210417 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210424 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210510 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210516 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210522 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210527 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210604 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210611 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210618 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210626 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210709 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210719 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210806 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210819 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210909 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320210924 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211021 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211027 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211103 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211115 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211121 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211205 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211213 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDErrorA0320211226 date, sort lcolor(magenta) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IMPE, all updates, forecast only", size(small)) 

qui graph export "graph 3 C19 daily deaths error, $country, IMPE, all updates.pdf", replace





******
* graph 4 Daily deaths, Absolute Error

twoway ///
(line DDAbsErrA0320200614 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200616 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200619 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200623 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200703 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200704 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200707 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200711 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200714 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200715 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200718 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200720 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200722 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200725 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200727 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200731 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200808 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200810 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200811 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200813 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200814 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200817 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200823 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200827 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200831 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200902 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200906 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200908 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200912 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200915 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200919 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200923 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320200925 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201003 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201012 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201019 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201025 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201028 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201101 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201114 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201123 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201204 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201212 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201220 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320201226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210112 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210124 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210130 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210203 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210210 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210217 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210305 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210312 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210319 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210329 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210406 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210417 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210424 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210510 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210516 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210522 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210527 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210604 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210611 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210618 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210626 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210709 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210719 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210806 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210819 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210909 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320210924 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211021 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211027 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211103 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211115 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211121 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211205 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211213 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbsErrA0320211226 date, sort lcolor(magenta) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IMPE, all updates, forecast only", size(small))

qui graph export "graph 4 C19 daily deaths absolute error, $country, IMPE, all updates.pdf", replace








******
* graph 5 Daily deaths, % Error

twoway ///
(line DDPerErrA0320200614 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200616 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200619 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200623 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200703 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200704 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200707 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200711 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200714 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200715 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200718 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200720 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200722 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200725 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200727 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200731 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200808 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200810 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200811 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200813 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200814 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200817 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200823 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200827 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200831 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200902 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200906 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200908 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200912 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200915 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200919 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200923 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320200925 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201003 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201012 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201019 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201025 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201028 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201101 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201114 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201123 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201204 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201212 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201220 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320201226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210112 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210124 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210130 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210203 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210210 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210217 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210305 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210312 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210319 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210329 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210406 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210417 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210424 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210510 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210516 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210522 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210527 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210604 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210611 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210618 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210626 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210709 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210719 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210806 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210819 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210909 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320210924 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211021 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211027 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211103 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211115 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211121 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211205 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211213 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDPerErrA0320211226 date, sort lcolor(magenta) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IMPE, all updates, forecast only", size(small))

qui graph export "graph 5 C19 daily deaths % error, $country, IMPE, all updates.pdf", replace








******
* graph 6 Daily deaths, Absolute % Error

twoway ///
(line DDAbPeErA0320200614 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200616 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200619 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200623 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200703 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200704 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200707 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200711 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200714 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200715 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200718 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200720 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200722 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200725 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200727 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200731 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200808 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200810 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200811 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200813 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200814 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200817 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200823 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200827 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200831 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200902 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200906 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200908 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200912 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200915 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200919 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200923 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320200925 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201003 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201012 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201019 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201025 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201028 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201101 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201114 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201123 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201204 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201212 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201220 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320201226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210110 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210112 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210118 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210124 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210130 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210203 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210210 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210217 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210226 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210305 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210312 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210319 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210329 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210406 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210417 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210424 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210510 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210516 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210522 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210527 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210604 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210611 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210618 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210626 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210702 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210709 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210719 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210806 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210819 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210825 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210909 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320210924 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211006 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211021 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211027 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211103 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211115 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211121 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211129 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211205 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211213 date, sort lcolor(magenta) lwidth(thin)) /// 
(line DDAbPeErA0320211226 date, sort lcolor(magenta) lwidth(thin)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3)) ///
subtitle("$country, IMPE, all updates, forecast only", size(small))

qui graph export "graph 6 C19 daily deaths absolute % error, $country, IMPE, all updates.pdf", replace











***************************************************************
* graph 7 a Daily deaths, average median errors 

twoway ///
(line DDErrorA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 a C19 daily deaths error, $country, IMPE, Error Mean1.pdf", replace




*********************
* smooth median error for better viewing 

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   

tssmooth ma DDErrorA03_Mean1_window = DDErrorA03_Mean1, window(3 1 3)

tssmooth ma DDErrorA03_Mean1_sm = DDErrorA03_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDErrorA03_Mean1_sm "Daily deaths IMPE average median errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*




***************************************************************
* graph 7 b Daily deaths, average median errors 

twoway ///
(line DDErrorA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 7 b C19 daily deaths error, $country, IMPE, Error Mean1 smooth.pdf", replace










***************************************************************
* graph 8 a Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 a C19 daily deaths error, $country, IMPE, Absolute Error Mean1.pdf", replace





*********************
* smooth median absolute error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbsErrA03_Mean1_window = DDAbsErrA03_Mean1, window(3 1 3)

tssmooth ma DDAbsErrA03_Mean1_sm = DDAbsErrA03_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbsErrA03_Mean1_sm "Daily deaths IMPE average median absolute errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 8 b Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 8 b C19 daily deaths error, $country, IMPE, Absolute Error Mean1 smooth.pdf", replace







***************************************************************
* graph 9 a Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 a C19 daily deaths error, $country, IMPE, % Error Mean1.pdf", replace




*********************
* smooth median percent error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDPerErrA03_Mean1_window = DDPerErrA03_Mean1, window(3 1 3)

tssmooth ma DDPerErrA03_Mean1_sm = DDPerErrA03_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDPerErrA03_Mean1_sm "Daily deaths IMPE average median percent errors smooth"

drop *_window

// drop provincestate_encoded

// tsset, clear

*





***************************************************************
* graph 9 b Daily deaths, average median percent errors 

twoway ///
(line DDPerErrA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 9 b C19 daily deaths error, $country, IMPE, % Error Mean1 smooth.pdf", replace










***************************************************************
* graph 10 a Daily deaths, average median absolute percent errors

twoway ///
(line DDAbPeErA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 a C19 daily deaths error, $country, IMPE, Absolute % Error Mean1.pdf", replace




*********************
* smooth median absolute % error for better viewing 

// encode provincestate, gen(provincestate_encoded)

// tsset provincestate_encoded date, daily   

tssmooth ma DDAbPeErA03_Mean1_window = DDAbPeErA03_Mean1, window(3 1 3)

tssmooth ma DDAbPeErA03_Mean1_sm = DDAbPeErA03_Mean1_window, weights( 1 2 3 <4> 3 2 1) replace

label var DDAbPeErA03_Mean1_sm "Daily deaths IMPE average median absolute percent errors smooth"

drop *_window

drop provincestate_encoded

tsset, clear

*



***************************************************************
* graph 10 b Daily deaths, average median absolute percent errors, smooth

twoway ///
(line DDAbPeErA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, IMPE, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))

qui graph export "graph 10 b C19 daily deaths error, $country, IMPE, Absolute % Error Mean1 smooth.pdf", replace








***********************************************

capture drop *2r

gen DDAbPeErA03_Mean2r = round(DDAbPeErA03_Mean2,0.1)
    

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA03_Mean2r /// 
, bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medium) color(black)) ///
subtitle("$country, IMPE, forecast only. MAPE: Median Absolute Percent Error", size(small)) /// 
legend(off) 

qui graph export "graph 11 C19 daily deaths, $country, IMPE, Average MAPE.pdf", replace















*

qui compress

save "CovidLongitudinal IMPE 3.dta", replace



view "log CovidLongitudinal IMPE 4.smcl"

log close
