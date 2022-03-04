
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
* download and prepare estimates files
* input data files: download csv files
* output data files: "IHME202?????.dta " (78 files)
* "graph epoch update 202?????.pdf"



do "do CovidLongitudinal IHME 2.do"
* continue preparation of estimates files and merge them, graphs: updates separate 
* graphs (number 1) of each model update (separate) with official reports (JOHN)
* Forecast and backcast
* input data files: "IHME`update'.dta" (78 files) and "CovidLongitudinal JOHN.dta"
* output data files: "CovidLongitudinal IHME.dta"



do "do CovidLongitudinal IHME 3.do"
* continue graphs: updates together
* graphs (number 2) of all model update (together) with official reports (JOHN)
* input data files: "CovidLongitudinal IHME.dta"
* output data files: "CovidLongitudinal IHME 2.dta" (saves vars for provinces)



do "do CovidLongitudinal IHME 4.do"
* weeks time bin
* run calculations - daily deaths: four error types (graphs 3, 4, 5, 6), updates together
* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Percent Error
* 6 Absolute Percent Error
* input data files: "CovidLongitudinal IHME 2.dta"
* output data files: "CovidLongitudinal IHME 3.dta" (weekly error measures saved)



do "do CovidLongitudinal IHME 5.do"
* weeks time bin
* draw graphs - daily deaths: four error types (graphs 3, 4, 5, 6), updates together
* continue graphs: four error types (graphs 3, 4, 5, 6), updates together
* 3 Error
* 4 Absolute Error
* 5 Percent Error
* 6 Absolute Percent Error
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: none (on change in data)




** weeks time bin:


do "do CovidLongitudinal IHME 6.do"
* weeks time bin
* location = Alberta // XAB
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Alberta.dta", 
*                    "CovidLongitudinal IHME 3 Alberta Mean1 Mean2.dta"




do "do CovidLongitudinal IHME 7.do"
* weeks time bin
* location = British Columbia // XBC
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 British Columbia.dta",
*                    "CovidLongitudinal IHME 3 British Columbia Mean1 Mean2.dta"




do "do CovidLongitudinal IHME 8.do"
* weeks time bin
* location = Manitoba // XMB
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Manitoba.dta",
*                    "CovidLongitudinal IHME 3 Manitoba Mean1 Mean2.dta"




do "do CovidLongitudinal IHME 9.do"
* weeks time bin
* location = National // XXX
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 National.dta", 
*                    "CovidLongitudinal IHME 3 National Mean1 Mean2.dta"




do "do CovidLongitudinal IHME 10.do"
* weeks time bin
* location = Nova Scotia // XNS
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Nova Scotia.dta",
*                    "CovidLongitudinal IHME 3 Nova Scotia Mean1 Mean2.dta"




do "do CovidLongitudinal IHME 11.do"
* weeks time bin
* location = Ontario // XON
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Ontario.dta",
*                    "CovidLongitudinal IHME 3 Ontario Mean1 Mean2.dta"





do "do CovidLongitudinal IHME 12.do"
* weeks time bin
* location = Quebec // XQC
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Ontario.dta",
*                    "CovidLongitudinal IHME 3 Ontario Mean1 Mean2.dta"





do "do CovidLongitudinal IHME 13.do"
* weeks time bin
* location = Saskatchewan // XSK
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median % error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute % error by epi weeks
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Saskatchewan.dta",
*                    "CovidLongitudinal IHME 3 Saskatchewan Mean1 Mean2.dta"










** months time bin:


do "do CovidLongitudinal IHME 6b.do"
* months time bin
* location = Alberta // XAB
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3b Alberta.dta", 
*                    "CovidLongitudinal IHME 3b Alberta Mean1b Mean2b.dta"





do "do CovidLongitudinal IHME 7b.do"
* months time bin
* location = British Columbia // XBC
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3b British Columbia.dta",
*                    "CovidLongitudinal IHME 3b British Columbia Mean1b Mean2b.dta"




do "do CovidLongitudinal IHME 8b.do"
* months time bin
* location = Manitoba // XMB
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3b Manitoba.dta",
*                    "CovidLongitudinal IHME 3b Manitoba Mean1b Mean2b.dta"




do "do CovidLongitudinal IHME 9b.do"
* months time bin
* location = National // XXX
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 National.dta", 
*                    "CovidLongitudinal IHME 3b National Mean1b Mean2b.dta"




do "do CovidLongitudinal IHME 10b.do"
* months time bin
* location = Nova Scotia // XNS
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Nova Scotia.dta",
*                    "CovidLongitudinal IHME 3b Nova Scotia Mean1b Mean2b.dta"




do "do CovidLongitudinal IHME 11b.do"
* months time bin
* location = Ontario // XON
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Ontario.dta",
*                    "CovidLongitudinal IHME 3b Ontario Mean1b Mean2b.dta"





do "do CovidLongitudinal IHME 12b.do"
* months time bin
* location = Quebec // XQC
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Ontario.dta",
*                    "CovidLongitudinal IHME 3b Ontario Mean1b Mean2b.dta"





do "do CovidLongitudinal IHME 13b.do"
* months time bin
* location = Saskatchewan // XSK
* continue graphs
* 7 Daily deaths, location, mean over updates of median error by calendar months
* 8 Daily deaths, location, mean over updates of median absolute error by calendar months
* 9 Daily deaths, location, mean over updates of median % error by calendar months
* 10 Daily deaths, location, mean over updates of median absolute % error by calendar months
* input data files: "CovidLongitudinal IHME 3.dta"
* output data files: "CovidLongitudinal IHME 3 Saskatchewan.dta",
*                    "CovidLongitudinal IHME 3b Saskatchewan Mean1b Mean2b.dta"


************

** provinces together




do "do CovidLongitudinal IHME 14.do"
* weeks time bin
* compile the data created by IHME 6.do to IHME 13.do, for 8 locations: National and 7 provinces
* graphs provinces together
* input data files: "CovidLongitudinal IHME 3 _LOCATION_.dta", where LOCATION is National and 7 provinces
* output data files: "CovidLongitudinal IHME 4.dta"




do "do CovidLongitudinal IHME 14b.do"
* months time bin
* compile the data created by IHME 6b.do to IHME 13b.do, for 8 locations: National and 7 provinces
* graphs provinces together
* input data files: "CovidLongitudinal IHME 3b _LOCATION_.dta", where LOCATION is National and 7 provinces
*                   "CovidLongitudinal IHME 4.dta" // weekly compiled
* output data files: "CovidLongitudinal IHME 5.dta" // monthly compiled
*                    "CovidLongitudinal IHME 6.dta" // weekly and monthly compiled







