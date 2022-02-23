
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Pecent Error
* 6 Absolute Pecent Error



use "CovidVisualizedCountry IHME DayDea.dta", clear


grstyle init

grstyle color background white




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

	foreach location in XAB XBC XMB XNS XON XQC XSK XXX {

		qui capture drop DDErrorA02`location'`update' 
		qui gen DDErrorA02`location'`update' = DayDeaMeSmA00S00`location' - DayDeaMeSmA02S01`location'`update' if DayDeaMeSmA00S00`location' != .
		qui replace DDErrorA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDErrorA02`location'`update' "DayDeaMeSmA02S01`location' Error" 
		
		qui capture drop DDAbsErrA02`location'`update' 
		qui gen DDAbsErrA02`location'`update' = abs(DayDeaMeSmA00S00`location' - DayDeaMeSmA02S01`location'`update') if DayDeaMeSmA00S00`location' != .
		qui replace DDAbsErrA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDAbsErrA02`location'`update' "DayDeaMeSmA02S01`location' Absolute Error" 
		
		qui capture drop DDPerErrA02`location'`update' 
		qui gen DDPerErrA02`location'`update' = (100 * (DayDeaMeSmA00S00`location' - DayDeaMeSmA02S01`location'`update')) if DayDeaMeSmA00S00`location' != .
		qui replace DDPerErrA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDPerErrA02`location'`update' "DayDeaMeSmA02S01`location' Percent Error" 
		
		qui capture drop DDAbPeErA02`location'`update' 
		qui gen DDAbPeErA02`location'`update' = (100 * abs(DayDeaMeSmA00S00`location' - DayDeaMeSmA02S01`location'`update')) if DayDeaMeSmA00S00`location' != .
		qui replace DDAbPeErA02`location'`update' = . if DayDeaMeSmA00S00`location' == . // before location was added to the estimates for the country
		qui label var DDAbPeErA02`location'`update' "DayDeaMeSmA02S01`location' Absolute Percent Error" 

	}	
	
}
*	


qui compress

save "CovidVisualizedCountry IHME DayDea 2.dta", replace




**************************************
**************************************
* 3 Daily deaths, location, Error


******
* 3 Daily deaths, National, Error

