
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME 1.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 1.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download and prepare estimates files



* based on combinations of linkdate, download, and urldate
* e.g., 				   04-Nov-21 ihme-covid19  2021-11-04	https://ihmecovid19storage.blob.core.windows.net/archive/2021-11-04/ihme-covid19.zip	data_download_file_reference_2020

* Deatails: "do CovidVisualizedCountry IHME updates Canada.do"
*           "IHME updates.xlsx"







**********************************************
**********************************************
**********************************************

* Canada update 1
* linkdate	download	urldate
* 22-Apr-20	2020_04_21.08	2020_04_21
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020_04_21, update 20200422" 

copy https://www.healthdata.org/sites/default/files/files/Projects/COVID/ihme-covid19-0422.zip ihme-covid19-0422.zip
unzipfile ihme-covid19-0422.zip, replace
erase ihme-covid19-0422.zip

cd 2020_04_21.08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* There are no Daily deaths smoothed in data files, up to update 20200615

* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200422)

rename (date20200422 loc_grand_name20200422) (date loc_grand_name) 

drop TotINFMeRaA02S0120200422 DayINFMeRaA02S0120200422 TotDeaMeSmA02S0120200422 DayDeaMeSmA02S0120200422

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200422.dta", replace


shell rm -r "2020_04_21.08"



*
***








**********************************************
**********************************************
**********************************************

* Canada update 2
* linkdate	download	urldate
* 27-Apr-20	2020_04_26.08	2020_04_26
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020_04_26, update 20200427"
     
copy https://www.healthdata.org/sites/default/files/files/Projects/COVID/downloads_0427.zip downloads_0427.zip
unzipfile downloads_0427.zip, replace
erase downloads_0427.zip

cd 2020_04_26.08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200427)

rename (date20200427 loc_grand_name20200427) (date loc_grand_name) 

drop TotINFMeRaA02S0120200427 DayINFMeRaA02S0120200427 TotDeaMeSmA02S0120200427 DayDeaMeSmA02S0120200427

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200427.dta", replace


shell rm -r "2020_04_26.08"



*
***










**********************************************
**********************************************
**********************************************

* Canada update 3
* linkdate	download	urldate
* 28-Apr-20	2020_04_27.05.c	2020_04_28
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020_04_28, update 20200428"
     
copy https://www.healthdata.org/sites/default/files/files/Projects/COVID/Downloads_0428.zip Downloads_0428.zip
unzipfile Downloads_0428.zip, replace
erase Downloads_0428.zip

cd 2020_04_27.05.c

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200428)

rename (date20200428 loc_grand_name20200428) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200428.dta", replace


shell rm -r "2020_04_27.05.c"



*
***










**********************************************
**********************************************
**********************************************

* Canada update 4
* linkdate	download	urldate
* 29-Apr-20	2020_04_28.02	2020-04-29
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-04-29, update 20200429"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_28.02

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200429)

rename (date20200429 loc_grand_name20200429) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200429.dta", replace


shell rm -r "2020_04_28.02"



*
***










**********************************************
**********************************************
**********************************************

* Canada update 5
* linkdate	download	urldate
* 04-May-20	2020_05_04	2020-05-04
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-04"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-04/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_04

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200504)

rename (date20200504 loc_grand_name20200504) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200504.dta", replace


shell rm -r "2020_05_04"



*
***















**********************************************
**********************************************
**********************************************

* Canada update 6
* linkdate	download	urldate
* 10-May-20	2020_05_08	2020-05-10
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-10"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200510)

rename (date20200510 loc_grand_name20200510) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200510.dta", replace


shell rm -r "2020_05_08"



*
***












**********************************************
**********************************************
**********************************************

* Canada update 7
* linkdate	download	urldate
* 12-May-20	2020_05_10	2020-05-12
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-12"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-12/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_10

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200512)

rename (date20200512 loc_grand_name20200512) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200512.dta", replace


shell rm -r "2020_05_10"



*
***





**********************************************
**********************************************
**********************************************

* Canada update 8
* linkdate	download	urldate
* 20-May-20	2020_05_19	2020-05-20
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-20"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-20/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_19

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200520)

rename (date20200520 loc_grand_name20200520) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200520.dta", replace


shell rm -r "2020_05_19"



*
***
















**********************************************
**********************************************
**********************************************

* Canada update 9
* linkdate	download	urldate
* 25-May-20	2020_05_23	2020-05-25
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-25"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_23

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200525)

rename (date20200525 loc_grand_name20200525) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200525.dta", replace


shell rm -r "2020_05_23"



*
***












**********************************************
**********************************************
**********************************************

