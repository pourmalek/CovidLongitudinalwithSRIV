
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 5.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median percent error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute percent error by epi weeks

* location = National // XXX


use "CovidVisualizedCountry IHME DayDea 2.dta", clear

save "CovidVisualizedCountry IHME DayDea 2 National.dta", replace

keep if provincestate == " National" 

drop *XAB *XBC *XMB *XNB *XNL *XNT *XNS *XNU *XON *XPE *XQC *XSK // extra for this do file
* XXX XAB  XBC  XMB  XNB  XNL  XNT  XNS  XNU  XON  XPE  XQC  XSK // all
* XXX XAB  XBC  XMB  XNS  XON  XQC  XSK // IHME

qui compress


ssc install epiweek

* Create new variables epi_week and epi_year from calendar date

epiweek date, epiw(epi_week) epiy(epi_year)

label var epi_week "Epidemiological week"
label var epi_year "Epidemiological year"


* Create new variables - calendar date with starting Sunday from and ending Saturday to

egen epi_yrwk = concat(epi_year epi_week), p(w)

label var epi_yrwk "Epidemiological year and week"

epiweek2 epi_yrwk, s(epi_week_from) e(epi_week_to)

label var epi_week_from "Epidemiological week start date"
label var epi_week_to "Epidemiological week end date"




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






sort provincestate date



* (2) gen MEDIAN of error types by epi weeks and updates = _Med1

* Wait note: wait ...

foreach update of local list {

qui {
		
bysort epi_yrwk : egen DDErrorA02XXX`update'_Med1 = median(DDErrorA02XXX`update')
label var DDErrorA02XXX`update'_Med1 "DayDeaMeSmA02S01XXX`update' median error by epi weeks and updates"

bysort epi_yrwk : egen DDAbsErrA02XXX`update'_Med1 = median(DDAbsErrA02XXX`update')
label var DDAbsErrA02XXX`update'_Med1 "DayDeaMeSmA02S01XXX`update' median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DDPerErrA02XXX`update'_Med1 = median(DDPerErrA02XXX`update')
label var DDPerErrA02XXX`update'_Med1 "DayDeaMeSmA02S01XXX`update' median percent error by epi weeks and updates"

bysort epi_yrwk : egen DDAbPeErA02XXX`update'_Med1 = median(DDAbPeErA02XXX`update')
label var DDAbPeErA02XXX`update'_Med1 "DayDeaMeSmA02S01XXX`update' median absolute percent error by epi weeks and updates" 

	}
}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1

order *, alphabetic
		
egen DDErrorA02XXX_Mean1 = rowmean(DDErrorA02XXX20200422_Med1-DDErrorA02XXX20211221_Med1) 
label var DDErrorA02XXX_Mean1 "DayDeaMeSmA02S01XXX mean over updates of median error by epi weeks"

egen DDAbsErrA02XXX_Mean1 = rowmean(DDAbsErrA02XXX20200422_Med1-DDAbsErrA02XXX20211221_Med1) 
label var DDAbsErrA02XXX_Mean1 "DayDeaMeSmA02S01XXX mean over updates of median absolute error by epi weeks"

egen DDPerErrA02XXX_Mean1 = rowmean(DDPerErrA02XXX20200422_Med1-DDPerErrA02XXX20211221_Med1) 
label var DDPerErrA02XXX_Mean1 "DayDeaMeSmA02S01XXX mean over updates of median percent error by epi weeks"

egen DDAbPeErA02XXX_Mean1 = rowmean(DDAbPeErA02XXX20200422_Med1-DDAbPeErA02XXX20211221_Med1) 
label var DDAbPeErA02XXX_Mean1 "DayDeaMeSmA02S01XXX mean over updates of median absolute percent error by epi weeks"


* 
 
  


* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2
 
		
egen DDErrorA02XXX_Mean2 = mean(DDErrorA02XXX_Mean1) // get mean for all epi weeks of _Mean1
label var DDErrorA02XXX_Mean2 "DayDeaMeSmA02S01XXX Mean over epi weeks of median error over updates"

egen DDAbsErrA02XXX_Mean2 = mean(DDAbsErrA02XXX_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbsErrA02XXX_Mean2 "DayDeaMeSmA02S01XXX Mean over epi weeks of median absolute error over updates"

egen DDPerErrA02XXX_Mean2 = mean(DDPerErrA02XXX_Mean1) // get mean for all epi weeks of _Mean1
label var DDPerErrA02XXX_Mean2 "DayDeaMeSmA02S01XXX Mean over epi weeks of median Pecent error over updates"

egen DDAbPeErA02XXX_Mean2 = mean(DDAbPeErA02XXX_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbPeErA02XXX_Mean2 "DayDeaMeSmA02S01XXX Mean over epi weeks of median absolute percent error over updates"


*




qui compress

save "CovidVisualizedCountry IHME DayDea 3 National.dta", replace






************

* graphs



grstyle init

grstyle color background white



***************************************************************
* 7 Daily deaths, National, mean over updates of median error by epi weeks

twoway ///
(line DDErrorA02XXX_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 7 National C-19 daily deaths error, $country, IHME, Error Mean1.pdf", replace







***************************************************************
* 8 Daily deaths, National, mean over updates of median absolute error by epi weeks

twoway ///
(line DDAbsErrA02XXX_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 8 National C-19 daily deaths error, $country, IHME, Absolute Error Mean1.pdf", replace






***************************************************************
* 9 Daily deaths, National, mean over updates of median percent error by epi weeks

twoway ///
(line DDPerErrA02XXX_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 9 National C-19 daily deaths error, $country, IHME, Percent Error Mean1.pdf", replace





***************************************************************
* 10 Daily deaths, National, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DDAbPeErA02XXX_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median absolute percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 10 National C-19 daily deaths error, $country, IHME, Absolute Percent Error Mean1.pdf", replace






keep loc_grand_name provincestate date DDAbPeErA02XXX_Mean1 DDAbPeErA02XXX_Mean2

save "CovidVisualizedCountry IHME DayDea 3 National.dta", replace











**********************

view "log CovidVisualizedCountry IHME 5.smcl"

log close

exit, clear
