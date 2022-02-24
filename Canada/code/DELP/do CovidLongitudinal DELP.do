
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
* output data files: "CovidLongitudinal DELP 202?????.dta " (142 files)


do "do CovidLongitudinal DELP 2.do"
* merge update files
* input data files: "CovidLongitudinal DELP 202?????.dta " (142 files)
* output data files: "CovidLongitudinal DELP.dta"


do "do CovidLongitudinal DELP 3.do"
* graphs, daily deaths: updates separate 
* graphs (number 100-109) of each model update (separate) with official reports (JOHN)
* input data files: "CovidLongitudinal DELP.dta"
* output data files: "CovidLongitudinal DELP daily deaths.dta"


do "do CovidLongitudinal DELP 4.do"
* continue graphs, daily deaths: updates together (without error measures)
* graphs (number 110-119, 1, 1b) of all model update (together) with official reports (JOHN)
* 1 With extremes
* 1b Without extremes
* input data files: "CovidLongitudinal DELP daily deaths.dta"
* output data files: none, no changes saves in input files


do "do CovidLongitudinal DELP 5.do"
* continue graphs, daily deaths: four error types (graphs 110-119, 5, 6, 7, 8), updates together
* 2 Error
* 3 Absolute Error
* 4 Pecent Error
* 5 Absolute Pecent Error
* 6  median error by epi weeks and updates
* 7  mean over updates of median error by epi weeks
* 8  median absolute error by epi weeks and updates
* 9  mean over updates of median absolute error by epi weeks
* 10 median percent error by epi weeks and updates
* 11 mean over updates of median percent error by epi weeks
* 12 median absolute percent error by epi weeks and updates
* 13 mean over updates of median absolute percent error by epiweeks
* input data files: "CovidLongitudinal DELP daily deaths.dta"
* output data files: "CovidLongitudinal DELP daily deaths 2.dta" (error measures saved)



