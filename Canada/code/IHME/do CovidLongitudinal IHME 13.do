
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 13.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 13.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* weeks time bin
* location = Saskatchewan // XSK
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Saskatchewan.dta",
*                    "CovidLongitudinal IHME 3 Saskatchewan Mean1 Mean2.dta"



use "CovidLongitudinal IHME 3", clear

save "CovidLongitudinal IHME 3 Saskatchewan.dta", replace

keep if provincestate == "Saskatchewan" 

drop *XAB *XBC *XMB *XXX *XNS *XON *XQC 

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
		
bysort epi_yrwk : egen DDErrorA02XSK`update'_Med1 = median(DDErrorA02XSK`update')
label var DDErrorA02XSK`update'_Med1 "DayDeaMeSmA02S01XSK`update' median error by epi weeks and updates"

bysort epi_yrwk : egen DDAbsErrA02XSK`update'_Med1 = median(DDAbsErrA02XSK`update')
label var DDAbsErrA02XSK`update'_Med1 "DayDeaMeSmA02S01XSK`update' median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DDPerErrA02XSK`update'_Med1 = median(DDPerErrA02XSK`update')
label var DDPerErrA02XSK`update'_Med1 "DayDeaMeSmA02S01XSK`update' median % error by epi weeks and updates"

bysort epi_yrwk : egen DDAbPeErA02XSK`update'_Med1 = median(DDAbPeErA02XSK`update')
label var DDAbPeErA02XSK`update'_Med1 "DayDeaMeSmA02S01XSK`update' median absolute % error by epi weeks and updates" 

	
}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1




order DDErrorA02XSK20211221_Med1
order DDErrorA02XSK20211104_Med1
order DDErrorA02XSK20211021_Med1
order DDErrorA02XSK20211015_Med1
order DDErrorA02XSK20210930_Med1
order DDErrorA02XSK20210923_Med1
order DDErrorA02XSK20210916_Med1
order DDErrorA02XSK20210910_Med1
order DDErrorA02XSK20210902_Med1
order DDErrorA02XSK20210826_Med1
order DDErrorA02XSK20210820_Med1
order DDErrorA02XSK20210806_Med1
order DDErrorA02XSK20210730_Med1
order DDErrorA02XSK20210723_Med1
order DDErrorA02XSK20210715_Med1
order DDErrorA02XSK20210702_Med1
order DDErrorA02XSK20210625_Med1
order DDErrorA02XSK20210618_Med1
order DDErrorA02XSK20210610_Med1
order DDErrorA02XSK20210604_Med1
order DDErrorA02XSK20210528_Med1
order DDErrorA02XSK20210521_Med1
order DDErrorA02XSK20210514_Med1
order DDErrorA02XSK20210506_Med1
order DDErrorA02XSK20210423_Med1
order DDErrorA02XSK20210416_Med1
order DDErrorA02XSK20210409_Med1
order DDErrorA02XSK20210401_Med1
order DDErrorA02XSK20210325_Med1
order DDErrorA02XSK20210317_Med1
order DDErrorA02XSK20210311_Med1
order DDErrorA02XSK20210306_Med1
order DDErrorA02XSK20210225_Med1
order DDErrorA02XSK20210220_Med1
order DDErrorA02XSK20210212_Med1
order DDErrorA02XSK20210204_Med1
order DDErrorA02XSK20210128_Med1
order DDErrorA02XSK20210122_Med1
order DDErrorA02XSK20210115_Med1
order DDErrorA02XSK20201223_Med1
order DDErrorA02XSK20201217_Med1
order DDErrorA02XSK20201210_Med1
order DDErrorA02XSK20201203_Med1
order DDErrorA02XSK20201119_Med1
order DDErrorA02XSK20201112_Med1
order DDErrorA02XSK20201029_Med1
order DDErrorA02XSK20201022_Med1
order DDErrorA02XSK20201015_Med1
order DDErrorA02XSK20201009_Med1
order DDErrorA02XSK20201002_Med1
order DDErrorA02XSK20200924_Med1
order DDErrorA02XSK20200918_Med1
order DDErrorA02XSK20200911_Med1
order DDErrorA02XSK20200903_Med1
order DDErrorA02XSK20200827_Med1
order DDErrorA02XSK20200821_Med1
order DDErrorA02XSK20200806_Med1
order DDErrorA02XSK20200730_Med1
order DDErrorA02XSK20200722_Med1
order DDErrorA02XSK20200714_Med1
order DDErrorA02XSK20200707_Med1
order DDErrorA02XSK20200629_Med1
order DDErrorA02XSK20200625_Med1
order DDErrorA02XSK20200615_Med1
order DDErrorA02XSK20200610_Med1
order DDErrorA02XSK20200608_Med1
order DDErrorA02XSK20200605_Med1
order DDErrorA02XSK20200529_Med1
order DDErrorA02XSK20200526_Med1
order DDErrorA02XSK20200525_Med1
order DDErrorA02XSK20200520_Med1
order DDErrorA02XSK20200512_Med1
order DDErrorA02XSK20200510_Med1
order DDErrorA02XSK20200504_Med1
order DDErrorA02XSK20200429_Med1
order DDErrorA02XSK20200428_Med1
order DDErrorA02XSK20200427_Med1
order DDErrorA02XSK20200422_Med1

		
egen DDErrorA02XSK_Mean1 = rowmean(DDErrorA02XSK20200422_Med1-DDErrorA02XSK20211221_Med1) 
label var DDErrorA02XSK_Mean1 "DayDeaMeSmA02S01XSK mean over updates of median error by epi weeks"







