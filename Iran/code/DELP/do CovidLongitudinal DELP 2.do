
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
* input data files: "CovidLongitudinal DELP 202?????.dta " 
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
20200801 ///
20200815 ///
20200829 ///
20200912 ///
20200926 ///
20201008 ///
20201022 ///
20201105 ///
20201119 ///
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
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 

 


foreach update of local list {

use "CovidLongitudinal DELP `update'.dta", clear

capture rename DayDeaMeSmA01S00`update' DayDeaMeSmA01`update'

capture drop update_date

gen update_date = date("`update'", "YMD")
 
capture drop DayDeaFOREA01`update'

gen DayDeaFOREA01`update' = DayDeaMeSmA01`update'

replace DayDeaFOREA01`update' = . if date < update_date

label var DayDeaFOREA01`update' "DayDeaMeSmA01 Forecast only"

save "CovidLongitudinal DELP `update'.dta", replace

}
* 




foreach update of local list {

	di in red "This is update " `update'
	
	merge 1:1 date loc_grand_name provincestate using "CovidLongitudinal DELP `update'.dta"
	
	drop _merge
	
}
*


isid provincestate date, missok

sort loc_grand_name provincestate date

save "CovidLongitudinal DELP.dta", replace




* add JOHN

cd .. // /code/

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

cd ..

cd DELP 

gen provincestate = " National"

save "CovidLongitudinal JOHN.dta", replace

merge m:m date loc_grand_name provincestate using "CovidLongitudinal DELP.dta"
 
drop _merge

duplicates report date, gen duptag


isid provincestate date, missok

drop if date > td(01jan2022)

sort loc_grand_name provincestate date

qui compress

save "CovidLongitudinal DELP.dta", replace










view "log CovidLongitudinal DELP 2.smcl"

log close

exit, clear
