
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 5b 11.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 5b 11.do"

* Project: Longitudinal assessment of C19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* months time bin

* compile the data created by DELP 5b 1.do to DELP 5b 10.do, for 10 locations: National and 9 provinces

* input data files: "CovidLongitudinal DELP 3 _LOCATION_.dta", where LOCATION is National and 9 provinces
* output data files: "CovidLongitudinal DELP 4.dta"





use "CovidLongitudinal DELP 3 National.dta", clear

merge m:m provincestate date using "CovidLongitudinal DELP 3 Alberta.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 British Columbia.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 Manitoba.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 New Brunswick.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 Newfoundland & Labrador.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 Nova Scotia.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 Ontario.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 Quebec.dta"

drop _merge

merge m:m provincestate date using "CovidLongitudinal DELP 3 Saskatchewan.dta"

drop _merge



qui compress 

save "CovidLongitudinal DELP 4", replace 






view "log CovidLongitudinal DELP 5b 11.smcl"

log close

exit, clear

