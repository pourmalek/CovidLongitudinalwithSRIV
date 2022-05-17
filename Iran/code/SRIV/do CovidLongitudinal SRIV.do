
clear all

cd "$pathCovidLongitudinal"

cd SRIV




***************************************************************************
* This is "do CovidLongitudinal SRIV.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidLongitudinal SRIV 1.do"
* download estimates files 
* input data files: csv files on web site
* output data files: "SRIV `update'.dta" 


do "do CovidLongitudinal SRIV 2.do"
* merge estimates files
* input data files: "SRIV `update'.dta", "CovidLongitudinal JOHN.dta"
* output date files: "CovidLongitudinal SRIV.dta"


do "do CovidLongitudinal SRIV 3.do"
* graphs:
* graph 1 C19 daily deaths, $country, SRIV, update `update' 
* input data files: "CovidLongitudinal SRIV.dta"
* output data files: none (no change in data)


do "do CovidLongitudinal SRIV 4.do"
* continue graphs, daily deaths: updates together (without error measures)
* graphs 2 a b of all model updates (together) with official reports (JOHN)
* 2 a With extremes
* 2 b Without extremes
* input data files: "CovidLongitudinal SRIV.dta"
* output data files: none (no change in data)


do "do CovidLongitudinal SRIV 5.do"
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

* input data files: "CovidLongitudinal SRIV.dta"
* output data files: "CovidLongitudinal SRIV 2.dta" (with error measures saved)


***********************************************************
* Final data output file: "CovidLongitudinal SRIV 2.dta"










