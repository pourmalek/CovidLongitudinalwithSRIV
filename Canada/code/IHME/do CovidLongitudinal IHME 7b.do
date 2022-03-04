
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 7b.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 7b.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* months time bin
* location = British Columbia // XBC
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3b British Columbia.dta", 
*                    "CovidLongitudinal IHME 3b British Columbia Mean1b Mean2.dta"




use "CovidLongitudinal IHME 3", clear

save "CovidLongitudinal IHME 3b British Columbia.dta", replace

keep if provincestate == "British Columbia" 

drop *XAB      *XMB *XXX *XNS *XON *XQC *XSK

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





* gen months time bin


gen month = month(date)

gen monthstr = ""
replace monthstr = "01" if month == 1
replace monthstr = "02" if month == 2
replace monthstr = "03" if month == 3

replace monthstr = "04" if month == 4
replace monthstr = "05" if month == 5
replace monthstr = "06" if month == 6

replace monthstr = "07" if month == 7
replace monthstr = "08" if month == 8
replace monthstr = "09" if month == 9

replace monthstr = "10" if month == 10
replace monthstr = "11" if month == 11
replace monthstr = "12" if month == 12



egen year_month = concat(epi_year monthstr), p(m)

sort provincestate date epi_year year_month epi_week



encode year_month, gen(year_month_encoded)





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



* (2) gen MEDIAN of error types by calendar months and updates = _Med1b

* Wait note: wait ...

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 
		
bysort year_month : egen DDErrorA02XBC`update'_Med1b = median(DDErrorA02XBC`update')
label var DDErrorA02XBC`update'_Med1b "DayDeaMeSmA02S01XBC`update' median error by calendar months and updates"

bysort year_month : egen DDAbsErrA02XBC`update'_Med1b = median(DDAbsErrA02XBC`update')
label var DDAbsErrA02XBC`update'_Med1b "DayDeaMeSmA02S01XBC`update' median absolute error by calendar months and updates"

bysort year_month : egen DDPerErrA02XBC`update'_Med1b = median(DDPerErrA02XBC`update')
label var DDPerErrA02XBC`update'_Med1b "DayDeaMeSmA02S01XBC`update' median % error by calendar months and updates"

bysort year_month : egen DDAbPeErA02XBC`update'_Med1b = median(DDAbPeErA02XBC`update')
label var DDAbPeErA02XBC`update'_Med1b "DayDeaMeSmA02S01XBC`update' median absolute % error by calendar months and updates" 

	
}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1b




