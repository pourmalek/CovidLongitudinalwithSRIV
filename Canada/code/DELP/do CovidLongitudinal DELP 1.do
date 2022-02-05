
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 1.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 1.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download and prepare update files



/*
Rule for harvesting updates:

Get the later version of updates with the same date where applicable.

Example: For update 20200704, there are two versions available: 
Global_20200704.csv and Global_V2_20200704.csv. 
Get the later version, Global_V2_20200704.csv.

*/



/*

File name formats on https://github.com/COVIDAnalytics/website/tree/master/data/predicted


* Global_20200417.csv (format 1 of 4)

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
20200628 


* Global_V2_20200704.csv (format 2 of 4)

20200704 ///
20200718 


* Global_V2_since100_20200723.csv (format 3 of 4)	

20200723 ///
20200926 ///
20201008 ///
20201022 ///
20201105 


* Global_V4_since100_20201119.csv (format 4 of 4)

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



*/




*********************************************************************

* Global_20200417.csv (format 1 of 4)

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
20200628 


foreach update of local list {

di in red "This is update " `update'

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_`update'.csv Global_`update'.csv

import delimited using "Global_`update'.csv", clear varnames(1)

rename country loc_grand_name

keep if loc_grand_name == "$country"

drop continent

rename province provincestate

replace provincestate = " National" if provincestate == "None"



* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

drop year month day date2


* rename outcome variables


* total vars

rename totaldetecteddeaths   TotDeaMeRaA01S00

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

rename totaldetected   TotCasMeRaA01S00

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"


* gen daily vars and rename

sort provincestate date

bysort provincestate (date): gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

bysort provincestate (date): gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]



label var DayDeaMeRaA01S00 "Daily Deaths Mean DELP S0"

label var DayCasMeRaA01S00 "Daily Cases Mean DELP S0"

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"



keep ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///


order ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///



* smooth daily deaths and daily cases

qui {

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA01S00 "Daily deaths mean smooth DELP"



tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasMeSmA01S00 "Daily cases mean smooth DELP"



drop *_window

drop provincestate_encoded

tsset, clear

}
*






* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeRaA01S00 DayCasMeRaA01S00 /// 
TotDeaMeRaA01S00 TotCasMeRaA01S00 {


*
			 
qui gen `var'XAB = `var' 
qui replace `var'XAB = . if provincestate != "Alberta"

qui gen `var'XBC = `var'
qui replace `var'XBC = . if provincestate != "British Columbia"

qui gen `var'XMB = `var'
qui replace `var'XMB = . if provincestate != "Manitoba"

qui gen `var'XXX = `var'
qui replace `var'XXX = . if provincestate != " National"

qui gen `var'XNB = `var'
qui replace `var'XNB = . if provincestate != "New Brunswick"

qui gen `var'XNL = `var'
qui replace `var'XNL = . if provincestate != "Newfoundland and Labrador"

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"


label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNS "`var' Nova Scotia"
label var `var'XON "`var' Ontario"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"


                
}
*




* smooth daily deaths and daily cases

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


	foreach var of varlist ///
	DayDeaMeRaA01S00XAB-DayCasMeRaA01S00XSK {


qui tssmooth ma `var'_window = `var' if `var' >= 0, window(3 1 3)

qui tssmooth ma `var'_sm = `var'_window, weights( 1 2 3 <4> 3 2 1) replace


	}
*

drop *_window

drop provincestate_encoded

tsset, clear


