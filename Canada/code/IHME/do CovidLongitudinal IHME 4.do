
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* weeks time bin
* run calculations - daily deaths: four error types (graphs 3, 4, 5, 6), updates together
* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Percent Error
* 6 Absolute Percent Error
* input data files: "CovidLongitudinal IHME 2.dta"
* output data files: "CovidLongitudinal IHME 3.dta" (weekly error measures saved)


use "CovidLongitudinal IHME 2.dta"


grstyle init

grstyle color background white




local list1 ///
20200422 ///
20200427 ///
20200428 ///
20200429 ///
20200504 ///
20200510 ///
20200512 ///
20200520 ///
20200525 ///
20200526 ///
20200529 ///
20200605 ///
20200608 ///
20200610 ///
20200615 ///
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
20211221 







foreach update of local list1 {

	foreach location in XAB XBC XMB XNS XON XQC XSK XXX {

		qui capture drop DDErrorA02`location'`update' 
		qui gen DDErrorA02`location'`update' = DayDeaMeSmA00S00`location' - DayDeaFOREA02S01`location'`update' if DayDeaMeSmA00S00`location' != .
		qui replace DDErrorA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDErrorA02`location'`update' "DayDeaFOREA02S01`location' Error" 
		
		qui capture drop DDAbsErrA02`location'`update' 
		qui gen DDAbsErrA02`location'`update' = abs(DayDeaMeSmA00S00`location' - DayDeaFOREA02S01`location'`update') if DayDeaMeSmA00S00`location' != .
		qui replace DDAbsErrA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDAbsErrA02`location'`update' "DayDeaFOREA02S01`location' Absolute Error" 
		
		qui capture drop DDPerErrA02`location'`update' 
		qui gen DDPerErrA02`location'`update' = (100 * (DayDeaMeSmA00S00`location' - DayDeaFOREA02S01`location'`update')) if DayDeaMeSmA00S00`location' != .
		qui replace DDPerErrA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDPerErrA02`location'`update' "DayDeaFOREA02S01`location' Percent Error" 
		
		qui capture drop DDAbPeErA02`location'`update' 
		qui gen DDAbPeErA02`location'`update' = (100 * abs(DayDeaMeSmA00S00`location' - DayDeaFOREA02S01`location'`update')) if DayDeaMeSmA00S00`location' != .
		qui replace DDAbPeErA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDAbPeErA02`location'`update' "DayDeaFOREA02S01`location' Absolute Percent Error" 

	}	
	
}
*	


qui compress

save "CovidLongitudinal IHME 3.dta", replace






**********************

view "log CovidLongitudinal IHME 4.smcl"

log close

exit, clear