order DDErrorA02XBC20211221_Med1b
order DDErrorA02XBC20211104_Med1b
order DDErrorA02XBC20211021_Med1b
order DDErrorA02XBC20211015_Med1b
order DDErrorA02XBC20210930_Med1b
order DDErrorA02XBC20210923_Med1b
order DDErrorA02XBC20210916_Med1b
order DDErrorA02XBC20210910_Med1b
order DDErrorA02XBC20210902_Med1b
order DDErrorA02XBC20210826_Med1b
order DDErrorA02XBC20210820_Med1b
order DDErrorA02XBC20210806_Med1b
order DDErrorA02XBC20210730_Med1b
order DDErrorA02XBC20210723_Med1b
order DDErrorA02XBC20210715_Med1b
order DDErrorA02XBC20210702_Med1b
order DDErrorA02XBC20210625_Med1b
order DDErrorA02XBC20210618_Med1b
order DDErrorA02XBC20210610_Med1b
order DDErrorA02XBC20210604_Med1b
order DDErrorA02XBC20210528_Med1b
order DDErrorA02XBC20210521_Med1b
order DDErrorA02XBC20210514_Med1b
order DDErrorA02XBC20210506_Med1b
order DDErrorA02XBC20210423_Med1b
order DDErrorA02XBC20210416_Med1b
order DDErrorA02XBC20210409_Med1b
order DDErrorA02XBC20210401_Med1b
order DDErrorA02XBC20210325_Med1b
order DDErrorA02XBC20210317_Med1b
order DDErrorA02XBC20210311_Med1b
order DDErrorA02XBC20210306_Med1b
order DDErrorA02XBC20210225_Med1b
order DDErrorA02XBC20210220_Med1b
order DDErrorA02XBC20210212_Med1b
order DDErrorA02XBC20210204_Med1b
order DDErrorA02XBC20210128_Med1b
order DDErrorA02XBC20210122_Med1b
order DDErrorA02XBC20210115_Med1b
order DDErrorA02XBC20201223_Med1b
order DDErrorA02XBC20201217_Med1b
order DDErrorA02XBC20201210_Med1b
order DDErrorA02XBC20201203_Med1b
order DDErrorA02XBC20201119_Med1b
order DDErrorA02XBC20201112_Med1b
order DDErrorA02XBC20201029_Med1b
order DDErrorA02XBC20201022_Med1b
order DDErrorA02XBC20201015_Med1b
order DDErrorA02XBC20201009_Med1b
order DDErrorA02XBC20201002_Med1b
order DDErrorA02XBC20200924_Med1b
order DDErrorA02XBC20200918_Med1b
order DDErrorA02XBC20200911_Med1b
order DDErrorA02XBC20200903_Med1b
order DDErrorA02XBC20200827_Med1b
order DDErrorA02XBC20200821_Med1b
order DDErrorA02XBC20200806_Med1b
order DDErrorA02XBC20200730_Med1b
order DDErrorA02XBC20200722_Med1b
order DDErrorA02XBC20200714_Med1b
order DDErrorA02XBC20200707_Med1b
order DDErrorA02XBC20200629_Med1b
order DDErrorA02XBC20200625_Med1b
order DDErrorA02XBC20200615_Med1b
order DDErrorA02XBC20200610_Med1b
order DDErrorA02XBC20200608_Med1b
order DDErrorA02XBC20200605_Med1b
order DDErrorA02XBC20200529_Med1b
order DDErrorA02XBC20200526_Med1b
order DDErrorA02XBC20200525_Med1b
order DDErrorA02XBC20200520_Med1b
order DDErrorA02XBC20200512_Med1b
order DDErrorA02XBC20200510_Med1b
order DDErrorA02XBC20200504_Med1b
order DDErrorA02XBC20200429_Med1b
order DDErrorA02XBC20200428_Med1b
order DDErrorA02XBC20200427_Med1b
order DDErrorA02XBC20200422_Med1b

		
egen DDErrorA02XBC_Mean1b = rowmean(DDErrorA02XBC20200422_Med1b-DDErrorA02XBC20211221_Med1b) 
label var DDErrorA02XBC_Mean1b "DayDeaMeSmA02S01XBC mean over updates of median error by calendar months"