* Canada update 10
* linkdate	download	urldate
* 26-May-20	2020_05_23.03	2020-05-26
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-26"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-26/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_23.03

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200526)

rename (date20200526 loc_grand_name20200526) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200526.dta", replace


shell rm -r "2020_05_23.03"



*
***














**********************************************
**********************************************
**********************************************

* Canada update 11
* linkdate	download	urldate
* 29-May-20	2020_05_28	2020-05-29
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-05-29"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_28

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200529)

rename (date20200529 loc_grand_name20200529) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200529.dta", replace


shell rm -r "2020_05_28"



*
***












**********************************************
**********************************************
**********************************************

* Canada update 12
* linkdate	download	urldate
* 05-Jun-20	2020_06_03	2020-06-05
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-06-05"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-05/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_03

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200605)

rename (date20200605 loc_grand_name20200605) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200605.dta", replace


shell rm -r "2020_06_03"



*
***










**********************************************
**********************************************
**********************************************

* Canada update 13
* linkdate	download	urldate
* 08-Jun-20	2020_06_06	2020-06-08
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-06-08"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-08/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_06

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"



* Daily Deaths smoothed

rename deaths_mean_smoothed DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"




rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200608)

rename (date20200608 loc_grand_name20200608) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200608.dta", replace


shell rm -r "2020_06_06"



*
***











**********************************************
**********************************************
**********************************************

* Canada update 14
* linkdate	download	urldate
* 10-Jun-20	2020_06_08	2020-06-10
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-06-10"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"




* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"



* Daily Deaths not smoothed
gen DayDeaMeRaA02S01 = . 
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200610)

rename (date20200610 loc_grand_name20200610) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200610.dta", replace


shell rm -r "2020_06_08"



*
***













**********************************************
**********************************************
**********************************************

* Canada update 15
* linkdate	download	urldate
* 15-Jun-20	2020_06_13	2020-06-15
* filename Hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-06-15"
     
copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_13

import delimited using Hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total Deaths not smoothed, 
gen  TotINFMeRaA02S01 = .
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed, est_infections_mean not in data 
gen DayINFMeRaA02S01 = . 
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed, totdea_mean_smoothed not in data
gen TotDeaMeSmA02S01 = .
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* gen Daily Deaths smoothed

encode location_name, gen(location_name_encoded)

tsset location_name_encoded date, daily   


tssmooth ma DayDeaMeRaA02S01_window = DayDeaMeRaA02S01, window(3 1 3)

tssmooth ma DayDeaMeSmA02S01 = DayDeaMeRaA02S01_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"

drop DayDeaMeRaA02S01_window


drop location_name_encoded

tsset, clear







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200615)

rename (date20200615 loc_grand_name20200615) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200615.dta", replace


shell rm -r "2020_06_13"



*
***









**********************************************
**********************************************
**********************************************

* Canada update 16
* linkdate	download	urldate
* 25-Jun-20	2020_06_24.02	2020-06-25
* filename reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2021-05-14" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_24.02

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200625)

rename (date20200625 loc_grand_name20200625) (date loc_grand_name) 

drop TotINFMeRaA02S0120200625

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200625.dta", replace


shell rm -r "2020_06_24.02"



*
***









**********************************************
**********************************************
**********************************************

* Canada update 17
* linkdate	download	urldate
* 29-Jun-20	2020_06_27	2020-06-29
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-06-29" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_27

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200629)

rename (date20200629 loc_grand_name20200629) (date loc_grand_name) 

drop TotINFMeRaA02S0120200629

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200629.dta", replace


shell rm -r "2020_06_27"



*
***
















**********************************************
**********************************************
**********************************************

* Canada update 18
* linkdate	download	urldate
* 07-Jul-20	2020_07_04	2020-07-07
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-07-07" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-07/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_04

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200707)

rename (date20200707 loc_grand_name20200707) (date loc_grand_name) 

drop TotINFMeRaA02S0120200707

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200707.dta", replace


shell rm -r "2020_07_04"



*
***









**********************************************
**********************************************
**********************************************

* Canada update 19
* linkdate	download	urldate
* 14-Jul-20	2020_07_11	2020-07-14
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-07-14" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-14/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_11

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200714)

rename (date20200714 loc_grand_name20200714) (date loc_grand_name) 

drop TotINFMeRaA02S0120200714

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200714.dta", replace


shell rm -r "2020_07_11"



*
***














**********************************************
**********************************************
**********************************************

* Canada update 20
* linkdate	download	urldate
* 22-Jul-20	2020_07_18	2020-07-22
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-07-22" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_18

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200722)

rename (date20200722 loc_grand_name20200722) (date loc_grand_name) 

drop TotINFMeRaA02S0120200722

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200722.dta", replace


