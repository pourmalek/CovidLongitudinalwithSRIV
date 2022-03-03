
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 6b.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 6b.do"

* Project: Longitudinal assessment of C19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* months time bin 

* continue graphs, daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by calendar months and updates
* 7  mean over updates of median error by calendar months
* 8  median absolute error by calendar months and updates
* 9  mean over updates of median absolute error by calendar months
* 10 median % error by calendar months and updates
* 11 mean over updates of median % error by calendar months
* 12 median absolute % error by calendar months and updates
* 13 mean over updates of median absolute % error by calendar months
* 14 average MAPE over updates and calendar months (single value for each location-model)
* input data files: "CovidLongitudinal DELP 4.dta"
* output data files: none. No change in data. 







grstyle init

grstyle color background white


use "CovidLongitudinal DELP 4.dta", clear 




*****************

** graphs





* National

***********************************************







***********************************************

* 110 6b Daily deaths, National, median error by calendar months and updates

twoway ///
(line DDErrorA01XXX20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XXX20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small)) 

qui graph export "graph 110 06b C19 daily deaths, $country, National, DELP, Error median1.pdf", replace






***********************************************

* 110 7b Daily deaths, National, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XXX_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small))  

qui graph export "graph 110 07b C19 daily deaths, $country, National, DELP, Error Mean1b.pdf", replace










***********************************************

* 110 8b Daily deaths, National, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XXX20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XXX20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small)) 

qui graph export "graph 110 08b C19 daily deaths, $country, National, DELP, Absolute Error median1.pdf", replace






***********************************************

* 110 9b Daily deaths, National, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XXX_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small)) 

qui graph export "graph 110 9b C19 daily deaths, $country, National, DELP, Absolute Error Mean1b.pdf", replace









***********************************************

* 110 10b Daily deaths, National, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XXX20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XXX20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small)) 

qui graph export "graph 110 10b C19 daily deaths, $country, National, DELP, Percent Error median1.pdf", replace






***********************************************

* 110 11b Daily deaths, National, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XXX_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small))

qui graph export "graph 110 11b C19 daily deaths, $country, National, DELP, Percent Error Mean1b.pdf", replace







***********************************************

* 110 12b Daily deaths, National, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XXX20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XXX20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small))

qui graph export "graph 110 12b C19 daily deaths, $country, National, DELP, Absolute Percent Error median1.pdf", replace






***********************************************


* 110 13b Daily deaths, National, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XXX_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, National, DELP, Forecast only", size(small)) 

qui graph export "graph 110 13b C19 daily deaths, $country, National, DELP, Absolute Percent Error Mean1b.pdf", replace














* Alberta

***********************************************







***********************************************

* 111 6b Daily deaths, Alberta, median error by calendar months and updates

twoway ///
(line DDErrorA01XAB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XAB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small)) 

qui graph export "graph 111 06b C19 daily deaths, $country, Alberta, DELP, Error median1.pdf", replace






***********************************************

* 111 7b Daily deaths, Alberta, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XAB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small))  

qui graph export "graph 111 07b C19 daily deaths, $country, Alberta, DELP, Error Mean1b.pdf", replace








***********************************************

* 111 8b Daily deaths, Alberta, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XAB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XAB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small)) 

qui graph export "graph 111 08b C19 daily deaths, $country, Alberta, DELP, absolute Error median1.pdf", replace






***********************************************

* 111 9b Daily deaths, Alberta, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XAB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small)) 

qui graph export "graph 111 09b C19 daily deaths, $country, Alberta, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 111 10b Daily deaths, Alberta, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XAB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XAB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small)) 

qui graph export "graph 111 10b C19 daily deaths, $country, Alberta, DELP, % Error median1.pdf", replace






***********************************************

* 111 11b Daily deaths, Alberta, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XAB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small))

qui graph export "graph 111 11b C19 daily deaths, $country, Alberta, DELP, % Error Mean1b.pdf", replace







***********************************************

* 111 12b Daily deaths, Alberta, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XAB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XAB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small))

qui graph export "graph 111 12b C19 daily deaths, $country, Alberta, DELP, absolute % Error median1.pdf", replace






***********************************************


* 111 13b Daily deaths, Alberta, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XAB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Alberta, DELP, Forecast only", size(small)) 

qui graph export "graph 111 13b C19 daily deaths, $country, Alberta, DELP, absolute % Error Mean1b.pdf", replace














* British Columbia

***********************************************






***********************************************

* 112 6b Daily deaths, British Columbia, median error by calendar months and updates

twoway ///
(line DDErrorA01XBC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XBC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small)) 

qui graph export "graph 112 06b C19 daily deaths, $country, British Columbia, DELP, Error median1.pdf", replace






***********************************************

* 112 7b Daily deaths, British Columbia, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XBC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small))  

qui graph export "graph 112 07b C19 daily deaths, $country, British Columbia, DELP, Error Mean1b.pdf", replace








***********************************************

* 112 8b Daily deaths, British Columbia, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XBC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XBC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small)) 

