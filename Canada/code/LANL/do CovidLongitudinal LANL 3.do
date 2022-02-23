
clear all

cd "$pathCovidLongitudinal"

cd LANL

capture log close 

log using "log CovidVisualizedCountry LANL 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* graphs, daily deaths: updates separate
* graph 1 daily deaths LANL with official reports (JOHN)
* graphs, daily deaths: updates together
* graph 2 daily deaths: all updates

* 129 updates


local list ///
20200426 ///
20200429 ///
20200503 ///
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

use "CovidLongitudinal LANL 2.dta", clear





***********************************************

* daily deaths, each update, National

foreach update of local list {

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "DayDeaMeSmA04_`update' if date == update_date"
summ DayDeaMeSmA04_`update' if date == update_date

gen DayDeaMeSmA04_`update'_val = r(mean)

local value = DayDeaMeSmA04_`update'_val


twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA04_`update' date, sort lcolor(orange) lwidth(medthick)) /// 2 "LANL smooth"
(scatteri `value' `update_date', mcolor(orange) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, LANL, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "LANL smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 1 C19 daily deaths, $country, National, LANL, update `update'.pdf", replace

*


}
*





******
* daily deaths, national, reference scenario  
	
twoway ///
(line DayDeaMeSmA00S00XXX date, sort lwidth(vvthick) lcolor(cyan)) /// JOHN smooth
(line DayDeaMeSmA04_20200426 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200429 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200503 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200506 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200510 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200513 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200517 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200520 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200524 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200527 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200531 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200603 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200607 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200610 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200613 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200617 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200621 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200623 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200628 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200701 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200705 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200708 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200712 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200715 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200719 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200722 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200726 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200729 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200802 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200805 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200809 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200812 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200816 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200819 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200823 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200826 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200830 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200902 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200906 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200909 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200913 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200916 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200920 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200923 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200927 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20200930 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201004 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201007 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201011 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201014 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201018 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201021 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201025 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201028 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201101 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201104 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201108 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201111 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201115 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201118 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201122 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201125 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201129 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201202 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201206 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201209 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201213 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201216 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201220 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20201223 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210103 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210105 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210110 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210113 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210117 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210120 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210124 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210127 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210131 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210203 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210207 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210210 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210214 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210217 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210221 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210224 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210228 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210303 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210307 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210310 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210314 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210321 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210324 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210328 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210331 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210404 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210407 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210411 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210414 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210418 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210421 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210425 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210428 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210502 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210505 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210509 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210512 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210516 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210519 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210523 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210526 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210602 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210606 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210613 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210620 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210627 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210704 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210711 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210718 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210725 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210801 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210808 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210815 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210822 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210829 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210905 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210912 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210919 date, sort lwidth(medium) lcolor(orange)) /// 
(line DayDeaMeSmA04_20210926 date, sort lwidth(medium) lcolor(orange)) /// if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, national, LANL, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "LANL smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph export "graph 2 National C-19 daily deaths, $country, LANL, reference scenario, all updates.pdf", replace






*

view "log CovidVisualizedCountry LANL 3.smcl"

log close

exit, clear

