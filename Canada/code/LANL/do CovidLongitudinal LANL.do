
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


do "do CovidLongitudinal LANL 2.do"
* merge estimates files


do "do CovidLongitudinal LANL 3.do"
* graphs, daily deaths: updates separate
* graph 1 daily deaths LANL with official reports (JOHN)
* graphs, daily deaths: updates together
* graph 2 daily deaths: all updates


do "do CovidLongitudinal LANL 4.do"
* 3 Error
* 4 Absolute Error
* 5 Pecent Error
* 6 Absolute Pecent Error
* 7 Daily deaths, location, mean over updates of median error by epi weeks
* 8 Daily deaths, location, mean over updates of median absolute error by epi weeks
* 9 Daily deaths, location, mean over updates of median percent error by epi weeks
* 10 Daily deaths, location, mean over updates of median absolute percent error by epi weeks
