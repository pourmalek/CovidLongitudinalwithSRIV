
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* continue graphs, daily deaths: updates together (without error measures)
* graphs (number 110-119, 1, 1b) of all model update (together) with official reports (JOHN)
* 1 With extremes
* 1b Without extremes
* input data files: "CovidLongitudinal DELP.dta"
* output data files: none. no change in data.





* Daily deaths

* Updates together, Estimates’ values (without error measures)







grstyle init

grstyle color background white


use "CovidLongitudinal DELP.dta", clear 







* National

***********************************************

* 110 1 Daily deaths, National, Updates together, With extremes

twoway /// 
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == " National" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 110 01 C19 daily deaths, $country, National, DELP, Updates together With extremes.pdf", replace







***********************************************

* 110 1b Daily deaths, National, Updates together, Without extremes

* extremes (much higher than other updates) = update 20201022 

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == " National" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 110 01b C19 daily deaths, $country, National, DELP, Updates together Without extremes.pdf", replace









* Alberta

***********************************************

* 111 1 Daily deaths, Alberta, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XAB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Alberta" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. No extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 111 01 C19 daily deaths, $country, Alberta, DELP, Updates together With extremes.pdf", replace







***********************************************

* 111 1b Daily deaths, Alberta, Updates together, Without extremes

* extremes (much higher than other updates) = none

twoway ///
(line DayDeaMeSmA00S00XAB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Alberta" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. No extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 111 01b C19 daily deaths, $country, Alberta, DELP, Updates together Without extremes.pdf", replace











* British Columbia

***********************************************

* 112 1 Daily deaths, British Columbia, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "British Columbia" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 112 01 C19 daily deaths, $country, British Columbia, DELP, Updates together With extremes.pdf", replace






***********************************************

* 112 1b Daily deaths, British Columbia, Updates together, Without extremes 

* extremes (much higher than other updates) = 20201217 20201203 

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "British Columbia" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 112 01b C19 daily deaths, $country, British Columbia, DELP, Updates together Without extremes.pdf", replace











* Manitoba

***********************************************

* 113 1 Daily deaths, Manitoba, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Manitoba" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 113 01 C19 daily deaths, $country, Manitoba, DELP, Updates together With extremes.pdf", replace










***********************************************

* 113 1b Daily deaths, Manitoba, Updates together, Without extremes

* extremes (much higher than other updates) = update 20201105 

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Manitoba" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 113 01b C19 daily deaths, $country, Manitoba, DELP, Updates together Without extremes.pdf", replace








* New Brunswick

***********************************************

* 114 1 Daily deaths, New Brunswick, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "New Brunswick" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 114 01 C19 daily deaths, $country, New Brunswick, DELP, Updates together With extremes.pdf", replace










***********************************************

* 114 1b Daily deaths, New Brunswick, Updates together, Without extremes

* extremes (much higher than other updates) = update 20210923 

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "New Brunswick" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 114 01b C19 daily deaths, $country, New Brunswick, DELP, Updates together Without extremes.pdf", replace















* Newfoundland and Labrador

***********************************************

* 115 1 Daily deaths, Newfoundland and Labrador, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Newfoundland and Labrador" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Newfoundland, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Newfoundland and Labrador. Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 115 01 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together With extremes.pdf", replace










***********************************************

* 115 1b Daily deaths, Newfoundland and Labrador, Updates together, Without extremes 

* extremes (much higher than other updates) = update 20211003 20211004 20211005 20211006 20211007 20211008 

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Newfoundland and Labrador" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.1fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 115 01b C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together Without extremes.pdf", replace











* Nova Scotia

***********************************************

* 116 1 Daily deaths, Nova Scotia, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Nova Scotia" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 116 01 C19 daily deaths, $country, Nova Scotia, DELP, Updates together With extremes.pdf", replace










***********************************************

* 116 1b Daily deaths, Nova Scotia, Updates together, Without extremes  

* extremes (much higher than other updates) = 20210812 20210819 20210826 20210902

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Nova Scotia"  ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 116 01b C19 daily deaths, $country, Nova Scotia, DELP, Updates together Without extremes.pdf", replace












* Ontario

***********************************************

* 117 1 Daily deaths, Ontario, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Ontario" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. No extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 117 01 C19 daily deaths, $country, Ontario, DELP, Updates together With extremes.pdf", replace










***********************************************

* 117 1b Daily deaths, Ontario, Updates together, Without extremes  

* extremes (much higher than other updates) = none


twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022)  & provincestate == "Ontario" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. No extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 117 01b C19 daily deaths, $country, Ontario, DELP, Updates together Without extremes.pdf", replace












* Quebec

***********************************************

* 118 1 Daily deaths, Quebec, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Quebec" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 118 01 C19 daily deaths, $country, Quebec, DELP, Updates together With extremes.pdf", replace










***********************************************

* 118 1b Daily deaths, Quebec, Updates together, Without extremes  

* extremes (much higher than other updates) = 20201022

twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Quebec" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 118 01b C19 daily deaths, $country, Quebec, DELP, Updates together Without extremes.pdf", replace










* Saskatchewan

***********************************************

* 119 1 Daily deaths, Saskatchewan, Updates together, With extremes

twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Saskatchewan" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. With extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 119 01 C19 daily deaths, $country, Saskatchewan, DELP, Updates together With extremes.pdf", replace










***********************************************

* 119 1b Daily deaths, Saskatchewan, Updates together, Without extremes  

* extremes (much higher than other updates) = 20210128


twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaFOREA01S0020200417 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200424 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200501 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200509 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200517 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200524 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200531 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200607 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200614 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200621 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200628 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200704 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200718 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200723 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020200926 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020201231 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210311 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210325 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210408 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210422 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210506 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210520 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210603 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210610 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210617 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210624 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210701 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210708 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210715 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210722 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210729 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210805 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210812 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210819 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210826 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210902 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210909 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210916 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210923 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020210930 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211001 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211002 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211003 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211004 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211005 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211006 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211007 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211008 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211009 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211010 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211011 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211012 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211013 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211014 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211015 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211016 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211017 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211018 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211019 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211020 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211021 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211022 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211023 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211024 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211025 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211026 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211027 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211028 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211029 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211030 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211031 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211101 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211102 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211103 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211104 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211105 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211106 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211107 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211108 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211109 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211110 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211111 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211112 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211113 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211114 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211115 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211116 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211117 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211118 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211119 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211120 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211121 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211122 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211123 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211124 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211125 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211126 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211127 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211128 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211129 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211130 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211201 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211202 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211203 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211204 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211205 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211206 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211207 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211208 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211209 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211210 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211211 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211212 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211213 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211214 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211215 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211216 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211217 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211218 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211219 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211220 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211221 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211222 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211223 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211224 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211225 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211226 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211227 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211228 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211229 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211230 date, sort lcolor(red) lwidth(medium)) /// 
(line DayDeaFOREA01S0020211231 date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Saskatchewan" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("C19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Forecast only. Without extremes", size(small)) yscale(titlegap(2))


qui graph export "graph 119 01b C19 daily deaths, $country, Saskatchewan, DELP, Updates together Without extremes.pdf", replace









view "log CovidLongitudinal DELP 4.smcl"

log close

exit, clear