rename ///
(DayDeaMeRaA01S00XAB_sm	DayDeaMeRaA01S00XBC_sm	DayDeaMeRaA01S00XMB_sm	DayDeaMeRaA01S00XXX_sm	DayDeaMeRaA01S00XNB_sm	DayDeaMeRaA01S00XNL_sm	DayDeaMeRaA01S00XNS_sm	DayDeaMeRaA01S00XON_sm	DayDeaMeRaA01S00XQC_sm	DayDeaMeRaA01S00XSK_sm	DayCasMeRaA01S00XAB_sm	DayCasMeRaA01S00XBC_sm	DayCasMeRaA01S00XMB_sm	DayCasMeRaA01S00XXX_sm	DayCasMeRaA01S00XNB_sm	DayCasMeRaA01S00XNL_sm	DayCasMeRaA01S00XNS_sm	DayCasMeRaA01S00XON_sm	DayCasMeRaA01S00XQC_sm	DayCasMeRaA01S00XSK_sm) ///
(DayDeaMeSmA01S00XAB   	DayDeaMeSmA01S00XBC   	DayDeaMeSmA01S00XMB   	DayDeaMeSmA01S00XXX   	DayDeaMeSmA01S00XNB   	DayDeaMeSmA01S00XNL   	DayDeaMeSmA01S00XNS   	DayDeaMeSmA01S00XON   	DayDeaMeSmA01S00XQC   	DayDeaMeSmA01S00XSK   	DayCasMeSmA01S00XAB   	DayCasMeSmA01S00XBC   	DayCasMeSmA01S00XMB   	DayCasMeSmA01S00XXX   	DayCasMeSmA01S00XNB   	DayCasMeSmA01S00XNL   	DayCasMeSmA01S00XNS   	DayCasMeSmA01S00XON   	DayCasMeSmA01S00XQC   	DayCasMeSmA01S00XSK   )


labvars DayDeaMeSmA01S00XAB-DayCasMeSmA01S00XSK ,names
	   
*


drop TotDeaMeRaA01S00 DayDeaMeRaA01S00 TotCasMeRaA01S00 DayCasMeRaA01S00 DayDeaMeSmA01S00 DayCasMeSmA01S00


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)


sort date loc_grand_name provincestate 

order date loc_grand_name provincestate


qui compress

save "CovidLongitudinal DELP `update'.dta", replace


}
*














*********************************************************************


* Global_V2_20200704.csv (format 2 of 4)

local list ///
20200704 ///
20200718 


foreach update of local list {

di in red "This is update " `update'

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V2_`update'.csv Global_V2_`update'.csv

import delimited using "Global_V2_`update'.csv", clear varnames(1)

rename country loc_grand_name

keep if loc_grand_name == "$country"

drop continent

rename province provincestate

replace provincestate = " National" if provincestate == "None"



* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

drop year month day date2


* rename outcome variables


* total vars

rename totaldetecteddeaths   TotDeaMeRaA01S00

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

rename totaldetected   TotCasMeRaA01S00

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"


* gen daily vars and rename

sort provincestate date

bysort provincestate (date): gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

bysort provincestate (date): gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]



label var DayDeaMeRaA01S00 "Daily Deaths Mean DELP S0"

label var DayCasMeRaA01S00 "Daily Cases Mean DELP S0"

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"



keep ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///


order ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///



* smooth daily deaths and daily cases

qui {

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA01S00 "Daily deaths mean smooth DELP"



tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasMeSmA01S00 "Daily cases mean smooth DELP"



drop *_window

drop provincestate_encoded

tsset, clear

}
*






* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeRaA01S00 DayCasMeRaA01S00 /// 
TotDeaMeRaA01S00 TotCasMeRaA01S00 {


*
			 
qui gen `var'XAB = `var' 
qui replace `var'XAB = . if provincestate != "Alberta"

qui gen `var'XBC = `var'
qui replace `var'XBC = . if provincestate != "British Columbia"

qui gen `var'XMB = `var'
qui replace `var'XMB = . if provincestate != "Manitoba"

qui gen `var'XXX = `var'
qui replace `var'XXX = . if provincestate != " National"

qui gen `var'XNB = `var'
qui replace `var'XNB = . if provincestate != "New Brunswick"

qui gen `var'XNL = `var'
qui replace `var'XNL = . if provincestate != "Newfoundland and Labrador"

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"


label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNS "`var' Nova Scotia"
label var `var'XON "`var' Ontario"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"


                
}
*




* smooth daily deaths and daily cases

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


	foreach var of varlist ///
	DayDeaMeRaA01S00XAB-DayCasMeRaA01S00XSK {


qui tssmooth ma `var'_window = `var' if `var' >= 0, window(3 1 3)

qui tssmooth ma `var'_sm = `var'_window, weights( 1 2 3 <4> 3 2 1) replace


	}
*

drop *_window

drop provincestate_encoded

tsset, clear


