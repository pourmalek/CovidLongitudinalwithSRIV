
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidVisualizedCountry IMPE 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE 4.do"

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





use "CovidLongitudinal IMPE 2.dta", clear


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

qui capture drop DDErrorA03`update' 
qui gen DDErrorA03`update' = DayDeaMeSmA00S00 - DayDeaMeRaA03S02_`update' if DayDeaMeSmA00S00 != .
qui replace DDErrorA03`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDErrorA03`update' "DayDeaMeSmA03S02 Error" 

qui capture drop DDAbsErrA03`update' 
qui gen DDAbsErrA03`update' = abs(DayDeaMeSmA00S00 - DayDeaMeRaA03S02_`update') if DayDeaMeSmA00S00 != .
qui replace DDAbsErrA03`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDAbsErrA03`update' "DayDeaMeSmA03S02 Absolute Error" 

qui capture drop DDPerErrA03`update' 
qui gen DDPerErrA03`update' = (100 * (DayDeaMeSmA00S00 - DayDeaMeRaA03S02_`update')) if DayDeaMeSmA00S00 != .
qui replace DDPerErrA03`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDPerErrA03`update' "DayDeaMeSmA03S02 Percent Error" 

qui capture drop DDAbPeErA03`update' 
qui gen DDAbPeErA03`update' = (100 * abs(DayDeaMeSmA00S00 - DayDeaMeRaA03S02_`update')) if DayDeaMeSmA00S00 != .
qui replace DDAbPeErA03`update' = . if DayDeaMeSmA00S00 == . // before location was added to the estimates for the country
qui label var DDAbPeErA03`update' "DayDeaMeSmA03S02 Absolute Percent Error" 

}
*


* (2) gen MEDIAN of error types by epi weeks and updates = _Med1

* Wait note: wait ...