twoway ///
(line DDErrorA02XXX20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XXX20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, national, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 National C-19 daily deaths error, $country, IHME, all updates.pdf", replace







******
* 3 Daily deaths, Alberta, Error

twoway ///
(line DDErrorA02XAB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XAB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, Alberta, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 Alberta C-19 daily deaths error, $country, IHME, all updates.pdf", replace







******
* 3 Daily deaths, British Columbia, Error

twoway ///
(line DDErrorA02XBC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XBC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, British Columbia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 British Columbia C-19 daily deaths error, $country, IHME, all updates.pdf", replace






******
* 3 Daily deaths, Manitoba, Error

twoway ///
(line DDErrorA02XMB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XMB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, Manitoba, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 Manitoba C-19 daily deaths error, $country, IHME, all updates.pdf", replace







******
* 3 Daily deaths, Nova Scotia, Error

twoway ///
(line DDErrorA02XNS20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XNS20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, Nova Scotia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 Nova Scotia C-19 daily deaths error, $country, IHME, all updates.pdf", replace






******
* 3 Daily deaths, Ontario, Error

twoway ///
(line DDErrorA02XON20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XON20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, Ontario, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)
 
qui graph export "graph 3 Ontario C-19 daily deaths error, $country, IHME, all updates.pdf", replace






******
* 3 Daily deaths, Quebec, Error

twoway ///
(line DDErrorA02XQC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XQC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, Quebec, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 Quebec C-19 daily deaths error, $country, IHME, all updates.pdf", replace






******
* 3 Daily deaths, Saskatchewan, Error

twoway ///
(line DDErrorA02XSK20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDErrorA02XSK20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, Saskatchewan, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 3 Saskatchewan C-19 daily deaths error, $country, IHME, all updates.pdf", replace













*********************************************
*********************************************
* 4 Daily deaths, location, Absolute Error




******
* 4 Daily deaths, National, Absolute Error

twoway ///
(line DDAbsErrA02XXX20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XXX20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, national, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 National C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace






******
* 4 Daily deaths, Alberta, Absolute Error

twoway ///
(line DDAbsErrA02XAB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XAB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, Alberta, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 Alberta C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace







******
* 4 Daily deaths, British Columbia, Absolute Error

twoway ///
(line DDAbsErrA02XBC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XBC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, British Columbia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 British Columbia C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace






******
* 4 Daily deaths, Manitoba, Absolute Error

twoway ///
(line DDAbsErrA02XMB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XMB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, Manitoba, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 Manitoba C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace







******
* 4 Daily deaths, Nova Scotia, Absolute Error

twoway ///
(line DDAbsErrA02XNS20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XNS20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, Nova Scotia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)
 
qui graph export "graph 4 Nova Scotia C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace






******
* 4 Daily deaths, Ontario, Absolute Error

twoway ///
(line DDAbsErrA02XON20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XON20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, Ontario, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 Ontario C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace






******
* 4 Daily deaths, Quebec, Absolute Error

twoway ///
(line DDAbsErrA02XQC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XQC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, Quebec, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 Quebec C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace




******
* 4 Daily deaths, Saskatchewan, Absolute Error

twoway ///
(line DDAbsErrA02XSK20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbsErrA02XSK20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, Saskatchewan, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 4 Saskatchewan C-19 daily deaths absolute error, $country, IHME, all updates.pdf", replace















*********************************************
*********************************************
* 5 Daily deaths, location, Percent Error



******
* 5 Daily deaths, National, Percent Error

twoway ///
(line DDPerErrA02XXX20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XXX20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, national, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 National C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace






******
* 5 Daily deaths, Alberta, Percent Error

twoway ///
(line DDPerErrA02XAB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XAB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, Alberta, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 Alberta C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace







******
* 5 Daily deaths, British Columbia, Percent Error

twoway ///
(line DDPerErrA02XBC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XBC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, British Columbia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 British Columbia C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace






******
* 5 Daily deaths, Manitoba, Percent Error

twoway ///
(line DDPerErrA02XMB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XMB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, Manitoba, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 Manitoba C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace







******
* 5 Daily deaths, Nova Scotia, Percent Error

twoway ///
(line DDPerErrA02XNS20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XNS20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, Nova Scotia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 Nova Scotia C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace






******
* 5 Daily deaths, Ontario, Percent Error

twoway ///
(line DDPerErrA02XON20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XON20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, Ontario, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 Ontario C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace






******
* 5 Daily deaths, Quebec, Percent Error

twoway ///
(line DDPerErrA02XQC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XQC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, Quebec, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 Quebec C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace







******
* 5 Daily deaths, Saskatchewan, Percent Error

twoway ///
(line DDPerErrA02XSK20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDPerErrA02XSK20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, Saskatchewan, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 5 Saskatchewan C-19 daily deaths percent error, $country, IHME, all updates.pdf", replace

















***************************************************
***************************************************
* 6 Daily deaths, location, Absolute Percent Error




******
* 6 Daily deaths, National, Absolute Percent Error

twoway ///
(line DDAbPeErA02XXX20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XXX20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, national, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 National C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace






******
* 6 Daily deaths, Alberta, Absolute Percent Error

twoway ///
(line DDAbPeErA02XAB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XAB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, Alberta, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 Alberta C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace







******
* 6 Daily deaths, British Columbia, Absolute Percent Error

twoway ///
(line DDAbPeErA02XBC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XBC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, British Columbia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 British Columbia C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace





******
* 6 Daily deaths, Manitoba, Absolute Percent Error

twoway ///
(line DDAbPeErA02XMB20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XMB20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, Manitoba, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 Manitoba C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace







******
* 6 Daily deaths, Nova Scotia, Absolute Percent Error

twoway ///
(line DDAbPeErA02XNS20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XNS20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, Nova Scotia, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 Nova Scotia C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace






******
* 6 Daily deaths, Ontario, Absolute Percent Error

twoway ///
(line DDAbPeErA02XON20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XON20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, Ontario, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 Ontario C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace






******
* 6 Daily deaths, Quebec, Absolute Percent Error

twoway ///
(line DDAbPeErA02XQC20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XQC20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, Quebec, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 Quebec C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace










******
* 6 Daily deaths, Saskatchewan, Absolute Percent Error

twoway ///
(line DDAbPeErA02XSK20200422 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200427 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200428 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200429 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200504 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200510 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200512 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200520 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200525 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200526 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200529 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200605 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200608 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200615 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200629 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200707 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200714 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200722 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200821 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200827 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200903 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200911 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200918 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20200924 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201002 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201009 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201022 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201029 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201112 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201119 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201203 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201210 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201217 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20201223 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210115 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210122 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210128 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210204 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210212 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210220 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210225 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210306 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210311 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210317 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210325 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210401 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210409 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210416 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210423 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210506 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210514 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210521 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210528 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210604 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210610 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210618 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210625 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210702 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210715 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210723 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210730 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210806 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210820 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210826 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210902 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210910 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210916 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210923 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20210930 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20211015 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20211021 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20211104 date, sort lwidth(thin) lcolor(black)) /// 
(line DDAbPeErA02XSK20211221 date, sort lwidth(thin) lcolor(black)) /// Canada update 78
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, Saskatchewan, IHME, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) 
 
qui graph export "graph 6 Saskatchewan C-19 daily deaths absolute percent error, $country, IHME, all updates.pdf", replace






**********************

view "log CovidVisualizedCountry IHME 4.smcl"

log close

exit, clear
