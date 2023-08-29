
clear all

cd "$pathCovidLongitudinal/download/YYGU"

capture log close 

log using "log CovidLongitudinal YYGU.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal YYGU.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Download estimates files for YYGU model                                                                   
***************************************************************************


* download and prepare update files
* input data files: download csv files
* output data files: "CovidLongitudinal YYGU 202?????.dta" 
*                    "YYGU countries.dta"
*                    "YYGU countries long.dta"





/*

(1) Estimates for all countries except USA are located in 2020-??-??_global.csv files

https://github.com/youyanggu/covid19_projections/tree/master/projections/combined/ 2020-??-??_global.csv


(2) Estimates for the USA are located in 2020-??-??_us.csv files

https://github.com/youyanggu/covid19_projections/tree/master/projections/combined/ 2020-??-??_us.csv


Calendar date range within each pair of update dates for (1) all countries except USA 
and for (2) USA are not identical. 
This prevents the full range of dates to be used for merging these two series of estimates. 
Therefore, a calendar file for 2020 is added to each series before merging calendar dates 
using similar update dates in the two series. 

*/




* gen calendar file 2020

clear

di td(01jan2020) // 21915

di td(31dec2020) // 22280

di td(31dec2020) - td(01jan2020) + 1 // 366



set obs 366

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/366

format date %tdDDMonCCYY

codebook date

save "calendar 2020.dta", replace







* (1) Estimates for all countries except USA


local list `" "2020-04-02" "2020-04-03" "2020-04-04" "2020-04-05" "2020-04-06" "2020-04-07" "2020-04-08" "2020-04-09" "2020-04-10" "2020-04-11" "2020-04-12" "2020-04-13" "2020-04-14" "2020-04-15" "2020-04-16" "2020-04-17" "2020-04-18" "2020-04-19" "2020-04-20" "2020-04-21" "2020-04-22" "2020-04-23" "2020-04-24" "2020-04-25" "2020-04-26" "2020-04-27" "2020-04-28" "2020-04-29" "2020-04-30" "2020-05-01" "2020-05-02" "2020-05-03" "2020-05-04" "2020-05-05" "2020-05-06" "2020-05-07" "2020-05-08" "2020-05-09" "2020-05-10" "2020-05-11" "2020-05-12" "2020-05-13" "2020-05-14" "2020-05-15" "2020-05-16" "2020-05-17" "2020-05-18" "2020-05-19" "2020-05-20" "2020-05-21" "2020-05-22" "2020-05-23" "2020-05-24" "2020-05-25" "2020-05-26" "2020-05-27" "2020-05-28" "2020-05-29" "2020-05-30" "2020-05-31" "2020-06-01" "2020-06-02" "2020-06-03" "2020-06-04" "2020-06-05" "2020-06-06" "2020-06-07" "2020-06-08" "2020-06-09" "2020-06-10" "2020-06-11" "2020-06-12" "2020-06-13" "2020-06-14" "2020-06-15" "2020-06-16" "2020-06-17" "2020-06-18" "2020-06-19" "2020-06-20" "2020-06-21" "2020-06-22" "2020-06-23" "2020-06-24" "2020-06-25" "2020-06-26" "2020-06-27" "2020-06-28" "2020-06-29" "2020-06-30" "2020-07-01" "2020-07-02" "2020-07-03" "2020-07-04" "2020-07-05" "2020-07-06" "2020-07-07" "2020-07-08" "2020-07-09" "2020-07-10" "2020-07-11" "2020-07-12" "2020-07-13" "2020-07-14" "2020-07-15" "2020-07-16" "2020-07-17" "2020-07-18" "2020-07-19" "2020-07-20" "2020-07-21" "2020-07-22" "2020-07-23" "2020-07-24" "2020-07-25" "2020-07-26" "2020-07-27" "2020-07-28" "2020-07-29" "2020-07-30" "2020-07-31" "2020-08-01" "2020-08-02" "2020-08-03" "2020-08-04" "2020-08-05" "2020-08-06" "2020-08-07" "2020-08-08" "2020-08-09" "2020-08-10" "2020-08-11" "2020-08-12" "2020-08-13" "2020-08-14" "2020-08-15" "2020-08-16" "2020-08-17" "2020-08-18" "2020-08-19" "2020-08-20" "2020-08-21" "2020-08-22" "2020-08-23" "2020-08-24" "2020-08-25" "2020-08-26" "2020-08-27" "2020-08-28" "2020-08-29" "2020-08-30" "2020-08-31" "2020-09-01" "2020-09-02" "2020-09-03" "2020-09-04" "2020-09-05" "2020-09-06" "2020-09-07" "2020-09-08" "2020-09-09" "2020-09-10" "2020-09-11" "2020-09-12" "2020-09-13" "2020-09-14" "2020-09-15" "2020-09-16" "2020-09-17" "2020-09-18" "2020-09-19" "2020-09-20" "2020-09-21" "2020-09-22" "2020-09-23" "2020-09-24" "2020-09-25" "2020-09-26" "2020-09-27" "2020-09-28" "2020-09-29" "2020-09-30" "2020-10-01" "2020-10-02" "2020-10-03" "2020-10-04" "'


foreach update of local list {

di in red "This is YYGU update "  "`update'" "_global.csv" 

