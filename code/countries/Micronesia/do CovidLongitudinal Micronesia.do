
clear all

cd "$pathCovidLongitudinal/countries/Micronesia"




***************************************************************************
* This is "do CovidLongitudinal Micronesia.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Micronesia <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Micronesia ?.do" files


do "do CovidLongitudinal Micronesia 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Micronesia not included in DELP
do "do CovidLongitudinal Micronesia 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Micronesia not included in IHME
do "do CovidLongitudinal Micronesia 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Micronesia 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Micronesia not included in LANL
do "do CovidLongitudinal Micronesia 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Micronesia not included in SRIV
do "do CovidLongitudinal Micronesia 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/

/* Micronesia not included in UCLA
do "do CovidLongitudinal Micronesia 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Micronesia not included in YYGU
do "do CovidLongitudinal Micronesia 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Micronesia 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



