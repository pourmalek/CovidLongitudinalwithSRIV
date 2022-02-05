
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


* graphs, daily deaths together


/*

Daily deaths

Updates together, Estimates’ values (without looking at errors)



--- Order of graphs:

Level (1) Locations: 0 National, 1 Alberta, 2 British Columbia, 3 Manitoba, 4 New Brunswick, 5 Newfoundland and Labrador, 6 Nova Scotia, 7 Ontario, 8 Quebec, 9 Saskatchewan. 

Level (2) Update circles: 1 Without update circles, 2 With update circles. Update circles = Update release dates (x value) and values (y value) denoted with circles. 

Level (3) Extreme values: 1 With extreme values, 2 Without extreme values. Extreme values = Updates whose values are much larger than other updates.


--- Graph numbers and contents:

110 (1-4) National

* 110 1 Daily deaths, National, Updates together, Without Update circles, With extremes
* 110 2 Daily deaths, National, Updates together, Without Update circles, Without extremes / extremes = update 20201022
* 110 3 Daily deaths, National, Updates together, With Update circles, With extremes
* 110 4 Daily deaths, National, Updates together, With Update circles, Without extremes / extremes = update 20201022


111 (1-4) Alberta

* 111 1 Daily deaths, Alberta, Updates together, Without Update circles, With extremes
* 111 2 Daily deaths, Alberta, Updates together, Without Update circles, Without extremes / extremes = none
* 111 3 Daily deaths, Alberta, Updates together, With Update circles, With extremes
* 111 4 Daily deaths, Alberta, Updates together, With Update circles, Without extremes / extremes = none


112 (1-4) British Columbia

* 112 1 Daily deaths, British Columbia, Updates together, Without Update circles, With extremes
* 112 2 Daily deaths, British Columbia, Updates together, Without Update circles, Without extremes / extremes = 20201217 20201203
* 112 3 Daily deaths, British Columbia, Updates together, With Update circles, With extremes
* 112 4 Daily deaths, British Columbia, Updates together, With Update circles, Without extremes / extremes = 20201217 20201203


113 (1-4) Manitoba

* 113 1 Daily deaths, Manitoba, Updates together, Without Update circles, With extremes
* 113 2 Daily deaths, Manitoba, Updates together, Without Update circles, Without extremes / extremes = 20201105
* 113 3 Daily deaths, Manitoba, Updates together, With Update circles, With extremes
* 113 4 Daily deaths, Manitoba, Updates together, With Update circles, Without extremes / extremes = 20201105


114 (1-4) New Brunswick

* 114 1 Daily deaths, New Brunswick, Updates together, Without Update circles, With extremes
* 114 2 Daily deaths, New Brunswick, Updates together, Without Update circles, Without extremes / extremes = 20210923
* 114 3 Daily deaths, New Brunswick, Updates together, With Update circles, With extremes
* 114 4 Daily deaths, New Brunswick, Updates together, With Update circles, Without extremes / extremes = 20210923


115 (1-4) Newfoundland and Labrador

* 115 1 Daily deaths, Newfoundland and Labrador, Updates together, Without Update circles, With extremes
* 115 2 Daily deaths, Newfoundland and Labrador, Updates together, Without Update circles, Without extremes / extremes = 20211003 20211004 20211005 20211006 20211007 20211008
* 115 3 Daily deaths, Newfoundland and Labrador, Updates together, With Update circles, With extremes
* 115 4 Daily deaths, Newfoundland and Labrador, Updates together, With Update circles, Without extremes / extremes = 20211003 20211004 20211005 20211006 20211007 20211008


116 (1-4) Nova Scotia

* 116 1 Daily deaths, Nova Scotia, Updates together, Without Update circles, With extremes
* 116 2 Daily deaths, Nova Scotia, Updates together, Without Update circles, Without extremes / extremes = 20210812 20210819 20210826 20210902
* 116 3 Daily deaths, Nova Scotia, Updates together, With Update circles, With extremes
* 116 4 Daily deaths, Nova Scotia, Updates together, With Update circles, Without extremes / extremes = 20210812 20210819 20210826 20210902

 
117 (1-4) Ontario

* 117 1 Daily deaths, Ontario, Updates together, Without Update circles, With extremes
* 117 2 Daily deaths, Ontario, Updates together, Without Update circles, Without extremes / extremes = none
* 117 3 Daily deaths, Ontario, Updates together, With Update circles, With extremes
* 117 4 Daily deaths, Ontario, Updates together, With Update circles, Without extremes / extremes = none


118 (1-4) Quebec

* 118 1 Daily deaths, Quebec, Updates together, Without Update circles, With extremes
* 118 2 Daily deaths, Quebec, Updates together, Without Update circles, Without extremes / extremes = 20201022
* 118 3 Daily deaths, Quebec, Updates together, With Update circles, With extremes
* 118 4 Daily deaths, Quebec, Updates together, With Update circles, Without extremes / extremes = 20201022


119 (1-4) Saskatchewan

* 119 1 Daily deaths, Saskatchewan, Updates together, Without Update circles, With extremes
* 119 2 Daily deaths, Saskatchewan, Updates together, Without Update circles, Without extremes / extremes = 20210128
* 119 3 Daily deaths, Saskatchewan, Updates together, With Update circles, With extremes
* 119 4 Daily deaths, Saskatchewan, Updates together, With Update circles, Without extremes / extremes = 20210128



*/






