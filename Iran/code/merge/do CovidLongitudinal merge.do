
clear all

cd "$pathCovidLongitudinal"

cd merge





***************************************************************************
* This is "do CovidLongitudinal merge.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



* runs do files for CovidLongitudinal merge



do "do CovidLongitudinal merge 1.do"

* merge models' files

* input file(s):
* output data files: "CovidLongitudinal JOHN.dta"
* Final data output file: "CovidLongitudinal DELP 2.dta"
* Final data output file: "CovidLongitudinal IHME 2.dta"
* Final data output file: "CovidLongitudinal IMPE 3.dta"
* Final data output file: "CovidLongitudinal LANL 3.dta"
* Final data output file: "CovidLongitudinal SRIV 2.dta"

* output file(s):
* "CovidLongitudinal merge.dta"



do "do CovidLongitudinal merge 2.do"

* graphs 1 a daily deaths, each update, backcast and forecast
* graphs 1 b daily deaths, each update, forecast only

* input file(s): "CovidLongitudinal merge.dta"
* output data files: none (no change in data)




do "do CovidLongitudinal merge 3.do"

* continue graphs, daily deaths: updates together (without error measures)
* graphs 2 a b c d of all models' updates (together) with official reports (JOHN)
* 2 a Backcasts and forecasts, with extremes
* 2 b Backcasts and forecasts, without extremes
* 2 c Forecasts only, with extremes
* 2 d Forecasts only, without extremes (i.e. > 4000)
* 2 e Forecasts only, without extremes (i.e. > 2000)

* input file(s): "CovidLongitudinal merge.dta"
* output data files: none (no change in data)




do "do CovidLongitudinal merge 4.do"


* graphs for four error types (graphs 3 to 11), updates together

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

* graph 11 a Daily deaths, Avergae of Mean Error over updates and calendar months
* graph 11 b Daily deaths, Avergae of Mean Absolute Error over updates and calendar months
* graph 11 c Daily deaths, Avergae of Mean Percent Error over updates and calendar months
* graph 11 d Daily deaths, Avergae of Mean Absolute Percent Error over updates and calendar months

* input data files: "CovidLongitudinal merge.dta"
* output data files: "CovidLongitudinal merge 2.dta"