qui graph export "graph 112 08b C19 daily deaths, $country, British Columbia, DELP, absolute Error median1.pdf", replace






***********************************************

* 112 9b Daily deaths, British Columbia, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XBC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small)) 

qui graph export "graph 112 09b C19 daily deaths, $country, British Columbia, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 112 10b Daily deaths, British Columbia, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XBC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XBC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small)) 

qui graph export "graph 112 10b C19 daily deaths, $country, British Columbia, DELP, % Error median1.pdf", replace






***********************************************

* 112 11b Daily deaths, British Columbia, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XBC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small))

qui graph export "graph 112 11b C19 daily deaths, $country, British Columbia, DELP, % Error Mean1b.pdf", replace







***********************************************

* 112 12b Daily deaths, British Columbia, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XBC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XBC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small))

qui graph export "graph 112 12b C19 daily deaths, $country, British Columbia, DELP, absolute % Error median1.pdf", replace






***********************************************


* 112 13b Daily deaths, British Columbia, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XBC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, British Columbia, DELP, Forecast only", size(small)) 

qui graph export "graph 112 13b C19 daily deaths, $country, British Columbia, DELP, absolute % Error Mean1b.pdf", replace















* Manitoba

***********************************************






***********************************************

* 113 6b Daily deaths, Manitoba, median error by calendar months and updates

twoway ///
(line DDErrorA01XMB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XMB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small)) 

qui graph export "graph 113 06b C19 daily deaths, $country, Manitoba, DELP, Error median1.pdf", replace






***********************************************

* 113 7b Daily deaths, Manitoba, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XMB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small))  

qui graph export "graph 113 07b C19 daily deaths, $country, Manitoba, DELP, Error Mean1b.pdf", replace








***********************************************

* 113 8b Daily deaths, Manitoba, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XMB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XMB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small)) 

qui graph export "graph 113 08b C19 daily deaths, $country, Manitoba, DELP, absolute Error median1.pdf", replace






***********************************************

* 113 9b Daily deaths, Manitoba, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XMB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small)) 

qui graph export "graph 113 09b C19 daily deaths, $country, Manitoba, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 113 10b Daily deaths, Manitoba, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XMB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XMB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small)) 

qui graph export "graph 113 10b C19 daily deaths, $country, Manitoba, DELP, % Error median1.pdf", replace






***********************************************

* 113 11b Daily deaths, Manitoba, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XMB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small))

qui graph export "graph 113 11b C19 daily deaths, $country, Manitoba, DELP, % Error Mean1b.pdf", replace







***********************************************

* 113 12b Daily deaths, Manitoba, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XMB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XMB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small))

qui graph export "graph 113 12b C19 daily deaths, $country, Manitoba, DELP, absolute % Error median1.pdf", replace






***********************************************


* 113 13b Daily deaths, Manitoba, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XMB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Manitoba, DELP, Forecast only", size(small)) 

qui graph export "graph 113 13b C19 daily deaths, $country, Manitoba, DELP, absolute % Error Mean1b.pdf", replace















* New Brunswick

***********************************************






***********************************************

* 114 6b Daily deaths, New Brunswick, median error by calendar months and updates

twoway ///
(line DDErrorA01XNB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small)) 

qui graph export "graph 114 06b C19 daily deaths, $country, New Brunswick, DELP, Error median1.pdf", replace






***********************************************

* 114 7b Daily deaths, New Brunswick, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XNB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small))  

qui graph export "graph 114 07b C19 daily deaths, $country, New Brunswick, DELP, Error Mean1b.pdf", replace








***********************************************

* 114 8b Daily deaths, New Brunswick, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XNB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small)) 

qui graph export "graph 114 08b C19 daily deaths, $country, New Brunswick, DELP, absolute Error median1.pdf", replace






***********************************************

* 114 9b Daily deaths, New Brunswick, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XNB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small)) 

qui graph export "graph 114 09b C19 daily deaths, $country, New Brunswick, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 114 10b Daily deaths, New Brunswick, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XNB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small)) 

qui graph export "graph 114 10b C19 daily deaths, $country, New Brunswick, DELP, % Error median1.pdf", replace






***********************************************

* 114 11b Daily deaths, New Brunswick, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XNB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small))

qui graph export "graph 114 11b C19 daily deaths, $country, New Brunswick, DELP, % Error Mean1b.pdf", replace







***********************************************

* 114 12b Daily deaths, New Brunswick, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XNB20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNB20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small))

qui graph export "graph 114 12b C19 daily deaths, $country, New Brunswick, DELP, absolute % Error median1.pdf", replace






***********************************************


* 114 13b Daily deaths, New Brunswick, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XNB_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, New Brunswick, DELP, Forecast only", size(small)) 

qui graph export "graph 114 13b C19 daily deaths, $country, New Brunswick, DELP, absolute % Error Mean1b.pdf", replace





















* Newfoundland & Labrador

***********************************************







***********************************************

* 115 6b Daily deaths, Newfoundland & Labrador, median error by calendar months and updates

twoway ///
(line DDErrorA01XNL20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNL20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small)) 

