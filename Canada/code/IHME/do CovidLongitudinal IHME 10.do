
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 10.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 10.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* weeks time bin
* location = Nova Scotia // XNS
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Nova Scotia.dta",
*                    "CovidLongitudinal IHME 3 Nova Scotia Mean1 Mean2.dta"




use "CovidLongitudinal IHME 3", clear

save "CovidLongitudinal IHME 3 Nova Scotia.dta", replace

keep if provincestate == "Nova Scotia" 

drop *XAB *XBC *XMB *XXX      *XON *XQC *XSK 

qui compress




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

	* Running not quietly displays that the Stata is working and has not frozen. 
		
bysort epi_yrwk : egen DDErrorA02XNS`update'_Med1 = median(DDErrorA02XNS`update')
label var DDErrorA02XNS`update'_Med1 "DayDeaMeSmA02S01XNS`update' median error by epi weeks and updates"

bysort epi_yrwk : egen DDAbsErrA02XNS`update'_Med1 = median(DDAbsErrA02XNS`update')
label var DDAbsErrA02XNS`update'_Med1 "DayDeaMeSmA02S01XNS`update' median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DDPerErrA02XNS`update'_Med1 = median(DDPerErrA02XNS`update')
label var DDPerErrA02XNS`update'_Med1 "DayDeaMeSmA02S01XNS`update' median % error by epi weeks and updates"

bysort epi_yrwk : egen DDAbPeErA02XNS`update'_Med1 = median(DDAbPeErA02XNS`update')
label var DDAbPeErA02XNS`update'_Med1 "DayDeaMeSmA02S01XNS`update' median absolute % error by epi weeks and updates" 

	
}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1




order DDErrorA02XNS20211221_Med1
order DDErrorA02XNS20211104_Med1
order DDErrorA02XNS20211021_Med1
order DDErrorA02XNS20211015_Med1
order DDErrorA02XNS20210930_Med1
order DDErrorA02XNS20210923_Med1
order DDErrorA02XNS20210916_Med1
order DDErrorA02XNS20210910_Med1
order DDErrorA02XNS20210902_Med1
order DDErrorA02XNS20210826_Med1
order DDErrorA02XNS20210820_Med1
order DDErrorA02XNS20210806_Med1
order DDErrorA02XNS20210730_Med1
order DDErrorA02XNS20210723_Med1
order DDErrorA02XNS20210715_Med1
order DDErrorA02XNS20210702_Med1
order DDErrorA02XNS20210625_Med1
order DDErrorA02XNS20210618_Med1
order DDErrorA02XNS20210610_Med1
order DDErrorA02XNS20210604_Med1
order DDErrorA02XNS20210528_Med1
order DDErrorA02XNS20210521_Med1
order DDErrorA02XNS20210514_Med1
order DDErrorA02XNS20210506_Med1
order DDErrorA02XNS20210423_Med1
order DDErrorA02XNS20210416_Med1
order DDErrorA02XNS20210409_Med1
order DDErrorA02XNS20210401_Med1
order DDErrorA02XNS20210325_Med1
order DDErrorA02XNS20210317_Med1
order DDErrorA02XNS20210311_Med1
order DDErrorA02XNS20210306_Med1
order DDErrorA02XNS20210225_Med1
order DDErrorA02XNS20210220_Med1
order DDErrorA02XNS20210212_Med1
order DDErrorA02XNS20210204_Med1
order DDErrorA02XNS20210128_Med1
order DDErrorA02XNS20210122_Med1
order DDErrorA02XNS20210115_Med1
order DDErrorA02XNS20201223_Med1
order DDErrorA02XNS20201217_Med1
order DDErrorA02XNS20201210_Med1
order DDErrorA02XNS20201203_Med1
order DDErrorA02XNS20201119_Med1
order DDErrorA02XNS20201112_Med1
order DDErrorA02XNS20201029_Med1
order DDErrorA02XNS20201022_Med1
order DDErrorA02XNS20201015_Med1
order DDErrorA02XNS20201009_Med1
order DDErrorA02XNS20201002_Med1
order DDErrorA02XNS20200924_Med1
order DDErrorA02XNS20200918_Med1
order DDErrorA02XNS20200911_Med1
order DDErrorA02XNS20200903_Med1
order DDErrorA02XNS20200827_Med1
order DDErrorA02XNS20200821_Med1
order DDErrorA02XNS20200806_Med1
order DDErrorA02XNS20200730_Med1
order DDErrorA02XNS20200722_Med1
order DDErrorA02XNS20200714_Med1
order DDErrorA02XNS20200707_Med1
order DDErrorA02XNS20200629_Med1
order DDErrorA02XNS20200625_Med1
order DDErrorA02XNS20200615_Med1
order DDErrorA02XNS20200610_Med1
order DDErrorA02XNS20200608_Med1
order DDErrorA02XNS20200605_Med1
order DDErrorA02XNS20200529_Med1
order DDErrorA02XNS20200526_Med1
order DDErrorA02XNS20200525_Med1
order DDErrorA02XNS20200520_Med1
order DDErrorA02XNS20200512_Med1
order DDErrorA02XNS20200510_Med1
order DDErrorA02XNS20200504_Med1
order DDErrorA02XNS20200429_Med1
order DDErrorA02XNS20200428_Med1
order DDErrorA02XNS20200427_Med1
order DDErrorA02XNS20200422_Med1

		
egen DDErrorA02XNS_Mean1 = rowmean(DDErrorA02XNS20200422_Med1-DDErrorA02XNS20211221_Med1) 
label var DDErrorA02XNS_Mean1 "DayDeaMeSmA02S01XNS mean over updates of median error by epi weeks"