capture shell rm -r "`update'_global.csv"

clear

copy https://raw.githubusercontent.com/youyanggu/covid19_projections/master/projections/combined/`update'_global.csv `update'_global.csv

import delimited using "`update'_global.csv", clear varnames(1)

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2

keep date country predicted_deaths_mean

rename predicted_deaths_mean DayDeaMeRaYYGU

rename country loc_grand_name


* country names to loc_grand_name

replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea" 

label var DayDeaMeRaYYGU "Daily Deaths Mean YYGU"

gen update = "`update'"

replace update = subinstr(update, "-", "",.)

destring update, replace

format update %8.0f

local update = update

gen update_date`update' = date("`update'", "YMD")

rename DayDeaMeRaYYGU DayDeaMeRaYYGU`update'

qui compress 

save "CovidLongitudinal YYGU `update'.dta", replace

merge m:m date using "calendar 2020.dta"

drop _merge

save "CovidLongitudinal YYGU global `update'.dta", replace


}
*









* "latest_global.csv"

di in red "This is YYGU update latest_global.csv" 

capture shell rm -r  "latest_global.csv"

clear

copy https://raw.githubusercontent.com/youyanggu/covid19_projections/master/projections/combined/latest_global.csv latest_global.csv

import delimited using "latest_global.csv", clear varnames(1)

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2

keep date country predicted_deaths_mean

rename predicted_deaths_mean DayDeaMeRaYYGU

rename country loc_grand_name

label var DayDeaMeRaYYGU "Daily Deaths Mean YYGU"

gen update = 20201005

format update %8.0f

rename DayDeaMeRaYYGU DayDeaMeRaYYGU20201005

qui compress 

save "CovidLongitudinal YYGU 20201005.dta", replace

merge m:m date using "calendar 2020.dta"

drop _merge

save "CovidLongitudinal YYGU global 20201005.dta", replace

*






* (2) Estimates for the USA