qui graph export "graph 115 06b C19 daily deaths, $country, Newfoundland & Labrador, DELP, Error median1.pdf", replace






***********************************************

* 115 7b Daily deaths, Newfoundland & Labrador, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XNL_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small))  

qui graph export "graph 115 07b C19 daily deaths, $country, Newfoundland & Labrador, DELP, Error Mean1b.pdf", replace








***********************************************

* 115 8b Daily deaths, Newfoundland & Labrador, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XNL20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNL20211231_Med1b date, sort lcolor(red) lwidth(medium)) ///
if date >= td(01jan2020) & date <= td(01jan2022) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small)) 

qui graph export "graph 115 08b C19 daily deaths, $country, Newfoundland & Labrador, DELP, absolute Error median1.pdf", replace






***********************************************

* 115 9b Daily deaths, Newfoundland & Labrador, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XNL_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small)) 

qui graph export "graph 115 09b C19 daily deaths, $country, Newfoundland & Labrador, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 115 10b Daily deaths, Newfoundland & Labrador, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XNL20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNL20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small)) 

qui graph export "graph 115 10 C19 daily deaths, $country, Newfoundland & Labrador, DELP, % Error median1.pdf", replace






***********************************************

* 115 11b Daily deaths, Newfoundland & Labrador, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XNL_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small))

qui graph export "graph 115 11b C19 daily deaths, $country, Newfoundland & Labrador, DELP, % Error Mean1b.pdf", replace







***********************************************

* 115 12b Daily deaths, Newfoundland & Labrador, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XNL20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNL20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small))

qui graph export "graph 115 12b C19 daily deaths, $country, Newfoundland & Labrador, DELP, absolute % Error median1.pdf", replace






***********************************************


* 115 13b Daily deaths, Newfoundland & Labrador, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XNL_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Newfoundland & Labrador, DELP, Forecast only", size(small)) 

qui graph export "graph 115 13b C19 daily deaths, $country, Newfoundland & Labrador, DELP, absolute % Error Mean1b.pdf", replace

















* Nova Scotia

***********************************************






***********************************************

* 116 6b Daily deaths, Nova Scotia, median error by calendar months and updates

twoway ///
(line DDErrorA01XNS20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XNS20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small)) 

qui graph export "graph 116 06b C19 daily deaths, $country, Nova Scotia, DELP, Error median1.pdf", replace






***********************************************

* 116 7b Daily deaths, Nova Scotia, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XNS_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small))  

qui graph export "graph 116 07b C19 daily deaths, $country, Nova Scotia, DELP, Error Mean1b.pdf", replace








***********************************************

* 116 8b Daily deaths, Nova Scotia, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XNS20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XNS20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small)) 

qui graph export "graph 116 08b C19 daily deaths, $country, Nova Scotia, DELP, absolute Error median1.pdf", replace






***********************************************

* 116 9b Daily deaths, Nova Scotia, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XNS_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small)) 

qui graph export "graph 116 09b C19 daily deaths, $country, Nova Scotia, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 116 10b Daily deaths, Nova Scotia, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XNS20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XNS20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small)) 

qui graph export "graph 116 10b C19 daily deaths, $country, Nova Scotia, DELP, % Error median1.pdf", replace






***********************************************

* 116 11b Daily deaths, Nova Scotia, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XNS_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small))

qui graph export "graph 116 11b C19 daily deaths, $country, Nova Scotia, DELP, % Error Mean1b.pdf", replace







***********************************************

* 116 12b Daily deaths, Nova Scotia, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XNS20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XNS20211231_Med1b date, sort lcolor(red) lwidth(medium)) ///
if date >= td(01jan2020) & date <= td(01jan2022) /// 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small))

qui graph export "graph 116 12b C19 daily deaths, $country, Nova Scotia, DELP, absolute % Error median1.pdf", replace






***********************************************


* 116 13b Daily deaths, Nova Scotia, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XNS_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Nova Scotia, DELP, Forecast only", size(small)) 

qui graph export "graph 116 13b C19 daily deaths, $country, Nova Scotia, DELP, absolute % Error Mean1b.pdf", replace















* Ontario

***********************************************





***********************************************

* 117 6b Daily deaths, Ontario, median error by calendar months and updates

twoway ///
(line DDErrorA01XON20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XON20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small)) 

qui graph export "graph 117 06b C19 daily deaths, $country, Ontario, DELP, Error median1.pdf", replace






***********************************************

* 117 7b Daily deaths, Ontario, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XON_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small))  

qui graph export "graph 117 07b C19 daily deaths, $country, Ontario, DELP, Error Mean1b.pdf", replace








***********************************************

* 117 8b Daily deaths, Ontario, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XON20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XON20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small)) 

qui graph export "graph 117 08b C19 daily deaths, $country, Ontario, DELP, absolute Error median1.pdf", replace






***********************************************

* 117 9b Daily deaths, Ontario, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XON_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small)) 

qui graph export "graph 117 09b C19 daily deaths, $country, Ontario, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 117 10b Daily deaths, Ontario, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XON20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XON20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small)) 

