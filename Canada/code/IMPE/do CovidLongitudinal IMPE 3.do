
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidVisualizedCountry IMPE 3.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 3.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* graphs, daily deaths: updates separate
* graph 1 daily deaths IMPE with official reports (JOHN)
* graphs, daily deaths: updates together
* graph 2 daily deaths: all updates




* add JOHN

cd .. // /code/

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

keep loc_grand_name date DayDeaMeSmA00S00XXX 

cd ..

cd IMPE 

save "CovidLongitudinal JOHN.dta", replace

merge m:m date loc_grand_name using "CovidLongitudinal IMPE.dta"
 
drop _merge


drop if date > td(01jan2022)

qui compress

save "CovidLongitudinal IMPE 2.dta", replace





local list ///
20200616 ///
20200619 ///
20200623 ///
20200702 ///
20200703 ///
20200704 ///
20200707 ///
20200711 ///
20200714 ///
20200715 ///
20200718 ///
20200720 ///
20200722 ///
20200725 ///
20200727 ///
20200731 ///
20200808 ///
20200810 ///
20200811 ///
20200813 ///
20200814 ///
20200817 ///
20200823 ///
20200825 ///
20200827 ///
20200831 ///
20200902 ///
20200906 ///
20200908 ///
20200912 ///
20200915 ///
20200919 ///
20200923 ///
20200925 ///
20201003 ///
20201006 ///
20201012 ///
20201019 ///
20201025 ///
20201028 ///
20201101 ///
20201110 ///
20201114 ///
20201118 ///
20201123 ///
20201129 ///
20201204 ///
20201212 ///
20201220 ///
20201226 ///
20210110 ///
20210112 ///
20210118 ///
20210124 ///
20210130 ///
20210203 ///
20210210 ///
20210217 ///
20210226 ///
20210305 ///
20210312 ///
20210319 ///
20210329 ///
20210406 ///
20210417 ///
20210424 ///
20210510 ///
20210516 ///
20210522 ///
20210527 ///
20210604 ///
20210611 ///
20210618 ///
20210626 ///
20210702 ///
20210709 ///
20210719 ///
20210806 ///
20210819 ///
20210825 ///
20210909 ///
20210924 ///
20211006 ///
20211021 ///
20211027 ///
20211103 ///
20211115 ///
20211121 ///
20211129 ///
20211205 ///
20211213 ///
20211226 




grstyle init

grstyle color background white



***********************************************

* daily deaths, each update, National

foreach update of local list {

capture drop update_date

gen update_date = date("`update'", "YMD")

local update_date = date("`update'", "YMD")

di "DayDeaMeRaA03S02_`update' if date == update_date"
summ DayDeaMeRaA03S02_`update' if date == update_date

gen DayDeaMeRaA03S02_`update'_val = r(mean)

local value = DayDeaMeRaA03S02_`update'_val


twoway ///
(line DayDeaMeSmA00S00XXX date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeRaA03S02_`update' date, sort lcolor(magenta) lwidth(medthick)) /// 2 "IMPE smooth"
(scatteri `value' `update_date', mcolor(red) msymbol(circle_hollow)) /// 3 "Update release date and value"
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, National, IMPE, update `update'", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "IMPE smooth" 3 "Update release date and value") size(small) row(1)) ///
subtitle("reference scenario", size(small)) yscale(titlegap(2))

qui graph export "graph 1 C19 daily deaths, $country, National, IMPE, update `update'.pdf", replace

*


}
*





* updates together


******
* daily deaths, national, reference scenario  
	
twoway ///
(line DayDeaMeRaA03S02_20200616 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200619 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200623 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200702 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200703 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200704 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200707 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200711 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200714 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200715 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200718 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200720 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200722 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200725 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200727 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200731 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200808 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200810 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200811 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200813 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200814 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200817 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200823 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200825 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200827 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200831 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200902 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200906 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200908 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200912 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200915 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200919 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200923 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20200925 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201003 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201006 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201012 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201019 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201025 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201028 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201101 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201110 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201114 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201118 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201123 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201129 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201204 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201212 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201220 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20201226 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210110 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210112 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210118 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210124 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210130 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210203 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210210 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210217 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210226 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210305 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210312 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210319 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210329 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210406 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210417 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210424 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210510 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210516 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210522 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210527 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210604 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210611 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210618 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210626 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210702 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210709 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210719 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210806 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210819 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210825 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210909 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20210924 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211006 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211021 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211027 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211103 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211115 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211121 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211129 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211205 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211213 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeRaA03S02_20211226 date, sort lwidth(medthick) lcolor(magenta)) /// 
(line DayDeaMeSmA00S00XXX date, sort lwidth(thick) lcolor(cyan)) /// JOHN smooth
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, national, IMPE, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "IMPE smooth" 93 "JOHN smooth") rows(1)) ///
subtitle(Reference scenario, size(small)) 
 
qui graph export "graph 2 National C-19 daily deaths, $country, IMPE, reference scenario, all updates.pdf", replace










view "log CovidVisualizedCountry IMPE 3.smcl"

log close