local list `" "2020-04-01" "2020-04-02" "2020-04-03" "2020-04-04" "2020-04-05" "2020-04-06" "2020-04-07" "2020-04-08" "2020-04-09" "2020-04-10" "2020-04-11" "2020-04-12" "2020-04-13" "2020-04-14" "2020-04-15" "2020-04-16" "2020-04-17" "2020-04-18" "2020-04-19" "2020-04-20" "2020-04-21" "2020-04-22" "2020-04-23" "2020-04-24" "2020-04-25" "2020-04-26" "2020-04-27" "2020-04-28" "2020-04-29" "2020-04-30" "2020-05-01" "2020-05-02" "2020-05-03" "2020-05-04" "2020-05-05" "2020-05-06" "2020-05-07" "2020-05-08" "2020-05-09" "2020-05-10" "2020-05-11" "2020-05-12" "2020-05-13" "2020-05-14" "2020-05-15" "2020-05-16" "2020-05-17" "2020-05-18" "2020-05-19" "2020-05-20" "2020-05-21" "2020-05-22" "2020-05-23" "2020-05-24" "2020-05-25" "2020-05-26" "2020-05-27" "2020-05-28" "2020-05-29" "2020-05-30" "2020-05-31" "2020-06-01" "2020-06-02" "2020-06-03" "2020-06-04" "2020-06-05" "2020-06-06" "2020-06-07" "2020-06-08" "2020-06-09" "2020-06-10" "2020-06-11" "2020-06-12" "2020-06-13" "2020-06-14" "2020-06-15" "2020-06-16" "2020-06-17" "2020-06-18" "2020-06-19" "2020-06-20" "2020-06-21" "2020-06-22" "2020-06-23" "2020-06-24" "2020-06-25" "2020-06-26" "2020-06-27" "2020-06-28" "2020-06-29" "2020-06-30" "2020-07-01" "2020-07-02" "2020-07-03" "2020-07-04" "2020-07-05" "2020-07-06" "2020-07-07" "2020-07-08" "2020-07-09" "2020-07-10" "2020-07-11" "2020-07-12" "2020-07-13" "2020-07-14" "2020-07-15" "2020-07-16" "2020-07-17" "2020-07-18" "2020-07-19" "2020-07-20" "2020-07-21" "2020-07-22" "2020-07-23" "2020-07-24" "2020-07-25" "2020-07-26" "2020-07-27" "2020-07-28" "2020-07-29" "2020-07-30" "2020-07-31" "2020-08-01" "2020-08-02" "2020-08-03" "2020-08-04" "2020-08-05" "2020-08-06" "2020-08-07" "2020-08-08" "2020-08-09" "2020-08-10" "2020-08-11" "2020-08-12" "2020-08-13" "2020-08-14" "2020-08-15" "2020-08-16" "2020-08-17" "2020-08-18" "2020-08-19" "2020-08-20" "2020-08-21" "2020-08-22" "2020-08-23" "2020-08-24" "2020-08-25" "2020-08-26" "2020-08-27" "2020-08-28" "2020-08-29" "2020-08-30" "2020-08-31" "2020-09-01" "2020-09-02" "2020-09-03" "2020-09-04" "2020-09-05" "2020-09-06" "2020-09-07" "2020-09-08" "2020-09-09" "2020-09-10" "2020-09-11" "2020-09-12" "2020-09-13" "2020-09-14" "2020-09-15" "2020-09-16" "2020-09-17" "2020-09-18" "2020-09-19" "2020-09-20" "2020-09-21" "2020-09-22" "2020-09-23" "2020-09-24" "2020-09-25" "2020-09-26" "2020-09-27" "2020-09-28" "2020-09-29" "2020-09-30" "2020-10-01" "2020-10-02" "2020-10-03" "2020-10-04" "'


foreach update of local list {

di in red "This is YYGU update "  "`update'" "_us.csv" 

capture shell rm -r "`update'_us.csv"

clear

copy https://raw.githubusercontent.com/youyanggu/covid19_projections/master/projections/combined/`update'_us.csv `update'_us.csv

import delimited using "`update'_us.csv", clear varnames(1)

keep if region == "" // national level


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2

keep date country predicted_deaths_mean

rename predicted_deaths_mean DayDeaMeRaYYGU

rename country loc_grand_name

* country names to loc_grand_name
replace loc_grand_name = "United States of America" if loc_grand_name == "US" 

label var DayDeaMeRaYYGU "Daily Deaths Mean YYGU"

