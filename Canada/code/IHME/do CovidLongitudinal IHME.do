
clear all

cd "$pathCovidLongitudinal"

cd IHME

 



***************************************************************************
* This is "do CovidLongitudinal IHME.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************



do "do CovidVisualizedCountry IHME 1.do"
* download and prepare estimates files


do "do CovidVisualizedCountry IHME 2.do"
* continue preparation of estimates files and merge them, graphs


do "do CovidVisualizedCountry IHME 3.do"
* continue graphs
