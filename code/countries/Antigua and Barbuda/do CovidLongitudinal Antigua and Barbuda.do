
clear all

cd "$pathCovidLongitudinal/countries/Antigua and Barbuda"




***************************************************************************
* This is "do CovidLongitudinal Antigua and Barbuda.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Antigua and Barbuda <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Antigua and Barbuda ?.do" files


do "do CovidLongitudinal Antigua and Barbuda 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Antigua and Barbuda 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


/* Antigua and Barbuda not included in IHME
do "do CovidLongitudinal Antigua and Barbuda 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Antigua and Barbuda 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Antigua and Barbuda 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Antigua and Barbuda 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Antigua and Barbuda not included in UCLA
do "do CovidLongitudinal Antigua and Barbuda 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Antigua and Barbuda not included in YYGU
do "do CovidLongitudinal Antigua and Barbuda 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Antigua and Barbuda 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



