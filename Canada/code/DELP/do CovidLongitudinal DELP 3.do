
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graphs, daily deaths: updates separate 
* graphs (number 100-109) of each model update (separate) with official reports (JOHN)
* input data files: "CovidLongitudinal DELP.dta"
* output data files: "CovidLongitudinal DELP daily deaths.dta"


grstyle init

grstyle color background white



use "CovidLongitudinal DELP.dta", clear

drop if date > td(01jan2022)

keep loc_grand_name provincestate date DayDea*

qui compress




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








****************
****************
* daily deaths



***********************************************

* daily deaths, each update, National

foreach update of local list {

di in red "This is update " `update' " National"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")
      
di "summ DayDeaMeSmA01S00`update' if date == update_date & provincestate is National"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == " National"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == " National" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 100 C19 daily deaths, $country, National, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*





***********************************************

* daily deaths, each update, Alberta

foreach update of local list {

di in red "This is update " `update' " Alberta"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "DayDeaMeSmA01S00`update' if date == update_date & provincestate is Alberta"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Alberta" 

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway /// 
(line DayDeaMeSmA00S00XAB date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Alberta" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Alberta, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 101 C19 daily deaths, $country, Alberta, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*






***********************************************

* daily deaths, each update, British Columbia

foreach update of local list {

di in red "This is update " `update' " British Columbia"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "DayDeaMeSmA01S00XBC`update' if date == update_date & provincestate is British Columbia"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "British Columbia" 

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XBC date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "British Columbia" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, British Columbia, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 102 C19 daily deaths, $country, British Columbia, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*


***********************************************

* daily deaths, each update, Manitoba

foreach update of local list {

di in red "This is update " `update' " Manitoba"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "summ DayDeaMeSmA01S00`update' if date == update_date & provincestate is Manitoba"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Manitoba"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XMB date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Manitoba" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Manitoba, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 103 C19 daily deaths, $country, Manitoba, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*


***********************************************

* daily deaths, each update, New Brunswick

foreach update of local list {

di in red "This is update " `update' " New Brunswick"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "summ DayDeaMeSmA01S00`update' if date == update_date & provincestate is New Brunswick"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "New Brunswick"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XNB date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "New Brunswick" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, New Brunswick, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 104 C19 daily deaths, $country, New Brunswick, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*


***********************************************

* daily deaths, each update, Newfoundland and Labrador

foreach update of local list {

di in red "This is update " `update' " Newfoundland and Labrador"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "DayDeaMeSmA01S00`update' if date == update_date & provincestate is Newfoundland and Labrador"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Newfoundland and Labrador"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XNL date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022)  & provincestate == "Newfoundland and Labrador" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Newfoundland, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("Newfoundland and Labrador; reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 105 C19 daily deaths, $country, Newfoundland and Labrador, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*




***********************************************

* daily deaths, each update, Nova Scotia

foreach update of local list {

di in red "This is update " `update' " Nova Scotia"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "DayDeaMeSmA01S00`update' if date == update_date & provincestate is Nova Scotia"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Nova Scotia"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XNS date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Nova Scotia" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Nova Scotia, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 106 C19 daily deaths, $country, Nova Scotia, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*


***********************************************

* daily deaths, each update, Ontario

foreach update of local list {

di in red "This is update " `update' " Ontario"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "summ DayDeaMeSmA01S00`update' if date == update_date & provincestate is Ontario"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Ontario"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XON date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Ontario" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Ontario, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 107 C19 daily deaths, $country, Ontario, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*






***********************************************

* daily deaths, each update, Quebec

foreach update of local list {

di in red "This is update " `update' " Quebec"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "summ DayDeaMeSmA01S00`update' if date == update_date & provincestate is Quebec"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Quebec"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XQC date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Quebec" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Quebec, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 108 C19 daily deaths, $country, Quebec, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*





***********************************************

* daily deaths, each update, Saskatchewan

foreach update of local list {

di in red "This is update " `update' " Saskatchewan"

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "summ DayDeaMeSmA01S00`update' if date == update_date & provincestate is Saskatchewan"
summ DayDeaMeSmA01S00`update' if date == update_date & provincestate == "Saskatchewan"

gen DayDeaMeSmA01S00`update'_val = r(mean)

local value = DayDeaMeSmA01S00`update'_val

twoway ///
(line DayDeaMeSmA00S00XSK date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeSmA01S00`update' date, sort lcolor(red) lwidth(medthick)) /// 2 "DELP smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) & provincestate == "Saskatchewan" ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Saskatchewan, DELP, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 109 C19 daily deaths, $country, Saskatchewan, DELP, update `update'.pdf", replace

drop DayDeaMeSmA01S00`update'_val

}
*









qui compress

save "CovidLongitudinal DELP daily deaths.dta", replace






view "log CovidLongitudinal DELP 3.smcl"

log close

exit, clear