qui graph export "graph 117 10b C19 daily deaths, $country, Ontario, DELP, % Error median1.pdf", replace






***********************************************

* 117 11b Daily deaths, Ontario, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XON_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small))

qui graph export "graph 117 11b C19 daily deaths, $country, Ontario, DELP, % Error Mean1b.pdf", replace







***********************************************

* 117 12b Daily deaths, Ontario, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XON20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XON20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small))

qui graph export "graph 117 12b C19 daily deaths, $country, Ontario, DELP, absolute % Error median1.pdf", replace






***********************************************


* 117 13b Daily deaths, Ontario, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XON_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Ontario, DELP, Forecast only", size(small)) 

qui graph export "graph 117 13b C19 daily deaths, $country, Ontario, DELP, absolute % Error Mean1b.pdf", replace


















* Quebec

***********************************************







***********************************************

* 118 6b Daily deaths, Quebec, median error by calendar months and updates

twoway ///
(line DDErrorA01XQC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XQC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small)) 

qui graph export "graph 118 06b C19 daily deaths, $country, Quebec, DELP, Error median1.pdf", replace






***********************************************

* 118 7b Daily deaths, Quebec, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XQC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small))  

qui graph export "graph 118 07b C19 daily deaths, $country, Quebec, DELP, Error Mean1b.pdf", replace








***********************************************

* 118 8b Daily deaths, Quebec, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XQC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XQC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small)) 

qui graph export "graph 118 08b C19 daily deaths, $country, Quebec, DELP, absolute Error median1.pdf", replace






***********************************************

* 118 9b Daily deaths, Quebec, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XQC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small)) 

qui graph export "graph 118 09b C19 daily deaths, $country, Quebec, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 118 10b Daily deaths, Quebec, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XQC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XQC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small)) 

qui graph export "graph 118 10b C19 daily deaths, $country, Quebec, DELP, % Error median1.pdf", replace






***********************************************

* 118 11b Daily deaths, Quebec, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XQC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small))

qui graph export "graph 118 11b C19 daily deaths, $country, Quebec, DELP, % Error Mean1b.pdf", replace







***********************************************

* 118 12b Daily deaths, Quebec, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XQC20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XQC20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small))

qui graph export "graph 118 12b C19 daily deaths, $country, Quebec, DELP, absolute % Error median1.pdf", replace






***********************************************


* 118 13b Daily deaths, Quebec, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XQC_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Quebec, DELP, Forecast only", size(small)) 

qui graph export "graph 118 13b C19 daily deaths, $country, Quebec, DELP, absolute % Error Mean1b.pdf", replace















* Saskatchewan

***********************************************






***********************************************

* 119 6b Daily deaths, Saskatchewan, median error by calendar months and updates

twoway ///
(line DDErrorA01XSK20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA01XSK20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small)) 

qui graph export "graph 119 06b C19 daily deaths, $country, Saskatchewan, DELP, Error median1.pdf", replace






***********************************************

* 119 7b Daily deaths, Saskatchewan, AVERAGE over updates of median error by calendar months

twoway ///
(line DDErrorA01XSK_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, mean over updates of median error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small))  

qui graph export "graph 119 07b C19 daily deaths, $country, Saskatchewan, DELP, Error Mean1b.pdf", replace








***********************************************

* 119 8b Daily deaths, Saskatchewan, median absolute error by calendar months and updates

twoway ///
(line DDAbsErrA01XSK20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA01XSK20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small)) 

qui graph export "graph 119 08b C19 daily deaths, $country, Saskatchewan, DELP, absolute Error median1.pdf", replace






***********************************************

* 119 9b Daily deaths, Saskatchewan, mean over updates of median absolute error by calendar months

twoway ///
(line DDAbsErrA01XSK_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small)) 

qui graph export "graph 119 09b C19 daily deaths, $country, Saskatchewan, DELP, absolute Error Mean1b.pdf", replace









***********************************************

* 119 10b Daily deaths, Saskatchewan, median % error by calendar months and updates

twoway ///
(line DDPerErrA01XSK20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA01XSK20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small)) 

qui graph export "graph 119 10b C19 daily deaths, $country, Saskatchewan, DELP, % Error median1.pdf", replace






***********************************************

* 119 11b Daily deaths, Saskatchewan, mean over updates of median % error by calendar months

twoway ///
(line DDPerErrA01XSK_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small))

qui graph export "graph 119 11b C19 daily deaths, $country, Saskatchewan, DELP, % Error Mean1b.pdf", replace







***********************************************

* 119 12b Daily deaths, Saskatchewan, median absolute % error by calendar months and updates

