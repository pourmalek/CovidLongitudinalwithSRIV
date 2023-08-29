
clear all

cd "$pathCovidLongitudinal/download/UCLA"

capture log close 

log using "log CovidLongitudinal UCLA.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal UCLA.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Download estimates files for UCLA model                                                                   
***************************************************************************


* download and prepare update files
* input data files: download csv files
* output data files: "CovidLongitudinal UCLA 202?????.dta" 
*                    "UCLA countries.dta"
*                    "UCLA countries long.dta"




* (1) all countries (some countries of the world): "pred_world_`update'.csv"
* (2) USA only


/*

UCLA updates:

** (1) all countries (some countries of the world), file name format: pred_world_01-03.csv

pred_world_01-03.csv
pred_world_01-10.csv
pred_world_02-06.csv
pred_world_03-07.csv
pred_world_03-15.csv
pred_world_03-28.csv
pred_world_04-04.csv
pred_world_07-12.csv
pred_world_07-19.csv
pred_world_07-26.csv
pred_world_08-02.csv
pred_world_08-09.csv
pred_world_08-16.csv
pred_world_08-23.csv
pred_world_08-30.csv
pred_world_09-06.csv
pred_world_09-13.csv
pred_world_09-20.csv
pred_world_09-27.csv
pred_world_10-04.csv
pred_world_10-11.csv
pred_world_10-18.csv
pred_world_10-25.csv
pred_world_11-01.csv
pred_world_11-08.csv
pred_world_11-22.csv
pred_world_11-29.csv
pred_world_12-06.csv
pred_world_12-13.csv
pred_world_12-20.csv


* misnomer:
* pred_world_11-15.csv 		is not world [countries], it is USA states
* pred_world-05-01-210.csv 	is not world [countries], it is USA [national]
* pred_world-05-08.csv		is not world [countries], it is USA [national]
* pred_world-4-24.csv		is not world [countries], it is USA [national]
* pred_world_07-12.zip		contains pred_world_new.csv, the file pred_world_07-12.csv used instead 




** (2) USA, appearing in world and state files (order of convention for use here)

world					||	state					||	used here					||	Not usable (do not contain pre_fata_daily:)

pred_world_01-03.csv	||	pred_state_01-03.csv	||	pred_world_01-03.csv		||	
pred_world_01-10.csv	||	pred_state_01-10.csv	||	pred_world_01-10.csv		||	
pred_world_02-06.csv	||	pred_state_02-06.csv	||	pred_world_02-06.csv		||	
						||	pred_state_02-28.csv	||	pred_state_02-28.csv		||	
pred_world_03-07.csv	||							||	pred_world_03-07.csv		||	
pred_world_03-15.csv	||							||	pred_world_03-15.csv		||	
pred_world_03-28.csv	||	pred_state_03-28.csv	||	pred_world_03-28.csv		||	
pred_world_04-04.csv	||	pred_state_04-04.csv	||	pred_world_04-04.csv		||	
						||	pred_state_04-24.csv	||								||	pred_state_04-24.csv
						||	pred_state_05-01.csv	||								||	pred_state_05-01.csv
						||	pred_state_05-07.csv	||								||	pred_state_05-07.csv
						||	pred_state_05-13.csv	||								||	pred_state_05-13.csv
						||	pred_state_05-14.csv	||								||	pred_state_05-14.csv
						||	pred_state_05-21.csv	||								||	pred_state_05-21.csv
						||	pred_state_06-06.csv	||	pred_state_06-06.csv		||	
						||	pred_state_06-14.csv	||	pred_state_06-14.csv		||	
						||	pred_state_06-21.csv	||	pred_state_06-21.csv		||	
						||  pred_state_06-27.csv	||	pred_state_06-27.csv		||	
						||	pred_state_06-30.csv	||	pred_state_06-30.csv		||	
						||	pred_state_07-06.csv	||	pred_state_07-06.csv		||	
pred_world_07-12.csv	||	pred_state_07-12.csv	||	pred_world_07-12.csv		||	
pred_world_07-19.csv	||	pred_state_07-19.csv	||	pred_world_07-19.csv		||	
pred_world_07-26.csv	||	pred_state_07-26.csv	||	pred_world_07-26.csv		||	
pred_world_08-02.csv	||	pred_state_08-02.csv	||	pred_world_08-02.csv		||	
pred_world_08-09.csv	||	pred_state_08-09.csv	||	pred_world_08-09.csv		||	
pred_world_08-16.csv	||	pred_state_08-16.csv	||	pred_world_08-16.csv		||	
pred_world_08-23.csv	||	pred_state_08-23.csv	||	pred_world_08-23.csv		||	
pred_world_08-30.csv	||	pred_state_08-30.csv	||	pred_world_08-30.csv		||	
pred_world_09-06.csv	||	pred_state_09-06.csv	||	pred_world_09-06.csv		||	
pred_world_09-13.csv	||	pred_state_09-13.csv	||	pred_world_09-13.csv		||	
pred_world_09-20.csv	||	pred_state_09-20.csv	||	pred_world_09-20.csv		||	
pred_world_09-27.csv	||	pred_state_09-27.csv	||	pred_world_09-27.csv		||	
pred_world_10-04.csv	||	pred_state_10-04.csv	||	pred_world_10-04.csv		||	
pred_world_10-11.csv	||	pred_state_10-11.csv	||	pred_world_10-11.csv		||	
pred_world_10-18.csv	||	pred_state_10-18.csv	||	pred_world_10-18.csv		||	
pred_world_10-25.csv	||	pred_state_10-25.csv	||	pred_world_10-25.csv		||	
pred_world_11-01.csv	||	pred_state_11-01.csv	||	pred_world_11-01.csv		||	
pred_world_11-08.csv	||	pred_state_11-08.csv	||	pred_world_11-08.csv		||	
						||	pred_state_11-15.csv	||	pred_state_11-15.csv		||	
pred_world_11-22.csv	||	pred_state_11-22.csv	||	pred_world_11-22.csv		||	
pred_world_11-29.csv	||	pred_state_11-29.csv	||	pred_world_11-29.csv		||	
pred_world_12-06.csv	||	pred_state_12-06.csv	||	pred_world_12-06.csv		||	
pred_world_12-13.csv	||	pred_state_12-13.csv	||	pred_world_12-13.csv		||	
pred_world_12-20.csv	||	pred_state_12-20.csv	||	pred_world_12-20.csv		||	


*/