grstyle init

grstyle color background white


use "CovidLongitudinal DELP daily deaths.dta", clear 


* 142 individual updates


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
20200926 ///
20201008 ///
20201022 ///
20201105 ///
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
20211001 ///
20211002 ///
20211003 ///
20211004 ///
20211005 ///
20211006 ///
20211007 ///
20211008 ///
20211009 ///
20211010 ///
20211011 ///
20211012 ///
20211013 ///
20211014 ///
20211015 ///
20211016 ///
20211017 ///
20211018 ///
20211019 ///
20211020 ///
20211021 ///
20211022 ///
20211023 ///
20211024 ///
20211025 ///
20211026 ///
20211027 ///
20211028 ///
20211029 ///
20211030 ///
20211031 ///
20211101 ///
20211102 ///
20211103 ///
20211104 ///
20211105 ///
20211106 ///
20211107 ///
20211108 ///
20211109 ///
20211110 ///
20211111 ///
20211112 ///
20211113 ///
20211114 ///
20211115 ///
20211116 ///
20211117 ///
20211118 ///
20211119 ///
20211120 ///
20211121 ///
20211122 ///
20211123 ///
20211124 ///
20211125 ///
20211126 ///
20211127 ///
20211128 ///
20211129 ///
20211130 ///
20211201 ///
20211202 ///
20211203 ///
20211204 ///
20211205 ///
20211206 ///
20211207 ///
20211208 ///
20211209 ///
20211210 ///
20211211 ///
20211212 ///
20211213 ///
20211214 ///
20211215 ///
20211216 ///
20211217 ///
20211218 ///
20211219 ///
20211220 ///
20211221 ///
20211222 ///
20211223 ///
20211224 ///
20211225 ///
20211226 ///
20211227 ///
20211228 ///
20211229 ///
20211230 ///
20211231





foreach update of local list {

gen update_date_`update' = date("`update'", "YMD")

local value = update_date_`update'

rename update_date_`update' update_date_`value'

}
*







* National

***********************************************

* 110 1 Daily deaths, National, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 110 1 C19 daily deaths, $country, National, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 110 1 C19 daily deaths, $country, National, DELP, Updates together Without Update circles With extremes.pdf", replace







***********************************************