twoway ///
(line DDAbPeErA01XSK20200417_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200424_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200501_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200509_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200517_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200524_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200531_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200607_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200614_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200621_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200628_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200704_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200718_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200723_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20200926_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20201231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210311_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210325_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210408_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210422_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210506_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210520_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210603_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210610_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210617_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210624_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210701_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210708_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210715_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210722_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210729_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210805_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210812_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210819_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210826_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210902_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210909_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210916_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210923_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20210930_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211001_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211002_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211003_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211004_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211005_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211006_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211007_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211008_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211009_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211010_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211011_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211012_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211013_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211014_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211015_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211016_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211017_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211018_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211019_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211020_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211021_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211022_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211023_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211024_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211025_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211026_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211027_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211028_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211029_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211030_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211031_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211101_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211102_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211103_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211104_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211105_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211106_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211107_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211108_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211109_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211110_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211111_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211112_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211113_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211114_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211115_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211116_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211117_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211118_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211119_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211120_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211121_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211122_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211123_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211124_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211125_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211126_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211127_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211128_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211129_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211130_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211201_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211202_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211203_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211204_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211205_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211206_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211207_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211208_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211209_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211210_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211211_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211212_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211213_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211214_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211215_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211216_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211217_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211218_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211219_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211220_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211221_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211222_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211223_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211224_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211225_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211226_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211227_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211228_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211229_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211230_Med1b date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA01XSK20211231_Med1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, median absolute % error by calendar months and updates", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small))

qui graph export "graph 119 12b C19 daily deaths, $country, Saskatchewan, DELP, absolute % Error median1.pdf", replace






***********************************************


* 119 13b Daily deaths, Saskatchewan, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA01XSK_Mean1b date, sort lcolor(red) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off) ///
subtitle("$country, Saskatchewan, DELP, Forecast only", size(small)) 

qui graph export "graph 119 13b C19 daily deaths, $country, Saskatchewan, DELP, absolute % Error Mean1b.pdf", replace










****************************
****************************
****************************

* provinces together







***********************************************


* 120 2 1 Daily deaths, provinces together, mean over updates of median absolute % error by calendar months


twoway ///
(line DDAbPeErA01XXX_Mean1b date, sort lwidth(medium) lcolor(gray)) /// 1 "CAN" 
(line DDAbPeErA01XAB_Mean1b date, sort lwidth(medium) lcolor(cyan)) /// 2 "AB" cyan
(line DDAbPeErA01XBC_Mean1b date, sort lwidth(medium) lcolor(blue)) /// 3 "BC" blue
(line DDAbPeErA01XMB_Mean1b date, sort lwidth(medium) lcolor(lime)) /// 4 "MB" lime
(line DDAbPeErA01XNB_Mean1b date, sort lwidth(medium) lcolor(sienna)) /// 5 "NB" sienna
(line DDAbPeErA01XNL_Mean1b date, sort lwidth(medium) lcolor(gold)) /// 6 "NL" gold
(line DDAbPeErA01XNS_Mean1b date, sort lwidth(medium) lcolor(magenta)) /// 7 "NS" magenta
(line DDAbPeErA01XON_Mean1b date, sort lwidth(medium) lcolor(red)) /// 8 "ON" red
(line DDAbPeErA01XQC_Mean1b date, sort lwidth(medium) lcolor(black)) /// 9 "QC" black
(line DDAbPeErA01XSK_Mean1b date, sort lwidth(medium) lcolor(brown)) /// 10 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, DELP, Forecast only", size(small)) /// 
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NB" 6 "NL" 7 "NS" 8 "ON" 9 "QC" 10 "SK") rows(3) size(small))  

qui graph export "graph 120 2 1 C19 daily deaths, $country, provinces together, DELP, absolute % Error Mean1b.pdf", replace








***********************************************


* 120 2 2 Daily deaths, provinces together, mean over updates of median absolute % error by calendar months
* w/o extremes NS NL

twoway ///
(line DDAbPeErA01XXX_Mean1b date, sort lwidth(vthick) lcolor(gray)) /// 1 "CAN" 
(line DDAbPeErA01XAB_Mean1b date, sort lwidth(medium) lcolor(cyan)) /// 2 "AB" cyan
(line DDAbPeErA01XBC_Mean1b date, sort lwidth(medium) lcolor(blue)) /// 3 "BC" blue
(line DDAbPeErA01XMB_Mean1b date, sort lwidth(medium) lcolor(lime)) /// 4 "MB" lime
(line DDAbPeErA01XNB_Mean1b date, sort lwidth(medium) lcolor(sienna)) /// 5 "NB" sienna
(line DDAbPeErA01XON_Mean1b date, sort lwidth(medium) lcolor(red)) /// 6 "ON" red
(line DDAbPeErA01XQC_Mean1b date, sort lwidth(medium) lcolor(black)) /// 7 "QC" black
(line DDAbPeErA01XSK_Mean1b date, sort lwidth(medium) lcolor(brown)) /// 8 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, DELP, Forecast only, without extremes NS NL", size(small)) /// 
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NB" 6 "ON" 7 "QC" 8 "SK") rows(2) size(small))  

qui graph export "graph 120 2 2 C19 daily deaths, $country, provinces together, DELP, absolute % Error Mean1b.pdf", replace








***********************************************


* 120 2 3 Daily deaths, provinces together, mean over updates of median absolute % error by calendar months
* w/o extremes NS NL NB SK