shell rm -r "2020_07_18"



*
***










**********************************************
**********************************************
**********************************************

* Canada update 21
* linkdate	download	urldate
* 30-Jul-20	2020_07_26	2020-07-30
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-07-30" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-30/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_26

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200730)

rename (date20200730 loc_grand_name20200730) (date loc_grand_name) 

drop TotINFMeRaA02S0120200730

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200730.dta", replace


shell rm -r "2020_07_26"



*
***












**********************************************
**********************************************
**********************************************

* Canada update 22
* linkdate	download	urldate
* 06-Aug-20	2020_08_06	2020-08-06
* filename Reference_hospitalization_all_locs.csv
* cd


* Could write the code piece to transform the urldate with dashes (like 2020-08-06) to downloaded directory name with underlines (like 2020_08_06) for updates where these two are not incompatible. 


clear 
				

di in red "This is urldate 2020-08-06" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-08-06/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_08_06

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200806)

rename (date20200806 loc_grand_name20200806) (date loc_grand_name) 

drop TotINFMeRaA02S0120200806

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200806.dta", replace


shell rm -r "2020_08_06"



*
***















**********************************************
**********************************************
**********************************************

* Canada update 23
* linkdate	download	urldate
* 21-Aug-20	2020_08_21	2020-08-21
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-08-21" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-08-21/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_08_21

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200821)

rename (date20200821 loc_grand_name20200821) (date loc_grand_name) 

drop TotINFMeRaA02S0120200821

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200821.dta", replace


shell rm -r "2020_08_21"



*
***








**********************************************
**********************************************
**********************************************

* Canada update 24
* linkdate	download	urldate
* 27-Aug-20	2020_08_27	2020-08-27
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-08-27" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-08-27/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_08_27

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200827)

rename (date20200827 loc_grand_name20200827) (date loc_grand_name) 

drop TotINFMeRaA02S0120200827

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200827.dta", replace


shell rm -r "2020_08_27"



*
***


















**********************************************
**********************************************
**********************************************

* Canada update 25
* linkdate	download	urldate
* 03-Sep-20	2020_09_02	2020-09-03	
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-09-03" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-03/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_02

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections

* 

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .

* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200903)

rename (date20200903 loc_grand_name20200903) (date loc_grand_name) 

drop TotINFMeRaA02S0120200903

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200903.dta", replace


shell rm -r "2020_09_02"



*
***
















**********************************************
**********************************************
**********************************************

* Canada update 26
* linkdate	download	urldate
* 11-Sep-20	2020_09_11	2020-09-11
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-09-11" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-11/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_11

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections not smoothed (inf_cuml_mean present)
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200911)

rename (date20200911 loc_grand_name20200911) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200911.dta", replace


shell rm -r "2020_09_11"



*
***














**********************************************
**********************************************
**********************************************

* Canada update 27
* linkdate	download	urldate
* 18-Sep-20	2020_09_18	2020-09-18
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-09-18" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-18/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_18

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections not smoothed (inf_cuml_mean present)
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200918)

rename (date20200918 loc_grand_name20200918) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200918.dta", replace


shell rm -r "2020_09_18"



*
***












**********************************************
**********************************************
**********************************************

* Canada update 28
* linkdate	download	urldate
* 24-Sep-20	2020_09_24	2020-09-24
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-09-24" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-24/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_24

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Total infections not smoothed (inf_cuml_mean added to date starting from update 2020-09-11)
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20200924)

rename (date20200924 loc_grand_name20200924) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20200924.dta", replace


shell rm -r "2020_09_24"



*
***
















**********************************************
**********************************************
**********************************************

* Canada update 29
* linkdate	download	urldate
* 02-Oct-20	2020_10_02	2020-10-02
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-10-02" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-02/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_02

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

*  

bysort location_name (date): generate inf_cuml_mean = sum(est_infections_mean) 
	format inf_cuml_mean %10.0f
	replace inf_cuml_mean = . if est_infections_mean == .
	
* Total infections not smoothed (inf_cuml_mean present in update 2020-09-11)
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201002)

rename (date20201002 loc_grand_name20201002) (date loc_grand_name) 

drop TotINFMeRaA02S0120201002

order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20201002.dta", replace


shell rm -r "2020_10_02"



*
***















**********************************************
**********************************************
**********************************************

* Canada update 30
* linkdate	download	urldate
* 09-Oct-20	2020_10_09  2020-10-09
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-10-09" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-09/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_09

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

* inf_cuml_mean present in data again	
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201009)

rename (date20201009 loc_grand_name20201009) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20201009.dta", replace


shell rm -r "2020_10_09"



*
***













**********************************************
**********************************************
**********************************************

