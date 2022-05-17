
clear all

cd "$pathCovidLongitudinal"

cd LANL

capture log close 

log using "log CovidLongitudinal LANL 1.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal LANL 1.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download estimates files
* input date files: csv files on the web
* output data files: "CovidLongitudinal LANL `update'.dta"


* updates without this country: "2020-05-03"


local list `" "2020-04-26" "2020-04-29" "2020-05-06" "2020-05-10" "2020-05-13" "2020-05-17" "2020-05-20" "2020-05-24" "2020-05-27" "2020-05-31" "2020-06-03" "2020-06-07" "2020-06-10" "2020-06-13" "2020-06-17" "2020-06-21" "2020-06-23" "2020-06-28" "2020-07-01" "2020-07-05" "2020-07-08" "2020-07-12" "2020-07-15" "2020-07-19" "2020-07-22" "2020-07-26" "2020-07-29" "2020-08-02" "2020-08-05" "2020-08-09" "2020-08-12" "2020-08-16" "2020-08-19" "2020-08-23" "2020-08-26" "2020-08-30" "2020-09-02" "2020-09-06" "2020-09-09" "2020-09-13" "2020-09-16" "2020-09-20" "2020-09-23" "2020-09-27" "2020-09-30" "2020-10-04"  "2020-10-07" "2020-10-11" "2020-10-14" "2020-10-18" "2020-10-21" "2020-10-25" "'


foreach update of local list {

	clear
	
	di in red "This is update " "`update'"
	
	copy https://covid-19.bsvgateway.org/forecast/global/`update'/files/`update'_deaths_incidence_quantiles_global_website.csv `update'_deaths_incidence_quantiles_global_website.csv
	import delimited using "`update'_deaths_incidence_quantiles_global_website.csv", clear varnames(1)

	
	keep date q50 countries fcst_date

	keep if regexm(countries,"$country") == 1
	
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
	
	rename q50  DayDeaMeRaA04S00
	
	label var DayDeaMeRaA04S00 "Daily deaths Mean LANL S0"
	
	
	* smooth
	
	tsset date, daily   
	
	
	tssmooth ma DayDeaMeRaA04S00_window = DayDeaMeRaA04S00 if DayDeaMeRaA04S00 >= 0, window(3 1 3)
	
	tssmooth ma DayDeaMeSmA04S00 = DayDeaMeRaA04S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA04S00 "Daily deaths mean smooth LANL"
	
	drop *_window
	
	tsset, clear
	
	
	drop DayDeaMeRaA04S00
	
	order date loc_grand_name DayDeaMeSmA04S00
	
	rename DayDeaMeSmA04S00 DayDeaMeSmA04_`this'
	
	drop update fcst_date year month day
	
	qui compress
	
	save "CovidLongitudinal LANL `this'.dta", replace
	
	
	shell rm -r "`update'_deaths_incidence_quantiles_global_website.csv" 
    
*

}
*


**************************************** 



* update "2020-10-28": file name like the above series 1, file variable names like the series two below


local list `" "2020-10-28" "'


foreach update of local list {

	clear
	
	di in red "This is update " "`update'"
	
	copy https://covid-19.bsvgateway.org/forecast/global/`update'/files/`update'_deaths_incidence_quantiles_global_website.csv `update'_deaths_incidence_quantiles_global_website.csv
	import delimited using "`update'_deaths_incidence_quantiles_global_website.csv", clear varnames(1)

	
	keep date q50 name fcst_date

	keep if regexm(name,"$country") == 1
	
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
	
	rename q50  DayDeaMeRaA04S00
	
	label var DayDeaMeRaA04S00 "Daily deaths Mean LANL S0"
	
	
	* smooth
	
	tsset date, daily   
	
	
	tssmooth ma DayDeaMeRaA04S00_window = DayDeaMeRaA04S00 if DayDeaMeRaA04S00 >= 0, window(3 1 3)
	
	tssmooth ma DayDeaMeSmA04S00 = DayDeaMeRaA04S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA04S00 "Daily deaths mean smooth LANL"
	
	drop *_window
	
	tsset, clear
	
	
	drop DayDeaMeRaA04S00
	
	order date loc_grand_name DayDeaMeSmA04S00
	
	rename DayDeaMeSmA04S00 DayDeaMeSmA04_`this'
	
	drop update fcst_date year month day
	
	qui compress
	
	save "CovidLongitudinal LANL `this'.dta", replace
	
	
	shell rm -r "`update'_deaths_incidence_quantiles_global_website.csv" 
    
*

}
*





****************************************



local list `" "2020-11-01" "2020-11-04" "2020-11-08" "2020-11-11" "2020-11-15" "2020-11-18" "2020-11-22" "2020-11-25" "2020-11-29" "2020-12-02" "2020-12-06" "2020-12-09" "2020-12-13" "2020-12-16" "2020-12-20" "2020-12-23" "2021-01-03" "2021-01-05" "2021-01-10" "2021-01-13" "2021-01-17" "2021-01-20" "2021-01-24" "2021-01-27" "2021-01-31" "2021-02-03" "2021-02-07" "2021-02-10" "2021-02-14" "2021-02-17" "2021-02-21" "2021-02-24" "2021-02-28" "2021-03-03" "2021-03-07" "2021-03-10" "2021-03-14" "2021-03-21" "2021-03-24" "2021-03-28" "2021-03-31" "2021-04-04"  "2021-04-07" "2021-04-11" "2021-04-14" "2021-04-18" "2021-04-21" "2021-04-25" "2021-04-28" "2021-05-02" "2021-05-05" "2021-05-09" "2021-05-12" "2021-05-16" "2021-05-19" "2021-05-23" "2021-05-26" "2021-06-02" "2021-06-06" "2021-06-13" "2021-06-20" "2021-06-27" "2021-07-04" "2021-07-11" "2021-07-18" "2021-07-25" "2021-08-01" "2021-08-08" "2021-08-15" "2021-08-22" "2021-08-29" "2021-09-05" "2021-09-12" "2021-09-19" "2021-09-26" "'


foreach update of local list {

	clear
	
	di in red "This is update " "`update'"
	
	copy https://covid-19.bsvgateway.org/forecast/global/`update'/files/`update'_global_incidence_daily_deaths_website.csv `update'_global_incidence_daily_deaths_website.csv 
	import delimited using "`update'_global_incidence_daily_deaths_website.csv", clear varnames(1)

	
	keep date q50 name fcst_date

	keep if regexm(name,"$country") == 1
	
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
	
	rename q50  DayDeaMeRaA04S00
	
	label var DayDeaMeRaA04S00 "Daily deaths Mean LANL S0"
	
	
	* smooth
	
	tsset date, daily   
	
	
	tssmooth ma DayDeaMeRaA04S00_window = DayDeaMeRaA04S00 if DayDeaMeRaA04S00 >= 0, window(3 1 3)
	
	tssmooth ma DayDeaMeSmA04S00 = DayDeaMeRaA04S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA04S00 "Daily deaths mean smooth LANL"
	
	drop *_window
	
	tsset, clear
	
	
	drop DayDeaMeRaA04S00
	
	order date loc_grand_name DayDeaMeSmA04S00
	
	rename DayDeaMeSmA04S00 DayDeaMeSmA04_`this'
	
	drop update fcst_date year month day
	
	qui compress
	
	save "CovidLongitudinal LANL `this'.dta", replace
	
	
	shell rm -r "`update'_global_incidence_daily_deaths_website.csv" 
    
*

}
*










*

view "log CovidLongitudinal LANL 1.smcl"

log close

exit, clear
