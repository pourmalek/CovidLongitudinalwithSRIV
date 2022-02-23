
clear all

cd "$pathCovidLongitudinal"

cd LANL

capture log close 

log using "log CovidVisualizedCountry LANL 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Pecent Error
* 6 Absolute Pecent Error

* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median percent error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute percent error by epi weeks





use "CovidLongitudinal LANL 2.dta", clear


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



*

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




foreach update of local list {

qui capture drop DDErrorA04`update'             
qui gen DDErrorA04`update' = DayDeaMeSmA00S00 - DayDeaMeSmA04_`update' if DayDeaMeSmA00S00 != .
qui replace DDErrorA04`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDErrorA04`update' "DayDeaMeSmA04 Error" 

qui capture drop DDAbsErrA04`update' 
qui gen DDAbsErrA04`update' = abs(DayDeaMeSmA00S00 - DayDeaMeSmA04_`update') if DayDeaMeSmA00S00 != .
qui replace DDAbsErrA04`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDAbsErrA04`update' "DayDeaMeSmA04 Absolute Error" 

qui capture drop DDPerErrA04`update' 
qui gen DDPerErrA04`update' = (100 * (DayDeaMeSmA00S00 - DayDeaMeSmA04_`update')) if DayDeaMeSmA00S00 != .
qui replace DDPerErrA04`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDPerErrA04`update' "DayDeaMeSmA04 Percent Error" 

qui capture drop DDAbPeErA04`update' 
qui gen DDAbPeErA04`update' = (100 * abs(DayDeaMeSmA00S00 - DayDeaMeSmA04_`update')) if DayDeaMeSmA00S00 != .
qui replace DDAbPeErA04`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDAbPeErA04`update' "DayDeaMeSmA04 Absolute Percent Error" 

}
*


* (2) gen MEDIAN of error types by epi weeks and updates = _Med1

* Wait note: wait ...