* Canada update 31
* linkdate	download	urldate
* 15-Oct-20	2020_10_15	2020-10-15
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-10-15" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_15

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

* inf_cuml_mean present in data again	
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201015)

rename (date20201015 loc_grand_name20201015) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20201015.dta", replace


shell rm -r "2020_10_15"



*
***












**********************************************
**********************************************
**********************************************

* Canada update 32
* linkdate	download	urldate
* 22-Oct-20	2020_10_22	2020-10-22
* filename Reference_hospitalization_all_locs.csv
* cd


clear 
				

di in red "This is urldate 2020-10-22" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_22

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
		
rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2		
		
		
		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

* inf_cuml_mean present in data again	
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///        
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201022)

rename (date20201022 loc_grand_name20201022) (date loc_grand_name) 



order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20201022.dta", replace


shell rm -r "2020_10_22"



*
***











**********************************************
**********************************************
**********************************************

* Canada update 33
* linkdate	download	urldate
* 29-Oct-20	2020_10_29	2020-10-29
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020_10_29" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_29

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201029)

rename (date20201029 loc_grand_name20201029) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201029.dta", replace



shell rm -r "2020_10_29"


*
***
















**********************************************
**********************************************
**********************************************

* Canada update 34
* linkdate	download	urldate
* 12-Nov-20	2020_11_12	2020-11-12
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020-11-12" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-11-12/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_11_12

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201112)

rename (date20201112 loc_grand_name20201112) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201112.dta", replace



shell rm -r "2020_11_12"


*
***










**********************************************
**********************************************
**********************************************

* Canada update 35
* linkdate	download	urldate
* 19-Nov-20	2020_11_19	2020-11-19
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020-11-19" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-11-19/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_11_19

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201119)

rename (date20201119 loc_grand_name20201119) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201119.dta", replace



shell rm -r "2020_11_19"


*
***
















**********************************************
**********************************************
**********************************************

* Canada update 36
* linkdate	download	urldate
* 03-Dec-20	2020_12_03	2020-12-03
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020-12-03" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-03/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_03

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201203)

rename (date20201203 loc_grand_name20201203) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201203.dta", replace



shell rm -r "2020_12_03"


*
***

















**********************************************
**********************************************
**********************************************

* Canada update 37
* linkdate	download	urldate
* 10-Dec-20	2020_12_10	2020-12-10
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020-12-10" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_10

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201210)

rename (date20201210 loc_grand_name20201210) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201210.dta", replace



shell rm -r "2020_12_10"


*
***












**********************************************
**********************************************
**********************************************

* Canada update 38
* linkdate	download	urldate
* 17-Dec-20	2020_12_17	2020-12-17
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020-12-17" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-17/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_17

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201217)

rename (date20201217 loc_grand_name20201217) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201217.dta", replace



shell rm -r "2020_12_17"


*
***










**********************************************
**********************************************
**********************************************

* Canada update 39
* linkdate	download	urldate
* 23-Dec-20	2020_12_23	2020-12-23
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2020-12-23" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-23/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_23

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20201223)

rename (date20201223 loc_grand_name20201223) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20201223.dta", replace



shell rm -r "2020_12_23"


*
***














**********************************************
**********************************************
**********************************************

* Canada update 40
* linkdate	download	urldate
* 15-Jan-21	2021-01-15	2021-01-15
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-01-15" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-01-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021-01-15

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210115)

rename (date20210115 loc_grand_name20210115) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210115.dta", replace



shell rm -r "2021-01-15"


*
***















**********************************************
**********************************************
**********************************************

* Canada update 41
* linkdate	download	urldate
* 22-Jan-21	2021_01_22	2021-01-22
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-01-22" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-01-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_01_22

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210122)

rename (date20210122 loc_grand_name20210122) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210122.dta", replace



shell rm -r "2021_01_22"


*
***











**********************************************
**********************************************
**********************************************

* Canada update 42
* linkdate	download	urldate
* 28-Jan-21	2021_01_28	2021-01-28
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-01-28" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-01-28/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_01_28

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210128)

rename (date20210128 loc_grand_name20210128) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210128.dta", replace



shell rm -r "2021_01_28"


*
***











**********************************************
**********************************************
**********************************************

* Canada update 43
* linkdate	download	urldate
* 04-Feb-21	2021_02_04	2021-02-04
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-02-04" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-04/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_04

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210204)

rename (date20210204 loc_grand_name20210204) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210204.dta", replace



shell rm -r "2021_02_04"


*
***












**********************************************
**********************************************
**********************************************

* Canada update 44		
* linkdate	download	urldate
* 12-Feb-21	2021_02_12	2021-02-12
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-02-12" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-12/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_12

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210212)

