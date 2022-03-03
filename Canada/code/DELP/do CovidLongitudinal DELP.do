
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
* output data files: none. no change in data.


do "do CovidLongitudinal DELP 4.do"
* continue graphs, daily deaths: updates together (without error measures)
* graphs (number 110-119, 1, 1b) of all model update (together) with official reports (JOHN)
* 1 With extremes
* 1b Without extremes
* input data files: "CovidLongitudinal DELP.dta"
* output data files: none. no change in data.


** do files with suffix b after their number are for monthly time bins.
** do files without suffix b after their number are for weekly time bins.


do "do CovidLongitudinal DELP 5.do"
* weeks time bin
* run calculations - daily deaths: four error types (graphs 110-119, 5, 6, 7, 8), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by epi weeks and updates
* 7  mean over updates of median error by epi weeks
* 8  median absolute error by epi weeks and updates
* 9  mean over updates of median absolute error by epi weeks
* 10 median percent error by epi weeks and updates
* 11 mean over updates of median percent error by epi weeks
* 12 median absolute percent error by epi weeks and updates
* 13 mean over updates of median absolute percent error by epi weeks
* 14 average MAPE over updates and epi weeks (single value for each location-model)
* input data files: "CovidLongitudinal DELP.dta"
* output data files: "CovidLongitudinal DELP 2.dta" (with weekly error measures saved)


do "do CovidLongitudinal DELP 5b 1.do"
* months time bin
* National XXX
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by calendar months and updates
* 7  mean over updates of median error by calendar months
* 8  median absolute error by calendar months and updates
* 9  mean over updates of median absolute error by calendar months
* 10 median percent error by calendar months and updates
* 11 mean over updates of median percent error by calendar months
* 12 median absolute percent error by calendar months and updates
* 13 mean over updates of median absolute percent error by epi weeks
* 14 average MAPE over updates and calendar months (single value for each location-model)
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 National.dta" (with monthly error measures saved)


do "do CovidLongitudinal DELP 5b 2.do"
* months time bin
* Alberta XAB
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Alberta.dta" (with monthly error measures saved)


do "do CovidLongitudinal DELP 5b 3.do"
* months time bin
* British Columbia XBC
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 British Columbia.dta" (with monthly error measures saved)


do "do CovidLongitudinal DELP 5b 4.do"
* months time bin
* Manitoba XMB
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Manitoba.dta" (with monthly error measures saved)



do "do CovidLongitudinal DELP 5b 5.do"
* months time bin
* New Brunswick XNB
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 New Brunswick.dta" (with monthly error measures saved)



do "do CovidLongitudinal DELP 5b 6.do"
* months time bin
* Newfoundland & Labrador XNL
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Newfoundland & Labrador.dta" (with monthly error measures saved)



do "do CovidLongitudinal DELP 5b 7.do"
* months time bin
* Nova Scotia XNS
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Nova Scotia.dta" (with monthly error measures saved)



do "do CovidLongitudinal DELP 5b 8.do"
* months time bin
* Ontario XON
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Ontario.dta" (with monthly error measures saved)



do "do CovidLongitudinal DELP 5b 9.do"
* months time bin
* Quebec XQC
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Quebec.dta" (with monthly error measures saved)



do "do CovidLongitudinal DELP 5b 10.do"
* months time bin
* Saskatchewan XSK
* run calculations - daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: "CovidLongitudinal DELP 3 Saskatchewan.dta" (with monthly error measures saved)




do "do CovidLongitudinal DELP 5b 11.do"
* months time bin
* compile the data created by DELP 5b 1.do to DELP 5b 10.do, for 10 locations: National and 9 provinces
* input data files: "CovidLongitudinal DELP 3 _LOCATION_.dta", where LOCATION is National and 9 provinces
* output data files: "CovidLongitudinal DELP 4.dta"




do "do CovidLongitudinal DELP 6.do"
* weeks time bin 
* continue graphs, daily deaths: four error types (graphs 110-119, 5, 6, 7, 8), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by epi weeks and updates
* 7  mean over updates of median error by epi weeks
* 8  median absolute error by epi weeks and updates
* 9  mean over updates of median absolute error by epi weeks
* 10 median % error by epi weeks and updates
* 11 mean over updates of median % error by epi weeks
* 12 median absolute % error by epi weeks and updates
* 13 mean over updates of median absolute % error by epiweeks
* 14 average MAPE over updates and epi weeks (single value for each location-model)
* input data files: "CovidLongitudinal DELP 2.dta"
* output data files: none. no change in data.



do "do CovidLongitudinal DELP 6b.do"
* months time bin 

* continue graphs, daily deaths: four error types (graphs 110-119, 5b, 6b, 7b, 8b), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by calendar months and updates
* 7  mean over updates of median error by calendar months
* 8  median absolute error by calendar months and updates
* 9  mean over updates of median absolute error by calendar months
* 10 median % error by calendar months and updates
* 11 mean over updates of median % error by calendar months
* 12 median absolute % error by calendar months and updates
* 13 mean over updates of median absolute % error by calendar months
* 14 average MAPE over updates and calendar months (single value for each location-model)
* input data files: "CovidLongitudinal DELP 4.dta"
* output data files: none. No change in data. 

