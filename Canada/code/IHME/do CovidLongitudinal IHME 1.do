
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 1.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 1.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download and prepare estimates files
* input data files: download csv files
* output data files: "IHME202?????.dta " (78 files)
* "graph epoch update 202?????.pdf"

* based on combinations of linkdate, download, and urldate
* e.g., 				   04-Nov-21 ihme-covid19  2021-11-04	https://ihmecovid19storage.blob.core.windows.net/archive/2021-11-04/ihme-covid19.zip	data_download_file_reference_2020

* Details: "do CovidLongitudinal IHME updates Canada.do"



grstyle init

grstyle color background white



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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(22Apr2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200422", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 22Apr2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200422.pdf", replace


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


*


keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

sort loc_grand_name provincestate date 


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200422 epoch20200422)

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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(27Apr2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200427", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 27Apr2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200427.pdf", replace


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



keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200427 epoch20200427)
 




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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

 

// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(28Apr2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200428", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 28Apr2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200428.pdf", replace


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





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200428 epoch20200428)





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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"





// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(29Apr2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200429", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 29Apr2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200429.pdf", replace






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






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date

rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200429 epoch20200429)




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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(02May2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200504", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 02May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200504.pdf", replace


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





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200504 epoch20200504)




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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(02May2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200510", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 02May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200510.pdf", replace





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




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200510 epoch20200510)



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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"





// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(10May2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200512", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 10May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200512.pdf", replace




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





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200512 epoch20200512)






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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"





// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(08May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200520", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 08May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200520.pdf", replace






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





*





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200520 epoch20200520)






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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"





// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(23May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200525", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200525.pdf", replace







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





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200525 epoch20200525)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"






// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(23May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200526", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200526.pdf", replace





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






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date

rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200526 epoch20200526)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(23May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200529", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200529.pdf", replace




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







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200529 epoch20200529)






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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(23May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200605", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200605.pdf", replace



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







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200605 epoch20200605)





qui compress

cd ..

save "IHME20200605.dta", replace


shell rm -r "2020_06_03"



*
***





* temp end




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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


* Daily Deaths smoothed

rename deaths_mean_smoothed DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"




rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120200608)





qui compress

cd ..

save "IHME20200608.dta", replace


shell rm -r "2020_06_06"




* update 20200608 epoch

// br date DayDeaMeSmA02S0120200608 if  provincestate == " National"
gen epoch = td(23May2020)
di td(23May2020)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line DayDeaMeSmA02S0120200608 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200608", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22058, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200608.pdf", replace

rename epoch epoch20200608

save "IHME20200608.dta", replace

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



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"


* Daily Deaths not smoothed
gen DayDeaMeRaA02S01 = . // data file does not have it
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(23May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200610", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200610.pdf", replace


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200610 epoch20200610)







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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(24May2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200615", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 24May2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200615.pdf", replace


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






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200615 epoch20200615)





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
				

di in red "This is urldate 2020-06-25" 

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(21Jun2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200625", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 21Jun2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200625.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200625 epoch20200625)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(21Jun2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200629", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 21Jun2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200629.pdf", replace




* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200629 epoch20200629)





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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Jul2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200707", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Jul2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200707.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"








keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200707 epoch20200707)





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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"





// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(12Jul2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200714", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 12Jul2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200714.pdf", replace




* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200714 epoch20200714)




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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(19Jul2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200722", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 19Jul2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200722.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200722 epoch20200722)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(25Jul2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200730", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 25Jul2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200730.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"







rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200730 epoch20200730)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(01Aug2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200806", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 01Aug2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200806.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200806 epoch20200806)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(01Aug2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200806", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 01Aug2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200806.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200821 epoch20200821)




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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(22Aug2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200827", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 22Aug2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200827.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200827 epoch20200827)





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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(31Aug2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200903", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 31Aug2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200903.pdf", replace




* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200903 epoch20200903)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Sep2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200911", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Sep2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200911.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200911 epoch20200911)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(12Sep2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200918", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 12Sep2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200918.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200918 epoch20200918)




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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(21Sep2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20200924", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 21Sep2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20200924.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120200924 epoch20200924)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(26Sep2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201002", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 26Sep2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201002.pdf", replace




* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"



keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201002 epoch20201002)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(03Oct2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201009", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 03Oct2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201009.pdf", replace




* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




*





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201009 epoch20201009)
 




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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Oct2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201015", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Oct2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201015.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201015 epoch20201015)





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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Oct2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201022", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Oct2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201022.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201022 epoch20201022)





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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Oct2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201029", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Oct2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201029.pdf", replace



* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 DayDeaMeRaA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201029 epoch20201029)





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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(09Nov2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201112", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 09Nov2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201112.pdf", replace
	

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201112 epoch20201112)




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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"




// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(16Nov2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201119", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 16Nov2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201119.pdf", replace
	
	
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201119 epoch20201119)





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
				
clear

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

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(28Nov2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201203", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 28Nov2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201203.pdf", replace
	
	
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"




rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201203 epoch20201203)




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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Dec2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201210", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Dec2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201210.pdf", replace
	

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201210 epoch20201210)




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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(12Dec2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201217", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 12Dec2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201217.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201217 epoch20201217)





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
				
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(18Dec2020)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20201223", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 18Dec2020")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20201223.pdf", replace
		


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120201223 epoch20201223)



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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(11Jan2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210115", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 11Jan2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210115.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date





rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210115 epoch20210115)



 

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
		
		
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	

// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(16Jan2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210122", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 16Jan2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210122.pdf", replace
		
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210122 epoch20210122)




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
				
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(22Jan2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210128", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 22Jan2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210128.pdf", replace
		
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210128 epoch20210128)





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
				

clear
				
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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(29Jan2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210204", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 29Jan2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210204.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210204 epoch20210204)





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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	

// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Feb2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210212", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Feb2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210212.pdf", replace
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210212 epoch20210212)




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
		
clear		

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(13Feb2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210220", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 13Feb2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210220.pdf", replace
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




*





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210220 epoch20210220)




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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	

// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(19Feb2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210225", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 19Feb2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210225.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





*





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210225 epoch20210225)




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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(26Feb2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210306", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 26Feb2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210306.pdf", replace


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210306 epoch20210306)





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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(05Mar2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210311", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 05Mar2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210311.pdf", replace

	
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210311 epoch20210311)





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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(12Mar2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210317", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 12Mar2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210317.pdf", replace
	

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"




rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210317 epoch20210317)





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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(19Mar2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210325", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 19Mar2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210325.pdf", replace
	

	
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210325 epoch20210325)





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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(26Mar2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210401", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 26Mar2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210401.pdf", replace
	

	
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210401 epoch20210401)




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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(01Apr2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210409", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 01Apr2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210409.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210409 epoch20210409)





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
				
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(12Apr2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210416", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 12Apr2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210416.pdf", replace
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210416 epoch20210416)




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
				
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(19Apr2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210423", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 19Apr2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210423.pdf", replace
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"




rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210423 epoch20210423)




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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(03May2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210506", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 03May2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210506.pdf", replace
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210506 epoch20210506)





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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(12May2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210514", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 12May2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210514.pdf", replace
		
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"






keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210514 epoch20210514)





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

clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


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






gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag





keep date loc_grand_name provincestate DayDeaMeSmA02S01 

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date









qui compress

save "IHME`updatetag'.dta", replace



shell rm -r "best_masks_hospitalization_all_locs.csv"
shell rm -r "IHME_COVID_19_Data_Release_Information_Sheet.pdf"
shell rm -r "reference_hospitalization_all_locs.csv"
shell rm -r "Summary_stats_all_locs.csv"
shell rm -r "worse_hospitalization_all_locs.csv"


}
***



* update 20210521 epoch

use "IHME20210521.dta", clear

rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210521)