order DDAbsErrA02XSK20211221_Med1
order DDAbsErrA02XSK20211104_Med1
order DDAbsErrA02XSK20211021_Med1
order DDAbsErrA02XSK20211015_Med1
order DDAbsErrA02XSK20210930_Med1
order DDAbsErrA02XSK20210923_Med1
order DDAbsErrA02XSK20210916_Med1
order DDAbsErrA02XSK20210910_Med1
order DDAbsErrA02XSK20210902_Med1
order DDAbsErrA02XSK20210826_Med1
order DDAbsErrA02XSK20210820_Med1
order DDAbsErrA02XSK20210806_Med1
order DDAbsErrA02XSK20210730_Med1
order DDAbsErrA02XSK20210723_Med1
order DDAbsErrA02XSK20210715_Med1
order DDAbsErrA02XSK20210702_Med1
order DDAbsErrA02XSK20210625_Med1
order DDAbsErrA02XSK20210618_Med1
order DDAbsErrA02XSK20210610_Med1
order DDAbsErrA02XSK20210604_Med1
order DDAbsErrA02XSK20210528_Med1
order DDAbsErrA02XSK20210521_Med1
order DDAbsErrA02XSK20210514_Med1
order DDAbsErrA02XSK20210506_Med1
order DDAbsErrA02XSK20210423_Med1
order DDAbsErrA02XSK20210416_Med1
order DDAbsErrA02XSK20210409_Med1
order DDAbsErrA02XSK20210401_Med1
order DDAbsErrA02XSK20210325_Med1
order DDAbsErrA02XSK20210317_Med1
order DDAbsErrA02XSK20210311_Med1
order DDAbsErrA02XSK20210306_Med1
order DDAbsErrA02XSK20210225_Med1
order DDAbsErrA02XSK20210220_Med1
order DDAbsErrA02XSK20210212_Med1
order DDAbsErrA02XSK20210204_Med1
order DDAbsErrA02XSK20210128_Med1
order DDAbsErrA02XSK20210122_Med1
order DDAbsErrA02XSK20210115_Med1
order DDAbsErrA02XSK20201223_Med1
order DDAbsErrA02XSK20201217_Med1
order DDAbsErrA02XSK20201210_Med1
order DDAbsErrA02XSK20201203_Med1
order DDAbsErrA02XSK20201119_Med1
order DDAbsErrA02XSK20201112_Med1
order DDAbsErrA02XSK20201029_Med1
order DDAbsErrA02XSK20201022_Med1
order DDAbsErrA02XSK20201015_Med1
order DDAbsErrA02XSK20201009_Med1
order DDAbsErrA02XSK20201002_Med1
order DDAbsErrA02XSK20200924_Med1
order DDAbsErrA02XSK20200918_Med1
order DDAbsErrA02XSK20200911_Med1
order DDAbsErrA02XSK20200903_Med1
order DDAbsErrA02XSK20200827_Med1
order DDAbsErrA02XSK20200821_Med1
order DDAbsErrA02XSK20200806_Med1
order DDAbsErrA02XSK20200730_Med1
order DDAbsErrA02XSK20200722_Med1
order DDAbsErrA02XSK20200714_Med1
order DDAbsErrA02XSK20200707_Med1
order DDAbsErrA02XSK20200629_Med1
order DDAbsErrA02XSK20200625_Med1
order DDAbsErrA02XSK20200615_Med1
order DDAbsErrA02XSK20200610_Med1
order DDAbsErrA02XSK20200608_Med1
order DDAbsErrA02XSK20200605_Med1
order DDAbsErrA02XSK20200529_Med1
order DDAbsErrA02XSK20200526_Med1
order DDAbsErrA02XSK20200525_Med1
order DDAbsErrA02XSK20200520_Med1
order DDAbsErrA02XSK20200512_Med1
order DDAbsErrA02XSK20200510_Med1
order DDAbsErrA02XSK20200504_Med1
order DDAbsErrA02XSK20200429_Med1
order DDAbsErrA02XSK20200428_Med1
order DDAbsErrA02XSK20200427_Med1
order DDAbsErrA02XSK20200422_Med1