order DDAbsErrA02XNS20211221_Med1
order DDAbsErrA02XNS20211104_Med1
order DDAbsErrA02XNS20211021_Med1
order DDAbsErrA02XNS20211015_Med1
order DDAbsErrA02XNS20210930_Med1
order DDAbsErrA02XNS20210923_Med1
order DDAbsErrA02XNS20210916_Med1
order DDAbsErrA02XNS20210910_Med1
order DDAbsErrA02XNS20210902_Med1
order DDAbsErrA02XNS20210826_Med1
order DDAbsErrA02XNS20210820_Med1
order DDAbsErrA02XNS20210806_Med1
order DDAbsErrA02XNS20210730_Med1
order DDAbsErrA02XNS20210723_Med1
order DDAbsErrA02XNS20210715_Med1
order DDAbsErrA02XNS20210702_Med1
order DDAbsErrA02XNS20210625_Med1
order DDAbsErrA02XNS20210618_Med1
order DDAbsErrA02XNS20210610_Med1
order DDAbsErrA02XNS20210604_Med1
order DDAbsErrA02XNS20210528_Med1
order DDAbsErrA02XNS20210521_Med1
order DDAbsErrA02XNS20210514_Med1
order DDAbsErrA02XNS20210506_Med1
order DDAbsErrA02XNS20210423_Med1
order DDAbsErrA02XNS20210416_Med1
order DDAbsErrA02XNS20210409_Med1
order DDAbsErrA02XNS20210401_Med1
order DDAbsErrA02XNS20210325_Med1
order DDAbsErrA02XNS20210317_Med1
order DDAbsErrA02XNS20210311_Med1
order DDAbsErrA02XNS20210306_Med1
order DDAbsErrA02XNS20210225_Med1
order DDAbsErrA02XNS20210220_Med1
order DDAbsErrA02XNS20210212_Med1
order DDAbsErrA02XNS20210204_Med1
order DDAbsErrA02XNS20210128_Med1
order DDAbsErrA02XNS20210122_Med1
order DDAbsErrA02XNS20210115_Med1
order DDAbsErrA02XNS20201223_Med1
order DDAbsErrA02XNS20201217_Med1
order DDAbsErrA02XNS20201210_Med1
order DDAbsErrA02XNS20201203_Med1
order DDAbsErrA02XNS20201119_Med1
order DDAbsErrA02XNS20201112_Med1
order DDAbsErrA02XNS20201029_Med1
order DDAbsErrA02XNS20201022_Med1
order DDAbsErrA02XNS20201015_Med1
order DDAbsErrA02XNS20201009_Med1
order DDAbsErrA02XNS20201002_Med1
order DDAbsErrA02XNS20200924_Med1
order DDAbsErrA02XNS20200918_Med1
order DDAbsErrA02XNS20200911_Med1
order DDAbsErrA02XNS20200903_Med1
order DDAbsErrA02XNS20200827_Med1
order DDAbsErrA02XNS20200821_Med1
order DDAbsErrA02XNS20200806_Med1
order DDAbsErrA02XNS20200730_Med1
order DDAbsErrA02XNS20200722_Med1
order DDAbsErrA02XNS20200714_Med1
order DDAbsErrA02XNS20200707_Med1
order DDAbsErrA02XNS20200629_Med1
order DDAbsErrA02XNS20200625_Med1
order DDAbsErrA02XNS20200615_Med1
order DDAbsErrA02XNS20200610_Med1
order DDAbsErrA02XNS20200608_Med1
order DDAbsErrA02XNS20200605_Med1
order DDAbsErrA02XNS20200529_Med1
order DDAbsErrA02XNS20200526_Med1
order DDAbsErrA02XNS20200525_Med1
order DDAbsErrA02XNS20200520_Med1
order DDAbsErrA02XNS20200512_Med1
order DDAbsErrA02XNS20200510_Med1
order DDAbsErrA02XNS20200504_Med1
order DDAbsErrA02XNS20200429_Med1
order DDAbsErrA02XNS20200428_Med1
order DDAbsErrA02XNS20200427_Med1
order DDAbsErrA02XNS20200422_Med1



