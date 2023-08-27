
clear all

cd "$pathCovidLongitudinal/countries/Saint Kitts and Nevis"




***************************************************************************
* This is "do CovidLongitudinal Saint Kitts and Nevis.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Saint Kitts and Nevis <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Saint Kitts and Nevis ?.do" files


do "do CovidLongitudinal Saint Kitts and Nevis 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Saint Kitts and Nevis not included in DELP
do "do CovidLongitudinal Saint Kitts and Nevis 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Saint Kitts and Nevis not included in IHME
do "do CovidLongitudinal Saint Kitts and Nevis 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


/* Saint Kitts and Nevis not included in IMPE
do "do CovidLongitudinal Saint Kitts and Nevis 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **/


/* Saint Kitts and Nevis not included in LANL
do "do CovidLongitudinal Saint Kitts and Nevis 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


do "do CovidLongitudinal Saint Kitts and Nevis 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Saint Kitts and Nevis not included in UCLA
do "do CovidLongitudinal Saint Kitts and Nevis 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Saint Kitts and Nevis not included in YYGU
do "do CovidLongitudinal Saint Kitts and Nevis 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Saint Kitts and Nevis 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



