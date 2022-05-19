
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidLongitudinal IMPE.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidLongitudinal IMPE 1a.do"
* download estimates files - part 1 of 2 - 2020 (from 2020 and 2021)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 


do "do CovidLongitudinal IMPE 1b.do"
* download estimates files - part 2 of 2 - 2021 (from 2020 and 2021)
* input data files: csv files on web site
* output data files: "IMPE `update'.dta" 94 files


do "do CovidLongitudinal IMPE 2.do"
* merge estimates files
* input data files: "IMPE `update'.dta"
* output date files: "CovidLongitudinal IMPE.dta"


do "do CovidLongitudinal IMPE 3.do"
* graphs:
* graph 1 a C19 daily deaths, $country, IMPE, update `update', Backcast and forecast
* graph 1 b C19 daily deaths, $country, IMPE, update `update', Forecast only
* input data files: "CovidLongitudinal IMPE.dta", "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal IMPE 2.dta"


do "do CovidLongitudinal IMPE 4.do"
* graphs 2 a b c d of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* 2 b Without extremes
* 2 c Forecast only, with extremes
* 2 d Forecast only, ithout extremes
* input data files: "CovidLongitudinal IMPE 2.dta"
* output data files: none (no change in data)


do "do CovidLongitudinal IMPE 5.do"
* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Percent Error
* 6 Absolute Percent Error

* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months

* input data files: "CovidLongitudinal IMPE 2.dta"
* output data files: "CovidLongitudinal IMPE 3.dta" (error masures saved)


***********************************************************
* Final data output file: "CovidLongitudinal IMPE 3.dta"