* (2) USA only = updates with USA estimates in "pred_state_??-?.csv"



/* "pred_state_??-?.csv"

pred_state_02-28.csv
pred_state_06-06.csv
pred_state_06-14.csv
pred_state_06-21.csv
pred_state_06-27.csv
pred_state_06-30.csv
pred_state_07-06.csv
pred_state_11-15.csv

* do not contain pre_fata_daily:
pred_state_04-24.csv 
pred_state_05-01.csv
pred_state_05-07.csv
pred_state_05-13.csv
pred_state_05-14.csv
pred_state_05-21.csv

*/












* (1) all countries (some countries of the world): "pred_world_`update'.csv"

local list `" "01-03" "01-10" "02-06" "03-07" "03-15" "03-28" "04-04" "07-12" "07-19" "07-26" "08-02" "08-09" "08-16" "08-23" "08-30" "09-06" "09-13" "09-20" "09-27" "10-04" "10-11" "10-18" "10-25" "11-01" "11-08" "11-22" "11-29" "12-06" "12-13" "12-20" "'


foreach update of local list {

di in red "This is UCLA update 2021-" "`update'"

capture shell rm -r  "pred_world_`update'.csv"

clear

copy https://raw.githubusercontent.com/uclaml/ucla-covid19-forecasts/master/projection_result/pred_world_`update'.csv pred_world_`update'.csv

import delimited using "pred_world_`update'.csv", clear varnames(1)

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2

keep date region pre_fata_daily

rename pre_fata_daily DayDeaMeRaUCLA

rename region loc_grand_name

label var loc_grand_name loc_grand_name

