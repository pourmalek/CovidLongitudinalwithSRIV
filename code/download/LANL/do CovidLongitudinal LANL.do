
clear all

cd "$pathCovidLongitudinal/download/LANL"

capture log close 

log using "log CovidLongitudinal LANL.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL.do"

* Project: Longitudinal assessment of COVID-19 models    

* Objective: Download estimates files for LANL model                                                                                                                                        
***************************************************************************


* download estimates files
* input date files: csv files on the web
* output data files: "CovidLongitudinal LANL `update'.dta"
*                    "LANL countries.dta"
*                    "LANL countries long.dta"




*************
* There are three groups of updates based on two types of file names and two types of location variable name:


* There are two types of file names: 
* "`update'_deaths_incidence_quantiles_global_website.csv"
* "`update'_global_incidence_daily_deaths_website.csv"


* There are two types of some variable names, in particular the location variable:
* countries
* name
*************








*************************************************************************

* group 1 of 3 of updates: "`update'_deaths_incidence_quantiles_global_website.csv" + location variable: countries

local list `" "2020-04-26" "2020-04-29" "2020-05-03" "2020-05-06" "2020-05-10" "2020-05-13" "2020-05-17" "2020-05-20" "2020-05-24" "2020-05-27" "2020-05-31" "2020-06-03" "2020-06-07" "2020-06-10" "2020-06-13" "2020-06-17" "2020-06-21" "2020-06-23" "2020-06-28" "2020-07-01" "2020-07-05" "2020-07-08" "2020-07-12" "2020-07-15" "2020-07-19" "2020-07-22" "2020-07-26" "2020-07-29" "2020-08-02" "2020-08-05" "2020-08-09" "2020-08-12" "2020-08-16" "2020-08-19" "2020-08-23" "2020-08-26" "2020-08-30" "2020-09-02" "2020-09-06" "2020-09-09" "2020-09-13" "2020-09-16" "2020-09-20" "2020-09-23" "2020-09-27" "2020-09-30" "2020-10-04"  "2020-10-07" "2020-10-11" "2020-10-14" "2020-10-18" "2020-10-21" "2020-10-25" "'


foreach update of local list {

	clear
	
	di in red "This is LANL update " "`update'"
	
	capture shell rm -r "`update'_deaths_incidence_quantiles_global_website.csv"
	
	copy https://covid-19.bsvgateway.org/forecast/global/`update'/files/`update'_deaths_incidence_quantiles_global_website.csv `update'_deaths_incidence_quantiles_global_website.csv
	
	import delimited using "`update'_deaths_incidence_quantiles_global_website.csv", clear varnames(1)

	
	keep date q50 countries fcst_date
	
	rename countries loc_grand_name
	
	* gen date
	
	rename date date_original
	
	gen year = substr(date_original,1,4) 
	gen month = substr(date_original,6,2) 
	gen day = substr(date_original,9,2) 
	egen date2 = concat(day month year)
	gen date = date(date2, "DMY", 2050)
	format date %tdDDMonCCYY
	codebook date
	
	drop year month day date2 date_original
	
	*
	gen year = substr(fcst_date,1,4)
	gen month = substr(fcst_date,6,2)
	gen day = substr(fcst_date,9,2)
	
	gen update = year + month + day
	
	local this = update
	*
	
	
	* rename estimate vars
	
	rename q50  DayDeaMeRaLANL`this'
	
	label var DayDeaMeRaLANL`this' "Daily deaths Mean LANL"
	
	drop update fcst_date year month day
	
	codebook loc_grand_name
	
	replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
	replace loc_grand_name = "Congo" if loc_grand_name == "Republic of Congo"
	replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of the Congo"
	replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
	replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
	replace loc_grand_name = "Myanmar" if loc_grand_name == "Burma"
	replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza"
	replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
	replace loc_grand_name = "United States of America" if loc_grand_name == "US"
	replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"

	qui compress
	
	save "CovidLongitudinal LANL `this'.dta", replace
	
	shell rm -r "`update'_deaths_incidence_quantiles_global_website.csv" 
    
*

}
*





************************************************************************* 

* group 2 of 3 of updates: "`update'_deaths_incidence_quantiles_global_website.csv" + location variable: name

* update "2020-10-28": file name like the above series 1, variable names like the series two below


local list `" "2020-10-28" "'


foreach update of local list {

	clear
	
	di in red "This is update " "`update'"
	
	capture shell rm -r "`update'_deaths_incidence_quantiles_global_website.csv"	
	
	copy https://covid-19.bsvgateway.org/forecast/global/`update'/files/`update'_deaths_incidence_quantiles_global_website.csv `update'_deaths_incidence_quantiles_global_website.csv
	
	import delimited using "`update'_deaths_incidence_quantiles_global_website.csv", clear varnames(1)

	
	keep date q50 name fcst_date
	
	rename name loc_grand_name
	
	* gen date
	
	rename date date_original
	
	gen year = substr(date_original,1,4) 
	gen month = substr(date_original,6,2) 
	gen day = substr(date_original,9,2) 
	egen date2 = concat(day month year)
	gen date = date(date2, "DMY", 2050)
	format date %tdDDMonCCYY
	codebook date
	
	drop year month day date2 date_original
	
	*
	gen year = substr(fcst_date,1,4)
	gen month = substr(fcst_date,6,2)
	gen day = substr(fcst_date,9,2)
	
	gen update = year + month + day
	
	local this = update
	*
	
	
	* rename estimate vars
	
	rename q50  DayDeaMeRaLANL`this'
	
	label var DayDeaMeRaLANL`this' "Daily deaths Mean LANL"
	
	
	drop update fcst_date year month day
	
	
	codebook loc_grand_name
	
	replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
	replace loc_grand_name = "Congo" if loc_grand_name == "Republic of Congo"
	replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of the Congo"
	replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
	replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
	replace loc_grand_name = "Myanmar" if loc_grand_name == "Burma"
	replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza"
	replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
	replace loc_grand_name = "United States of America" if loc_grand_name == "US"
	replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"
	
	qui compress
	
	save "CovidLongitudinal LANL `this'.dta", replace
	
	
	shell rm -r "`update'_deaths_incidence_quantiles_global_website.csv" 
    
