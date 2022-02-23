
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* continue preparation of estimates files and merge them, graphs: updates separate 
* graphs (number 1) of each model update (separate) with official reports (JOHN)


* 79 updates

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

	append using "IHME`update'.dta"
	
}
*	


save "CovidVisualizedCountry IHME.dta", replace




* add JOHN

cd ..

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

cd ..

cd IHME

save "CovidLongitudinal JOHN.dta", replace 

merge m:m loc_grand_name date using "CovidVisualizedCountry IHME.dta"

drop _merge


drop if date > td(01jan2022)

save "CovidVisualizedCountry IHME.dta", replace






**********************

* graphs

grstyle init

grstyle color background white


* updates separate

	
	
foreach update of local list1 {

	******
	* daily deaths, national, reference scenario = S1 
	
	di in red "This is update " `update' " for national"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XXX`update' if date == update_date

	gen DayDeaMeSmA02S01XXX`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XXX`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XXX date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XXX`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, national, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 National C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XXX`update'_val
	
	

	******
	* daily deaths, Alberta, reference scenario = S1 
	
	di in red "This is update " `update' " for Alberta"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XAB`update' if date == update_date

	gen DayDeaMeSmA02S01XAB`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XAB`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XAB date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XAB`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, Alberta, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 Alberta C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XAB`update'_val
	
	
		 



	******
	* daily deaths, British Columbia, reference scenario = S1 
	
	di in red "This is update " `update' " British Columbia"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XBC`update' if date == update_date

	gen DayDeaMeSmA02S01XBC`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XBC`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XBC date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XBC`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, British Columbia, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 British Columbia C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XBC`update'_val
	
	
	
	


	******
	* daily deaths, Manitoba, reference scenario = S1 
	
	di in red "This is update " `update' " Manitoba"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XMB`update' if date == update_date

	gen DayDeaMeSmA02S01XMB`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XMB`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XMB date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XMB`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, Manitoba, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 Manitoba C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XMB`update'_val

	
	
	
	


	******
	* daily deaths, Nova Scotia, reference scenario = S1 
	
	di in red "This is update " `update' " Nova Scotia"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XNS`update' if date == update_date

	gen DayDeaMeSmA02S01XNS`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XNS`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XNS date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XNS`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, Nova Scotia, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 Nova Scotia C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XNS`update'_val

	
	
	
	


	******
	* daily deaths, Ontario, reference scenario = S1 
	
	di in red "This is update " `update' " for Ontario"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XON`update' if date == update_date

	gen DayDeaMeSmA02S01XON`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XON`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XON date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XON`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, Ontario, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 Ontario C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XON`update'_val

	
	
	


	******
	* daily deaths, Quebec, reference scenario = S1 
	
	di in red "This is update " `update' " for Quebec"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XQC`update' if date == update_date

	gen DayDeaMeSmA02S01XQC`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XQC`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XQC date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XQC`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, Quebec, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 Quebec C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XQC`update'_val

	
	
	


	******
	* daily deaths, Saskatchewan, reference scenario = S1 
	
	di in red "This is update " `update' " for Saskatchewan"
		
	gen update_date = date("`update'", "YMD")

	local update_date = date("`update'", "YMD")

	summ DayDeaMeSmA02S01XSK`update' if date == update_date

	gen DayDeaMeSmA02S01XSK`update'_val = r(mean)

	local value = DayDeaMeSmA02S01XSK`update'_val
	
	twoway ///
	(line DayDeaMeSmA00S00XSK date, sort lwidth(thick) lcolor(cyan)) /// 	1 "JOHN smooth"
	(line DayDeaMeSmA02S01XSK`update' date, sort lwidth(medthick) lcolor(black)) /// 1 "IHME smooth"
	(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
	if date >= td(01jan2020) &  date <= td(01jan2022) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, $country, Saskatchewan, IHME, update `update'", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "IHME smooth" 3 "Update release date and value") rows(1)) ///
	 subtitle(Reference scenario, size(small)) 
	
	qui graph export "graph 1 Saskatchewan C-19 daily deaths, $country, IHME, reference scenario, update `update'.pdf", replace

	capture drop update_date DayDeaMeSmA02S01XSK`update'_val




}
*
	
	
	
	
	







**********************

view "log CovidVisualizedCountry IHME 2.smcl"

log close

exit, clear