rename ///
(DayDeaMeRaA01S00XAB_sm	DayDeaMeRaA01S00XBC_sm	DayDeaMeRaA01S00XMB_sm	DayDeaMeRaA01S00XXX_sm	DayDeaMeRaA01S00XNB_sm	DayDeaMeRaA01S00XNL_sm	DayDeaMeRaA01S00XNS_sm	DayDeaMeRaA01S00XON_sm	DayDeaMeRaA01S00XQC_sm	DayDeaMeRaA01S00XSK_sm	DayCasMeRaA01S00XAB_sm	DayCasMeRaA01S00XBC_sm	DayCasMeRaA01S00XMB_sm	DayCasMeRaA01S00XXX_sm	DayCasMeRaA01S00XNB_sm	DayCasMeRaA01S00XNL_sm	DayCasMeRaA01S00XNS_sm	DayCasMeRaA01S00XON_sm	DayCasMeRaA01S00XQC_sm	DayCasMeRaA01S00XSK_sm) ///
(DayDeaMeSmA01S00XAB   	DayDeaMeSmA01S00XBC   	DayDeaMeSmA01S00XMB   	DayDeaMeSmA01S00XXX   	DayDeaMeSmA01S00XNB   	DayDeaMeSmA01S00XNL   	DayDeaMeSmA01S00XNS   	DayDeaMeSmA01S00XON   	DayDeaMeSmA01S00XQC   	DayDeaMeSmA01S00XSK   	DayCasMeSmA01S00XAB   	DayCasMeSmA01S00XBC   	DayCasMeSmA01S00XMB   	DayCasMeSmA01S00XXX   	DayCasMeSmA01S00XNB   	DayCasMeSmA01S00XNL   	DayCasMeSmA01S00XNS   	DayCasMeSmA01S00XON   	DayCasMeSmA01S00XQC   	DayCasMeSmA01S00XSK   )


labvars DayDeaMeSmA01S00XAB-DayCasMeSmA01S00XSK ,names
	   
*


drop TotDeaMeRaA01S00 DayDeaMeRaA01S00 TotCasMeRaA01S00 DayCasMeRaA01S00 DayDeaMeSmA01S00 DayCasMeSmA01S00


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)


sort date loc_grand_name provincestate 

order date loc_grand_name provincestate 

qui compress

save "CovidLongitudinal DELP `update'.dta", replace


}
*
















*********************************************************************


* Global_V2_since100_20200723.csv (format 3 of 4)	

local list ///
20200723 ///
20200926 ///
20201008 ///
20201022 ///
20201105 



foreach update of local list {

di in red "This is update " `update'

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V2_since100_`update'.csv Global_V2_since100_`update'.csv

import delimited using "Global_V2_since100_`update'.csv", clear varnames(1)

rename country loc_grand_name

keep if loc_grand_name == "$country"

drop continent

rename province provincestate

replace provincestate = " National" if provincestate == "None"



* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

drop year month day date2


* rename outcome variables


* total vars

rename totaldetecteddeaths   TotDeaMeRaA01S00

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

rename totaldetected   TotCasMeRaA01S00

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"


* gen daily vars and rename

sort provincestate date

bysort provincestate (date): gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

bysort provincestate (date): gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]



label var DayDeaMeRaA01S00 "Daily Deaths Mean DELP S0"

label var DayCasMeRaA01S00 "Daily Cases Mean DELP S0"

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"



keep ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///


order ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///



* smooth daily deaths and daily cases

qui {

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA01S00 "Daily deaths mean smooth DELP"



tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasMeSmA01S00 "Daily cases mean smooth DELP"



drop *_window

drop provincestate_encoded

tsset, clear

}
*






* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeRaA01S00 DayCasMeRaA01S00 /// 
TotDeaMeRaA01S00 TotCasMeRaA01S00 {


*
			 
qui gen `var'XAB = `var' 
qui replace `var'XAB = . if provincestate != "Alberta"

qui gen `var'XBC = `var'
qui replace `var'XBC = . if provincestate != "British Columbia"

qui gen `var'XMB = `var'
qui replace `var'XMB = . if provincestate != "Manitoba"

qui gen `var'XXX = `var'
qui replace `var'XXX = . if provincestate != " National"

qui gen `var'XNB = `var'
qui replace `var'XNB = . if provincestate != "New Brunswick"

qui gen `var'XNL = `var'
qui replace `var'XNL = . if provincestate != "Newfoundland and Labrador"

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"


label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNS "`var' Nova Scotia"
label var `var'XON "`var' Ontario"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"


                
}
*




