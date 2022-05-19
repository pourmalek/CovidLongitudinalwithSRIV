
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 3.do"

* Project: Longitudinal assessment of C-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs, daily deaths: updates separate 
* graph 1 a C19 daily deaths, $country, DELP, update `update', Backcast and forecast
* graph 1 b C19 daily deaths, $country, DELP, update `update', Forecast only
* input data files: "CovidLongitudinal DELP.dta"
* output data files: none. no change in data.


grstyle init

grstyle color background white



use "CovidLongitudinal DELP.dta", clear



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







****************
****************
* daily deaths



***********************************************

* daily deaths, each update, Backcast and forecast

foreach update of local list {

	twoway ///
	(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "DELP smooth, backcast"
	(line DayDeaFOREA01`update' date, sort lwidth(medthick) lcolor(red)) /// 3 "DELP smooth, forecast"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == " National" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, DELP, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "DELP smooth, backcast" 3 "DELP smooth, forecast") rows(1) size(small)) ///
	subtitle("Backcasts and forecasts", size(small)) 
	
	qui graph export "graph 1 a C19 daily deaths, $country, DELP, update `update'.pdf", replace

}
*




***********************************************

* daily deaths, each update, Forecast only

foreach update of local list {

	twoway ///
	(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaFOREA01`update' date, sort lwidth(medthick) lcolor(red)) /// 2 "DELP smooth, forecast"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == " National" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, DELP, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "DELP smooth, forecast") rows(1) size(small)) ///
	subtitle("Forecast only", size(small))  
	
	qui graph export "graph 1 b C19 daily deaths, $country, DELP, update `update'.pdf", replace

}
*




save "CovidLongitudinal DELP.dta", replace




view "log CovidLongitudinal DELP 3.smcl"

log close

exit, clear
