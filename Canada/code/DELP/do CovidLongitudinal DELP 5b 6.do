
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 5b 6.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 5b 6.do"

* Project: Longitudinal assessment of C19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* months time bin

* Newfoundland & Labrador XNL

* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by calendar months and updates
* 7  mean over updates of median error by calendar months
* 8  median absolute error by calendar months and updates
* 9  mean over updates of median absolute error by calendar months
* 10 median percent error by calendar months and updates
* 11 mean over updates of median percent error by calendar months
* 12 median absolute percent error by calendar months and updates
* 13 mean over updates of median absolute percent error by epi weeks
* 14 average MAPE over updates and calendar months (single value for each location-model)
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Newfoundland & Labrador.dta" (with monthly error measures saved)


/*

Reference = JOHN, Model = DELP

Error = Reference minus Model 

absolute Error = | Reference minus Model |

percent Error = 100 * (Reference minus Model) / Reference

absolute percent Error = 100 * | Reference minus Model | / Reference



`update' = Model update date

XNL = location

Error = DayDeaMeSmA00S00XNL - DayDeaFOREA01S00XNL`update'

absolute Error = | DayDeaMeSmA00S00XNL - DayDeaFOREA01S00XNL`update' |

percent Error = 100 * (DayDeaMeSmA00S00XNL - DayDeaFOREA01S00XNL`update') / DayDeaMeSmA00S00XNL

absolute percent Error = 100 * | DayDeaMeSmA00S00XNL - DayDeaFOREA01S00XNL`update' | / DayDeaMeSmA00S00XNL

*/






use "CovidLongitudinal DELP 2.dta", clear


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


* 142 individual updates


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




* (2) gen MEDIAN of error types by calendar months and updates = _Med1b

* Wait note: wait ...

