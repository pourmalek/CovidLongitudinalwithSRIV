
clear all

cd "$pathCovidLongitudinal/countries/Samoa"




***************************************************************************
* This is "do CovidLongitudinal Samoa.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Samoa <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Samoa ?.do" files


do "do CovidLongitudinal Samoa 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Samoa not included in DELP
do "do CovidLongitudinal Samoa 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Samoa not included in IHME
do "do CovidLongitudinal Samoa 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Samoa 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Samoa not included in LANL
do "do CovidLongitudinal Samoa 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Samoa not included in SRIV
do "do CovidLongitudinal Samoa 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/

/* Samoa not included in UCLA
do "do CovidLongitudinal Samoa 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Samoa not included in YYGU
do "do CovidLongitudinal Samoa 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Samoa 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