egen DDAbsErrA02XSK_Mean1 = rowmean(DDAbsErrA02XSK20200422_Med1-DDAbsErrA02XSK20211221_Med1) 
label var DDAbsErrA02XSK_Mean1 "DayDeaMeSmA02S01XSK mean over updates of median absolute error by epi weeks"










order DDPerErrA02XSK20211221_Med1
order DDPerErrA02XSK20211104_Med1
order DDPerErrA02XSK20211021_Med1
order DDPerErrA02XSK20211015_Med1
order DDPerErrA02XSK20210930_Med1
order DDPerErrA02XSK20210923_Med1
order DDPerErrA02XSK20210916_Med1
order DDPerErrA02XSK20210910_Med1
order DDPerErrA02XSK20210902_Med1
order DDPerErrA02XSK20210826_Med1
order DDPerErrA02XSK20210820_Med1
order DDPerErrA02XSK20210806_Med1
order DDPerErrA02XSK20210730_Med1
order DDPerErrA02XSK20210723_Med1
order DDPerErrA02XSK20210715_Med1
order DDPerErrA02XSK20210702_Med1
order DDPerErrA02XSK20210625_Med1
order DDPerErrA02XSK20210618_Med1
order DDPerErrA02XSK20210610_Med1
order DDPerErrA02XSK20210604_Med1
order DDPerErrA02XSK20210528_Med1
order DDPerErrA02XSK20210521_Med1
order DDPerErrA02XSK20210514_Med1
order DDPerErrA02XSK20210506_Med1
order DDPerErrA02XSK20210423_Med1
order DDPerErrA02XSK20210416_Med1
order DDPerErrA02XSK20210409_Med1
order DDPerErrA02XSK20210401_Med1
order DDPerErrA02XSK20210325_Med1
order DDPerErrA02XSK20210317_Med1
order DDPerErrA02XSK20210311_Med1
order DDPerErrA02XSK20210306_Med1
order DDPerErrA02XSK20210225_Med1
order DDPerErrA02XSK20210220_Med1
order DDPerErrA02XSK20210212_Med1
order DDPerErrA02XSK20210204_Med1
order DDPerErrA02XSK20210128_Med1
order DDPerErrA02XSK20210122_Med1
order DDPerErrA02XSK20210115_Med1
order DDPerErrA02XSK20201223_Med1
order DDPerErrA02XSK20201217_Med1
order DDPerErrA02XSK20201210_Med1
order DDPerErrA02XSK20201203_Med1
order DDPerErrA02XSK20201119_Med1
order DDPerErrA02XSK20201112_Med1
order DDPerErrA02XSK20201029_Med1
order DDPerErrA02XSK20201022_Med1
order DDPerErrA02XSK20201015_Med1
order DDPerErrA02XSK20201009_Med1
order DDPerErrA02XSK20201002_Med1
order DDPerErrA02XSK20200924_Med1
order DDPerErrA02XSK20200918_Med1
order DDPerErrA02XSK20200911_Med1
order DDPerErrA02XSK20200903_Med1
order DDPerErrA02XSK20200827_Med1
order DDPerErrA02XSK20200821_Med1
order DDPerErrA02XSK20200806_Med1
order DDPerErrA02XSK20200730_Med1
order DDPerErrA02XSK20200722_Med1
order DDPerErrA02XSK20200714_Med1
order DDPerErrA02XSK20200707_Med1
order DDPerErrA02XSK20200629_Med1
order DDPerErrA02XSK20200625_Med1
order DDPerErrA02XSK20200615_Med1
order DDPerErrA02XSK20200610_Med1
order DDPerErrA02XSK20200608_Med1
order DDPerErrA02XSK20200605_Med1
order DDPerErrA02XSK20200529_Med1
order DDPerErrA02XSK20200526_Med1
order DDPerErrA02XSK20200525_Med1
order DDPerErrA02XSK20200520_Med1
order DDPerErrA02XSK20200512_Med1
order DDPerErrA02XSK20200510_Med1
order DDPerErrA02XSK20200504_Med1
order DDPerErrA02XSK20200429_Med1
order DDPerErrA02XSK20200428_Med1
order DDPerErrA02XSK20200427_Med1
order DDPerErrA02XSK20200422_Med1


