
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* continue preparation of estimates files and merge them, graphs: updates separate 
* graphs (number 1) of each model update (separate) with official reports (JOHN)
* Forecast and backcast
* input data files: "IHME`update'.dta" (78 files) and "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal IHME.dta"






* 78 updates


local list ///
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






foreach update of local list {
	
	use "IHME`update'.dta", clear
	
	capture drop DayDeaFOREA02S01`update'
	
	gen DayDeaFOREA02S01`update' = DayDeaMeSmA02S01`update'
	
	replace DayDeaFOREA02S01`update' = . if date < epoch`update'
	
	label var DayDeaFOREA02S01`update' "DayDeaFWDA02S01 Forecast only"
	
	save "IHME`update'.dta", replace

}
*


foreach update of local list {
	
	merge m:m date loc_grand_name provincestate using "IHME`update'.dta"
	
	drop _merge
	
}
*	


duplicates drop provincestate date, force

isid provincestate date

order loc_grand_name provincestate date DayDeaFOREA02S01* epoch*

sort loc_grand_name provincestate date

qui compress

save "CovidLongitudinal IHME.dta", replace







* add JOHN

cd ..

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

cd ..

cd IHME

save "CovidLongitudinal JOHN.dta", replace 


merge m:m loc_grand_name provincestate date using "CovidLongitudinal IHME.dta"

drop _merge


drop if date > td(01jan2022)


drop DayDeaMeRa*

drop DayCas*

drop Tot*


drop DayDeaMeSmA00S00XNB DayDeaMeSmA00S00XNL DayDeaMeSmA00S00XNT ///
DayDeaMeSmA00S00XNU DayDeaMeSmA00S00XPE DayDeaMeSmA00S00XYT


* keeps DayDeaMeSmA00S00XAB DayDeaMeSmA00S00XBC DayDeaMeSmA00S00XMB DayDeaMeSmA00S00XXX 
* DayDeaMeSmA00S00XNS DayDeaMeSmA00S00XON DayDeaMeSmA00S00XQC DayDeaMeSmA00S00XSK

qui compress

save "CovidLongitudinal IHME.dta", replace







**********************

* graphs

grstyle init

grstyle color background white


* updates separate

	
	
foreach update of local list {

	****** 
	* daily deaths, National

	twoway ///
	(line DayDeaMeSmA00S00XXX date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == " National" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, National, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 National C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*
	

	
	
	
	

foreach update of local list {

	****** 
	* daily deaths, Alberta

	twoway ///
	(line DayDeaMeSmA00S00XAB date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "Alberta" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, Alberta, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 Alberta C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	





foreach update of local list {

	****** 
	* daily deaths, British Columbia

	twoway ///
	(line DayDeaMeSmA00S00XBC date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "British Columbia" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, British Columbia, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 British Columbia C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	





foreach update of local list {

	****** 
	* daily deaths, Manitoba

	twoway ///
	(line DayDeaMeSmA00S00XMB date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "Manitoba" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, Manitoba, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 Manitoba C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	






foreach update of local list {

	****** 
	* daily deaths, Nova Scotia

	twoway ///
	(line DayDeaMeSmA00S00XNS date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "Nova Scotia" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, Nova Scotia, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 Nova Scotia C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	





foreach update of local list {

	****** 
	* daily deaths, Ontario

	twoway ///
	(line DayDeaMeSmA00S00XON date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "Ontario" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, Ontario, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 Ontario C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	





foreach update of local list {

	****** 
	* daily deaths, Quebec

	twoway ///
	(line DayDeaMeSmA00S00XQC date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "Quebec" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, Quebec, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 Quebec C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	






foreach update of local list {

	****** 
	* daily deaths, Saskatchewan

	twoway ///
	(line DayDeaMeSmA00S00XSK date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01`update' date, sort lwidth(medthick) lcolor(gold)) /// 2 "IHME smooth, Backcast"
	(line DayDeaFOREA02S01`update' date, sort lwidth(medthick) lcolor(black)) /// 2 "IHME smooth, Forecast only"
	if date >= td(01jan2020) &  date <= td(01jan2022) & provincestate == "Saskatchewan" ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C19 daily deaths, $country, Saskatchewan, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth, Backcast" ///
	3 "IHME smooth, Forecast") rows(1) size(small)) 
	
	qui graph export "graph 1 Saskatchewan C19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace
	
}
*	
	
	
	
	


**********************

view "log CovidLongitudinal IHME 2.smcl"

log close

exit, clear


