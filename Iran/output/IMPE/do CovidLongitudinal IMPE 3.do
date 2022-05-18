
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs:
* graphs 1 updates separate
* input data files: "CovidLongitudinal IMPE.dta", "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal IMPE 2.dta"



* add JOHN

cd .. // /code/

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

keep loc_grand_name date DayDeaMeSmA00S00

cd ..

cd IMPE 

save "CovidLongitudinal JOHN.dta", replace

merge m:m date loc_grand_name using "CovidLongitudinal IMPE.dta"
 
drop _merge

duplicates drop date, force

isid date

drop if date > td(01jan2022)

qui compress

save "CovidLongitudinal IMPE 2.dta", replace




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




grstyle init

grstyle color background white



***********************************************

* daily deaths, each update

foreach update of local list {

rename DayDeaMeSmA03`update' DayDeaMeSmA03`update'

capture drop update_date

gen update_date = date("`update'", "YMD")

capture drop DayDeaFOREA03`update'

gen DayDeaFOREA03`update' = DayDeaMeSmA03`update'

replace DayDeaFOREA03`update' = . if date < update_date

label var DayDeaFOREA03`update' "DayDeaMeSmA03 Forecast only"

local update_date = date("`update'", "YMD")

di "DayDeaMeSmA03`update' if date == update_date"
summ DayDeaMeSmA03`update' if date == update_date

gen DayDeaMeSmA03`update'_val = r(mean)

local value = DayDeaMeSmA03`update'_val

	twoway ///
	(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA03`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IMPE smooth, backcast"
	(line DayDeaFOREA03`update' date, sort lwidth(medthick) lcolor(magenta)) /// 3 "IMPE smooth, forecast"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, IMPE, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IMPE smooth, backcast" 3 "IMPE smooth, forecast") rows(1) size(small))

	qui graph export "graph 1 C19 daily deaths, $country, IMPE, update `update'.pdf", replace

}
*


save "CovidLongitudinal IMPE 2.dta", replace









view "log CovidLongitudinal IMPE 3.smcl"

log close