egen DDPerErrA02XSK_Mean1 = rowmean(DDPerErrA02XSK20200422_Med1-DDPerErrA02XSK20211221_Med1) 
label var DDPerErrA02XSK_Mean1 "DayDeaMeSmA02S01XSK mean over updates of median % error by epi weeks"






order DDAbPeErA02XSK20211221_Med1
order DDAbPeErA02XSK20211104_Med1
order DDAbPeErA02XSK20211021_Med1
order DDAbPeErA02XSK20211015_Med1
order DDAbPeErA02XSK20210930_Med1
order DDAbPeErA02XSK20210923_Med1
order DDAbPeErA02XSK20210916_Med1
order DDAbPeErA02XSK20210910_Med1
order DDAbPeErA02XSK20210902_Med1
order DDAbPeErA02XSK20210826_Med1
order DDAbPeErA02XSK20210820_Med1
order DDAbPeErA02XSK20210806_Med1
order DDAbPeErA02XSK20210730_Med1
order DDAbPeErA02XSK20210723_Med1
order DDAbPeErA02XSK20210715_Med1
order DDAbPeErA02XSK20210702_Med1
order DDAbPeErA02XSK20210625_Med1
order DDAbPeErA02XSK20210618_Med1
order DDAbPeErA02XSK20210610_Med1
order DDAbPeErA02XSK20210604_Med1
order DDAbPeErA02XSK20210528_Med1
order DDAbPeErA02XSK20210521_Med1
order DDAbPeErA02XSK20210514_Med1
order DDAbPeErA02XSK20210506_Med1
order DDAbPeErA02XSK20210423_Med1
order DDAbPeErA02XSK20210416_Med1
order DDAbPeErA02XSK20210409_Med1
order DDAbPeErA02XSK20210401_Med1
order DDAbPeErA02XSK20210325_Med1
order DDAbPeErA02XSK20210317_Med1
order DDAbPeErA02XSK20210311_Med1
order DDAbPeErA02XSK20210306_Med1
order DDAbPeErA02XSK20210225_Med1
order DDAbPeErA02XSK20210220_Med1
order DDAbPeErA02XSK20210212_Med1
order DDAbPeErA02XSK20210204_Med1
order DDAbPeErA02XSK20210128_Med1
order DDAbPeErA02XSK20210122_Med1
order DDAbPeErA02XSK20210115_Med1
order DDAbPeErA02XSK20201223_Med1
order DDAbPeErA02XSK20201217_Med1
order DDAbPeErA02XSK20201210_Med1
order DDAbPeErA02XSK20201203_Med1
order DDAbPeErA02XSK20201119_Med1
order DDAbPeErA02XSK20201112_Med1
order DDAbPeErA02XSK20201029_Med1
order DDAbPeErA02XSK20201022_Med1
order DDAbPeErA02XSK20201015_Med1
order DDAbPeErA02XSK20201009_Med1
order DDAbPeErA02XSK20201002_Med1
order DDAbPeErA02XSK20200924_Med1
order DDAbPeErA02XSK20200918_Med1
order DDAbPeErA02XSK20200911_Med1
order DDAbPeErA02XSK20200903_Med1
order DDAbPeErA02XSK20200827_Med1
order DDAbPeErA02XSK20200821_Med1
order DDAbPeErA02XSK20200806_Med1
order DDAbPeErA02XSK20200730_Med1
order DDAbPeErA02XSK20200722_Med1
order DDAbPeErA02XSK20200714_Med1
order DDAbPeErA02XSK20200707_Med1
order DDAbPeErA02XSK20200629_Med1
order DDAbPeErA02XSK20200625_Med1
order DDAbPeErA02XSK20200615_Med1
order DDAbPeErA02XSK20200610_Med1
order DDAbPeErA02XSK20200608_Med1
order DDAbPeErA02XSK20200605_Med1
order DDAbPeErA02XSK20200529_Med1
order DDAbPeErA02XSK20200526_Med1
order DDAbPeErA02XSK20200525_Med1
order DDAbPeErA02XSK20200520_Med1
order DDAbPeErA02XSK20200512_Med1
order DDAbPeErA02XSK20200510_Med1
order DDAbPeErA02XSK20200504_Med1
order DDAbPeErA02XSK20200429_Med1
order DDAbPeErA02XSK20200428_Med1
order DDAbPeErA02XSK20200427_Med1
order DDAbPeErA02XSK20200422_Med1

