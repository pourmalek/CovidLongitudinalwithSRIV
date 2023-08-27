
clear all

cd "$pathCovidLongitudinal/countries/Guinea"




***************************************************************************
* This is "do CovidLongitudinal Guinea.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Guinea <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Guinea ?.do" files


do "do CovidLongitudinal Guinea 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Guinea 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Guinea 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Guinea 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Guinea 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Guinea 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Guinea not included in UCLA
do "do CovidLongitudinal Guinea 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Guinea not included in YYGU
do "do CovidLongitudinal Guinea 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Guinea 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