* smooth daily deaths and daily cases

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


	foreach var of varlist ///
	DayDeaMeRaA01S00XAB-DayCasMeRaA01S00XSK {


qui tssmooth ma `var'_window = `var' if `var' >= 0, window(3 1 3)

qui tssmooth ma `var'_sm = `var'_window, weights( 1 2 3 <4> 3 2 1) replace


	}
*

drop *_window

drop provincestate_encoded

tsset, clear


rename ///
(DayDeaMeRaA01S00XAB_sm	DayDeaMeRaA01S00XBC_sm	DayDeaMeRaA01S00XMB_sm	DayDeaMeRaA01S00XXX_sm	DayDeaMeRaA01S00XNB_sm	DayDeaMeRaA01S00XNL_sm	DayDeaMeRaA01S00XNS_sm	DayDeaMeRaA01S00XON_sm	DayDeaMeRaA01S00XQC_sm	DayDeaMeRaA01S00XSK_sm	DayCasMeRaA01S00XAB_sm	DayCasMeRaA01S00XBC_sm	DayCasMeRaA01S00XMB_sm	DayCasMeRaA01S00XXX_sm	DayCasMeRaA01S00XNB_sm	DayCasMeRaA01S00XNL_sm	DayCasMeRaA01S00XNS_sm	DayCasMeRaA01S00XON_sm	DayCasMeRaA01S00XQC_sm	DayCasMeRaA01S00XSK_sm) ///
(DayDeaMeSmA01S00XAB   	DayDeaMeSmA01S00XBC   	DayDeaMeSmA01S00XMB   	DayDeaMeSmA01S00XXX   	DayDeaMeSmA01S00XNB   	DayDeaMeSmA01S00XNL   	DayDeaMeSmA01S00XNS   	DayDeaMeSmA01S00XON   	DayDeaMeSmA01S00XQC   	DayDeaMeSmA01S00XSK   	DayCasMeSmA01S00XAB   	DayCasMeSmA01S00XBC   	DayCasMeSmA01S00XMB   	DayCasMeSmA01S00XXX   	DayCasMeSmA01S00XNB   	DayCasMeSmA01S00XNL   	DayCasMeSmA01S00XNS   	DayCasMeSmA01S00XON   	DayCasMeSmA01S00XQC   	DayCasMeSmA01S00XSK   )


labvars DayDeaMeSmA01S00XAB-DayCasMeSmA01S00XSK ,names
	   
*


drop TotDeaMeRaA01S00 DayDeaMeRaA01S00 TotCasMeRaA01S00 DayCasMeRaA01S00 DayDeaMeSmA01S00 DayCasMeSmA01S00


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)


sort date loc_grand_name provincestate 

order date loc_grand_name provincestate 

qui compress

save "CovidLongitudinal DELP `update'.dta", replace


}
*

























*********************************************************************

* Global_V4_since100_20201119.csv (format 4 of 4)

local list ///
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

di in red "This is update " `update'

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V4_since100_`update'.csv Global_V4_since100_`update'.csv

import delimited using "Global_V4_since100_`update'.csv", clear varnames(1)

rename country loc_grand_name

keep if loc_grand_name == "$country"

drop continent

rename province provincestate

replace provincestate = " National" if provincestate == "None"



* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

drop year month day date2


* rename outcome variables


* total vars

rename totaldetecteddeaths   TotDeaMeRaA01S00

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

rename totaldetected   TotCasMeRaA01S00

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"


* gen daily vars and rename

sort provincestate date

bysort provincestate (date): gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

bysort provincestate (date): gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]



label var DayDeaMeRaA01S00 "Daily Deaths Mean DELP S0"

label var DayCasMeRaA01S00 "Daily Cases Mean DELP S0"

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"



keep ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///


order ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00  ///
DayDeaMeRaA01S00  ///
TotCasMeRaA01S00  ///
DayCasMeRaA01S00  ///



