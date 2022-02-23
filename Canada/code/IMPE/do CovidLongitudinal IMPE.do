
clear all

cd "$pathCovidLongitudinal"

cd IMPE

capture log close 

log using "log CovidVisualizedCountry IMPE.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IMPE.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidLongitudinal IMPE 1.do"
* download estimates files


do "do CovidLongitudinal IMPE 2.do"
* merge estimates files


do "do CovidLongitudinal IMPE 3.do"
* graphs, daily deaths: updates separate
* graph 1 daily deaths IMPE with official reports (JOHN)
* graphs, daily deaths: updates together
* graph 2 daily deaths: all updates


do "do CovidLongitudinal IMPE 4.do"
