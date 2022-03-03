
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* merge update files
* input data files: "CovidLongitudinal DELP 202?????.dta " (142 files)
* output data files: "CovidLongitudinal DELP.dta"


use "CovidLongitudinal DELP 20200417.dta", clear  


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
 
 

 
 
 
foreach update of local list {

	use "CovidLongitudinal DELP `update'.dta", clear
		
	capture drop DayDeaFOREA01S00`update'
	
	qui gen DayDeaFOREA01S00`update' = DayDeaMeSmA01S00`update'
	
	replace DayDeaFOREA01S00`update' = . if date < update_date`update'
	
	label var DayDeaFOREA01S00`update' "DayDeaMeSmA01S00 Forecast only"
	
	qui save "CovidLongitudinal DELP `update'.dta", replace
	
}	
* 


foreach update of local list {

	di in red "This is update " `update'
	
	merge 1:1 date loc_grand_name provincestate using "CovidLongitudinal DELP `update'.dta"
	
	drop _merge
	
}
*


isid provincestate date

order loc_grand_name provincestate date DayDeaMeSmA01S00* DayDeaFOREA01S00* update_date*

sort loc_grand_name provincestate date

save "CovidLongitudinal DELP.dta", replace




* add JOHN

cd .. // /code/

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

cd ..

cd DELP 

save "CovidLongitudinal JOHN.dta", replace

merge m:m date loc_grand_name provincestate using "CovidLongitudinal DELP.dta"
 
drop _merge

isid provincestate date

drop if date > td(01jan2022)


drop DayDeaMeRaA00S00* TotDeaMeRaA00S00* DayCasMeRaA00S00* TotCasMeRaA00S00* DayCasMeSmA00S00*
* keeps DayDeaMeSmA00S00XYZ

sort loc_grand_name provincestate date

qui compress

save "CovidLongitudinal DELP.dta", replace










view "log CovidLongitudinal DELP 2.smcl"

log close

exit, clear