rename (date20210212 loc_grand_name20210212) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210212.dta", replace



shell rm -r "2021_02_12"


*
***










**********************************************
**********************************************
**********************************************

* Canada update 45		
* linkdate	download	urldate
* 20-Feb-21	2021_02_20	2021-02-20
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-02-20" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-20/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_20

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210220)

rename (date20210220 loc_grand_name20210220) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210220.dta", replace



shell rm -r "2021_02_20"


*
***









**********************************************
**********************************************
**********************************************

* Canada update 46		
* linkdate	download	urldate
* 25-Feb-21	2021_02_25	2021-02-25
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-02-25" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_25

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210225)

rename (date20210225 loc_grand_name20210225) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210225.dta", replace



shell rm -r "2021_02_25"


*
***











**********************************************
**********************************************
**********************************************

* Canada update 47		
* linkdate	download	urldate
* 06-Mar-21	2021_03_06	2021-03-06
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-03-06" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-06/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_06

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210306)

rename (date20210306 loc_grand_name20210306) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210306.dta", replace



shell rm -r "2021_03_06"


*
***








**********************************************
**********************************************
**********************************************

* Canada update 48
* linkdate	download	urldate
* 11-Mar-21	2021_03_11	2021-03-11
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-03-11" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-11/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_11

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210311)

rename (date20210311 loc_grand_name20210311) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210311.dta", replace



shell rm -r "2021_03_11"


*
***












**********************************************
**********************************************
**********************************************

* Canada update 49
* linkdate	download	urldate
* 17-Mar-21	2021_03_17	2021-03-17
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-03-17" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-17/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_17

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210317)

rename (date20210317 loc_grand_name20210317) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210317.dta", replace



shell rm -r "2021_03_17"


*
***








**********************************************
**********************************************
**********************************************

* Canada update 50
* linkdate	download	urldate
* 25-Mar-21	2021_03_25	2021-03-25
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-03-25" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_25

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210325)

rename (date20210325 loc_grand_name20210325) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210325.dta", replace



shell rm -r "2021_03_25"


*
***









**********************************************
**********************************************
**********************************************

* Canada update 51
* linkdate	download	urldate
* 01-Apr-21	2021_04_01	2021-04-01
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-04-01" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-04-01/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_04_01

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210401)

rename (date20210401 loc_grand_name20210401) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210401.dta", replace



shell rm -r "2021_04_01"


*
***










**********************************************
**********************************************
**********************************************

* Canada update 52
* linkdate	download	urldate
* 09-Apr-21	2021_04_09	2021-04-09
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-04-09" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-04-09/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_04_09

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210409)

rename (date20210409 loc_grand_name20210409) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210409.dta", replace



shell rm -r "2021_04_09"


*
***









**********************************************
**********************************************
**********************************************

* Canada update 53
* linkdate	download	urldate
* 16-Apr-21	2021-04-16	2021-04-16
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-04-16" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-04-16/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021-04-16

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210416)

rename (date20210416 loc_grand_name20210416) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210416.dta", replace



shell rm -r "2021-04-16"


*
***








**********************************************
**********************************************
**********************************************

* Canada update 54
* linkdate	download	urldate
* 23-Apr-21	2021_04_22	2021-04-23
* filename reference_hospitalization_all_locs.csv
* cd
				

di in red "This is urldate 2021-04-23" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-04-23/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_04_22

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210423)

rename (date20210423 loc_grand_name20210423) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210423.dta", replace



shell rm -r "2021_04_22"


*
***









**********************************************
**********************************************
**********************************************

* Canada update 55
* linkdate	download	urldate
* 06-May-21	2021-05-06	2021-05-06
* filename reference_hospitalization_all_locs.csv
* cd 

clear 
				

di in red "This is urldate 2021-05-06" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-05-06/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021-05-06


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210506)

rename (date20210506 loc_grand_name20210506) (date loc_grand_name) 


order loc_grand_name date  

sort loc_grand_name date  


qui compress

cd ..

save "IHME20210506.dta", replace


shell rm -r "2021-05-06"


*
***













**********************************************
**********************************************
**********************************************

* Canada update 56
* linkdate	download	urldate
* 14-May-21	ihme-covid19	2021-05-14
* filename reference_hospitalization_all_locs.csv


clear 
				

di in red "This is urldate 2021-05-14" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-05-14/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210514)

rename (date20210514 loc_grand_name20210514) (date loc_grand_name) 


order loc_grand_name date  

sort loc_grand_name date  


qui compress



save "IHME20210514.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***












**********************************************
**********************************************
**********************************************

* Canada update 57 TO Canada update 64
* linkdate = urldate
* filename reference_hospitalization_all_locs.csv