order DDAbsErrA02XBC20211221_Med1b
order DDAbsErrA02XBC20211104_Med1b
order DDAbsErrA02XBC20211021_Med1b
order DDAbsErrA02XBC20211015_Med1b
order DDAbsErrA02XBC20210930_Med1b
order DDAbsErrA02XBC20210923_Med1b
order DDAbsErrA02XBC20210916_Med1b
order DDAbsErrA02XBC20210910_Med1b
order DDAbsErrA02XBC20210902_Med1b
order DDAbsErrA02XBC20210826_Med1b
order DDAbsErrA02XBC20210820_Med1b
order DDAbsErrA02XBC20210806_Med1b
order DDAbsErrA02XBC20210730_Med1b
order DDAbsErrA02XBC20210723_Med1b
order DDAbsErrA02XBC20210715_Med1b
order DDAbsErrA02XBC20210702_Med1b
order DDAbsErrA02XBC20210625_Med1b
order DDAbsErrA02XBC20210618_Med1b
order DDAbsErrA02XBC20210610_Med1b
order DDAbsErrA02XBC20210604_Med1b
order DDAbsErrA02XBC20210528_Med1b
order DDAbsErrA02XBC20210521_Med1b
order DDAbsErrA02XBC20210514_Med1b
order DDAbsErrA02XBC20210506_Med1b
order DDAbsErrA02XBC20210423_Med1b
order DDAbsErrA02XBC20210416_Med1b
order DDAbsErrA02XBC20210409_Med1b
order DDAbsErrA02XBC20210401_Med1b
order DDAbsErrA02XBC20210325_Med1b
order DDAbsErrA02XBC20210317_Med1b
order DDAbsErrA02XBC20210311_Med1b
order DDAbsErrA02XBC20210306_Med1b
order DDAbsErrA02XBC20210225_Med1b
order DDAbsErrA02XBC20210220_Med1b
order DDAbsErrA02XBC20210212_Med1b
order DDAbsErrA02XBC20210204_Med1b
order DDAbsErrA02XBC20210128_Med1b
order DDAbsErrA02XBC20210122_Med1b
order DDAbsErrA02XBC20210115_Med1b
order DDAbsErrA02XBC20201223_Med1b
order DDAbsErrA02XBC20201217_Med1b
order DDAbsErrA02XBC20201210_Med1b
order DDAbsErrA02XBC20201203_Med1b
order DDAbsErrA02XBC20201119_Med1b
order DDAbsErrA02XBC20201112_Med1b
order DDAbsErrA02XBC20201029_Med1b
order DDAbsErrA02XBC20201022_Med1b
order DDAbsErrA02XBC20201015_Med1b
order DDAbsErrA02XBC20201009_Med1b
order DDAbsErrA02XBC20201002_Med1b
order DDAbsErrA02XBC20200924_Med1b
order DDAbsErrA02XBC20200918_Med1b
order DDAbsErrA02XBC20200911_Med1b
order DDAbsErrA02XBC20200903_Med1b
order DDAbsErrA02XBC20200827_Med1b
order DDAbsErrA02XBC20200821_Med1b
order DDAbsErrA02XBC20200806_Med1b
order DDAbsErrA02XBC20200730_Med1b
order DDAbsErrA02XBC20200722_Med1b
order DDAbsErrA02XBC20200714_Med1b
order DDAbsErrA02XBC20200707_Med1b
order DDAbsErrA02XBC20200629_Med1b
order DDAbsErrA02XBC20200625_Med1b
order DDAbsErrA02XBC20200615_Med1b
order DDAbsErrA02XBC20200610_Med1b
order DDAbsErrA02XBC20200608_Med1b
order DDAbsErrA02XBC20200605_Med1b
order DDAbsErrA02XBC20200529_Med1b
order DDAbsErrA02XBC20200526_Med1b
order DDAbsErrA02XBC20200525_Med1b
order DDAbsErrA02XBC20200520_Med1b
order DDAbsErrA02XBC20200512_Med1b
order DDAbsErrA02XBC20200510_Med1b
order DDAbsErrA02XBC20200504_Med1b
order DDAbsErrA02XBC20200429_Med1b
order DDAbsErrA02XBC20200428_Med1b
order DDAbsErrA02XBC20200427_Med1b
order DDAbsErrA02XBC20200422_Med1b



egen DDAbsErrA02XBC_Mean1b = rowmean(DDAbsErrA02XBC20200422_Med1b-DDAbsErrA02XBC20211221_Med1b) 
label var DDAbsErrA02XBC_Mean1b "DayDeaMeSmA02S01XBC mean over updates of median absolute error by calendar months"