label var DayDeaMeRaUCLA "Daily Deaths Mean UCLA"

gen update = "`update'"

replace update = subinstr(update, "-", "",.)

gen year2021 = "2021"

gen updatenew = year2021 + update

drop update

rename updatenew update

destring update, replace

format update %8.0f

local update = update

gen update_date`update' = date("`update'", "YMD")

rename DayDeaMeRaUCLA DayDeaMeRaUCLA`update'

replace loc_grand_name = "United States of America" if loc_grand_name == "US"

qui compress 

save "CovidLongitudinal UCLA `update'.dta", replace

/* line DayDeaMeRaUCLA`update' date if loc_grand_name == "US"

graph export "DayDeaMeRaUCLA USA `update'.pdf", replace */

}
*









* (2) USA only


local list `" "02-28" "06-06" "06-14" "06-21" "06-27" "06-30" "07-06" "11-15" "'


foreach update of local list {

di in red "This is UCLA update pred_state_ 2021-" "`update'"

capture shell rm -r  "pred_state_`update'.csv"

clear

copy https://raw.githubusercontent.com/uclaml/ucla-covid19-forecasts/master/projection_result/pred_state_`update'.csv pred_state_`update'.csv

import delimited using "pred_state_`update'.csv", clear varnames(1)

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2

keep date region pre_fata_daily 

collapse (sum) pre_fata_daily, by(date) 

rename pre_fata_daily DayDeaMeRaUCLA

gen loc_grand_name = "US"

label var DayDeaMeRaUCLA "Daily Deaths Mean UCLA"

gen update = "`update'"

replace update = subinstr(update, "-", "",.)

gen year2021 = "2021"

gen updatenew = year2021 + update

drop update

rename updatenew update

destring update, replace

format update %8.0f

local update = update

gen update_date`update' = date("`update'", "YMD")

rename DayDeaMeRaUCLA DayDeaMeRaUCLA`update'

replace loc_grand_name = "United States of America" if loc_grand_name == "US"

qui compress 

save "CovidLongitudinal UCLA `update'.dta", replace

/* line DayDeaMeRaUCLA`update' date if loc_grand_name == "US"

graph export "DayDeaMeRaUCLA USA `update'.pdf", replace */

}
*











**********************************************
**********************************************

**********************************************
**********************************************

* gen list of countries and update dates


local list ///
20210103 ///
20210110 ///
20210206 ///
20210228 ///
20210307 ///
20210315 ///
20210328 ///
20210404 ///
20210606 ///
20210614 ///
20210621 ///
20210627 ///
20210630 ///
20210706 ///
20210712 ///
20210719 ///
20210726 ///
20210802 ///
20210809 ///
20210816 ///
20210823 ///
20210830 ///
20210906 ///
20210913 ///
20210920 ///
20210927 ///
20211004 ///
20211011 ///
20211018 ///
20211025 ///
20211101 ///
20211108 ///
20211115 ///
20211122 ///
20211129 ///
20211206 ///
20211213 ///
20211220


foreach update of local list {

	use "CovidLongitudinal UCLA `update'.dta", clear
			
	contract loc_grand_name
	
	drop _freq
		
	rename loc_grand_name loc_grand_name`update'
	
	gen counter = _n
	
	save "UCLA `update' countries.dta", replace

}
*



use "UCLA 20210103 countries.dta" 


foreach update of local list {

	merge m:m counter using "UCLA `update' countries.dta"
	
	drop _merge

}
*


order counter

qui compress 

save "UCLA countries.dta", replace


*





* determine earliest date each country was present (date_present_first) 
* dates on which each country was absent (after their first presence)(date_absent_1*)

use "UCLA countries.dta", clear 

rename counter obs_no

rename (loc_grand_name*) (countries*)

* use fillin- in a long file:

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

replace loc_grand_name = "United States of America" if loc_grand_name == "US" 

                                           
	
isid loc_grand_name update_date_block, sort
                                           



qui compress

save "UCLA countries long.dta", replace













view "log CovidLongitudinal UCLA.smcl"

log close

exit, clear