foreach update of local list {

qui {
		
bysort epi_yrwk : egen DDErrorA04`update'_Med1 = median(DDErrorA04`update')
label var DDErrorA04`update'_Med1 "DayDeaMeSmA04`update' median error by epi weeks and updates"

bysort epi_yrwk : egen DDAbsErrA04`update'_Med1 = median(DDAbsErrA04`update')
label var DDAbsErrA04`update'_Med1 "DayDeaMeSmA04`update' median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DDPerErrA04`update'_Med1 = median(DDPerErrA04`update')
label var DDPerErrA04`update'_Med1 "DayDeaMeSmA04`update' median percent error by epi weeks and updates"

bysort epi_yrwk : egen DDAbPeErA04`update'_Med1 = median(DDAbPeErA04`update')
label var DDAbPeErA04`update'_Med1 "DayDeaMeSmA04`update' median absolute percent error by epi weeks and updates" 

	}
}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1

order DDErrorA04* 
		
egen DDErrorA04_Mean1 = rowmean(DDErrorA0420200426_Med1-DDErrorA0420210926_Med1) 
label var DDErrorA04_Mean1 "DayDeaMeSmA04 mean over updates of median error by epi weeks"


order DDAbsErrA04* 

egen DDAbsErrA04_Mean1 = rowmean(DDAbsErrA0420200426_Med1-DDAbsErrA0420210926_Med1) 
label var DDAbsErrA04_Mean1 "DayDeaMeSmA04 mean over updates of median absolute error by epi weeks"


order DDPerErrA04* 

egen DDPerErrA04_Mean1 = rowmean(DDPerErrA0420200426_Med1-DDPerErrA0420210926_Med1) 
label var DDPerErrA04_Mean1 "DayDeaMeSmA04 mean over updates of median percent error by epi weeks"


order DDAbPeErA04* 

egen DDAbPeErA04_Mean1 = rowmean(DDAbPeErA0420200426_Med1-DDAbPeErA0420210926_Med1) 
label var DDAbPeErA04_Mean1 "DayDeaMeSmA04 mean over updates of median absolute percent error by epi weeks"

* 
 
  


* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2
 
		
egen DDErrorA04_Mean2 = mean(DDErrorA04_Mean1) // get mean for all epi weeks of _Mean1
label var DDErrorA04_Mean2 "DayDeaMeSmA04 Mean over epi weeks of median error over updates"

egen DDAbsErrA04_Mean2 = mean(DDAbsErrA04_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbsErrA04_Mean2 "DayDeaMeSmA04 Mean over epi weeks of median absolute error over updates"

egen DDPerErrA04_Mean2 = mean(DDPerErrA04_Mean1) // get mean for all epi weeks of _Mean1
label var DDPerErrA04_Mean2 "DayDeaMeSmA04 Mean over epi weeks of median Pecent error over updates"

egen DDAbPeErA04_Mean2 = mean(DDAbPeErA04_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbPeErA04_Mean2 "DayDeaMeSmA04 Mean over epi weeks of median absolute percent error over updates"


*




qui compress

save "CovidVisualizedCountry LANL DayDea 3.dta", replace




******
* 3 Daily deaths, National, Error

twoway ///
(line DDErrorA0420200426 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200429 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200503 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200506 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200510 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200513 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200517 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200520 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200524 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200527 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200531 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200603 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200607 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200610 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200617 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200621 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200623 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200628 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200701 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200705 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200708 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200712 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200715 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200719 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200722 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200726 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200729 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200802 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200805 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200809 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200812 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200816 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200819 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200823 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200826 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200830 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200902 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200906 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200909 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200913 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200916 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200920 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200923 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200927 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420200930 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201004 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201007 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201011 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201014 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201018 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201021 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201025 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201028 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201101 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201104 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201108 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201111 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201115 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201118 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201122 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201125 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201129 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201202 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201206 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201209 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201213 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201216 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201220 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420201223 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210103 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210105 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210110 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210113 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210117 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210120 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210124 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210127 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210131 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210203 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210207 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210210 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210214 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210217 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210221 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210224 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210228 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210303 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210307 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210310 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210314 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210321 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210324 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210328 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210331 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210404 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210407 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210411 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210414 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210418 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210421 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210425 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210428 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210502 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210505 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210509 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210512 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210516 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210519 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210523 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210526 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210602 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210606 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210620 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210627 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210704 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210711 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210718 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210725 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210801 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210808 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210815 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210822 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210829 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210905 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210912 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDErrorA0420210919 date, sort lwidth(thin) lcolor(orange)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, national, LANL, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 3 National C-19 daily deaths error, $country, LANL, all updates.pdf", replace






******
* 4 Daily deaths, National, Absolute Error

twoway ///
(line DDAbsErrA0420200426 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200429 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200503 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200506 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200510 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200513 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200517 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200520 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200524 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200527 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200531 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200603 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200607 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200610 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200617 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200621 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200623 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200628 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200701 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200705 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200708 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200712 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200715 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200719 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200722 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200726 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200729 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200802 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200805 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200809 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200812 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200816 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200819 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200823 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200826 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200830 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200902 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200906 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200909 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200913 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200916 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200920 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200923 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200927 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420200930 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201004 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201007 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201011 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201014 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201018 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201021 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201025 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201028 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201101 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201104 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201108 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201111 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201115 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201118 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201122 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201125 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201129 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201202 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201206 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201209 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201213 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201216 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201220 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420201223 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210103 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210105 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210110 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210113 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210117 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210120 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210124 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210127 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210131 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210203 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210207 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210210 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210214 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210217 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210221 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210224 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210228 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210303 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210307 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210310 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210314 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210321 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210324 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210328 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210331 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210404 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210407 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210411 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210414 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210418 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210421 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210425 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210428 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210502 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210505 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210509 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210512 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210516 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210519 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210523 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210526 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210602 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210606 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210620 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210627 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210704 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210711 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210718 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210725 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210801 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210808 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210815 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210822 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210829 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210905 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210912 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbsErrA0420210919 date, sort lwidth(thin) lcolor(orange)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, national, LANL, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 4 National C-19 daily deaths absolute error, $country, LANL, all updates.pdf", replace





******
* 5 Daily deaths, National, Percent Error

twoway ///
(line DDPerErrA0420200426 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200429 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200503 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200506 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200510 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200513 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200517 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200520 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200524 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200527 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200531 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200603 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200607 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200610 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200617 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200621 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200623 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200628 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200701 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200705 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200708 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200712 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200715 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200719 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200722 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200726 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200729 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200802 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200805 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200809 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200812 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200816 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200819 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200823 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200826 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200830 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200902 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200906 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200909 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200913 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200916 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200920 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200923 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200927 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420200930 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201004 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201007 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201011 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201014 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201018 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201021 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201025 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201028 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201101 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201104 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201108 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201111 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201115 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201118 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201122 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201125 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201129 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201202 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201206 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201209 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201213 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201216 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201220 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420201223 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210103 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210105 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210110 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210113 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210117 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210120 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210124 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210127 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210131 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210203 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210207 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210210 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210214 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210217 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210221 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210224 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210228 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210303 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210307 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210310 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210314 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210321 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210324 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210328 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210331 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210404 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210407 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210411 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210414 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210418 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210421 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210425 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210428 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210502 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210505 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210509 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210512 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210516 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210519 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210523 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210526 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210602 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210606 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210620 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210627 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210704 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210711 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210718 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210725 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210801 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210808 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210815 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210822 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210829 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210905 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210912 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDPerErrA0420210919 date, sort lwidth(thin) lcolor(orange)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, national, LANL, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 5 National C-19 daily deaths percent error, $country, LANL, all updates.pdf", replace






******
* 6 Daily deaths, National, Absolute Percent Error

twoway ///
(line DDAbPeErA0420200426 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200429 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200503 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200506 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200510 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200513 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200517 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200520 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200524 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200527 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200531 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200603 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200607 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200610 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200617 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200621 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200623 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200628 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200701 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200705 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200708 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200712 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200715 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200719 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200722 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200726 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200729 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200802 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200805 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200809 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200812 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200816 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200819 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200823 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200826 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200830 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200902 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200906 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200909 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200913 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200916 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200920 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200923 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200927 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420200930 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201004 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201007 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201011 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201014 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201018 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201021 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201025 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201028 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201101 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201104 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201108 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201111 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201115 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201118 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201122 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201125 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201129 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201202 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201206 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201209 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201213 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201216 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201220 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420201223 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210103 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210105 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210110 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210113 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210117 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210120 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210124 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210127 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210131 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210203 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210207 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210210 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210214 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210217 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210221 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210224 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210228 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210303 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210307 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210310 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210314 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210321 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210324 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210328 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210331 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210404 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210407 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210411 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210414 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210418 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210421 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210425 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210428 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210502 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210505 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210509 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210512 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210516 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210519 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210523 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210526 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210602 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210606 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210613 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210620 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210627 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210704 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210711 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210718 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210725 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210801 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210808 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210815 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210822 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210829 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210905 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210912 date, sort lwidth(thin) lcolor(orange)) /// 
(line DDAbPeErA0420210919 date, sort lwidth(thin) lcolor(orange)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, national, LANL, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 6 National C-19 daily deaths absolute percent error, $country, LANL, all updates.pdf", replace









***************************************************************
* 7 Daily deaths, National, mean over updates of median error by epi weeks

twoway ///
(line DDErrorA04_Mean1 date, sort lcolor(orange) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, LANL", size(small)) yscale(titlegap(3)) 

qui graph export "graph 7 National C-19 daily deaths error, $country, LANL, Error Mean1.pdf", replace







***************************************************************
* 8 Daily deaths, National, mean over updates of median absolute error by epi weeks

twoway ///
(line DDAbsErrA04_Mean1 date, sort lcolor(orange) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, LANL", size(small)) yscale(titlegap(3)) 

qui graph export "graph 8 National C-19 daily deaths error, $country, LANL, Absolute Error Mean1.pdf", replace






***************************************************************
* 9 Daily deaths, National, mean over updates of median percent error by epi weeks

twoway ///
(line DDPerErrA04_Mean1 date, sort lcolor(orange) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, LANL", size(small)) yscale(titlegap(4)) 

qui graph export "graph 9 National C-19 daily deaths error, $country, LANL, Percent Error Mean1.pdf", replace





***************************************************************
* 10 Daily deaths, National, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DDAbPeErA04_Mean1 date, sort lcolor(orange) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median absolute percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, LANL", size(small)) yscale(titlegap(4)) 

qui graph export "graph 10 National C-19 daily deaths error, $country, LANL, Absolute Percent Error Mean1.pdf", replace








***********************************************

capture drop *2r

gen DDAbPeErA04_Mean2r = round(DDAbPeErA04_Mean2,0.1)


* 11 a Daily deaths, provinces together, Avergae of MAPE over updates and epi weeks

graph bar ///
(mean) DDAbPeErA04_Mean2r /// 1 "CAN" gray
, bar(1, fcolor(gray) lcolor(gray)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C-19 daily deaths average MAPE over updates and epi weeks", size(medium)) ///
subtitle("$country, national, LANL; MAPE: Median Absolute % Error", size(small)) /// 
legend(off) 

qui graph export "graph 11 C19 daily deaths, $country, national, LANL, Average MAPE.pdf", replace






view "log CovidVisualizedCountry LANL 4.smcl"

log close
