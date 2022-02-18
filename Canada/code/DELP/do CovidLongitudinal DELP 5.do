
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 5.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* continue graphs, daily deaths: updates together (without error measures)
* graphs (number 110-119, 1, 1b) of all model update (together) with official reports (JOHN)
* 1 With extremes
* 1b Without extremes
* input data files: "CovidLongitudinal DELP daily deaths.dta"
* output data files: none, no changes saves in input files





* Daily deaths

* Updates together, Estimates’ values (without error measures)







grstyle init

grstyle color background white


use "CovidLongitudinal DELP daily deaths.dta", clear 







* National

***********************************************

* 110 1 Daily deaths, National, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XXX20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 110 01 C19 daily deaths, $country, National, DELP, Updates together With extremes.pdf", replace







***********************************************

* 110 1b Daily deaths, National, Updates together, Without extremes

* extremes (much higher than other updates) = update 20201022 

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XXX20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XXX20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 110 01b C19 daily deaths, $country, National, DELP, Updates together Without extremes.pdf", replace









* Alberta

***********************************************

* 111 1 Daily deaths, Alberta, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XAB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XAB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 111 01 C19 daily deaths, $country, Alberta, DELP, Updates together With extremes.pdf", replace







***********************************************

* 111 1b Daily deaths, Alberta, Updates together, Without extremes

* extremes (much higher than other updates) = none

twoway ///
(line DayDeaMeSmA00S00XAB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XAB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XAB20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 111 01b C19 daily deaths, $country, Alberta, DELP, Updates together Without extremes.pdf", replace











* British Columbia

***********************************************

* 112 1 Daily deaths, British Columbia, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XBC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 112 01 C19 daily deaths, $country, British Columbia, DELP, Updates together With extremes.pdf", replace






***********************************************

* 112 1b Daily deaths, British Columbia, Updates together, Without extremes 

* extremes (much higher than other updates) = 20201217 20201203 

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XBC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XBC20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 112 01b C19 daily deaths, $country, British Columbia, DELP, Updates together Without extremes.pdf", replace











* Manitoba

***********************************************

* 113 1 Daily deaths, Manitoba, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XMB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 113 01 C19 daily deaths, $country, Manitoba, DELP, Updates together With extremes.pdf", replace










***********************************************

* 113 1b Daily deaths, Manitoba, Updates together, Without extremes

* extremes (much higher than other updates) = update 20201105 

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XMB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XMB20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 113 01b C19 daily deaths, $country, Manitoba, DELP, Updates together Without extremes.pdf", replace








* New Brunswick

***********************************************

* 114 1 Daily deaths, New Brunswick, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XNB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 114 01 C19 daily deaths, $country, New Brunswick, DELP, Updates together With extremes.pdf", replace










***********************************************

* 114 1b Daily deaths, New Brunswick, Updates together, Without extremes

* extremes (much higher than other updates) = update 20210923 

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XNB20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNB20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 114 01b C19 daily deaths, $country, New Brunswick, DELP, Updates together Without extremes.pdf", replace















* Newfoundland and Labrador

***********************************************

* 115 1 Daily deaths, Newfoundland and Labrador, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XNL20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 115 01 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together With extremes.pdf", replace










***********************************************

* 115 1b Daily deaths, Newfoundland and Labrador, Updates together, Without extremes 

* extremes (much higher than other updates) = update 20211003 20211004 20211005 20211006 20211007 20211008 

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XNL20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNL20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 115 01b C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together Without extremes.pdf", replace











* Nova Scotia

***********************************************

* 116 1 Daily deaths, Nova Scotia, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XNS20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 116 01 C19 daily deaths, $country, Nova Scotia, DELP, Updates together With extremes.pdf", replace










***********************************************

* 116 1b Daily deaths, Nova Scotia, Updates together, Without extremes  

* extremes (much higher than other updates) = 20210812 20210819 20210826 20210902

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XNS20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XNS20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 116 01b C19 daily deaths, $country, Nova Scotia, DELP, Updates together Without extremes.pdf", replace












* Ontario

***********************************************

* 117 1 Daily deaths, Ontario, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XON20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. No extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 117 01 C19 daily deaths, $country, Ontario, DELP, Updates together With extremes.pdf", replace










***********************************************

* 117 1b Daily deaths, Ontario, Updates together, Without extremes  

* extremes (much higher than other updates) = none


twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XON20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XON20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. No extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 117 01b C19 daily deaths, $country, Ontario, DELP, Updates together Without extremes.pdf", replace












* Quebec

***********************************************

* 118 1 Daily deaths, Quebec, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XQC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 118 01 C19 daily deaths, $country, Quebec, DELP, Updates together With extremes.pdf", replace










***********************************************

* 118 1b Daily deaths, Quebec, Updates together, Without extremes  

* extremes (much higher than other updates) = 20201022

twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XQC20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XQC20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 118 01b C19 daily deaths, $country, Quebec, DELP, Updates together Without extremes.pdf", replace










* Saskatchewan

***********************************************

* 119 1 Daily deaths, Saskatchewan, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XSK20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 119 01 C19 daily deaths, $country, Saskatchewan, DELP, Updates together With extremes.pdf", replace










***********************************************

* 119 1b Daily deaths, Saskatchewan, Updates together, Without extremes  

* extremes (much higher than other updates) = 20210128


twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00XSK20200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaMeSmA01S00XSK20211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 119 01b C19 daily deaths, $country, Saskatchewan, DELP, Updates together Without extremes.pdf", replace









view "log CovidLongitudinal DELP 5.smcl"

log close

exit, clear