* smooth daily deaths and daily cases

qui {

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA01S00 "Daily deaths mean smooth DELP"



tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasMeSmA01S00 "Daily cases mean smooth DELP"



drop *_window

drop provincestate_encoded

tsset, clear

}
*






* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeRaA01S00 DayCasMeRaA01S00 /// 
TotDeaMeRaA01S00 TotCasMeRaA01S00 {


*
			 
qui gen `var'XAB = `var' 
qui replace `var'XAB = . if provincestate != "Alberta"

qui gen `var'XBC = `var'
qui replace `var'XBC = . if provincestate != "British Columbia"

qui gen `var'XMB = `var'
qui replace `var'XMB = . if provincestate != "Manitoba"

qui gen `var'XXX = `var'
qui replace `var'XXX = . if provincestate != " National"

qui gen `var'XNB = `var'
qui replace `var'XNB = . if provincestate != "New Brunswick"

qui gen `var'XNL = `var'
qui replace `var'XNL = . if provincestate != "Newfoundland and Labrador"

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"


label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNS "`var' Nova Scotia"
label var `var'XON "`var' Ontario"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"


                
}
*




* smooth daily deaths and daily cases

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


	foreach var of varlist ///
	DayDeaMeRaA01S00XAB-DayCasMeRaA01S00XSK {


qui tssmooth ma `var'_window = `var' if `var' >= 0, window(3 1 3)

qui tssmooth ma `var'_sm = `var'_window, weights( 1 2 3 <4> 3 2 1) replace


	}
*

drop *_window

drop provincestate_encoded

tsset, clear


rename ///
(DayDeaMeRaA01S00XAB_sm	DayDeaMeRaA01S00XBC_sm	DayDeaMeRaA01S00XMB_sm	DayDeaMeRaA01S00XXX_sm	DayDeaMeRaA01S00XNB_sm	DayDeaMeRaA01S00XNL_sm	DayDeaMeRaA01S00XNS_sm	DayDeaMeRaA01S00XON_sm	DayDeaMeRaA01S00XQC_sm	DayDeaMeRaA01S00XSK_sm	DayCasMeRaA01S00XAB_sm	DayCasMeRaA01S00XBC_sm	DayCasMeRaA01S00XMB_sm	DayCasMeRaA01S00XXX_sm	DayCasMeRaA01S00XNB_sm	DayCasMeRaA01S00XNL_sm	DayCasMeRaA01S00XNS_sm	DayCasMeRaA01S00XON_sm	DayCasMeRaA01S00XQC_sm	DayCasMeRaA01S00XSK_sm) ///
(DayDeaMeSmA01S00XAB   	DayDeaMeSmA01S00XBC   	DayDeaMeSmA01S00XMB   	DayDeaMeSmA01S00XXX   	DayDeaMeSmA01S00XNB   	DayDeaMeSmA01S00XNL   	DayDeaMeSmA01S00XNS   	DayDeaMeSmA01S00XON   	DayDeaMeSmA01S00XQC   	DayDeaMeSmA01S00XSK   	DayCasMeSmA01S00XAB   	DayCasMeSmA01S00XBC   	DayCasMeSmA01S00XMB   	DayCasMeSmA01S00XXX   	DayCasMeSmA01S00XNB   	DayCasMeSmA01S00XNL   	DayCasMeSmA01S00XNS   	DayCasMeSmA01S00XON   	DayCasMeSmA01S00XQC   	DayCasMeSmA01S00XSK   )


labvars DayDeaMeSmA01S00XAB-DayCasMeSmA01S00XSK ,names
	   
*


drop TotDeaMeRaA01S00 DayDeaMeRaA01S00 TotCasMeRaA01S00 DayCasMeRaA01S00 DayDeaMeSmA01S00 DayCasMeSmA01S00


* add update to varnames

rename (*) (*`update')

rename (date`update' loc_grand_name`update' provincestate`update') (date loc_grand_name provincestate)


sort date loc_grand_name provincestate 

order date loc_grand_name provincestate 

qui compress

save "CovidLongitudinal DELP `update'.dta", replace


}
*


view "log CovidLongitudinal DELP 1.smcl"

log close

exit, clear




