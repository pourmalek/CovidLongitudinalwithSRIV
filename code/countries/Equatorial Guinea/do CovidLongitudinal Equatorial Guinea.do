
clear all

cd "$pathCovidLongitudinal/countries/Equatorial Guinea"




***************************************************************************
* This is "do CovidLongitudinal Equatorial Guinea.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Equatorial Guinea <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Equatorial Guinea ?.do" files


do "do CovidLongitudinal Equatorial Guinea 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Equatorial Guinea 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Equatorial Guinea 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Equatorial Guinea 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Equatorial Guinea 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Equatorial Guinea 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Equatorial Guinea not included in UCLA
do "do CovidLongitudinal Equatorial Guinea 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Equatorial Guinea not included in YYGU
do "do CovidLongitudinal Equatorial Guinea 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Equatorial Guinea 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