// br date DayDeaMeSmA02S0120210521 if provincestate == " National"
gen epoch = td(17May2021)
di td(17May2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210521 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210521", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22417, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 17May2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210521.pdf", replace
		
rename epoch epoch20210521


save "IHME20210521.dta", replace

*




* update 20210528 epoch

use "IHME20210528.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210528)

// br date DayDeaMeSmA02S0120210528 if provincestate == " National"
gen epoch = td(23May2021)
di td(21May2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210528 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210528", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22421, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 21May2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210528.pdf", replace
		
rename epoch epoch20210528

save "IHME20210528.dta", replace

*





* update 20210604 epoch

use "IHME20210604.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210604)

// br date DayDeaMeSmA02S0120210604 if provincestate == " National"
gen epoch = td(01Jun2021)
di td(01Jun2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210604 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210604", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22431, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 01Jun2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210604.pdf", replace
		

rename epoch epoch20210604

save "IHME20210604.dta", replace

*








* update 20210610 epoch

use "IHME20210610.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210610)

// br date DayDeaMeSmA02S0120210610 if provincestate == " National"
gen epoch = td(08Jun2021)
di td(08Jun2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210610 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210610", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22439, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 08Jun2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210610.pdf", replace
		

rename epoch epoch20210610

save "IHME20210610.dta", replace

*







* update 20210618 epoch

use "IHME20210618.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210618)

// br date DayDeaMeSmA02S0120210618 if provincestate == " National"
gen epoch = td(16Jun2021)
di td(16Jun2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210618 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210618", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22447, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 16Jun2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210618.pdf", replace
		

rename epoch epoch20210618

save "IHME20210618.dta", replace

*







* update 20210625 epoch

use "IHME20210625.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210625)

// br date DayDeaMeSmA02S0120210625 if provincestate == " National"
gen epoch = td(23Jun2021)
di td(23Jun2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210625 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210625", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22454, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23Jun2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210625.pdf", replace
		

rename epoch epoch20210625

save "IHME20210625.dta", replace

*







* update 20210702 epoch

use "IHME20210702.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210702)

// br date DayDeaMeSmA02S0120210702 if provincestate == " National"
gen epoch = td(30Jun2021)
di td(30Jun2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210702 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210702", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22461, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 30Jun2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210702.pdf", replace
		

rename epoch epoch20210702

save "IHME20210702.dta", replace

*





* update 20210715 epoch

use "IHME20210715.dta", clear
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210715)

// br date DayDeaMeSmA02S0120210715 if provincestate == " National"
gen epoch = td(11Jul2021)
di td(11Jul2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeSmA02S0120210715 date, sort lwidth(medium) lcolor(black)) /// 	
if provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210715", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22472, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 11Jul2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210715.pdf", replace
		
rename epoch epoch20210715

save "IHME20210715.dta", replace

*



**********************************************
**********************************************
**********************************************

* Canada update 65 
* linkdate != urldate; 20210723, 2021-07-25
* filename reference_hospitalization_all_locs.csv 


		
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(19Jul2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210723", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 19Jul2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210723.pdf", replace
		


* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210723 epoch20210723)




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

		
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(26Jul2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210730", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 26Jul2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210730.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"



keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210730 epoch20210730)




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

		
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(01Aug2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210806", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 01Aug2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210806.pdf", replace
		
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210806 epoch20210806)




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


		
clear

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



* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"

	

// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(15Aug2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210820", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 15Aug2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210820.pdf", replace
		
		
* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"







keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210820 epoch20210820)




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


		
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"



// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(23Aug2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210826", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 23Aug2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210826.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210826 epoch20210826)




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

		
clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(30Aug2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210902", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 30Aug2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210902.pdf", replace
		

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"








keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210902 epoch20210902)





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


clear

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


* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"


// br date DayDeaMeRaA02S01 if location_name == "Canada"
gen epoch = td(07Sep2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line DayDeaMeRaA02S01 date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & location_name == "Canada" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, $country, National, IHME, update 20210910", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(`epoch', lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 07Sep2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210910.pdf", replace
			

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"





rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




keep date loc_grand_name provincestate DayDeaMeSmA02S01 epoch

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01 epoch) (DayDeaMeSmA02S0120210910 epoch20210910)





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



clear


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


* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Reported Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		
		
keep date location_name DayDeaMeSmA02S01 daily_deaths

order date location_name DayDeaMeSmA02S01

sort location_name date



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag








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









* update 20210916 epoch

use "IHME20210916.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(11Sep2021)
di td(11Sep2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20210916", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22534, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 11Sep2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210916.pdf", replace
		
drop daily_deaths

rename epoch epoch20210916
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210916)

save "IHME20210916.dta", replace

*







* update 20210923 epoch

use "IHME20210923.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(18Sep2021)
di td(18Sep2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20210923", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22541, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 18Sep2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210923.pdf", replace
		
drop daily_deaths

rename epoch epoch20210923
rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210923)

save "IHME20210923.dta", replace

*









**********************************************
**********************************************
**********************************************

* Canada update 74 
* linkdate != urldate; 20210930, 2021-10-01
* filename data_download_file_reference_2020.csv and data_download_file_reference_2021.csv


clear

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

* Daily Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01 
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
	


rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"


keep date loc_grand_name provincestate DayDeaMeSmA02S01 daily_deaths

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date




rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120210930)


order date loc_grand_name provincestate DayDeaMeSmA02S0120210930

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





* update 20210930 epoch

use "IHME20210930.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(25Sep2021)
di td(25Sep2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20210930", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22548, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 25Sep2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20210930.pdf", replace
		
drop daily_deaths

rename epoch epoch20210930

save "IHME20210930.dta", replace

*


















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



clear

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


* Daily Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag


keep date loc_grand_name provincestate DayDeaMeSmA02S01 daily_deaths

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date



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








* update 20211015 epoch

use "IHME20211015.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(09Oct2021)
di td(09Oct2021)
label var epoch "Forecast start date"
local epoch = epoch

twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20211015", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22562, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 09Oct2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20211015.pdf", replace
		
drop daily_deaths

rename DayDeaMeSmA02S01 DayDeaMeSmA02S0120211015
rename epoch epoch20211015

save "IHME20211015.dta", replace

*







* update 20211021 epoch

use "IHME20211021.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(16Oct2021)
di td(16Oct2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20211021", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22569, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 16Oct2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20211021.pdf", replace
		
drop daily_deaths

rename DayDeaMeSmA02S01 DayDeaMeSmA02S0120211021
rename epoch epoch20211021

save "IHME20211021.dta", replace

*






* update 20211104 epoch

use "IHME20211104.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(30Oct2021)
di td(30Oct2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20211104", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22583, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 30Oct2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20211104.pdf", replace
		
drop daily_deaths

rename DayDeaMeSmA02S01 DayDeaMeSmA02S0120211104
rename epoch epoch20211104

save "IHME20211104.dta", replace

*










**********************************************
**********************************************
**********************************************

* Canada update 78 
* linkdate = urldate
* linkdate	download	urldate
* 21-Dec-21	ihme-covid19	2021-12-21
* filename data_download_file_reference_2020.csv and data_download_file_reference_2021.csv


clear

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

* Daily Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
		



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"





gen updatedash = "`update'" 

gen year = substr(updatedash,1,4)
gen month = substr(updatedash,6,2)
gen day = substr(updatedash,9,2)

gen updatetag = year + month + day

local updatetag = updatetag

drop updatedash year month day updatetag


keep date loc_grand_name provincestate DayDeaMeSmA02S01 daily_deaths

order date loc_grand_name provincestate DayDeaMeSmA02S01

sort loc_grand_name provincestate date


rename (DayDeaMeSmA02S01) (DayDeaMeSmA02S0120211221)




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





* update 20211221 epoch

use "IHME20211221.dta", clear

* no raw estimated daily deaths in file

// br date daily_deaths if provincestate == " National"
gen epoch = td(11Dec2021)
di td(11Dec2021)
label var epoch "Forecast start date"
local epoch = epoch


twoway ///
(line daily_deaths date, sort lwidth(medium) lcolor(black)) /// 	
if date >= td(01Jan2020) & provincestate == " National" ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily reported deaths raw, $country, National, IHME, update 20211221", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xline(22625, lwidth(thin) lcolor(red)) ///
subtitle("Forecast start date is denoted with red line: 11Dec2021")

qui graph export "$pathCovidLongitudinal/IHME/graph epoch update 20211221.pdf", replace
		
drop daily_deaths
rename epoch epoch20211221

save "IHME20211221.dta", replace

*























**********************

view "log CovidLongitudinal IHME 1.smcl"

log close

exit, clear