foreach update of local list {

qui {
		
bysort epi_yrwk : egen DDErrorA03`update'_Med1 = median(DDErrorA03`update')
label var DDErrorA03`update'_Med1 "DayDeaMeSmA03S02`update' median error by epi weeks and updates"

bysort epi_yrwk : egen DDAbsErrA03`update'_Med1 = median(DDAbsErrA03`update')
label var DDAbsErrA03`update'_Med1 "DayDeaMeSmA03S02`update' median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DDPerErrA03`update'_Med1 = median(DDPerErrA03`update')
label var DDPerErrA03`update'_Med1 "DayDeaMeSmA03S02`update' median percent error by epi weeks and updates"

bysort epi_yrwk : egen DDAbPeErA03`update'_Med1 = median(DDAbPeErA03`update')
label var DDAbPeErA03`update'_Med1 "DayDeaMeSmA03S02`update' median absolute percent error by epi weeks and updates" 

	}
}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1

order DDErrorA03* 
		
egen DDErrorA03_Mean1 = rowmean(DDErrorA0320200616_Med1-DDErrorA0320211226_Med1) 
label var DDErrorA03_Mean1 "DayDeaMeSmA03S02 mean over updates of median error by epi weeks"


order DDAbsErrA03* 

egen DDAbsErrA03_Mean1 = rowmean(DDAbsErrA0320200616_Med1-DDAbsErrA0320211226_Med1) 
label var DDAbsErrA03_Mean1 "DayDeaMeSmA03S02 mean over updates of median absolute error by epi weeks"


order DDPerErrA03* 

egen DDPerErrA03_Mean1 = rowmean(DDPerErrA0320200616_Med1-DDPerErrA0320211226_Med1) 
label var DDPerErrA03_Mean1 "DayDeaMeSmA03S02 mean over updates of median percent error by epi weeks"


order DDAbPeErA03* 

egen DDAbPeErA03_Mean1 = rowmean(DDAbPeErA0320200616_Med1-DDAbPeErA0320211226_Med1) 
label var DDAbPeErA03_Mean1 "DayDeaMeSmA03S02 mean over updates of median absolute percent error by epi weeks"

* 
 
  


* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2
 
		
egen DDErrorA03_Mean2 = mean(DDErrorA03_Mean1) // get mean for all epi weeks of _Mean1
label var DDErrorA03_Mean2 "DayDeaMeSmA03S02 Mean over epi weeks of median error over updates"

egen DDAbsErrA03_Mean2 = mean(DDAbsErrA03_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbsErrA03_Mean2 "DayDeaMeSmA03S02 Mean over epi weeks of median absolute error over updates"

egen DDPerErrA03_Mean2 = mean(DDPerErrA03_Mean1) // get mean for all epi weeks of _Mean1
label var DDPerErrA03_Mean2 "DayDeaMeSmA03S02 Mean over epi weeks of median Pecent error over updates"

egen DDAbPeErA03_Mean2 = mean(DDAbPeErA03_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbPeErA03_Mean2 "DayDeaMeSmA03S02 Mean over epi weeks of median absolute percent error over updates"


*




qui compress

save "CovidVisualizedCountry IMPE DayDea 3.dta", replace




******
* 3 Daily deaths, National, Error

twoway ///
(line DDErrorA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths error, $country, national, IMPE, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 3 National C-19 daily deaths error, $country, IMPE, all updates.pdf", replace






******
* 4 Daily deaths, National, Absolute Error

twoway ///
(line DDAbsErrA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute error, $country, national, IMPE, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 4 National C-19 daily deaths absolute error, $country, IMPE, all updates.pdf", replace





******
* 5 Daily deaths, National, Percent Error

twoway ///
(line DDPerErrA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths percent error, $country, national, IMPE, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 5 National C-19 daily deaths percent error, $country, IMPE, all updates.pdf", replace






******
* 6 Daily deaths, National, Absolute Percent Error

twoway ///
(line DDAbPeErA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths absolute percent error, $country, national, IMPE, all updates", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) yscale(titlegap(3))
 
qui graph export "graph 6 National C-19 daily deaths absolute percent error, $country, IMPE, all updates.pdf", replace









***************************************************************
* 7 Daily deaths, National, mean over updates of median error by epi weeks

twoway ///
(line DDErrorA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IMPE", size(small)) yscale(titlegap(3)) 

qui graph export "graph 7 National C-19 daily deaths error, $country, IMPE, Error Mean1.pdf", replace







***************************************************************
* 8 Daily deaths, National, mean over updates of median absolute error by epi weeks

twoway ///
(line DDAbsErrA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IMPE", size(small)) yscale(titlegap(3)) 

qui graph export "graph 8 National C-19 daily deaths error, $country, IMPE, Absolute Error Mean1.pdf", replace






***************************************************************
* 9 Daily deaths, National, mean over updates of median percent error by epi weeks

twoway ///
(line DDPerErrA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IMPE", size(small)) yscale(titlegap(4)) 

qui graph export "graph 9 National C-19 daily deaths error, $country, IMPE, Percent Error Mean1.pdf", replace





***************************************************************
* 10 Daily deaths, National, mean over updates of median absolute percent error by epi weeks

twoway ///
(line DDAbPeErA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C-19 daily deaths, mean over updates of median absolute percent error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, IMPE", size(small)) yscale(titlegap(4)) 

qui graph export "graph 10 National C-19 daily deaths error, $country, IMPE, Absolute Percent Error Mean1.pdf", replace








***********************************************

capture drop *2r

gen DDAbPeErA03_Mean2r = round(DDAbPeErA03_Mean2,0.1)


* 11 a Daily deaths, provinces together, Avergae of MAPE over updates and epi weeks

graph bar ///
(mean) DDAbPeErA03_Mean2r /// 1 "CAN" gray
, bar(1, fcolor(gray) lcolor(gray)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C-19 daily deaths average MAPE over updates and epi weeks", size(medium)) ///
subtitle("$country, national, IMPE; MAPE: Median Absolute % Error", size(small)) /// 
legend(off) 

qui graph export "graph 11 C19 daily deaths, $country, national, IMPE, Average MAPE.pdf", replace






view "log CovidVisualizedCountry IMPE 4.smcl"

log close
