
clear all

cd "$pathCovidLongitudinal/countries/Timor Leste"




***************************************************************************
* This is "do CovidLongitudinal Timor Leste.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Timor Leste <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Timor Leste ?.do" files


do "do CovidLongitudinal Timor Leste 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Timor Leste not included in DELP
do "do CovidLongitudinal Timor Leste 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Timor Leste not included in IHME
do "do CovidLongitudinal Timor Leste 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Timor Leste 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Timor Leste 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Timor Leste 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Timor Leste not included in UCLA
do "do CovidLongitudinal Timor Leste 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Timor Leste not included in YYGU
do "do CovidLongitudinal Timor Leste 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Timor Leste 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