egen DDAbsErrA02XNS_Mean1 = rowmean(DDAbsErrA02XNS20200422_Med1-DDAbsErrA02XNS20211221_Med1) 
label var DDAbsErrA02XNS_Mean1 "DayDeaMeSmA02S01XNS mean over updates of median absolute error by epi weeks"










order DDPerErrA02XNS20211221_Med1
order DDPerErrA02XNS20211104_Med1
order DDPerErrA02XNS20211021_Med1
order DDPerErrA02XNS20211015_Med1
order DDPerErrA02XNS20210930_Med1
order DDPerErrA02XNS20210923_Med1
order DDPerErrA02XNS20210916_Med1
order DDPerErrA02XNS20210910_Med1
order DDPerErrA02XNS20210902_Med1
order DDPerErrA02XNS20210826_Med1
order DDPerErrA02XNS20210820_Med1
order DDPerErrA02XNS20210806_Med1
order DDPerErrA02XNS20210730_Med1
order DDPerErrA02XNS20210723_Med1
order DDPerErrA02XNS20210715_Med1
order DDPerErrA02XNS20210702_Med1
order DDPerErrA02XNS20210625_Med1
order DDPerErrA02XNS20210618_Med1
order DDPerErrA02XNS20210610_Med1
order DDPerErrA02XNS20210604_Med1
order DDPerErrA02XNS20210528_Med1
order DDPerErrA02XNS20210521_Med1
order DDPerErrA02XNS20210514_Med1
order DDPerErrA02XNS20210506_Med1
order DDPerErrA02XNS20210423_Med1
order DDPerErrA02XNS20210416_Med1
order DDPerErrA02XNS20210409_Med1
order DDPerErrA02XNS20210401_Med1
order DDPerErrA02XNS20210325_Med1
order DDPerErrA02XNS20210317_Med1
order DDPerErrA02XNS20210311_Med1
order DDPerErrA02XNS20210306_Med1
order DDPerErrA02XNS20210225_Med1
order DDPerErrA02XNS20210220_Med1
order DDPerErrA02XNS20210212_Med1
order DDPerErrA02XNS20210204_Med1
order DDPerErrA02XNS20210128_Med1
order DDPerErrA02XNS20210122_Med1
order DDPerErrA02XNS20210115_Med1
order DDPerErrA02XNS20201223_Med1
order DDPerErrA02XNS20201217_Med1
order DDPerErrA02XNS20201210_Med1
order DDPerErrA02XNS20201203_Med1
order DDPerErrA02XNS20201119_Med1
order DDPerErrA02XNS20201112_Med1
order DDPerErrA02XNS20201029_Med1
order DDPerErrA02XNS20201022_Med1
order DDPerErrA02XNS20201015_Med1
order DDPerErrA02XNS20201009_Med1
order DDPerErrA02XNS20201002_Med1
order DDPerErrA02XNS20200924_Med1
order DDPerErrA02XNS20200918_Med1
order DDPerErrA02XNS20200911_Med1
order DDPerErrA02XNS20200903_Med1
order DDPerErrA02XNS20200827_Med1
order DDPerErrA02XNS20200821_Med1
order DDPerErrA02XNS20200806_Med1
order DDPerErrA02XNS20200730_Med1
order DDPerErrA02XNS20200722_Med1
order DDPerErrA02XNS20200714_Med1
order DDPerErrA02XNS20200707_Med1
order DDPerErrA02XNS20200629_Med1
order DDPerErrA02XNS20200625_Med1
order DDPerErrA02XNS20200615_Med1
order DDPerErrA02XNS20200610_Med1
order DDPerErrA02XNS20200608_Med1
order DDPerErrA02XNS20200605_Med1
order DDPerErrA02XNS20200529_Med1
order DDPerErrA02XNS20200526_Med1
order DDPerErrA02XNS20200525_Med1
order DDPerErrA02XNS20200520_Med1
order DDPerErrA02XNS20200512_Med1
order DDPerErrA02XNS20200510_Med1
order DDPerErrA02XNS20200504_Med1
order DDPerErrA02XNS20200429_Med1
order DDPerErrA02XNS20200428_Med1
order DDPerErrA02XNS20200427_Med1
order DDPerErrA02XNS20200422_Med1


