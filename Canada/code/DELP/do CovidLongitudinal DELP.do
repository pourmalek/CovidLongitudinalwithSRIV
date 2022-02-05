
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


do "do CovidLongitudinal DELP 2.do"
* merge update files


do "do CovidLongitudinal DELP 3.do"
* graphs, daily deaths


do "do CovidLongitudinal DELP 4.do"
* graphs, daily cases


do "do CovidLongitudinal DELP 5.do"
* graphs, daily deaths together


do "do CovidLongitudinal DELP 6.do"
* graphs, daily cases together


do "do CovidLongitudinal DELP 7.do"
* graphs, daily deaths errors


do "do CovidLongitudinal DELP 8.do"
* graphs, daily cases errors