twoway ///
(line DDAbPeErA01XXX_Mean1b date, sort lwidth(vthick) lcolor(gray)) /// 1 "CAN" 
(line DDAbPeErA01XAB_Mean1b date, sort lwidth(medium) lcolor(cyan)) /// 2 "AB" cyan
(line DDAbPeErA01XBC_Mean1b date, sort lwidth(medium) lcolor(blue)) /// 3 "BC" blue
(line DDAbPeErA01XMB_Mean1b date, sort lwidth(medium) lcolor(lime)) /// 4 "MB" lime
(line DDAbPeErA01XON_Mean1b date, sort lwidth(medium) lcolor(red)) /// 5 "ON" red
(line DDAbPeErA01XQC_Mean1b date, sort lwidth(medium) lcolor(black)) /// 6 "QC" black
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, DELP, Forecast only, without extremes NS NL NB SK", size(small)) /// 
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "ON" 6 "QC") rows(1) size(small))  

qui graph export "graph 120 2 3 C19 daily deaths, $country, provinces together, DELP, absolute % Error Mean1b.pdf", replace








***********************************************

capture drop *2br

gen DDAbPeErA01XXX_Mean2br = round(DDAbPeErA01XXX_Mean2b,0.1)
gen DDAbPeErA01XAB_Mean2br = round(DDAbPeErA01XAB_Mean2b,0.1)
gen DDAbPeErA01XBC_Mean2br = round(DDAbPeErA01XBC_Mean2b,0.1)
gen DDAbPeErA01XMB_Mean2br = round(DDAbPeErA01XMB_Mean2b,0.1)
gen DDAbPeErA01XNB_Mean2br = round(DDAbPeErA01XNB_Mean2b,0.1)
gen DDAbPeErA01XNL_Mean2br = round(DDAbPeErA01XNL_Mean2b,0.1)
gen DDAbPeErA01XNS_Mean2br = round(DDAbPeErA01XNS_Mean2b,0.1)
gen DDAbPeErA01XON_Mean2br = round(DDAbPeErA01XON_Mean2b,0.1)
gen DDAbPeErA01XQC_Mean2br = round(DDAbPeErA01XQC_Mean2b,0.1)
gen DDAbPeErA01XSK_Mean2br = round(DDAbPeErA01XSK_Mean2b,0.1)

