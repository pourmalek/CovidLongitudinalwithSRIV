
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 2.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 2.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* continue preparation of estimates files and merge them, graphs: updates separate 
* graph 1 C19 daily deaths, $country, IHME, update `update' 
* Forecast and backcast
* input data files: "IHME`update'.dta" and "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal IHME.dta"







local list ///
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





foreach update of local list {
	
	use "IHME`update'.dta", clear
	
	capture rename DayDeaMeSmA02S01`update' DayDeaMeSmA02`update'
		
	capture drop DayDeaFOREA02`update'
	
	gen DayDeaFOREA02`update' = DayDeaMeSmA02`update'
	
	replace DayDeaFOREA02`update' = . if date < epoch`update'
	
	label var DayDeaFOREA02`update' "DayDeaMeSmA02S01 Forecast only"
	
	save "IHME`update'.dta", replace

}
*


foreach update of local list {
	
	merge m:m date loc_grand_name using "IHME`update'.dta"
	
	drop _merge
	
}
*	





duplicates drop date, force

isid date

order loc_grand_name date DayDeaFOREA02* epoch*

sort loc_grand_name date

qui compress

save "CovidLongitudinal IHME.dta", replace







* add JOHN

cd ..

cd JOHN

use "CovidLongitudinal JOHN.dta", clear 

cd ..

cd IHME

save "CovidLongitudinal JOHN.dta", replace 


merge m:m loc_grand_name date using "CovidLongitudinal IHME.dta"

drop _merge


drop if date > td(01jan2022)


drop DayDeaMeRa*

drop Tot*

drop provincestate


duplicates drop date, force

isid date

qui compress

save "CovidLongitudinal IHME.dta", replace








**********************

view "log CovidLongitudinal IHME 2.smcl"

log close

exit, clear