foreach update of local list {
				
bysort year_month : egen DDErrorA01XNL`update'_Med1b = median(DDErrorA01XNL`update')
label var DDErrorA01XNL`update'_Med1b "DayDeaFOREA01 median error by calendar months and updates"


bysort year_month : egen DDAbsErrA01XNL`update'_Med1b = median(DDAbsErrA01XNL`update')
label var DDAbsErrA01XNL`update'_Med1b "DayDeaFOREA01 median absolute error by calendar months and updates"

bysort year_month : egen DDPerErrA01XNL`update'_Med1b = median(DDPerErrA01XNL`update')
label var DDPerErrA01XNL`update'_Med1b "DayDeaFOREA01 median % error by calendar months and updates"

bysort year_month : egen DDAbPeErA01XNL`update'_Med1b = median(DDAbPeErA01XNL`update')
label var DDAbPeErA01XNL`update'_Med1b "DayDeaFOREA01 median absolute % error by calendar months and updates" 
		



}
*




 

* (3) gen AVERAGE over updates of MEDIAN of error types by calendar months = _Mean1b

* Wait note: wait ...


sort provincestate epi_year year_month epi_week date
 
		
order DDErrorA01XNL20211231_Med1b
order DDErrorA01XNL20211230_Med1b
order DDErrorA01XNL20211229_Med1b
order DDErrorA01XNL20211228_Med1b
order DDErrorA01XNL20211227_Med1b
order DDErrorA01XNL20211226_Med1b
order DDErrorA01XNL20211225_Med1b
order DDErrorA01XNL20211224_Med1b
order DDErrorA01XNL20211223_Med1b
order DDErrorA01XNL20211222_Med1b
order DDErrorA01XNL20211221_Med1b
order DDErrorA01XNL20211220_Med1b
order DDErrorA01XNL20211219_Med1b
order DDErrorA01XNL20211218_Med1b
order DDErrorA01XNL20211217_Med1b
order DDErrorA01XNL20211216_Med1b
order DDErrorA01XNL20211215_Med1b
order DDErrorA01XNL20211214_Med1b
order DDErrorA01XNL20211213_Med1b
order DDErrorA01XNL20211212_Med1b
order DDErrorA01XNL20211211_Med1b
order DDErrorA01XNL20211210_Med1b
order DDErrorA01XNL20211209_Med1b
order DDErrorA01XNL20211208_Med1b
order DDErrorA01XNL20211207_Med1b
order DDErrorA01XNL20211206_Med1b
order DDErrorA01XNL20211205_Med1b
order DDErrorA01XNL20211204_Med1b
order DDErrorA01XNL20211203_Med1b
order DDErrorA01XNL20211202_Med1b
order DDErrorA01XNL20211201_Med1b
order DDErrorA01XNL20211130_Med1b
order DDErrorA01XNL20211129_Med1b
order DDErrorA01XNL20211128_Med1b
order DDErrorA01XNL20211127_Med1b
order DDErrorA01XNL20211126_Med1b
order DDErrorA01XNL20211125_Med1b
order DDErrorA01XNL20211124_Med1b
order DDErrorA01XNL20211123_Med1b
order DDErrorA01XNL20211122_Med1b
order DDErrorA01XNL20211121_Med1b
order DDErrorA01XNL20211120_Med1b
order DDErrorA01XNL20211119_Med1b
order DDErrorA01XNL20211118_Med1b
order DDErrorA01XNL20211117_Med1b
order DDErrorA01XNL20211116_Med1b
order DDErrorA01XNL20211115_Med1b
order DDErrorA01XNL20211114_Med1b
order DDErrorA01XNL20211113_Med1b
order DDErrorA01XNL20211112_Med1b
order DDErrorA01XNL20211111_Med1b
order DDErrorA01XNL20211110_Med1b
order DDErrorA01XNL20211109_Med1b
order DDErrorA01XNL20211108_Med1b
order DDErrorA01XNL20211107_Med1b
order DDErrorA01XNL20211106_Med1b
order DDErrorA01XNL20211105_Med1b
order DDErrorA01XNL20211104_Med1b
order DDErrorA01XNL20211103_Med1b
order DDErrorA01XNL20211102_Med1b
order DDErrorA01XNL20211101_Med1b
order DDErrorA01XNL20211031_Med1b
order DDErrorA01XNL20211030_Med1b
order DDErrorA01XNL20211029_Med1b
order DDErrorA01XNL20211028_Med1b
order DDErrorA01XNL20211027_Med1b
order DDErrorA01XNL20211026_Med1b
order DDErrorA01XNL20211025_Med1b
order DDErrorA01XNL20211024_Med1b
order DDErrorA01XNL20211023_Med1b
order DDErrorA01XNL20211022_Med1b
order DDErrorA01XNL20211021_Med1b
order DDErrorA01XNL20211020_Med1b
order DDErrorA01XNL20211019_Med1b
order DDErrorA01XNL20211018_Med1b
order DDErrorA01XNL20211017_Med1b
order DDErrorA01XNL20211016_Med1b
order DDErrorA01XNL20211015_Med1b
order DDErrorA01XNL20211014_Med1b
order DDErrorA01XNL20211013_Med1b
order DDErrorA01XNL20211012_Med1b
order DDErrorA01XNL20211011_Med1b
order DDErrorA01XNL20211010_Med1b
order DDErrorA01XNL20211009_Med1b
order DDErrorA01XNL20211008_Med1b
order DDErrorA01XNL20211007_Med1b
order DDErrorA01XNL20211006_Med1b
order DDErrorA01XNL20211005_Med1b
order DDErrorA01XNL20211004_Med1b
order DDErrorA01XNL20211003_Med1b
order DDErrorA01XNL20211002_Med1b
order DDErrorA01XNL20211001_Med1b
order DDErrorA01XNL20210930_Med1b
order DDErrorA01XNL20210923_Med1b
order DDErrorA01XNL20210916_Med1b
order DDErrorA01XNL20210909_Med1b
order DDErrorA01XNL20210902_Med1b
order DDErrorA01XNL20210826_Med1b
order DDErrorA01XNL20210819_Med1b
order DDErrorA01XNL20210812_Med1b
order DDErrorA01XNL20210805_Med1b
order DDErrorA01XNL20210729_Med1b
order DDErrorA01XNL20210722_Med1b
order DDErrorA01XNL20210715_Med1b
order DDErrorA01XNL20210708_Med1b
order DDErrorA01XNL20210701_Med1b
order DDErrorA01XNL20210624_Med1b
order DDErrorA01XNL20210617_Med1b
order DDErrorA01XNL20210610_Med1b
order DDErrorA01XNL20210603_Med1b
order DDErrorA01XNL20210520_Med1b
order DDErrorA01XNL20210506_Med1b
order DDErrorA01XNL20210422_Med1b
order DDErrorA01XNL20210408_Med1b
order DDErrorA01XNL20210325_Med1b
order DDErrorA01XNL20210311_Med1b
order DDErrorA01XNL20210225_Med1b
order DDErrorA01XNL20210211_Med1b
order DDErrorA01XNL20210128_Med1b
order DDErrorA01XNL20210114_Med1b
order DDErrorA01XNL20201231_Med1b
order DDErrorA01XNL20201217_Med1b
order DDErrorA01XNL20201203_Med1b
order DDErrorA01XNL20201119_Med1b
order DDErrorA01XNL20201105_Med1b
order DDErrorA01XNL20201022_Med1b
order DDErrorA01XNL20201008_Med1b
order DDErrorA01XNL20200926_Med1b
order DDErrorA01XNL20200723_Med1b
order DDErrorA01XNL20200718_Med1b
order DDErrorA01XNL20200704_Med1b
order DDErrorA01XNL20200628_Med1b
order DDErrorA01XNL20200621_Med1b
order DDErrorA01XNL20200614_Med1b
order DDErrorA01XNL20200607_Med1b
order DDErrorA01XNL20200531_Med1b
order DDErrorA01XNL20200524_Med1b
order DDErrorA01XNL20200517_Med1b
order DDErrorA01XNL20200509_Med1b
order DDErrorA01XNL20200501_Med1b
order DDErrorA01XNL20200424_Med1b
order DDErrorA01XNL20200417_Med1b
		
egen DDErrorA01XNL_Mean1b = rowmean(DDErrorA01XNL20200417_Med1b-DDErrorA01XNL20211231_Med1b) 
label var DDErrorA01XNL_Mean1b "DayDeaFOREA01 mean over updates of median error by calendar months"







order DDAbsErrA01XNL20211231_Med1b
order DDAbsErrA01XNL20211230_Med1b
order DDAbsErrA01XNL20211229_Med1b
order DDAbsErrA01XNL20211228_Med1b
order DDAbsErrA01XNL20211227_Med1b
order DDAbsErrA01XNL20211226_Med1b
order DDAbsErrA01XNL20211225_Med1b
order DDAbsErrA01XNL20211224_Med1b
order DDAbsErrA01XNL20211223_Med1b
order DDAbsErrA01XNL20211222_Med1b
order DDAbsErrA01XNL20211221_Med1b
order DDAbsErrA01XNL20211220_Med1b
order DDAbsErrA01XNL20211219_Med1b
order DDAbsErrA01XNL20211218_Med1b
order DDAbsErrA01XNL20211217_Med1b
order DDAbsErrA01XNL20211216_Med1b
order DDAbsErrA01XNL20211215_Med1b
order DDAbsErrA01XNL20211214_Med1b
order DDAbsErrA01XNL20211213_Med1b
order DDAbsErrA01XNL20211212_Med1b
order DDAbsErrA01XNL20211211_Med1b
order DDAbsErrA01XNL20211210_Med1b
order DDAbsErrA01XNL20211209_Med1b
order DDAbsErrA01XNL20211208_Med1b
order DDAbsErrA01XNL20211207_Med1b
order DDAbsErrA01XNL20211206_Med1b
order DDAbsErrA01XNL20211205_Med1b
order DDAbsErrA01XNL20211204_Med1b
order DDAbsErrA01XNL20211203_Med1b
order DDAbsErrA01XNL20211202_Med1b
order DDAbsErrA01XNL20211201_Med1b
order DDAbsErrA01XNL20211130_Med1b
order DDAbsErrA01XNL20211129_Med1b
order DDAbsErrA01XNL20211128_Med1b
order DDAbsErrA01XNL20211127_Med1b
order DDAbsErrA01XNL20211126_Med1b
order DDAbsErrA01XNL20211125_Med1b
order DDAbsErrA01XNL20211124_Med1b
order DDAbsErrA01XNL20211123_Med1b
order DDAbsErrA01XNL20211122_Med1b
order DDAbsErrA01XNL20211121_Med1b
order DDAbsErrA01XNL20211120_Med1b
order DDAbsErrA01XNL20211119_Med1b
order DDAbsErrA01XNL20211118_Med1b
order DDAbsErrA01XNL20211117_Med1b
order DDAbsErrA01XNL20211116_Med1b
order DDAbsErrA01XNL20211115_Med1b
order DDAbsErrA01XNL20211114_Med1b
order DDAbsErrA01XNL20211113_Med1b
order DDAbsErrA01XNL20211112_Med1b
order DDAbsErrA01XNL20211111_Med1b
order DDAbsErrA01XNL20211110_Med1b
order DDAbsErrA01XNL20211109_Med1b
order DDAbsErrA01XNL20211108_Med1b
order DDAbsErrA01XNL20211107_Med1b
order DDAbsErrA01XNL20211106_Med1b
order DDAbsErrA01XNL20211105_Med1b
order DDAbsErrA01XNL20211104_Med1b
order DDAbsErrA01XNL20211103_Med1b
order DDAbsErrA01XNL20211102_Med1b
order DDAbsErrA01XNL20211101_Med1b
order DDAbsErrA01XNL20211031_Med1b
order DDAbsErrA01XNL20211030_Med1b
order DDAbsErrA01XNL20211029_Med1b
order DDAbsErrA01XNL20211028_Med1b
order DDAbsErrA01XNL20211027_Med1b
order DDAbsErrA01XNL20211026_Med1b
order DDAbsErrA01XNL20211025_Med1b
order DDAbsErrA01XNL20211024_Med1b
order DDAbsErrA01XNL20211023_Med1b
order DDAbsErrA01XNL20211022_Med1b
order DDAbsErrA01XNL20211021_Med1b
order DDAbsErrA01XNL20211020_Med1b
order DDAbsErrA01XNL20211019_Med1b
order DDAbsErrA01XNL20211018_Med1b
order DDAbsErrA01XNL20211017_Med1b
order DDAbsErrA01XNL20211016_Med1b
order DDAbsErrA01XNL20211015_Med1b
order DDAbsErrA01XNL20211014_Med1b
order DDAbsErrA01XNL20211013_Med1b
order DDAbsErrA01XNL20211012_Med1b
order DDAbsErrA01XNL20211011_Med1b
order DDAbsErrA01XNL20211010_Med1b
order DDAbsErrA01XNL20211009_Med1b
order DDAbsErrA01XNL20211008_Med1b
order DDAbsErrA01XNL20211007_Med1b
order DDAbsErrA01XNL20211006_Med1b
order DDAbsErrA01XNL20211005_Med1b
order DDAbsErrA01XNL20211004_Med1b
order DDAbsErrA01XNL20211003_Med1b
order DDAbsErrA01XNL20211002_Med1b
order DDAbsErrA01XNL20211001_Med1b
order DDAbsErrA01XNL20210930_Med1b
order DDAbsErrA01XNL20210923_Med1b
order DDAbsErrA01XNL20210916_Med1b
order DDAbsErrA01XNL20210909_Med1b
order DDAbsErrA01XNL20210902_Med1b
order DDAbsErrA01XNL20210826_Med1b
order DDAbsErrA01XNL20210819_Med1b
order DDAbsErrA01XNL20210812_Med1b
order DDAbsErrA01XNL20210805_Med1b
order DDAbsErrA01XNL20210729_Med1b
order DDAbsErrA01XNL20210722_Med1b
order DDAbsErrA01XNL20210715_Med1b
order DDAbsErrA01XNL20210708_Med1b
order DDAbsErrA01XNL20210701_Med1b
order DDAbsErrA01XNL20210624_Med1b
order DDAbsErrA01XNL20210617_Med1b
order DDAbsErrA01XNL20210610_Med1b
order DDAbsErrA01XNL20210603_Med1b
order DDAbsErrA01XNL20210520_Med1b
order DDAbsErrA01XNL20210506_Med1b
order DDAbsErrA01XNL20210422_Med1b
order DDAbsErrA01XNL20210408_Med1b
order DDAbsErrA01XNL20210325_Med1b
order DDAbsErrA01XNL20210311_Med1b
order DDAbsErrA01XNL20210225_Med1b
order DDAbsErrA01XNL20210211_Med1b
order DDAbsErrA01XNL20210128_Med1b
order DDAbsErrA01XNL20210114_Med1b
order DDAbsErrA01XNL20201231_Med1b
order DDAbsErrA01XNL20201217_Med1b
order DDAbsErrA01XNL20201203_Med1b
order DDAbsErrA01XNL20201119_Med1b
order DDAbsErrA01XNL20201105_Med1b
order DDAbsErrA01XNL20201022_Med1b
order DDAbsErrA01XNL20201008_Med1b
order DDAbsErrA01XNL20200926_Med1b
order DDAbsErrA01XNL20200723_Med1b
order DDAbsErrA01XNL20200718_Med1b
order DDAbsErrA01XNL20200704_Med1b
order DDAbsErrA01XNL20200628_Med1b
order DDAbsErrA01XNL20200621_Med1b
order DDAbsErrA01XNL20200614_Med1b
order DDAbsErrA01XNL20200607_Med1b
order DDAbsErrA01XNL20200531_Med1b
order DDAbsErrA01XNL20200524_Med1b
order DDAbsErrA01XNL20200517_Med1b
order DDAbsErrA01XNL20200509_Med1b
order DDAbsErrA01XNL20200501_Med1b
order DDAbsErrA01XNL20200424_Med1b
order DDAbsErrA01XNL20200417_Med1b

egen DDAbsErrA01XNL_Mean1b = rowmean(DDAbsErrA01XNL20200417_Med1b-DDAbsErrA01XNL20211231_Med1b) 
label var DDAbsErrA01XNL_Mean1b "DayDeaFOREA01 mean over updates of median absolute error by calendar months"






order DDPerErrA01XNL20211231_Med1b
order DDPerErrA01XNL20211230_Med1b
order DDPerErrA01XNL20211229_Med1b
order DDPerErrA01XNL20211228_Med1b
order DDPerErrA01XNL20211227_Med1b
order DDPerErrA01XNL20211226_Med1b
order DDPerErrA01XNL20211225_Med1b
order DDPerErrA01XNL20211224_Med1b
order DDPerErrA01XNL20211223_Med1b
order DDPerErrA01XNL20211222_Med1b
order DDPerErrA01XNL20211221_Med1b
order DDPerErrA01XNL20211220_Med1b
order DDPerErrA01XNL20211219_Med1b
order DDPerErrA01XNL20211218_Med1b
order DDPerErrA01XNL20211217_Med1b
order DDPerErrA01XNL20211216_Med1b
order DDPerErrA01XNL20211215_Med1b
order DDPerErrA01XNL20211214_Med1b
order DDPerErrA01XNL20211213_Med1b
order DDPerErrA01XNL20211212_Med1b
order DDPerErrA01XNL20211211_Med1b
order DDPerErrA01XNL20211210_Med1b
order DDPerErrA01XNL20211209_Med1b
order DDPerErrA01XNL20211208_Med1b
order DDPerErrA01XNL20211207_Med1b
order DDPerErrA01XNL20211206_Med1b
order DDPerErrA01XNL20211205_Med1b
order DDPerErrA01XNL20211204_Med1b
order DDPerErrA01XNL20211203_Med1b
order DDPerErrA01XNL20211202_Med1b
order DDPerErrA01XNL20211201_Med1b
order DDPerErrA01XNL20211130_Med1b
order DDPerErrA01XNL20211129_Med1b
order DDPerErrA01XNL20211128_Med1b
order DDPerErrA01XNL20211127_Med1b
order DDPerErrA01XNL20211126_Med1b
order DDPerErrA01XNL20211125_Med1b
order DDPerErrA01XNL20211124_Med1b
order DDPerErrA01XNL20211123_Med1b
order DDPerErrA01XNL20211122_Med1b
order DDPerErrA01XNL20211121_Med1b
order DDPerErrA01XNL20211120_Med1b
order DDPerErrA01XNL20211119_Med1b
order DDPerErrA01XNL20211118_Med1b
order DDPerErrA01XNL20211117_Med1b
order DDPerErrA01XNL20211116_Med1b
order DDPerErrA01XNL20211115_Med1b
order DDPerErrA01XNL20211114_Med1b
order DDPerErrA01XNL20211113_Med1b
order DDPerErrA01XNL20211112_Med1b
order DDPerErrA01XNL20211111_Med1b
order DDPerErrA01XNL20211110_Med1b
order DDPerErrA01XNL20211109_Med1b
order DDPerErrA01XNL20211108_Med1b
order DDPerErrA01XNL20211107_Med1b
order DDPerErrA01XNL20211106_Med1b
order DDPerErrA01XNL20211105_Med1b
order DDPerErrA01XNL20211104_Med1b
order DDPerErrA01XNL20211103_Med1b
order DDPerErrA01XNL20211102_Med1b
order DDPerErrA01XNL20211101_Med1b
order DDPerErrA01XNL20211031_Med1b
order DDPerErrA01XNL20211030_Med1b
order DDPerErrA01XNL20211029_Med1b
order DDPerErrA01XNL20211028_Med1b
order DDPerErrA01XNL20211027_Med1b
order DDPerErrA01XNL20211026_Med1b
order DDPerErrA01XNL20211025_Med1b
order DDPerErrA01XNL20211024_Med1b
order DDPerErrA01XNL20211023_Med1b
order DDPerErrA01XNL20211022_Med1b
order DDPerErrA01XNL20211021_Med1b
order DDPerErrA01XNL20211020_Med1b
order DDPerErrA01XNL20211019_Med1b
order DDPerErrA01XNL20211018_Med1b
order DDPerErrA01XNL20211017_Med1b
order DDPerErrA01XNL20211016_Med1b
order DDPerErrA01XNL20211015_Med1b
order DDPerErrA01XNL20211014_Med1b
order DDPerErrA01XNL20211013_Med1b
order DDPerErrA01XNL20211012_Med1b
order DDPerErrA01XNL20211011_Med1b
order DDPerErrA01XNL20211010_Med1b
order DDPerErrA01XNL20211009_Med1b
order DDPerErrA01XNL20211008_Med1b
order DDPerErrA01XNL20211007_Med1b
order DDPerErrA01XNL20211006_Med1b
order DDPerErrA01XNL20211005_Med1b
order DDPerErrA01XNL20211004_Med1b
order DDPerErrA01XNL20211003_Med1b
order DDPerErrA01XNL20211002_Med1b
order DDPerErrA01XNL20211001_Med1b
order DDPerErrA01XNL20210930_Med1b
order DDPerErrA01XNL20210923_Med1b
order DDPerErrA01XNL20210916_Med1b
order DDPerErrA01XNL20210909_Med1b
order DDPerErrA01XNL20210902_Med1b
order DDPerErrA01XNL20210826_Med1b
order DDPerErrA01XNL20210819_Med1b
order DDPerErrA01XNL20210812_Med1b
order DDPerErrA01XNL20210805_Med1b
order DDPerErrA01XNL20210729_Med1b
order DDPerErrA01XNL20210722_Med1b
order DDPerErrA01XNL20210715_Med1b
order DDPerErrA01XNL20210708_Med1b
order DDPerErrA01XNL20210701_Med1b
order DDPerErrA01XNL20210624_Med1b
order DDPerErrA01XNL20210617_Med1b
order DDPerErrA01XNL20210610_Med1b
order DDPerErrA01XNL20210603_Med1b
order DDPerErrA01XNL20210520_Med1b
order DDPerErrA01XNL20210506_Med1b
order DDPerErrA01XNL20210422_Med1b
order DDPerErrA01XNL20210408_Med1b
order DDPerErrA01XNL20210325_Med1b
order DDPerErrA01XNL20210311_Med1b
order DDPerErrA01XNL20210225_Med1b
order DDPerErrA01XNL20210211_Med1b
order DDPerErrA01XNL20210128_Med1b
order DDPerErrA01XNL20210114_Med1b
order DDPerErrA01XNL20201231_Med1b
order DDPerErrA01XNL20201217_Med1b
order DDPerErrA01XNL20201203_Med1b
order DDPerErrA01XNL20201119_Med1b
order DDPerErrA01XNL20201105_Med1b
order DDPerErrA01XNL20201022_Med1b
order DDPerErrA01XNL20201008_Med1b
order DDPerErrA01XNL20200926_Med1b
order DDPerErrA01XNL20200723_Med1b
order DDPerErrA01XNL20200718_Med1b
order DDPerErrA01XNL20200704_Med1b
order DDPerErrA01XNL20200628_Med1b
order DDPerErrA01XNL20200621_Med1b
order DDPerErrA01XNL20200614_Med1b
order DDPerErrA01XNL20200607_Med1b
order DDPerErrA01XNL20200531_Med1b
order DDPerErrA01XNL20200524_Med1b
order DDPerErrA01XNL20200517_Med1b
order DDPerErrA01XNL20200509_Med1b
order DDPerErrA01XNL20200501_Med1b
order DDPerErrA01XNL20200424_Med1b
order DDPerErrA01XNL20200417_Med1b

egen DDPerErrA01XNL_Mean1b = rowmean(DDPerErrA01XNL20200417_Med1b-DDPerErrA01XNL20211231_Med1b) 
label var DDPerErrA01XNL_Mean1b "DayDeaFOREA01 mean over updates of median % error by calendar months"







order DDAbPeErA01XNL20211231_Med1b
order DDAbPeErA01XNL20211230_Med1b
order DDAbPeErA01XNL20211229_Med1b
order DDAbPeErA01XNL20211228_Med1b
order DDAbPeErA01XNL20211227_Med1b
order DDAbPeErA01XNL20211226_Med1b
order DDAbPeErA01XNL20211225_Med1b
order DDAbPeErA01XNL20211224_Med1b
order DDAbPeErA01XNL20211223_Med1b
order DDAbPeErA01XNL20211222_Med1b
order DDAbPeErA01XNL20211221_Med1b
order DDAbPeErA01XNL20211220_Med1b
order DDAbPeErA01XNL20211219_Med1b
order DDAbPeErA01XNL20211218_Med1b
order DDAbPeErA01XNL20211217_Med1b
order DDAbPeErA01XNL20211216_Med1b
order DDAbPeErA01XNL20211215_Med1b
order DDAbPeErA01XNL20211214_Med1b
order DDAbPeErA01XNL20211213_Med1b
order DDAbPeErA01XNL20211212_Med1b
order DDAbPeErA01XNL20211211_Med1b
order DDAbPeErA01XNL20211210_Med1b
order DDAbPeErA01XNL20211209_Med1b
order DDAbPeErA01XNL20211208_Med1b
order DDAbPeErA01XNL20211207_Med1b
order DDAbPeErA01XNL20211206_Med1b
order DDAbPeErA01XNL20211205_Med1b
order DDAbPeErA01XNL20211204_Med1b
order DDAbPeErA01XNL20211203_Med1b
order DDAbPeErA01XNL20211202_Med1b
order DDAbPeErA01XNL20211201_Med1b
order DDAbPeErA01XNL20211130_Med1b
order DDAbPeErA01XNL20211129_Med1b
order DDAbPeErA01XNL20211128_Med1b
order DDAbPeErA01XNL20211127_Med1b
order DDAbPeErA01XNL20211126_Med1b
order DDAbPeErA01XNL20211125_Med1b
order DDAbPeErA01XNL20211124_Med1b
order DDAbPeErA01XNL20211123_Med1b
order DDAbPeErA01XNL20211122_Med1b
order DDAbPeErA01XNL20211121_Med1b
order DDAbPeErA01XNL20211120_Med1b
order DDAbPeErA01XNL20211119_Med1b
order DDAbPeErA01XNL20211118_Med1b
order DDAbPeErA01XNL20211117_Med1b
order DDAbPeErA01XNL20211116_Med1b
order DDAbPeErA01XNL20211115_Med1b
order DDAbPeErA01XNL20211114_Med1b
order DDAbPeErA01XNL20211113_Med1b
order DDAbPeErA01XNL20211112_Med1b
order DDAbPeErA01XNL20211111_Med1b
order DDAbPeErA01XNL20211110_Med1b
order DDAbPeErA01XNL20211109_Med1b
order DDAbPeErA01XNL20211108_Med1b
order DDAbPeErA01XNL20211107_Med1b
order DDAbPeErA01XNL20211106_Med1b
order DDAbPeErA01XNL20211105_Med1b
order DDAbPeErA01XNL20211104_Med1b
order DDAbPeErA01XNL20211103_Med1b
order DDAbPeErA01XNL20211102_Med1b
order DDAbPeErA01XNL20211101_Med1b
order DDAbPeErA01XNL20211031_Med1b
order DDAbPeErA01XNL20211030_Med1b
order DDAbPeErA01XNL20211029_Med1b
order DDAbPeErA01XNL20211028_Med1b
order DDAbPeErA01XNL20211027_Med1b
order DDAbPeErA01XNL20211026_Med1b
order DDAbPeErA01XNL20211025_Med1b
order DDAbPeErA01XNL20211024_Med1b
order DDAbPeErA01XNL20211023_Med1b
order DDAbPeErA01XNL20211022_Med1b
order DDAbPeErA01XNL20211021_Med1b
order DDAbPeErA01XNL20211020_Med1b
order DDAbPeErA01XNL20211019_Med1b
order DDAbPeErA01XNL20211018_Med1b
order DDAbPeErA01XNL20211017_Med1b
order DDAbPeErA01XNL20211016_Med1b
order DDAbPeErA01XNL20211015_Med1b
order DDAbPeErA01XNL20211014_Med1b
order DDAbPeErA01XNL20211013_Med1b
order DDAbPeErA01XNL20211012_Med1b
order DDAbPeErA01XNL20211011_Med1b
order DDAbPeErA01XNL20211010_Med1b
order DDAbPeErA01XNL20211009_Med1b
order DDAbPeErA01XNL20211008_Med1b
order DDAbPeErA01XNL20211007_Med1b
order DDAbPeErA01XNL20211006_Med1b
order DDAbPeErA01XNL20211005_Med1b
order DDAbPeErA01XNL20211004_Med1b
order DDAbPeErA01XNL20211003_Med1b
order DDAbPeErA01XNL20211002_Med1b
order DDAbPeErA01XNL20211001_Med1b
order DDAbPeErA01XNL20210930_Med1b
order DDAbPeErA01XNL20210923_Med1b
order DDAbPeErA01XNL20210916_Med1b
order DDAbPeErA01XNL20210909_Med1b
order DDAbPeErA01XNL20210902_Med1b
order DDAbPeErA01XNL20210826_Med1b
order DDAbPeErA01XNL20210819_Med1b
order DDAbPeErA01XNL20210812_Med1b
order DDAbPeErA01XNL20210805_Med1b
order DDAbPeErA01XNL20210729_Med1b
order DDAbPeErA01XNL20210722_Med1b
order DDAbPeErA01XNL20210715_Med1b
order DDAbPeErA01XNL20210708_Med1b
order DDAbPeErA01XNL20210701_Med1b
order DDAbPeErA01XNL20210624_Med1b
order DDAbPeErA01XNL20210617_Med1b
order DDAbPeErA01XNL20210610_Med1b
order DDAbPeErA01XNL20210603_Med1b
order DDAbPeErA01XNL20210520_Med1b
order DDAbPeErA01XNL20210506_Med1b
order DDAbPeErA01XNL20210422_Med1b
order DDAbPeErA01XNL20210408_Med1b
order DDAbPeErA01XNL20210325_Med1b
order DDAbPeErA01XNL20210311_Med1b
order DDAbPeErA01XNL20210225_Med1b
order DDAbPeErA01XNL20210211_Med1b
order DDAbPeErA01XNL20210128_Med1b
order DDAbPeErA01XNL20210114_Med1b
order DDAbPeErA01XNL20201231_Med1b
order DDAbPeErA01XNL20201217_Med1b
order DDAbPeErA01XNL20201203_Med1b
order DDAbPeErA01XNL20201119_Med1b
order DDAbPeErA01XNL20201105_Med1b
order DDAbPeErA01XNL20201022_Med1b
order DDAbPeErA01XNL20201008_Med1b
order DDAbPeErA01XNL20200926_Med1b
order DDAbPeErA01XNL20200723_Med1b
order DDAbPeErA01XNL20200718_Med1b
order DDAbPeErA01XNL20200704_Med1b
order DDAbPeErA01XNL20200628_Med1b
order DDAbPeErA01XNL20200621_Med1b
order DDAbPeErA01XNL20200614_Med1b
order DDAbPeErA01XNL20200607_Med1b
order DDAbPeErA01XNL20200531_Med1b
order DDAbPeErA01XNL20200524_Med1b
order DDAbPeErA01XNL20200517_Med1b
order DDAbPeErA01XNL20200509_Med1b
order DDAbPeErA01XNL20200501_Med1b
order DDAbPeErA01XNL20200424_Med1b
order DDAbPeErA01XNL20200417_Med1b

egen DDAbPeErA01XNL_Mean1b = rowmean(DDAbPeErA01XNL20200417_Med1b-DDAbPeErA01XNL20211231_Med1b) 
label var DDAbPeErA01XNL_Mean1b "DayDeaFOREA01 mean over updates of median % percent error by calendar months"




* 
 
 
 
 
 
 
 
 




* (4) gen AVERAGE over calendar months of _Mean1b  = _Mean2b

* Wait note: wait ...


sort provincestate epi_year year_month epi_week date

		
egen DDErrorA01XNL_Mean2b = mean(DDErrorA01XNL_Mean1b) // get mean for all calendar months of _Mean1b
label var DDErrorA01XNL_Mean2b "DayDeaFOREA01' Mean over calendar months of median error over updates"

egen DDAbsErrA01XNL_Mean2b = mean(DDAbsErrA01XNL_Mean1b) // get mean for all calendar months of _Mean1b
label var DDAbsErrA01XNL_Mean2b "DayDeaFOREA01 Mean over calendar months of median absolute error over updates"

egen DDPerErrA01XNL_Mean2b = mean(DDPerErrA01XNL_Mean1b) // get mean for all calendar months of _Mean1b
label var DDPerErrA01XNL_Mean2b "DayDeaFOREA01 Mean over calendar months of median % error over updates"

egen DDAbPeErA01XNL_Mean2b = mean(DDAbPeErA01XNL_Mean1b) // get mean for all calendar months of _Mean1b
label var DDAbPeErA01XNL_Mean2b "DayDeaFOREA01 Mean over calendar months of median absolute % error over updates"

	


*



 



******

qui compress 

save "CovidLongitudinal DELP 3 Newfoundland & Labrador.dta", replace 






view "log CovidLongitudinal DELP 5b 6.smcl"

log close

exit, clear

