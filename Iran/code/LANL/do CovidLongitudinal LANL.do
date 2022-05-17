
clear all

cd "$pathCovidLongitudinal"

cd LANL


***************************************************************************
* This is "do CovidLongitudinal LANL.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidLongitudinal LANL 1.do"
* download estimates files
* input date files: csv files on the web
* output data files: "CovidLongitudinal LANL 202?-??-??.dta"


do "do CovidLongitudinal LANL 2.do"
* merge files
* input date files: "CovidLongitudinal LANL `update'.dta", "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal LANL 2.dta"


do "do CovidLongitudinal LANL 3.do"
* graphs:
* graphs 1 updates separate 
* input data files: "CovidLongitudinal LANL 2.dta"
* output data files: none (no change in date)


do "do CovidLongitudinal LANL 4.do"
* graphs 2 a b c d of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* // 2 b Without extremes // there are no extremes
* 2 c Forecast only, with extremes
* // 2 d Forecast only, without extremes // there are no extremes
* input data files: "CovidLongitudinal LANL 2.dta"
* output data files: none (no change in data)


do "do CovidLongitudinal LANL 5.do"
* run calculations - daily deaths: four error types (graphs 3 to 11), updates together

* graph 3 Error
* graph 4 Absolute Error
* graph 5 Percent Error
* graph 6 Absolute Percent Error

* graph 7 mean over updates of median error by calendar months
* graph 8 Daily deaths, mean over updates of median absolute error by calendar months
* graph 9 Daily deaths, mean over updates of median % error by calendar months
* graph 10 Daily deaths, mean over updates of median absolute % error by calendar months
* (7, 8, 9, 10) (a, b); a = not smoothed, b = smoothed for better viewing

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

* input data files: "CovidLongitudinal LANL 2.dta"
* output data files: "CovidLongitudinal LANL 3.dta" (error measures saved)


***********************************************************
* Final data output file: "CovidLongitudinal LANL 3.dta"