order DDPerErrA02XBC20211221_Med1b
order DDPerErrA02XBC20211104_Med1b
order DDPerErrA02XBC20211021_Med1b
order DDPerErrA02XBC20211015_Med1b
order DDPerErrA02XBC20210930_Med1b
order DDPerErrA02XBC20210923_Med1b
order DDPerErrA02XBC20210916_Med1b
order DDPerErrA02XBC20210910_Med1b
order DDPerErrA02XBC20210902_Med1b
order DDPerErrA02XBC20210826_Med1b
order DDPerErrA02XBC20210820_Med1b
order DDPerErrA02XBC20210806_Med1b
order DDPerErrA02XBC20210730_Med1b
order DDPerErrA02XBC20210723_Med1b
order DDPerErrA02XBC20210715_Med1b
order DDPerErrA02XBC20210702_Med1b
order DDPerErrA02XBC20210625_Med1b
order DDPerErrA02XBC20210618_Med1b
order DDPerErrA02XBC20210610_Med1b
order DDPerErrA02XBC20210604_Med1b
order DDPerErrA02XBC20210528_Med1b
order DDPerErrA02XBC20210521_Med1b
order DDPerErrA02XBC20210514_Med1b
order DDPerErrA02XBC20210506_Med1b
order DDPerErrA02XBC20210423_Med1b
order DDPerErrA02XBC20210416_Med1b
order DDPerErrA02XBC20210409_Med1b
order DDPerErrA02XBC20210401_Med1b
order DDPerErrA02XBC20210325_Med1b
order DDPerErrA02XBC20210317_Med1b
order DDPerErrA02XBC20210311_Med1b
order DDPerErrA02XBC20210306_Med1b
order DDPerErrA02XBC20210225_Med1b
order DDPerErrA02XBC20210220_Med1b
order DDPerErrA02XBC20210212_Med1b
order DDPerErrA02XBC20210204_Med1b
order DDPerErrA02XBC20210128_Med1b
order DDPerErrA02XBC20210122_Med1b
order DDPerErrA02XBC20210115_Med1b
order DDPerErrA02XBC20201223_Med1b
order DDPerErrA02XBC20201217_Med1b
order DDPerErrA02XBC20201210_Med1b
order DDPerErrA02XBC20201203_Med1b
order DDPerErrA02XBC20201119_Med1b
order DDPerErrA02XBC20201112_Med1b
order DDPerErrA02XBC20201029_Med1b
order DDPerErrA02XBC20201022_Med1b
order DDPerErrA02XBC20201015_Med1b
order DDPerErrA02XBC20201009_Med1b
order DDPerErrA02XBC20201002_Med1b
order DDPerErrA02XBC20200924_Med1b
order DDPerErrA02XBC20200918_Med1b
order DDPerErrA02XBC20200911_Med1b
order DDPerErrA02XBC20200903_Med1b
order DDPerErrA02XBC20200827_Med1b
order DDPerErrA02XBC20200821_Med1b
order DDPerErrA02XBC20200806_Med1b
order DDPerErrA02XBC20200730_Med1b
order DDPerErrA02XBC20200722_Med1b
order DDPerErrA02XBC20200714_Med1b
order DDPerErrA02XBC20200707_Med1b
order DDPerErrA02XBC20200629_Med1b
order DDPerErrA02XBC20200625_Med1b
order DDPerErrA02XBC20200615_Med1b
order DDPerErrA02XBC20200610_Med1b
order DDPerErrA02XBC20200608_Med1b
order DDPerErrA02XBC20200605_Med1b
order DDPerErrA02XBC20200529_Med1b
order DDPerErrA02XBC20200526_Med1b
order DDPerErrA02XBC20200525_Med1b
order DDPerErrA02XBC20200520_Med1b
order DDPerErrA02XBC20200512_Med1b
order DDPerErrA02XBC20200510_Med1b
order DDPerErrA02XBC20200504_Med1b
order DDPerErrA02XBC20200429_Med1b
order DDPerErrA02XBC20200428_Med1b
order DDPerErrA02XBC20200427_Med1b
order DDPerErrA02XBC20200422_Med1b