gen update = "`update'"

replace update = subinstr(update, "-", "",.)

destring update, replace

format update %8.0f

local update = update

gen update_date`update' = date("`update'", "YMD")

rename DayDeaMeRaYYGU DayDeaMeRaYYGU`update'

qui compress 

save "CovidLongitudinal YYGU USA `update'.dta", replace

merge m:m date using "calendar 2020.dta"

drop _merge

save "CovidLongitudinal YYGU USA `update'.dta", replace

}
*







* merge estimates for (1) Estimates for all countries except USA and (2) Estimates for the USA

* 20200401 does not have countries other than USA
* 20201005 does not have USA

local list ///
20200402 ///
20200403 ///
20200404 ///
20200405 ///
20200406 ///
20200407 ///
20200408 ///
20200409 ///
20200410 ///
20200411 ///
20200412 ///
20200413 ///
20200414 ///
20200415 ///
20200416 ///
20200417 ///
20200418 ///
20200419 ///
20200420 ///
20200421 ///
20200422 ///
20200423 ///
20200424 ///
20200425 ///
20200426 ///
20200427 ///
20200428 ///
20200429 ///
20200430 ///
20200501 ///
20200502 ///
20200503 ///
20200504 ///
20200505 ///
20200506 ///
20200507 ///
20200508 ///
20200509 ///
20200510 ///
20200511 ///
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200518 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200605 ///
20200606 ///
20200607 ///
20200608 ///
20200609 ///
20200610 ///
20200611 ///
20200612 ///
20200613 ///
20200614 ///
20200615 ///
20200616 ///
20200617 ///
20200618 ///
20200619 ///
20200620 ///
20200621 ///
20200622 ///
20200623 ///
20200624 ///
20200625 ///
20200626 ///
20200627 ///
20200628 ///
20200629 ///
20200630 ///
20200701 ///
20200702 ///
20200703 ///
20200704 ///
20200705 ///
20200706 ///
20200707 ///
20200708 ///
20200709 ///
20200710 ///
20200711 ///
20200712 ///
20200713 ///
20200714 ///
20200715 ///
20200716 ///
20200717 ///
20200718 ///
20200719 ///
20200720 ///
20200721 ///
20200722 ///
20200723 ///
20200724 ///
20200725 ///
20200726 ///
20200727 ///
20200728 ///
20200729 ///
20200730 ///
20200731 ///
20200801 ///
20200802 ///
20200803 ///
20200804 ///
20200805 ///
20200806 ///
20200807 ///
20200808 ///
20200809 ///
20200810 ///
20200811 ///
20200812 ///
20200813 ///
20200814 ///
20200815 ///
20200816 ///
20200817 ///
20200818 ///
20200819 ///
20200820 ///
20200821 ///
20200822 ///
20200823 ///
20200824 ///
20200825 ///
20200826 ///
20200827 ///
20200828 ///
20200829 ///
20200830 ///
20200831 ///
20200901 ///
20200902 ///
20200903 ///
20200904 ///
20200905 ///
20200906 ///
20200907 ///
20200908 ///
20200909 ///
20200910 ///
20200911 ///
20200912 ///
20200913 ///
20200914 ///
20200915 ///
20200916 ///
20200917 ///
20200918 ///
20200919 ///
20200920 ///
20200921 ///
20200922 ///
20200923 ///
20200924 ///
20200925 ///
20200926 ///
20200927 ///
20200928 ///
20200929 ///
20200930 ///
20201001 ///
20201002 ///
20201003 ///
20201004


foreach update of local list { 

	use "CovidLongitudinal YYGU global `update'.dta", clear 
	
	merge m:m loc_grand_name date using "CovidLongitudinal YYGU USA `update'.dta"
	
	* country names to loc_grand_name

	replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea" 
	replace loc_grand_name = "United States of America" if loc_grand_name == "US" 
	
	drop _merge
	
	save "CovidLongitudinal YYGU `update'.dta", replace

}
*




