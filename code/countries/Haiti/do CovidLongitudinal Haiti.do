
clear all

cd "$pathCovidLongitudinal/countries/Haiti"




***************************************************************************
* This is "do CovidLongitudinal Haiti.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Haiti <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Haiti ?.do" files


do "do CovidLongitudinal Haiti 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Haiti 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Haiti 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Haiti 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Haiti 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Haiti 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Haiti not included in UCLA
do "do CovidLongitudinal Haiti 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Haiti not included in YYGU
do "do CovidLongitudinal Haiti 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Haiti 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