egen DDPerErrA02XBC_Mean1b = rowmean(DDPerErrA02XBC20200422_Med1b-DDPerErrA02XBC20211221_Med1b) 
label var DDPerErrA02XBC_Mean1b "DayDeaMeSmA02S01XBC mean over updates of median % error by calendar months"






order DDAbPeErA02XBC20211221_Med1b
order DDAbPeErA02XBC20211104_Med1b
order DDAbPeErA02XBC20211021_Med1b
order DDAbPeErA02XBC20211015_Med1b
order DDAbPeErA02XBC20210930_Med1b
order DDAbPeErA02XBC20210923_Med1b
order DDAbPeErA02XBC20210916_Med1b
order DDAbPeErA02XBC20210910_Med1b
order DDAbPeErA02XBC20210902_Med1b
order DDAbPeErA02XBC20210826_Med1b
order DDAbPeErA02XBC20210820_Med1b
order DDAbPeErA02XBC20210806_Med1b
order DDAbPeErA02XBC20210730_Med1b
order DDAbPeErA02XBC20210723_Med1b
order DDAbPeErA02XBC20210715_Med1b
order DDAbPeErA02XBC20210702_Med1b
order DDAbPeErA02XBC20210625_Med1b
order DDAbPeErA02XBC20210618_Med1b
order DDAbPeErA02XBC20210610_Med1b
order DDAbPeErA02XBC20210604_Med1b
order DDAbPeErA02XBC20210528_Med1b
order DDAbPeErA02XBC20210521_Med1b
order DDAbPeErA02XBC20210514_Med1b
order DDAbPeErA02XBC20210506_Med1b
order DDAbPeErA02XBC20210423_Med1b
order DDAbPeErA02XBC20210416_Med1b
order DDAbPeErA02XBC20210409_Med1b
order DDAbPeErA02XBC20210401_Med1b
order DDAbPeErA02XBC20210325_Med1b
order DDAbPeErA02XBC20210317_Med1b
order DDAbPeErA02XBC20210311_Med1b
order DDAbPeErA02XBC20210306_Med1b
order DDAbPeErA02XBC20210225_Med1b
order DDAbPeErA02XBC20210220_Med1b
order DDAbPeErA02XBC20210212_Med1b
order DDAbPeErA02XBC20210204_Med1b
order DDAbPeErA02XBC20210128_Med1b
order DDAbPeErA02XBC20210122_Med1b
order DDAbPeErA02XBC20210115_Med1b
order DDAbPeErA02XBC20201223_Med1b
order DDAbPeErA02XBC20201217_Med1b
order DDAbPeErA02XBC20201210_Med1b
order DDAbPeErA02XBC20201203_Med1b
order DDAbPeErA02XBC20201119_Med1b
order DDAbPeErA02XBC20201112_Med1b
order DDAbPeErA02XBC20201029_Med1b
order DDAbPeErA02XBC20201022_Med1b
order DDAbPeErA02XBC20201015_Med1b
order DDAbPeErA02XBC20201009_Med1b
order DDAbPeErA02XBC20201002_Med1b
order DDAbPeErA02XBC20200924_Med1b
order DDAbPeErA02XBC20200918_Med1b
order DDAbPeErA02XBC20200911_Med1b
order DDAbPeErA02XBC20200903_Med1b
order DDAbPeErA02XBC20200827_Med1b
order DDAbPeErA02XBC20200821_Med1b
order DDAbPeErA02XBC20200806_Med1b
order DDAbPeErA02XBC20200730_Med1b
order DDAbPeErA02XBC20200722_Med1b
order DDAbPeErA02XBC20200714_Med1b
order DDAbPeErA02XBC20200707_Med1b
order DDAbPeErA02XBC20200629_Med1b
order DDAbPeErA02XBC20200625_Med1b
order DDAbPeErA02XBC20200615_Med1b
order DDAbPeErA02XBC20200610_Med1b
order DDAbPeErA02XBC20200608_Med1b
order DDAbPeErA02XBC20200605_Med1b
order DDAbPeErA02XBC20200529_Med1b
order DDAbPeErA02XBC20200526_Med1b
order DDAbPeErA02XBC20200525_Med1b
order DDAbPeErA02XBC20200520_Med1b
order DDAbPeErA02XBC20200512_Med1b
order DDAbPeErA02XBC20200510_Med1b
order DDAbPeErA02XBC20200504_Med1b
order DDAbPeErA02XBC20200429_Med1b
order DDAbPeErA02XBC20200428_Med1b
order DDAbPeErA02XBC20200427_Med1b
order DDAbPeErA02XBC20200422_Med1b

