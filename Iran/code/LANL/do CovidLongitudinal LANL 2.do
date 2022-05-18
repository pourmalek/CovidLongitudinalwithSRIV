
clear all

cd "$pathCovidLongitudinal"

cd LANL

capture log close 

log using "log CovidLongitudinal LANL 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* merge files
* input date files: "CovidLongitudinal LANL `update'.dta", "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal LANL 2.dta"





local list ///
20200426 ///
20200429 ///
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





foreach update of local list {

use "CovidLongitudinal LANL `update'.dta", clear

capture rename DayDeaMeSmA04_`update' DayDeaMeSmA04`update'

rename DayDeaMeSmA04`update' DayDeaMeSmA04`update'

capture drop update_date

gen update_date = date("`update'", "YMD")

capture drop DayDeaFOREA04`update'

gen DayDeaFOREA04`update' = DayDeaMeSmA04`update'

replace DayDeaFOREA04`update' = . if date < update_date

label var DayDeaFOREA04`update' "DayDeaMeSmA04 Forecast only"

save "CovidLongitudinal LANL `update'.dta", replace

}
*


foreach update of local list {

	di in red "This is update " `update'
	
	merge 1:1 date loc_grand_name using "CovidLongitudinal LANL `update'.dta"
	
	drop _merge
	
}
*


isid date

qui compress

save "CovidLongitudinal LANL.dta", replace




* add JOHN

cd .. // /code/

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

keep loc_grand_name date DayDeaMeSmA00S00

rename DayDeaMeSmA00S00 DayDeaMeSmA00

cd ..

cd LANL 

save "CovidLongitudinal JOHN.dta", replace

merge m:m date loc_grand_name using "CovidLongitudinal LANL.dta"
 
drop _merge

drop if date > td(01jan2022)

duplicates drop date, force

isid date

qui compress

save "CovidLongitudinal LANL 2.dta", replace





*

view "log CovidLongitudinal LANL 2.smcl"

log close

exit, clear