egen DDAbPeErA02XSK_Mean1 = rowmean(DDAbPeErA02XSK20200422_Med1-DDAbPeErA02XSK20211221_Med1) 
label var DDAbPeErA02XSK_Mean1 "DayDeaMeSmA02S01XSK mean over updates of median absolute % error by epi weeks"


* 
 
  


* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2
 
		
egen DDErrorA02XSK_Mean2 = mean(DDErrorA02XSK_Mean1) // get mean for all epi weeks of _Mean1
label var DDErrorA02XSK_Mean2 "DayDeaMeSmA02S01XSK Mean over epi weeks of median error over updates"

egen DDAbsErrA02XSK_Mean2 = mean(DDAbsErrA02XSK_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbsErrA02XSK_Mean2 "DayDeaMeSmA02S01XSK Mean over epi weeks of median absolute error over updates"

egen DDPerErrA02XSK_Mean2 = mean(DDPerErrA02XSK_Mean1) // get mean for all epi weeks of _Mean1
label var DDPerErrA02XSK_Mean2 "DayDeaMeSmA02S01XSK Mean over epi weeks of median Pecent error over updates"

egen DDAbPeErA02XSK_Mean2 = mean(DDAbPeErA02XSK_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbPeErA02XSK_Mean2 "DayDeaMeSmA02S01XSK Mean over epi weeks of median absolute % error over updates"


*




qui compress

save "CovidLongitudinal IHME 3 Saskatchewan.dta", replace






************

* graphs



grstyle init

grstyle color background white



***************************************************************
* 7 Daily deaths, Saskatchewan, mean over updates of median error by epi weeks

twoway ///
(line DDErrorA02XSK_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by epiweeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 7 Saskatchewan C19 daily deaths error, $country, IHME, Error Mean1.pdf", replace







***************************************************************
* 8 Daily deaths, Saskatchewan, mean over updates of median absolute error by epi weeks

twoway ///
(line DDAbsErrA02XSK_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median absolute error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 8 Saskatchewan C19 daily deaths error, $country, IHME, Absolute Error Mean1.pdf", replace






***************************************************************
* 9 Daily deaths, Saskatchewan, mean over updates of median % error by epi weeks

twoway ///
(line DDPerErrA02XSK_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median % error by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 9 Saskatchewan C19 daily deaths error, $country, IHME, Percent Error Mean1.pdf", replace





***************************************************************
* 10 Daily deaths, Saskatchewan, mean over updates of median absolute % error by epi weeks

twoway ///
(line DDAbPeErA02XSK_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of MAPE by epi weeks", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, IHME; MAPE: Median Absolute Percent Error", size(small)) yscale(titlegap(4)) 

qui graph export "graph 10 Saskatchewan C19 daily deaths error, $country, IHME, Absolute Percent Error Mean1.pdf", replace







keep loc_grand_name provincestate date DDAbPeErA02XSK_Mean1 DDAbPeErA02XSK_Mean2

save "CovidLongitudinal IHME 3 Saskatchewan Mean1 Mean2.dta", replace







**********************

view "log CovidLongitudinal IHME 13.smcl"

log close

exit, clear
