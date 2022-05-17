
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* graphs, daily deaths: updates separate 
* graph 1 C19 daily deaths, $country, IHME, update `update' 
* input data files: "CovidLongitudinal IHME.dta"
* output data files: none. no change in data.





use "CovidLongitudinal IHME.dta", clear



local list ///
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




**********************

* graphs

grstyle init

grstyle color background white


* updates separate

	
	
foreach update of local list {

	****** 
	* daily deaths, National

	twoway ///
	(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, backcast" 3 "IHME smooth, forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 National C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*
	

	
	
	
	


**********************

view "log CovidLongitudinal IHME 3.smcl"

log close

exit, clear


