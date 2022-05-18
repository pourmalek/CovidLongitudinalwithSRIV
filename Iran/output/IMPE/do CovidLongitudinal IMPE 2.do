
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* merge estimates files
* input data files: "IMPE `update'.dta"
* output date files: "CovidLongitudinal IMPE.dta"




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



foreach update of local list {

	use "IMPE `update'.dta", clear
	
* gen Forecast only
	
	capture rename DayDeaMeRaA03S02_`update' DayDeaMeRaA03`update'
	
	capture rename DayDeaMeRaA03_`update' DayDeaMeRaA03`update'
	
	capture rename DayDeaMeRaA03`update' DayDeaMeRaA03`update'

	
	capture drop update_date
	
	gen update_date = date("`update'", "YMD")
	
	capture rename DayDeaMeRaA03S02`update' DayDeaMeRaA03`update'
	
	capture drop DayDeaFOREA03`update'
	
	gen DayDeaFOREA03`update' = DayDeaMeRaA03`update'
	
	replace DayDeaFOREA03`update' = . if date < update_date
	
	label var DayDeaFOREA03`update' "DayDeaMeRaA03 `update' Forecast only"
	
	

* smooth

	tsset date, daily   
	
	capture drop DayDeaMeRaA03`update'_window DayDeaMeSmA03`update' 
	
	tssmooth ma DayDeaMeRaA03`update'_window = DayDeaMeRaA03`update' if DayDeaMeRaA03`update' >= 0, window(3 1 3)
	
	tssmooth ma DayDeaMeSmA03`update' = DayDeaMeRaA03`update'_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA03`update' "Daily deaths mean smooth IMPE"
	
	
	capture drop DayDeaFOREA03`update'_raw DayDeaFOREA03`update'_window DayDeaFOREA03`update'
	
	rename DayDeaFOREA03`update' DayDeaFOREA03`update'_raw
	
	tssmooth ma DayDeaFOREA03`update'_window = DayDeaFOREA03`update'_raw if DayDeaFOREA03`update'_raw >= 0, window(3 1 3)
	
	tssmooth ma DayDeaFOREA03`update' = DayDeaFOREA03`update'_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaFOREA03`update' "Daily deaths mean smooth IMPE"
	
	drop *_window
	
	tsset, clear
		
	*

	save "CovidLongitudinal IMPE `update'.dta", replace

}
*





foreach update of local list {

	di in red "This is update " `update'
		
	merge 1:1 date loc_grand_name using "CovidLongitudinal IMPE `update'.dta"
	
	drop _merge
	
}
*


gen provincestate = " National"

isid date

qui compress

save "CovidLongitudinal IMPE.dta", replace






view "log CovidLongitudinal IMPE 2.smcl"

log close