egen DDPerErrA02XNS_Mean1 = rowmean(DDPerErrA02XNS20200422_Med1-DDPerErrA02XNS20211221_Med1) 
label var DDPerErrA02XNS_Mean1 "DayDeaMeSmA02S01XNS mean over updates of median % error by epi weeks"






order DDAbPeErA02XNS20211221_Med1
order DDAbPeErA02XNS20211104_Med1
order DDAbPeErA02XNS20211021_Med1
order DDAbPeErA02XNS20211015_Med1
order DDAbPeErA02XNS20210930_Med1
order DDAbPeErA02XNS20210923_Med1
order DDAbPeErA02XNS20210916_Med1
order DDAbPeErA02XNS20210910_Med1
order DDAbPeErA02XNS20210902_Med1
order DDAbPeErA02XNS20210826_Med1
order DDAbPeErA02XNS20210820_Med1
order DDAbPeErA02XNS20210806_Med1
order DDAbPeErA02XNS20210730_Med1
order DDAbPeErA02XNS20210723_Med1
order DDAbPeErA02XNS20210715_Med1
order DDAbPeErA02XNS20210702_Med1
order DDAbPeErA02XNS20210625_Med1
order DDAbPeErA02XNS20210618_Med1
order DDAbPeErA02XNS20210610_Med1
order DDAbPeErA02XNS20210604_Med1
order DDAbPeErA02XNS20210528_Med1
order DDAbPeErA02XNS20210521_Med1
order DDAbPeErA02XNS20210514_Med1
order DDAbPeErA02XNS20210506_Med1
order DDAbPeErA02XNS20210423_Med1
order DDAbPeErA02XNS20210416_Med1
order DDAbPeErA02XNS20210409_Med1
order DDAbPeErA02XNS20210401_Med1
order DDAbPeErA02XNS20210325_Med1
order DDAbPeErA02XNS20210317_Med1
order DDAbPeErA02XNS20210311_Med1
order DDAbPeErA02XNS20210306_Med1
order DDAbPeErA02XNS20210225_Med1
order DDAbPeErA02XNS20210220_Med1
order DDAbPeErA02XNS20210212_Med1
order DDAbPeErA02XNS20210204_Med1
order DDAbPeErA02XNS20210128_Med1
order DDAbPeErA02XNS20210122_Med1
order DDAbPeErA02XNS20210115_Med1
order DDAbPeErA02XNS20201223_Med1
order DDAbPeErA02XNS20201217_Med1
order DDAbPeErA02XNS20201210_Med1
order DDAbPeErA02XNS20201203_Med1
order DDAbPeErA02XNS20201119_Med1
order DDAbPeErA02XNS20201112_Med1
order DDAbPeErA02XNS20201029_Med1
order DDAbPeErA02XNS20201022_Med1
order DDAbPeErA02XNS20201015_Med1
order DDAbPeErA02XNS20201009_Med1
order DDAbPeErA02XNS20201002_Med1
order DDAbPeErA02XNS20200924_Med1
order DDAbPeErA02XNS20200918_Med1
order DDAbPeErA02XNS20200911_Med1
order DDAbPeErA02XNS20200903_Med1
order DDAbPeErA02XNS20200827_Med1
order DDAbPeErA02XNS20200821_Med1
order DDAbPeErA02XNS20200806_Med1
order DDAbPeErA02XNS20200730_Med1
order DDAbPeErA02XNS20200722_Med1
order DDAbPeErA02XNS20200714_Med1
order DDAbPeErA02XNS20200707_Med1
order DDAbPeErA02XNS20200629_Med1
order DDAbPeErA02XNS20200625_Med1
order DDAbPeErA02XNS20200615_Med1
order DDAbPeErA02XNS20200610_Med1
order DDAbPeErA02XNS20200608_Med1
order DDAbPeErA02XNS20200605_Med1
order DDAbPeErA02XNS20200529_Med1
order DDAbPeErA02XNS20200526_Med1
order DDAbPeErA02XNS20200525_Med1
order DDAbPeErA02XNS20200520_Med1
order DDAbPeErA02XNS20200512_Med1
order DDAbPeErA02XNS20200510_Med1
order DDAbPeErA02XNS20200504_Med1
order DDAbPeErA02XNS20200429_Med1
order DDAbPeErA02XNS20200428_Med1
order DDAbPeErA02XNS20200427_Med1
order DDAbPeErA02XNS20200422_Med1