*

}
*






************************************************************************* 

* group 3 of 3 of updates: "`update'_global_incidence_daily_deaths_website.csv" + location variable: name


local list `" "2020-11-01" "2020-11-04" "2020-11-08" "2020-11-11" "2020-11-15" "2020-11-18" "2020-11-22" "2020-11-25" "2020-11-29" "2020-12-02" "2020-12-06" "2020-12-09" "2020-12-13" "2020-12-16" "2020-12-20" "2020-12-23" "2021-01-03" "2021-01-05" "2021-01-10" "2021-01-13" "2021-01-17" "2021-01-20" "2021-01-24" "2021-01-27" "2021-01-31" "2021-02-03" "2021-02-07" "2021-02-10" "2021-02-14" "2021-02-17" "2021-02-21" "2021-02-24" "2021-02-28" "2021-03-03" "2021-03-07" "2021-03-10" "2021-03-14" "2021-03-21" "2021-03-24" "2021-03-28" "2021-03-31" "2021-04-04"  "2021-04-07" "2021-04-11" "2021-04-14" "2021-04-18" "2021-04-21" "2021-04-25" "2021-04-28" "2021-05-02" "2021-05-05" "2021-05-09" "2021-05-12" "2021-05-16" "2021-05-19" "2021-05-23" "2021-05-26" "2021-06-02" "2021-06-06" "2021-06-13" "2021-06-20" "2021-06-27" "2021-07-04" "2021-07-11" "2021-07-18" "2021-07-25" "2021-08-01" "2021-08-08" "2021-08-15" "2021-08-22" "2021-08-29" "2021-09-05" "2021-09-12" "2021-09-19" "2021-09-26" "'


foreach update of local list {

	clear
	
	di in red "This is update " "`update'"
	
	capture shell rm -r "`update'_global_incidence_daily_deaths_website.csv"		
	
	copy https://covid-19.bsvgateway.org/forecast/global/`update'/files/`update'_global_incidence_daily_deaths_website.csv `update'_global_incidence_daily_deaths_website.csv 
	
	import delimited using "`update'_global_incidence_daily_deaths_website.csv", clear varnames(1)

	
	keep date q50 name fcst_date
	
	rename name loc_grand_name
	
	* gen date
	
	rename date date_original
	
	gen year = substr(date_original,1,4) 
	gen month = substr(date_original,6,2) 
	gen day = substr(date_original,9,2) 
	egen date2 = concat(day month year)
	gen date = date(date2, "DMY", 2050)
	format date %tdDDMonCCYY
	codebook date
	
	drop year month day date2 date_original
	
	*
	gen year = substr(fcst_date,1,4)
	gen month = substr(fcst_date,6,2)
	gen day = substr(fcst_date,9,2)
	
	gen update = year + month + day
	
	local this = update
	*
	
	
	* rename estimate vars
	
	rename q50  DayDeaMeRaLANL`this'
	
	label var DayDeaMeRaLANL`this' "Daily deaths Mean LANL"
	

	drop update fcst_date year month day
	
	
	codebook loc_grand_name
	
	replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
	replace loc_grand_name = "Congo" if loc_grand_name == "Republic of Congo"
	replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of the Congo"
	replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
	replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea"
	replace loc_grand_name = "Myanmar" if loc_grand_name == "Burma"
	replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza"
	replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
	replace loc_grand_name = "United States of America" if loc_grand_name == "US"
	replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"	
	
	qui compress
	
	save "CovidLongitudinal LANL `this'.dta", replace
	
	
	shell rm -r "`update'_global_incidence_daily_deaths_website.csv" 
    
*

}
*











**********************************************
**********************************************

**********************************************
**********************************************

* gen list of countries and update dates


local list ///
20200426 ///
20200429 ///
20200503 ///
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
		
	contract loc_grand_name
	
	drop _freq
		
	rename loc_grand_name loc_grand_name`update'
	
	gen counter = _n
	
	save "LANL `update' countries.dta", replace

}
*



use "LANL 20200426 countries.dta" 


foreach update of local list {

	merge m:m counter using "LANL `update' countries.dta"
	
	drop _merge

}
*


order counter

qui compress 

save "LANL countries.dta", replace


*





* determine earliest date each country was present (date_present_first) 
* dates on which each country was absent (after their first presence)(date_absent_1*)

use "LANL countries.dta", clear 

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

replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde" 
replace loc_grand_name = "Congo" if loc_grand_name == "Republic of Congo" 
replace loc_grand_name = "Congo DR" if loc_grand_name == "Democratic Republic of the Congo" 
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau" 
replace loc_grand_name = "Korea South" if loc_grand_name == "South Korea" 
replace loc_grand_name = "Myanmar" if loc_grand_name == "Burma" 
replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza" 
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste" 
replace loc_grand_name = "United States of America" if loc_grand_name == "US" 
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam" 

    
	
isid loc_grand_name update_date_block, sort
                                           
                                                     
                                 


qui compress

save "LANL countries long.dta", replace












*

view "log CovidLongitudinal LANL.smcl"

log close

exit, clear