* 130 2 1 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA01XXX_Mean2br /// 1 "CAN" gray
(mean) DDAbPeErA01XAB_Mean2br /// 2 "AB" cyan
(mean) DDAbPeErA01XBC_Mean2br /// 3 "BC" blue
(mean) DDAbPeErA01XMB_Mean2br /// 4 "MB" lime
(mean) DDAbPeErA01XNB_Mean2br /// 5 "NB" sienna
(mean) DDAbPeErA01XNL_Mean2br /// 6 "NL" gold
(mean) DDAbPeErA01XNS_Mean2br /// 7 "NS" magenta
(mean) DDAbPeErA01XON_Mean2br /// 8 "ON" red
(mean) DDAbPeErA01XQC_Mean2br /// 9 "QC" black
(mean) DDAbPeErA01XSK_Mean2br /// 10 "SK" orange
, bar(1, fcolor(gray) lcolor(gray)) ///
bar(2, fcolor(cyan) lcolor(cyan)) ///
bar(3, fcolor(blue) lcolor(blue)) ///
bar(4, fcolor(lime) lcolor(lime)) ///
bar(5, fcolor(sienna) lcolor(sienna)) ///
bar(6, fcolor(gold) lcolor(gold)) ///
bar(7, fcolor(magenta) lcolor(magenta)) ///
bar(8, fcolor(red) lcolor(red)) ///
bar(9, fcolor(black) lcolor(black)) ///
bar(10, fcolor(orange) lcolor(orange)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medsmall)) ///
subtitle("$country, provinces, DELP, Forecast only. MAPE: Median Absolute % Error", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NB" 6 "NL" 7 "NS" 8 "ON" 9 "QC" 10 "SK") rows(2) size(small))

qui graph export "graph 130 2 1 C19 daily deaths, $country, provinces together, DELP, Average MAPE.pdf", replace









***********************************************

* 130 2 2 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA01XXX_Mean2br /// 1 "CAN" gray
(mean) DDAbPeErA01XAB_Mean2br /// 2 "AB" cyan
(mean) DDAbPeErA01XBC_Mean2br /// 3 "BC" blue
(mean) DDAbPeErA01XMB_Mean2br /// 4 "MB" lime
(mean) DDAbPeErA01XNB_Mean2br /// 5 "NB" sienna
(mean) DDAbPeErA01XON_Mean2br /// 6 "ON" red
(mean) DDAbPeErA01XQC_Mean2br /// 7 "QC" black
(mean) DDAbPeErA01XSK_Mean2br /// 8 "SK" orange
, bar(1, fcolor(gray) lcolor(gray)) ///
bar(2, fcolor(cyan) lcolor(cyan)) ///
bar(3, fcolor(blue) lcolor(blue)) ///
bar(4, fcolor(lime) lcolor(lime)) ///
bar(5, fcolor(sienna) lcolor(sienna)) ///
bar(8, fcolor(red) lcolor(red)) ///
bar(9, fcolor(black) lcolor(black)) ///
bar(10, fcolor(orange) lcolor(orange)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medsmall)) ///
subtitle("$country, provinces, DELP, Forecast only. MAPE: Median Absolute % Error" ///
"without extremes NL NS", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NB" 6 "ON" 7 "QC" 8 "SK") rows(2) size(small))

qui graph export "graph 130 2 2 C19 daily deaths, $country, provinces together, DELP, Average MAPE.pdf", replace














capture drop *2r

gen DDAbPeErA01XXX_Mean2r = round(DDAbPeErA01XXX_Mean2,0.1)
gen DDAbPeErA01XAB_Mean2r = round(DDAbPeErA01XAB_Mean2,0.1)
gen DDAbPeErA01XBC_Mean2r = round(DDAbPeErA01XBC_Mean2,0.1)
gen DDAbPeErA01XMB_Mean2r = round(DDAbPeErA01XMB_Mean2,0.1)
gen DDAbPeErA01XNB_Mean2r = round(DDAbPeErA01XNB_Mean2,0.1)
gen DDAbPeErA01XNL_Mean2r = round(DDAbPeErA01XNL_Mean2,0.1)
gen DDAbPeErA01XNS_Mean2r = round(DDAbPeErA01XNS_Mean2,0.1)
gen DDAbPeErA01XON_Mean2r = round(DDAbPeErA01XON_Mean2,0.1)
gen DDAbPeErA01XQC_Mean2r = round(DDAbPeErA01XQC_Mean2,0.1)
gen DDAbPeErA01XSK_Mean2r = round(DDAbPeErA01XSK_Mean2,0.1)


* 140 1 Daily deaths, provinces together, Avergae of MAPE over updates 
* and epi weeks or calendar months

graph bar ///
(mean) DDAbPeErA01XXX_Mean2br /// 	1 "CAN" gray monthly
(mean) DDAbPeErA01XXX_Mean2r ///  	2 "CAN" gray weekly
(mean) DDAbPeErA01XAB_Mean2br /// 	3 "AB" cyan monthly
(mean) DDAbPeErA01XAB_Mean2r ///  	4 "AB" cyan weekly
(mean) DDAbPeErA01XBC_Mean2br /// 	5 "BC" blue monthly
(mean) DDAbPeErA01XBC_Mean2r ///  	6 "BC" blue weekly
(mean) DDAbPeErA01XMB_Mean2br /// 	7 "MB" lime monthly
(mean) DDAbPeErA01XMB_Mean2r ///  	8 "MB" lime weekly
(mean) DDAbPeErA01XNB_Mean2br /// 	9 "NB" sienna monthly
(mean) DDAbPeErA01XNB_Mean2r /// 	10 "NB" sienna weekly
(mean) DDAbPeErA01XNL_Mean2br ///	11 "NL" gold monthly
(mean) DDAbPeErA01XNL_Mean2r /// 	12 "NL" gold weekly
(mean) DDAbPeErA01XNS_Mean2br ///	13 "NS" magenta monthly
(mean) DDAbPeErA01XNS_Mean2r /// 	14 "NS" magenta weekly
(mean) DDAbPeErA01XON_Mean2br ///	15 "ON" red monthly
(mean) DDAbPeErA01XON_Mean2r /// 	16 "ON" red weekly
(mean) DDAbPeErA01XQC_Mean2br ///	17 "QC" black monthly
(mean) DDAbPeErA01XQC_Mean2r /// 	18 "QC" black weekly
(mean) DDAbPeErA01XSK_Mean2br ///	19 "SK" orange monthly
(mean) DDAbPeErA01XSK_Mean2r /// 	20 "SK" orange weekly
, bar(1, fcolor(gray) lcolor(white)) ///			1 "CAN" gray monthly
bar(2, fcolor(gray*0.3) lcolor(white)) ///  		2 "CAN" gray weekly
bar(3, fcolor(cyan) lcolor(white)) ///				3 "AB" cyan monthly
bar(4, fcolor(cyan*0.3) lcolor(white)) ///			4 "AB" cyan weekly
bar(5, fcolor(blue) lcolor(white)) ///				5 "BC" blue monthly
bar(6, fcolor(blue*0.5) lcolor(white)) ///			6 "BC" blue weekly
bar(7, fcolor(lime) lcolor(white)) ///				7 "MB" lime monthly
bar(8, fcolor(lime*0.3) lcolor(white)) ///			8 "MB" lime weekly
bar(9, fcolor(sienna) lcolor(white)) ///			9 "NB" sienna monthly
bar(10, fcolor(sienna*0.3) lcolor(white)) ///		10 "NB" sienna weekly
bar(11, fcolor(gold) lcolor(white)) ///    			11 "NL" gold monthly
bar(12, fcolor(gold*0.3) lcolor(white)) ///			12 "NL" gold weekly
bar(13, fcolor(magenta) lcolor(white)) ///			13 "NS" magenta monthly
bar(14, fcolor(magenta*0.3) lcolor(white)) ///		14 "NS" magenta weekly
bar(15, fcolor(red) lcolor(white)) ///				15 "ON" red monthly
bar(16, fcolor(red*0.3) lcolor(white)) ///			16 "ON" red weekly
bar(17, fcolor(black) lcolor(white)) ///			17 "QC" black monthly
bar(18, fcolor(black*0.3) lcolor(white)) ///		18 "QC" black weekly
bar(19, fcolor(orange) lcolor(white)) ///			19 "SK" orange monthly
bar(20, fcolor(orange*0.3) lcolor(white)) ///		20 "SK" orange weekly
ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and time intervals", size(medsmall)) ///
subtitle("$country, provinces, DELP, Forecast only. MAPE: Median Absolute % Error", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 3 "AB" 5 "BC" 7 "MB" 9 "NB" 11 "NL" 13 "NS" 15 "ON" 17 "QC" 19 "SK") rows(2) size(small)) ///
note("Time intervals: Darker left bars show monthly. Paler right bars show weekly.", size(small))