egen DDAbPeErA02XNS_Mean1 = rowmean(DDAbPeErA02XNS20200422_Med1-DDAbPeErA02XNS20211221_Med1) 
label var DDAbPeErA02XNS_Mean1 "DayDeaMeSmA02S01XNS mean over updates of median absolute % error by epi weeks"


* 
 
  


* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2
 
		
egen DDErrorA02XNS_Mean2 = mean(DDErrorA02XNS_Mean1) // get mean for all epi weeks of _Mean1
label var DDErrorA02XNS_Mean2 "DayDeaMeSmA02S01XNS Mean over epi weeks of median error over updates"

egen DDAbsErrA02XNS_Mean2 = mean(DDAbsErrA02XNS_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbsErrA02XNS_Mean2 "DayDeaMeSmA02S01XNS Mean over epi weeks of median absolute error over updates"

egen DDPerErrA02XNS_Mean2 = mean(DDPerErrA02XNS_Mean1) // get mean for all epi weeks of _Mean1
label var DDPerErrA02XNS_Mean2 "DayDeaMeSmA02S01XNS Mean over epi weeks of median Pecent error over updates"

egen DDAbPeErA02XNS_Mean2 = mean(DDAbPeErA02XNS_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbPeErA02XNS_Mean2 "DayDeaMeSmA02S01XNS Mean over epi weeks of median absolute % error over updates"


*




qui compress

save "CovidLongitudinal IHME 3 Nova Scotia.dta", replace






************

* graphs



grstyle init

grstyle color background white



***************************************************************
* 7 Daily deaths, Nova Scotia, mean over updates of median error by epi weeks

twoway ///
(line DDErrorA02XNS_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 7 Nova Scotia C19 daily deaths error, $country, IHME, Error Mean1.pdf", replace







***************************************************************
* 8 Daily deaths, Nova Scotia, mean over updates of median absolute error by epi weeks

twoway ///
(line DDAbsErrA02XNS_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 8 Nova Scotia C19 daily deaths error, $country, IHME, Absolute Error Mean1.pdf", replace






***************************************************************
* 9 Daily deaths, Nova Scotia, mean over updates of median % error by epi weeks

twoway ///
(line DDPerErrA02XNS_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median % error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 9 Nova Scotia C19 daily deaths error, $country, IHME, Percent Error Mean1.pdf", replace





***************************************************************
* 10 Daily deaths, Nova Scotia, mean over updates of median absolute % error by epi weeks

twoway ///
(line DDAbPeErA02XNS_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of MAPE by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, IHME; MAPE: Median Absolute Percent Error", size(small)) yscale(titlegap(4)) 

qui graph export "graph 10 Nova Scotia C19 daily deaths error, $country, IHME, Absolute Percent Error Mean1.pdf", replace







keep loc_grand_name provincestate date DDAbPeErA02XNS_Mean1 DDAbPeErA02XNS_Mean2

save "CovidLongitudinal IHME 3 Nova Scotia Mean1 Mean2.dta", replace







**********************

view "log CovidLongitudinal IHME 10.smcl"

log close

exit, clear