egen DDAbPeErA02XBC_Mean1b = rowmean(DDAbPeErA02XBC20200422_Med1b-DDAbPeErA02XBC20211221_Med1b) 
label var DDAbPeErA02XBC_Mean1b "DayDeaMeSmA02S01XBC mean over updates of median absolute % error by calendar months"


* 
 
  


* (4) gen AVERAGE over calendar months of _Mean1b  = _Mean2
 
		
egen DDErrorA02XBC_Mean2 = mean(DDErrorA02XBC_Mean1b) // get mean for all calendar months of _Mean1b
label var DDErrorA02XBC_Mean2 "DayDeaMeSmA02S01XBC Mean over calendar months of median error over updates"

egen DDAbsErrA02XBC_Mean2 = mean(DDAbsErrA02XBC_Mean1b) // get mean for all calendar months of _Mean1b
label var DDAbsErrA02XBC_Mean2 "DayDeaMeSmA02S01XBC Mean over calendar months of median absolute error over updates"

egen DDPerErrA02XBC_Mean2 = mean(DDPerErrA02XBC_Mean1b) // get mean for all calendar months of _Mean1b
label var DDPerErrA02XBC_Mean2 "DayDeaMeSmA02S01XBC Mean over calendar months of median Pecent error over updates"

egen DDAbPeErA02XBC_Mean2 = mean(DDAbPeErA02XBC_Mean1b) // get mean for all calendar months of _Mean1b
label var DDAbPeErA02XBC_Mean2 "DayDeaMeSmA02S01XBC Mean over calendar months of median absolute % error over updates"


*




qui compress

save "CovidLongitudinal IHME 3b British Columbia.dta", replace






************

* graphs



grstyle init

grstyle color background white



***************************************************************
* 7 Daily deaths, British Columbia, mean over updates of median error by calendar months

twoway ///
(line DDErrorA02XBC_Mean1b date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by months", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 7b British Columbia C19 daily deaths error, $country, IHME, Error Mean1b.pdf", replace







***************************************************************
* 8 Daily deaths, British Columbia, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA02XBC_Mean1b date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 8b British Columbia C19 daily deaths error, $country, IHME, Absolute Error Mean1b.pdf", replace






***************************************************************
* 9 Daily deaths, British Columbia, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA02XBC_Mean1b date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median % error by calendar months", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, IHME", size(small)) yscale(titlegap(4)) 

qui graph export "graph 9b British Columbia C19 daily deaths error, $country, IHME, Percent Error Mean1b.pdf", replace





***************************************************************
* 10 Daily deaths, British Columbia, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA02XBC_Mean1b date, sort lcolor(black) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of MAPE by calendar months", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, IHME; MAPE: Median Absolute Percent Error", size(small)) yscale(titlegap(4)) 

qui graph export "graph 10b British Columbia C19 daily deaths error, $country, IHME, Absolute Percent Error Mean1b.pdf", replace







keep loc_grand_name provincestate date DDAbPeErA02XBC_Mean1b DDAbPeErA02XBC_Mean2

save "CovidLongitudinal IHME 3b British Columbia Mean1b Mean2.dta", replace







**********************

view "log CovidLongitudinal IHME 7b.smcl"

log close

exit, clear