**********
* 20200401 does not have countries other than USA
* 20201005 does not have USA


use "CovidLongitudinal YYGU USA 20200401.dta"
save "CovidLongitudinal YYGU with USA 20200401.dta", replace
save "CovidLongitudinal YYGU 20200401.dta", replace

use "CovidLongitudinal YYGU 20201005.dta", clear 
save "CovidLongitudinal YYGU with USA 20201005.dta", replace
save "CovidLongitudinal YYGU 20201005.dta", replace











**********************************************
**********************************************

**********************************************
**********************************************

* gen list of countries and update dates



local list ///
20200401 ///
20200402 ///
20200403 ///
20200404 ///
20200405 ///
20200406 ///
20200407 ///
20200408 ///
20200409 ///
20200410 ///
20200411 ///
20200412 ///
20200413 ///
20200414 ///
20200415 ///
20200416 ///
20200417 ///
20200418 ///
20200419 ///
20200420 ///
20200421 ///
20200422 ///
20200423 ///
20200424 ///
20200425 ///
20200426 ///
20200427 ///
20200428 ///
20200429 ///
20200430 ///
20200501 ///
20200502 ///
20200503 ///
20200504 ///
20200505 ///
20200506 ///
20200507 ///
20200508 ///
20200509 ///
20200510 ///
20200511 ///
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200518 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200605 ///
20200606 ///
20200607 ///
20200608 ///
20200609 ///
20200610 ///
20200611 ///
20200612 ///
20200613 ///
20200614 ///
20200615 ///
20200616 ///
20200617 ///
20200618 ///
20200619 ///
20200620 ///
20200621 ///
20200622 ///
20200623 ///
20200624 ///
20200625 ///
20200626 ///
20200627 ///
20200628 ///
20200629 ///
20200630 ///
20200701 ///
20200702 ///
20200703 ///
20200704 ///
20200705 ///
20200706 ///
20200707 ///
20200708 ///
20200709 ///
20200710 ///
20200711 ///
20200712 ///
20200713 ///
20200714 ///
20200715 ///
20200716 ///
20200717 ///
20200718 ///
20200719 ///
20200720 ///
20200721 ///
20200722 ///
20200723 ///
20200724 ///
20200725 ///
20200726 ///
20200727 ///
20200728 ///
20200729 ///
20200730 ///
20200731 ///
20200801 ///
20200802 ///
20200803 ///
20200804 ///
20200805 ///
20200806 ///
20200807 ///
20200808 ///
20200809 ///
20200810 ///
20200811 ///
20200812 ///
20200813 ///
20200814 ///
20200815 ///
20200816 ///
20200817 ///
20200818 ///
20200819 ///
20200820 ///
20200821 ///
20200822 ///
20200823 ///
20200824 ///
20200825 ///
20200826 ///
20200827 ///
20200828 ///
20200829 ///
20200830 ///
20200831 ///
20200901 ///
20200902 ///
20200903 ///
20200904 ///
20200905 ///
20200906 ///
20200907 ///
20200908 ///
20200909 ///
20200910 ///
20200911 ///
20200912 ///
20200913 ///
20200914 ///
20200915 ///
20200916 ///
20200917 ///
20200918 ///
20200919 ///
20200920 ///
20200921 ///
20200922 ///
20200923 ///
20200924 ///
20200925 ///
20200926 ///
20200927 ///
20200928 ///
20200929 ///
20200930 ///
20201001 ///
20201002 ///
20201003 ///
20201004 ///
20201005 ///




foreach update of local list {

	use "CovidLongitudinal YYGU `update'.dta", clear
			
	contract loc_grand_name
	
	drop _freq
		
	rename loc_grand_name loc_grand_name`update'
	
	gen counter = _n
	
	save "YYGU `update' countries.dta", replace

}
*








