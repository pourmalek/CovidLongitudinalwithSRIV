
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 


***************************************************************************
* This is "do CovidLongitudinal DELP.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidLongitudinal DELP 1.do"
* download and prepare update files
* input data files: download csv files
* output data files: "CovidLongitudinal DELP 202?????.dta " 


do "do CovidLongitudinal DELP 2.do"
* merge update files
* input data files: "CovidLongitudinal DELP 202?????.dta " 
* output data files: "CovidLongitudinal DELP.dta"


do "do CovidLongitudinal DELP 3.do"
* graphs, daily deaths: updates separate 
* graph 1 a C19 daily deaths, $country, DELP, update `update', Backcast and forecast
* graph 1 b C19 daily deaths, $country, DELP, update `update', Forecast only
* input data files: "CovidLongitudinal DELP.dta"
* output data files: none. no change in data.


do "do CovidLongitudinal DELP 4.do"
* continue graphs, daily deaths: updates together (without error measures)
* graphs 2 a b c d of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* 2 b Without extremes
* 2 c Forecast only, with extremes
* 2 d Forecast only, ithout extremes
* input data files: "CovidLongitudinal DELP.dta"
* output data files: none. no change in data.


do "do CovidLongitudinal DELP 5.do"
* run calculations - daily deaths: four error types (graphs 3 to 11), updates together

* graph 3 Error
* graph 4 Absolute Error
* graph 5 Percent Error
* graph 6 Absolute Percent Error

* graph 7 mean over updates of median error by calendar months
* graph 8 Daily deaths, mean over updates of median absolute error by calendar months
* graph 9 Daily deaths, mean over updates of median % error by calendar months
* graph 10 a Daily deaths, mean over updates of median absolute % error by calendar months
* graph 10 b Daily deaths, mean over updates of median absolute % error by calendar months smooth
* (7, 8, 9, 10) (a, b); a = not smoothed, b = smoothed for better viewing

* graph 11 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

* input data files: "CovidLongitudinal DELP.dta"
* output data files: "CovidLongitudinal DELP 2.dta" (with error measures saved)


***********************************************************
* Final data output file: "CovidLongitudinal DELP 2.dta"
