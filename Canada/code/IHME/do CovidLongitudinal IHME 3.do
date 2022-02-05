
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* continue graphs: updates together


use "CovidVisualizedCountry IHME.dta", clear


grstyle init

grstyle color background white


* updates together


******
* daily reported deaths, national, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XXX20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XXX20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XXX20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XXX date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, national, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 National C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 National C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace





******
* daily reported deaths, Alberta, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XAB20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XAB20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XAB20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XAB date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, Alberta, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 Alberta C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 Alberta C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace





******
* daily reported deaths, British Columbia, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XBC20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XBC20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XBC20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XBC date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, British Columbia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 British Columbia C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 British Columbia C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace




******
* daily reported deaths, Manitoba, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XMB20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XMB20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XMB20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XMB date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, Manitoba, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 Manitoba C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 Manitoba C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace





******
* daily reported deaths, Nova Scotia, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XNS20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XNS20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XNS20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XNS date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, Nova Scotia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 Nova Scotia C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 Nova Scotia C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace




******
* daily reported deaths, Ontario, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XON20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XON20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XON20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XON date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, Ontario, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 Ontario C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 Ontario C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace




******
* daily reported deaths, Quebec, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XQC20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XQC20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XQC20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XQC date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, Quebec, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 Quebec C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 Quebec C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace




******
* daily reported deaths, Saskatchewan, reference scenario = S1 
	
twoway ///
(line DayDeaMeSmA02S01XSK20200422 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 1
(line DayDeaMeSmA02S01XSK20200427 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200428 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200429 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200504 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200510 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200512 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200520 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200525 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200526 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200529 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200605 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200608 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200615 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200629 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200707 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200714 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200722 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200821 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200827 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200903 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200911 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200918 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20200924 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201002 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201009 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201022 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201029 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201112 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201119 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201203 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201210 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201217 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20201223 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210115 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210122 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210128 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210204 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210212 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210220 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210225 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210306 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210311 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210317 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210325 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210401 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210409 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210416 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210423 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210506 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210514 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210521 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210528 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210604 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210610 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210618 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210625 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210702 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210715 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210723 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210730 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210806 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210820 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210826 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210902 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210910 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210916 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210923 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20210930 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20211015 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20211021 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20211104 date, sort lwidth(medthick) lcolor(gray)) /// 
(line DayDeaMeSmA02S01XSK20211221 date, sort lwidth(medthick) lcolor(gray)) /// Canada update 78
(line DayDeaMeSmA00S00XSK date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily deaths, $country, Saskatchewan, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IHME smooth" 79 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph save "graph 2 Saskatchewan C-19 daily reported deaths, $country, IHME, reference scenario, all updates.gph", replace
qui graph export "graph 2 Saskatchewan C-19 daily reported deaths, $country, IHME, reference scenario, all updates.pdf", replace








**********************

view "log CovidVisualizedCountry IHME 3.smcl"

log close

exit, clear