use "YYGU 20200401 countries.dta" 


foreach update of local list {

	merge m:m counter using "YYGU `update' countries.dta"
	
	drop _merge

}
*


order counter

qui compress 

save "YYGU countries.dta", replace


*





* determine earliest date each country was present (date_present_first) 
* dates on which each country was absent (after their first presence)(date_absent_1*)

use "YYGU countries.dta", clear 

rename counter obs_no

rename (loc_grand_name*) (countries*)

* use -fillin- in a long file:

* https://www.statalist.org/forums/forum/general-stata-discussion/general/1687043-how-to-rearrange-the-values-of-string-variables-according-to-a-criterion

reshape long countries, i(obs_no) j(str_date) string
gen int real_date = daily(str_date, "YMD")
assert missing(str_date) == missing(real_date)
format real_date %td
drop str_date

rename countries country
drop if missing(country)
fillin country real_date
rename _fillin absent
drop obs_no

by country (real_date), sort: egen date_present_first = min(cond(!absent, real_date, .))
format date_present_first %td

by country (real_date): gen absent_dates = ///
    cond(absent, string(real_date, "%tdCCYYNNDD"), "") if _n == 1
by country (real_date): replace absent_dates = ///
    absent_dates[_n-1] + cond(absent, " " + string(real_date, "%tdCCYYNNDD"), "") ///
    if _n > 1
by country (real_date): replace absent_dates = absent_dates[_N]
split absent_dates, gen(date_absent)
drop absent_dates
isid country real_date, sort

* 


gen year = year(real_date)
gen month = month(real_date)
gen day = day(real_date)
tostring year month day, replace
replace month = "01" if month == "1"
replace month = "02" if month == "2"
replace month = "03" if month == "3"
replace month = "04" if month == "4"
replace month = "05" if month == "5"
replace month = "06" if month == "6"
replace month = "07" if month == "7"
replace month = "08" if month == "8"
replace month = "09" if month == "9"
replace day = "01" if day == "1"
replace day = "02" if day == "2"
replace day = "03" if day == "3"
replace day = "04" if day == "4"
replace day = "05" if day == "5"
replace day = "06" if day == "6"
replace day = "07" if day == "7"
replace day = "08" if day == "8"
replace day = "09" if day == "9"

gen blockdate_string = year + month + day
destring blockdate_string, gen(blockdate)
drop year month day blockdate_string
order blockdate, before(real_date)

rename blockdate update_date_block
rename real_date update_date_real







gen year = year(date_present_first)
gen month = month(date_present_first)
gen day = day(date_present_first)
tostring year month day, replace
replace month = "01" if month == "1"
replace month = "02" if month == "2"
replace month = "03" if month == "3"
replace month = "04" if month == "4"
replace month = "05" if month == "5"
replace month = "06" if month == "6"
replace month = "07" if month == "7"
replace month = "08" if month == "8"
replace month = "09" if month == "9"
replace day = "01" if day == "1"
replace day = "02" if day == "2"
replace day = "03" if day == "3"
replace day = "04" if day == "4"
replace day = "05" if day == "5"
replace day = "06" if day == "6"
replace day = "07" if day == "7"
replace day = "08" if day == "8"
replace day = "09" if day == "9"

gen date_present_first_block = year + month + day
destring date_present_first_block, replace
drop year month day 
order date_present_first_block, before(date_present_first)
rename date_present_first date_present_first_real

rename country loc_grand_name 

*



**********************************************
**********************************************
* country names to loc_grand_name

replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea" 
replace loc_grand_name = "United States of America" if loc_grand_name == "US" 
   
                                           
	
capture isid loc_grand_name update_date_block, sort

duplicates drop loc_grand_name update_date_block, force

isid loc_grand_name update_date_block, sort
                                           


qui compress

save "YYGU countries long.dta", replace














view "log CovidLongitudinal YYGU.smcl"

log close

exit, clear

