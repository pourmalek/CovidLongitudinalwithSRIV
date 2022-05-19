
clear all

cd "$pathCovidLongitudinal"

cd IHME

 



***************************************************************************
* This is "do CovidLongitudinal IHME.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidLongitudinal IHME 1.do"
* download and prepare estimates files
* input data files: download csv files
* output data files: "IHME202?????.dta " 
* "graph epoch update 202?????.pdf"


do "do CovidLongitudinal IHME 2.do"
* continue preparation of estimates files and merge them, graphs: updates separate 
* graph 1 C19 daily deaths, $country, IHME, update `update' 
* Forecast and backcast
* input data files: "IHME`update'.dta" and "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal IHME.dta"


do "do CovidLongitudinal IHME 3.do"
* graphs, daily deaths: updates separate 
* graph 1 a C19 daily deaths, $country, IHME, update `update', Backcast and forecast
* graph 1 b C19 daily deaths, $country, IHME, update `update', Forecast only
* input data files: "CovidLongitudinal IHME.dta"
* output data files: none. no change in data.


do "do CovidLongitudinal IHME 4.do"
* continue graphs, daily deaths: updates together (without error measures)
* graphs 2 a b c d of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* 2 b Without extremes
* 2 c Forecast only, with extremes
* 2 d Forecast only, ithout extremes
* input data files: "CovidLongitudinal IHME.dta"
* output data files: none. no change in data.


do "do CovidLongitudinal IHME 5.do"
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

* input data files: "CovidLongitudinal IHME.dta"
* output data files: "CovidLongitudinal IHME 2.dta" (with error measures saved)


***********************************************************
* Final data output file: "CovidLongitudinal IHME 2.dta"