* 110 2 Daily deaths, National, Updates together, Without Update circles, Without extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 110 2 C19 daily deaths, $country, National, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 110 2 C19 daily deaths, $country, National, DELP, Updates together Without Update circles Without extremes.pdf", replace








***********************************************

* 110 3 Daily deaths, National, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XXX20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 110 3 C19 daily deaths, $country, National, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 110 3 C19 daily deaths, $country, National, DELP, Updates together With Update circles With extremes.pdf", replace






***********************************************

* 110 4 Daily deaths, National, Updates together, With Update circles, Without extremes

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
(scatter DayDeaMeSmA01S00XXX20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XXX20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 110 4 C19 daily deaths, $country, National, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 110 4 C19 daily deaths, $country, National, DELP, Updates together With Update circles Without extremes.pdf", replace








* Alberta

***********************************************

* 111 1 Daily deaths, Alberta, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 111 1 C19 daily deaths, $country, Alberta, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 111 1 C19 daily deaths, $country, Alberta, DELP, Updates together Without Update circles With extremes.pdf", replace







***********************************************

* 111 2 Daily deaths, Alberta, Updates together, Without Update circles, Without extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 111 2 C19 daily deaths, $country, Alberta, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 111 2 C19 daily deaths, $country, Alberta, DELP, Updates together Without Update circles Without extremes.pdf", replace







***********************************************

* 111 3 Daily deaths, Alberta, Updates together, With Update circles, With extremes

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
(scatter DayDeaMeSmA01S00XAB20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XAB20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Alberta, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 111 3 C19 daily deaths, $country, Alberta, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 111 3 C19 daily deaths, $country, Alberta, DELP, Updates together With Update circles With extremes.pdf", replace








***********************************************

* 111 4 Daily deaths, Alberta, Updates together, With Update circles, Without extremes

* extremes (much higher than other updates) = none

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 111 4 C19 daily deaths, $country, Alberta, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 111 4 C19 daily deaths, $country, Alberta, DELP, Updates together With Update circles Without extremes.pdf", replace












* British Columbia

***********************************************

* 112 1 Daily deaths, British Columbia, Updates together, Without Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 111 1 C19 daily deaths, $country, British Columbia, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 111 1 C19 daily deaths, $country, British Columbia, DELP, Updates together Without Update circles With extremes.pdf", replace






***********************************************

* 112 2 Daily deaths, British Columbia, Updates together, Without Update circles, Without extremes 

* extremes (much higher than other updates) = 20201217 20201203 

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 111 2 C19 daily deaths, $country, British Columbia, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 111 2 C19 daily deaths, $country, British Columbia, DELP, Updates together Without Update circles Without extremes.pdf", replace






***********************************************

* 112 3 Daily deaths, British Columbia, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XBC20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 112 3 C19 daily deaths, $country, British Columbia, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 112 3 C19 daily deaths, $country, British Columbia, DELP, Updates together With Update circles With extremes.pdf", replace









***********************************************

* 112 4 Daily deaths, British Columbia, Updates together, With Update circles, Without extremes 

* extremes (much higher than other updates) = 20201217 20201203 

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XBC20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XBC20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 112 4 C19 daily deaths, $country, British Columbia, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 112 4 C19 daily deaths, $country, British Columbia, DELP, Updates together With Update circles Without extremes.pdf", replace
















* Manitoba

***********************************************

* 113 1 Daily deaths, Manitoba, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 113 1 C19 daily deaths, $country, Manitoba, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 113 1 C19 daily deaths, $country, Manitoba, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 113 2 Daily deaths, Manitoba, Updates together, Without Update circles, Without extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 113 2 C19 daily deaths, $country, Manitoba, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 113 2 C19 daily deaths, $country, Manitoba, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 113 3 Daily deaths, Manitoba, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XMB20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 113 3 C19 daily deaths, $country, Manitoba, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 113 3 C19 daily deaths, $country, Manitoba, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 113 4 Daily deaths, Manitoba, Updates together, With Update circles, Without extremes

* extremes (much higher than other updates) = update 20201105 

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XMB20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XMB20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 113 4 C19 daily deaths, $country, Manitoba, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 113 4 C19 daily deaths, $country, Manitoba, DELP, Updates together With Update circles Without extremes.pdf", replace















* New Brunswick

***********************************************

* 114 1 Daily deaths, New Brunswick, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 114 1 C19 daily deaths, $country, New Brunswick, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 114 1 C19 daily deaths, $country, New Brunswick, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 114 2 Daily deaths, New Brunswick, Updates together, Without Update circles, Without extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 114 2 C19 daily deaths, $country, New Brunswick, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 114 2 C19 daily deaths, $country, New Brunswick, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 114 3 Daily deaths, New Brunswick, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XNB20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 114 3 C19 daily deaths, $country, New Brunswick, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 114 3 C19 daily deaths, $country, New Brunswick, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 114 4 Daily deaths, New Brunswick, Updates together, With Update circles, Without extremes

* extremes (much higher than other updates) = update 20210923 

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XNB20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNB20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 114 4 C19 daily deaths, $country, New Brunswick, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 114 4 C19 daily deaths, $country, New Brunswick, DELP, Updates together With Update circles Without extremes.pdf", replace















* Newfoundland and Labrador

***********************************************

* 115 1 Daily deaths, Newfoundland and Labrador, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 115 1 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 115 1 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 115 2 Daily deaths, Newfoundland and Labrador, Updates together, Without Update circles, Without extremes 

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 115 2 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 115 2 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 115 3 Daily deaths, Newfoundland and Labrador, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XNL20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 115 3 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 115 3 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 115 4 Daily deaths, Newfoundland and Labrador, Updates together, With Update circles, Without extremes  

* extremes (much higher than other updates) = update 20211003 20211004 20211005 20211006 20211007 20211008 

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XNL20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNL20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland and Labrador, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 115 4 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 115 4 C19 daily deaths, $country, Newfoundland and Labrador, DELP, Updates together With Update circles Without extremes.pdf", replace

















* Nova Scotia

***********************************************

* 116 1 Daily deaths, Nova Scotia, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 116 1 C19 daily deaths, $country, Nova Scotia, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 116 1 C19 daily deaths, $country, Nova Scotia, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 116 2 Daily deaths, Nova Scotia, Updates together, Without Update circles, Without extremes  

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 116 2 C19 daily deaths, $country, Nova Scotia, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 116 2 C19 daily deaths, $country, Nova Scotia, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 116 3 Daily deaths, Nova Scotia, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XNS20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 116 3 C19 daily deaths, $country, Nova Scotia, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 116 3 C19 daily deaths, $country, Nova Scotia, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 116 4 Daily deaths, Nova Scotia, Updates together, With Update circles, Without extremes 

* extremes (much higher than other updates) = update 20210812 20210819 20210826 20210902

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XNS20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XNS20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 116 4 C19 daily deaths, $country, Nova Scotia, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 116 4 C19 daily deaths, $country, Nova Scotia, DELP, Updates together With Update circles Without extremes.pdf", replace














* Ontario

***********************************************

* 117 1 Daily deaths, Ontario, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. No extremes", size(small)) 


qui graph save "graph 117 1 C19 daily deaths, $country, Ontario, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 117 1 C19 daily deaths, $country, Ontario, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 117 2 Daily deaths, Ontario, Updates together, Without Update circles, Without extremes  

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. No extremes", size(small)) 


qui graph save "graph 117 2 C19 daily deaths, $country, Ontario, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 117 2 C19 daily deaths, $country, Ontario, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 117 3 Daily deaths, Ontario, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XON20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. No extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 117 3 C19 daily deaths, $country, Ontario, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 117 3 C19 daily deaths, $country, Ontario, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 117 4 Daily deaths, Ontario, Updates together, With Update circles, Without extremes  

* extremes (much higher than other updates) = none


twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XON20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XON20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. No extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 117 4 C19 daily deaths, $country, Ontario, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 117 4 C19 daily deaths, $country, Ontario, DELP, Updates together With Update circles Without extremes.pdf", replace








* Quebec

***********************************************

* 118 1 Daily deaths, Quebec, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 118 1 C19 daily deaths, $country, Quebec, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 118 1 C19 daily deaths, $country, Quebec, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 118 2 Daily deaths, Quebec, Updates together, Without Update circles, Without extremes  

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 118 2 C19 daily deaths, $country, Quebec, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 118 2 C19 daily deaths, $country, Quebec, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 118 3 Daily deaths, Quebec, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XQC20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 118 3 C19 daily deaths, $country, Quebec, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 118 3 C19 daily deaths, $country, Quebec, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 118 4 Daily deaths, Quebec, Updates together, With Update circles, Without extremes  

* extremes (much higher than other updates) = 20201022


twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XQC20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XQC20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 118 4 C19 daily deaths, $country, Quebec, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 118 4 C19 daily deaths, $country, Quebec, DELP, Updates together With Update circles Without extremes.pdf", replace


















* Saskatchewan

***********************************************

* 119 1 Daily deaths, Saskatchewan, Updates together, Without Update circles, With extremes

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) 


qui graph save "graph 119 1 C19 daily deaths, $country, Saskatchewan, DELP, Updates together Without Update circles With extremes.gph", replace
qui graph export "graph 119 1 C19 daily deaths, $country, Saskatchewan, DELP, Updates together Without Update circles With extremes.pdf", replace










***********************************************

* 119 2 Daily deaths, Saskatchewan, Updates together, Without Update circles, Without extremes  

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
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) 


