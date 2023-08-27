
clear all

cd "$pathCovidLongitudinal/countries/Eritrea"




***************************************************************************
* This is "do CovidLongitudinal Eritrea.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Eritrea <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Eritrea ?.do" files


do "do CovidLongitudinal Eritrea 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Eritrea not included in DELP
do "do CovidLongitudinal Eritrea 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Eritrea not included in IHME
do "do CovidLongitudinal Eritrea 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Eritrea 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Eritrea 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Eritrea 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Eritrea not included in UCLA
do "do CovidLongitudinal Eritrea 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Eritrea not included in YYGU
do "do CovidLongitudinal Eritrea 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Eritrea 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