/*
Canada update		updatenumber	
						linkdate	linkdate	download		urldate

Canada update 57	72	20210521	21-May-21	ihme-covid19	2021-05-21
Canada update 58	73	20210528	28-May-21	ihme-covid19	2021-05-28
Canada update 59	74	20210604	04-Jun-21	ihme-covid19	2021-06-04
Canada update 60	75	20210610	10-Jun-21	ihme-covid19	2021-06-10
Canada update 61	76	20210618	18-Jun-21	ihme-covid19	2021-06-18
Canada update 62	77	20210625	25-Jun-21	ihme-covid19	2021-06-25
Canada update 63	78	20210702	02-Jul-21	ihme-covid19	2021-07-02
Canada update 64	79	20210715	15-Jul-21	ihme-covid19	2021-07-15
*/



local list3 ///
2021-05-21 ///
2021-05-28 ///
2021-06-04 ///
2021-06-10 ///
2021-06-18 ///
2021-06-25 ///
2021-07-02 ///
2021-07-15 



foreach update of local list3 {				

di in red "This is urldate " "`update'"

copy https://ihmecovid19storage.blob.core.windows.net/archive/`update'/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*



gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag


keep date-DayDeaMeSmA02S01XSK


rename (*) (*`updatetag')

rename (date`updatetag' loc_grand_name`updatetag') (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME`updatetag'.dta", replace



shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


}
***









**********************************************
**********************************************
**********************************************

* Canada update 65 
* linkdate != urldate; 20210723, 2021-07-25
* filename reference_hospitalization_all_locs.csv 


		

di in red "This is urldate 2021-07-25, update 20210723" 


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-07-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*




keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210723)

rename (date20210723 loc_grand_name20210723) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210723.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***







**********************************************
**********************************************
**********************************************

* Canada update 66
* linkdate != urldate; 20210730, 2021-07-31
* filename reference_hospitalization_all_locs.csv 

		

di in red "This is urldate 2021-07-31, update 20210730"


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-07-31/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210730)

rename (date20210730 loc_grand_name20210730) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210730.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***













**********************************************
**********************************************
**********************************************

* Canada update 67
* linkdate	download	urldate
* 20210806	2021_08_04	2021-08-09
* filename reference_hospitalization_all_locs.csv 
* cd 
* cd: If the individual data files have been zipped together, downloading the zipped file (i.e., ihme-covid19.zip) 
*   results in individual data files being placed in the present working directory (-pwd-), i.e., |code|IHME| here). 
*   No -cd- is needed. On the other hand, if a directory containing the individual data files has been zipped, 
*   downloading the zipped file results in the unzipped directory (e.g. |2020_06_24.02|) 
*   being placed in the present working directory. Therefore, -cd- down to that directory 
*   (and -cd ..- at the end before saving the final file) is needed. 

		

di in red "This is urldate 2021-08-09, update 20210806"


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-08-09/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_08_04

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210806)

rename (date20210806 loc_grand_name20210806) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

cd ..

save "IHME20210806.dta", replace



shell rm -r "2021_08_04"


*
***












**********************************************
**********************************************
**********************************************

* Canada update 68
* linkdate	download	urldate
* 20210820	ihme-covid19	2021-08-23
* filename reference_hospitalization_all_locs.csv 


		

di in red "This is urldate 2021-08-23, update 20210820"


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-08-23/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*






keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210820)

rename (date20210820 loc_grand_name20210820) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210820.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***













**********************************************
**********************************************
**********************************************

* Canada update 69
* linkdate	download	urldate
* 26-Aug-21	ihme-covid19	2021-08-26
* filename reference_hospitalization_all_locs.csv 


		

di in red "This is urldate 2021-08-26"


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-08-26/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*






keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210826)

rename (date20210826 loc_grand_name20210826) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210826.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***










**********************************************
**********************************************
**********************************************

* Canada update 70
* linkdate	download		urldate
* 20210902	ihme-covid19 	2021-09-17; yes, yes, yes: linkdate= 20210902 and urldate = 2021-09-17
***************************************************************************************************
* filename reference_hospitalization_all_locs.csv 

		

di in red "This is urldate 2021-09-17, update 20210902"


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-09-17/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*






keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210902)

rename (date20210902 loc_grand_name20210902) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210902.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***












**********************************************
**********************************************
**********************************************

* Canada update 71
* linkdate	download	urldate
* 20210910	ihme-covid19	2021-09-14
* filename reference_hospitalization_all_locs.csv 



di in red "This is urldate 2021-09-14, update 20210910"


copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-09-14/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)


keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

		
* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"


* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"


* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
TotDeaMeRaA02S01 DayDeaMeRaA02S01 TotINFMeRaA02S01 DayINFMeRaA02S01 TotDeaMeSmA02S01 DayDeaMeSmA02S01 {

	 
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



*





keep date-DayDeaMeSmA02S01XSK


rename (*) (*20210910)

rename (date20210910 loc_grand_name20210910) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210910.dta", replace


shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


*
***













**********************************************
**********************************************
**********************************************

* Canada update 72 TO Canada update 73
* linkdate = urldate
* linkdate	download	urldate
* 16-Sep-21	ihme-covid19	2021-09-16
* 23-Sep-21	ihme-covid19	2021-09-23
* filename data_download_file_reference_2020.csv and data_download_file_reference_2021.csv


local list1 ///
2021-09-16 ///
2021-09-23 




foreach update of local list1 {				

di in red "This is urldate " "`update'"

*****************************

* get IHME estimates

copy https://ihmecovid19storage.blob.core.windows.net/archive/`update'/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


******************************

* import csv files



import delimited using data_download_file_reference_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2021.dta, replace



******************************

* gen scenario dta files


use "data_download_file_reference_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2020.dta", replace 



use "data_download_file_reference_2021.dta", clear 


local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2021.dta", replace 

append using "data_download_file_reference_2020.dta"




rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Reported Deaths Mean smoothed IHME S1" // Cumulative reported deaths (mean estimate)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Reported Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S01
label var TotINFMeSmA02S01 "Total infections Mean smoothed IHME S1" // Cumulative infections (mean estimate)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S01 // previously est_infections_mean
label var DayINFMeSmA02S01 "Daily infections Mean smoothed IHME S1" // Daily infections (mean estimate)

keep date location_name ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01
	



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01 {

	 
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



*


gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag


drop provincestate DayINFMeSmA02S01 TotINFMeSmA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01


rename (*) (*`updatetag')

rename (date`updatetag' loc_grand_name`updatetag') (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME`updatetag'.dta", replace



shell rm -r "data_dictionary.csv"
shell rm -r "data_download_file_best_masks_2020.csv"
shell rm -r "data_download_file_best_masks_2021.csv"
shell rm -r "data_download_file_reference_2020.csv"
shell rm -r "data_download_file_reference_2021.csv"
shell rm -r "data_download_file_worse_2020.csv"
shell rm -r "data_download_file_worse_2021.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "data_download_file_reference_2020.dta"
shell rm -r "data_download_file_reference_2021.dta"


}
***













**********************************************
**********************************************
**********************************************

* Canada update 74 
* linkdate != urldate; 20210930, 2021-10-01
* filename data_download_file_reference_2020.csv and data_download_file_reference_2021.csv



di in red "This is urldate 2021-10-01, update 20210930" 



copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-10-01/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


******************************

* import csv files



import delimited using data_download_file_reference_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2021.dta, replace



******************************

* gen scenario dta files


use "data_download_file_reference_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2020.dta", replace 



use "data_download_file_reference_2021.dta", clear 


local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2021.dta", replace 

append using "data_download_file_reference_2020.dta"




rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Reported Deaths Mean smoothed IHME S1" // Cumulative reported deaths (mean estimate)

* Total Excess Deaths smoothed
rename seir_cumulative_mean  TotDeXMeSmA02S01
label var TotDeXMeSmA02S01 "Total Excess Deaths Mean smoothed IHME S1" // Cumulative excess deaths (mean estimate)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Reported Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S01
label var TotINFMeSmA02S01 "Total infections Mean smoothed IHME S1" // Cumulative infections (mean estimate)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S01 // previously est_infections_mean
label var DayINFMeSmA02S01 "Daily infections Mean smoothed IHME S1" // Daily infections (mean estimate)

keep date location_name ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01
	



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01 {

	 
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



*






drop provincestate DayINFMeSmA02S01 TotINFMeSmA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01


rename (*) (*20210930)

rename (date20210930 loc_grand_name20210930) (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME20210930.dta", replace


shell rm -r "data_dictionary.csv"
shell rm -r "data_download_file_best_masks_2020.csv"
shell rm -r "data_download_file_best_masks_2021.csv"
shell rm -r "data_download_file_reference_2020.csv"
shell rm -r "data_download_file_reference_2021.csv"
shell rm -r "data_download_file_worse_2020.csv"
shell rm -r "data_download_file_worse_2021.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "data_download_file_reference_2020.dta"
shell rm -r "data_download_file_reference_2021.dta"


*
***






















**********************************************
**********************************************
**********************************************

* Canada update 75 TO Canada update 77
* linkdate = urldate
* linkdate	download	urldate
* 15-Oct-21	ihme-covid19	2021-10-15
* 21-Oct-21	ihme-covid19	2021-10-21
* 04-Nov-21	ihme-covid19	2021-11-04
* filename data_download_file_reference_2020.csv and data_download_file_reference_2021.csv


local list1 ///
2021-10-15 ///
2021-10-21 ///
2021-11-04




foreach update of local list1 {				

di in red "This is urldate " "`update'"

*****************************

* get IHME estimates

copy https://ihmecovid19storage.blob.core.windows.net/archive/`update'/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


******************************

* import csv files



import delimited using data_download_file_reference_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2021.dta, replace



******************************

* gen scenario dta files


use "data_download_file_reference_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2020.dta", replace 



use "data_download_file_reference_2021.dta", clear 


local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2021.dta", replace 

append using "data_download_file_reference_2020.dta"




rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Reported Deaths Mean smoothed IHME S1" // Cumulative reported deaths (mean estimate)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Reported Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S01
label var TotINFMeSmA02S01 "Total infections Mean smoothed IHME S1" // Cumulative infections (mean estimate)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S01 // previously est_infections_mean
label var DayINFMeSmA02S01 "Daily infections Mean smoothed IHME S1" // Daily infections (mean estimate)

keep date location_name ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01
	



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01 {

	 
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



*


gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag


drop provincestate DayINFMeSmA02S01 TotINFMeSmA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01


rename (*) (*`updatetag')

rename (date`updatetag' loc_grand_name`updatetag') (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME`updatetag'.dta", replace



shell rm -r "data_dictionary.csv"
shell rm -r "data_download_file_best_masks_2020.csv"
shell rm -r "data_download_file_best_masks_2021.csv"
shell rm -r "data_download_file_reference_2020.csv"
shell rm -r "data_download_file_reference_2021.csv"
shell rm -r "data_download_file_worse_2020.csv"
shell rm -r "data_download_file_worse_2021.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "data_download_file_reference_2020.dta"
shell rm -r "data_download_file_reference_2021.dta"


}
***













**********************************************
**********************************************
**********************************************

* Canada update 78 
* linkdate = urldate
* linkdate	download	urldate
* 21-Dec-21	ihme-covid19	2021-12-21
* filename data_download_file_reference_2020.csv and data_download_file_reference_2021.csv


local list1 ///
2021-12-21 ///





foreach update of local list1 {				

di in red "This is urldate " "`update'"

*****************************

* get IHME estimates

copy https://ihmecovid19storage.blob.core.windows.net/archive/`update'/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip


******************************

* import csv files



import delimited using data_download_file_reference_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2021.dta, replace



******************************

* gen scenario dta files


use "data_download_file_reference_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2020.dta", replace 



use "data_download_file_reference_2021.dta", clear 


local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2021.dta", replace 

append using "data_download_file_reference_2020.dta"




rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S01
label var TotDeaMeSmA02S01 "Total Reported Deaths Mean smoothed IHME S1" // Cumulative reported deaths (mean estimate)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Reported Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S01
label var TotINFMeSmA02S01 "Total infections Mean smoothed IHME S1" // Cumulative infections (mean estimate)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S01 // previously est_infections_mean
label var DayINFMeSmA02S01 "Daily infections Mean smoothed IHME S1" // Daily infections (mean estimate)

keep date location_name ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01
	



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeSmA02S01 DayINFMeSmA02S01 TotDeaMeSmA02S01 TotINFMeSmA02S01 {

	 
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



*


gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag


drop provincestate DayINFMeSmA02S01 TotINFMeSmA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01


rename (*) (*`updatetag')

rename (date`updatetag' loc_grand_name`updatetag') (date loc_grand_name)


order loc_grand_name date  

sort loc_grand_name date  

qui compress

save "IHME`updatetag'.dta", replace



shell rm -r "data_dictionary.csv"
shell rm -r "data_download_file_best_masks_2020.csv"
shell rm -r "data_download_file_best_masks_2021.csv"
shell rm -r "data_download_file_reference_2020.csv"
shell rm -r "data_download_file_reference_2021.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "data_download_file_reference_2020.dta"
shell rm -r "data_download_file_reference_2021.dta"

shell rm -r "data_download_file_severe_omicron_2020.csv"
shell rm -r "data_download_file_severe_omicron_2021.csv"
shell rm -r "data_download_file_third_dose_2020.csv"
shell rm -r "data_download_file_third_dose_2021.csv"
shell rm -r "data_download_file_reduce_hesitancy_2020.csv"
shell rm -r "data_download_file_reduce_hesitancy_2021.csv"


}
***


























**********************

view "log CovidVisualizedCountry IHME 1.smcl"

log close

exit, clear