qui graph save "graph 119 2 C19 daily deaths, $country, Saskatchewan, DELP, Updates together Without Update circles Without extremes.gph", replace
qui graph export "graph 119 2 C19 daily deaths, $country, Saskatchewan, DELP, Updates together Without Update circles Without extremes.pdf", replace









***********************************************

* 119 3 Daily deaths, Saskatchewan, Updates together, With Update circles, With extremes

twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XSK20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210128_val update_date_22308, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. With extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 119 3 C19 daily deaths, $country, Saskatchewan, DELP, Updates together With Update circles With extremes.gph", replace
qui graph export "graph 119 3 C19 daily deaths, $country, Saskatchewan, DELP, Updates together With Update circles With extremes.pdf", replace







***********************************************

* 119 4 Daily deaths, Saskatchewan, Updates together, With Update circles, Without extremes  

* extremes (much higher than other updates) = 20210128

twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(vvthick)) /// 1 "JOHN smooth"
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
(scatter DayDeaMeSmA01S00XSK20200417_val update_date_22022, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200424_val update_date_22029, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200501_val update_date_22036, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200509_val update_date_22044, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200517_val update_date_22052, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200524_val update_date_22059, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200531_val update_date_22066, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200607_val update_date_22073, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200614_val update_date_22080, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200621_val update_date_22087, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200628_val update_date_22094, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200704_val update_date_22100, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200718_val update_date_22114, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200723_val update_date_22119, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20200926_val update_date_22184, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201008_val update_date_22196, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201022_val update_date_22210, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201105_val update_date_22224, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201119_val update_date_22238, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201203_val update_date_22252, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201217_val update_date_22266, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20201231_val update_date_22280, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210114_val update_date_22294, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210211_val update_date_22322, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210225_val update_date_22336, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210311_val update_date_22350, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210325_val update_date_22364, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210408_val update_date_22378, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210422_val update_date_22392, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210506_val update_date_22406, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210520_val update_date_22420, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210603_val update_date_22434, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210610_val update_date_22441, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210617_val update_date_22448, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210624_val update_date_22455, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210701_val update_date_22462, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210708_val update_date_22469, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210715_val update_date_22476, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210722_val update_date_22483, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210729_val update_date_22490, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210805_val update_date_22497, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210812_val update_date_22504, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210819_val update_date_22511, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210826_val update_date_22518, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210902_val update_date_22525, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210909_val update_date_22532, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210916_val update_date_22539, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210923_val update_date_22546, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20210930_val update_date_22553, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211001_val update_date_22554, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211002_val update_date_22555, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211003_val update_date_22556, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211004_val update_date_22557, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211005_val update_date_22558, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211006_val update_date_22559, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211007_val update_date_22560, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211008_val update_date_22561, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211009_val update_date_22562, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211010_val update_date_22563, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211011_val update_date_22564, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211012_val update_date_22565, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211013_val update_date_22566, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211014_val update_date_22567, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211015_val update_date_22568, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211016_val update_date_22569, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211017_val update_date_22570, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211018_val update_date_22571, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211019_val update_date_22572, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211020_val update_date_22573, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211021_val update_date_22574, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211022_val update_date_22575, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211023_val update_date_22576, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211024_val update_date_22577, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211025_val update_date_22578, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211026_val update_date_22579, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211027_val update_date_22580, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211028_val update_date_22581, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211029_val update_date_22582, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211030_val update_date_22583, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211031_val update_date_22584, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211101_val update_date_22585, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211102_val update_date_22586, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211103_val update_date_22587, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211104_val update_date_22588, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211105_val update_date_22589, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211106_val update_date_22590, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211107_val update_date_22591, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211108_val update_date_22592, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211109_val update_date_22593, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211110_val update_date_22594, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211111_val update_date_22595, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211112_val update_date_22596, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211113_val update_date_22597, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211114_val update_date_22598, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211115_val update_date_22599, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211116_val update_date_22600, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211117_val update_date_22601, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211118_val update_date_22602, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211119_val update_date_22603, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211120_val update_date_22604, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211121_val update_date_22605, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211122_val update_date_22606, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211123_val update_date_22607, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211124_val update_date_22608, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211125_val update_date_22609, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211126_val update_date_22610, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211127_val update_date_22611, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211128_val update_date_22612, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211129_val update_date_22613, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211130_val update_date_22614, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211201_val update_date_22615, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211202_val update_date_22616, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211203_val update_date_22617, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211204_val update_date_22618, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211205_val update_date_22619, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211206_val update_date_22620, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211207_val update_date_22621, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211208_val update_date_22622, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211209_val update_date_22623, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211210_val update_date_22624, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211211_val update_date_22625, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211212_val update_date_22626, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211213_val update_date_22627, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211214_val update_date_22628, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211215_val update_date_22629, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211216_val update_date_22630, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211217_val update_date_22631, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211218_val update_date_22632, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211219_val update_date_22633, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211220_val update_date_22634, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211221_val update_date_22635, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211222_val update_date_22636, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211223_val update_date_22637, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211224_val update_date_22638, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211225_val update_date_22639, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211226_val update_date_22640, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211227_val update_date_22641, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211228_val update_date_22642, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211229_val update_date_22643, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211230_val update_date_22644, mcolor(gold) msymbol(circle_hollow)) /// 
(scatter DayDeaMeSmA01S00XSK20211231_val update_date_22645, mcolor(gold) msymbol(circle_hollow)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#25, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, all updates", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth") size(small) row(1)) ///
subtitle("Reference scenario. Without extremes", size(small)) ///
note("Update release dates and values denoted with circles")


qui graph save "graph 119 4 C19 daily deaths, $country, Saskatchewan, DELP, Updates together With Update circles Without extremes.gph", replace
qui graph export "graph 119 4 C19 daily deaths, $country, Saskatchewan, DELP, Updates together With Update circles Without extremes.pdf", replace























view "log CovidLongitudinal DELP 5.smcl"

log close

exit, clear