qui graph export "graph 140 1 C19 daily deaths, $country, provinces together, DELP, Average MAPE.pdf", replace







* 140 2 Daily deaths, provinces together, Avergae of MAPE over updates 
* and epi weeks or calendar months, without extremes NL NS

graph bar ///
(mean) DDAbPeErA01XXX_Mean2br /// 	1 "CAN" gray monthly
(mean) DDAbPeErA01XXX_Mean2r ///  	2 "CAN" gray weekly
(mean) DDAbPeErA01XAB_Mean2br /// 	3 "AB" cyan monthly
(mean) DDAbPeErA01XAB_Mean2r ///  	4 "AB" cyan weekly
(mean) DDAbPeErA01XBC_Mean2br /// 	5 "BC" blue monthly
(mean) DDAbPeErA01XBC_Mean2r ///  	6 "BC" blue weekly
(mean) DDAbPeErA01XMB_Mean2br /// 	7 "MB" lime monthly
(mean) DDAbPeErA01XMB_Mean2r ///  	8 "MB" lime weekly
(mean) DDAbPeErA01XNB_Mean2br /// 	9 "NB" sienna monthly
(mean) DDAbPeErA01XNB_Mean2r /// 	10 "NB" sienna weekly
(mean) DDAbPeErA01XON_Mean2br ///	11 "ON" red monthly
(mean) DDAbPeErA01XON_Mean2r /// 	12 "ON" red weekly
(mean) DDAbPeErA01XQC_Mean2br ///	13 "QC" black monthly
(mean) DDAbPeErA01XQC_Mean2r /// 	14 "QC" black weekly
(mean) DDAbPeErA01XSK_Mean2br ///	15 "SK" orange monthly
(mean) DDAbPeErA01XSK_Mean2r /// 	16 "SK" orange weekly
, bar(1, fcolor(gray) lcolor(white)) ///			1 "CAN" gray monthly
bar(2, fcolor(gray*0.3) lcolor(white)) ///  		2 "CAN" gray weekly
bar(3, fcolor(cyan) lcolor(white)) ///				3 "AB" cyan monthly
bar(4, fcolor(cyan*0.3) lcolor(white)) ///			4 "AB" cyan weekly
bar(5, fcolor(blue) lcolor(white)) ///				5 "BC" blue monthly
bar(6, fcolor(blue*0.4) lcolor(white)) ///			6 "BC" blue weekly
bar(7, fcolor(lime) lcolor(white)) ///				7 "MB" lime monthly
bar(8, fcolor(lime*0.3) lcolor(white)) ///			8 "MB" lime weekly
bar(9, fcolor(sienna) lcolor(white)) ///			9 "NB" sienna monthly
bar(10, fcolor(sienna*0.3) lcolor(white)) ///		10 "NB" sienna weekly
bar(11, fcolor(red) lcolor(white)) ///				11 "ON" red monthly
bar(12, fcolor(red*0.3) lcolor(white)) ///			12 "ON" red weekly
bar(13, fcolor(black) lcolor(white)) ///			13 "QC" black monthly
bar(14, fcolor(black*0.3) lcolor(white)) ///		14 "QC" black weekly
bar(15, fcolor(orange) lcolor(white)) ///			15 "SK" orange monthly
bar(16, fcolor(orange*0.3) lcolor(white)) ///		16 "SK" orange weekly
ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and time intervals", size(medsmall)) ///
subtitle("$country, provinces, DELP, Forecast only. MAPE: Median Absolute % Error" ///
"without extremes NL NS", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 3 "AB" 5 "BC" 7 "MB" 9 "NB" 11 "ON" 13 "QC" 15 "SK") rows(2) size(small)) ///
note("Time intervals: Darker left bars show monthly. Paler right bars show weekly.", size(small))

qui graph export "graph 140 2 C19 daily deaths, $country, provinces together, DELP, Average MAPE.pdf", replace






















view "log CovidLongitudinal DELP 6b.smcl"

log close

exit, clear



