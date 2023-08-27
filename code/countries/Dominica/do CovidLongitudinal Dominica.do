
clear all

cd "$pathCovidLongitudinal/countries/Dominica"




***************************************************************************
* This is "do CovidLongitudinal Dominica.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Dominica <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Dominica ?.do" files


do "do CovidLongitudinal Dominica 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Dominica not included in DELP
do "do CovidLongitudinal Dominica 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Dominica not included in IHME
do "do CovidLongitudinal Dominica 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


/* Dominica not included in IMPE
do "do CovidLongitudinal Dominica 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **/


/* Dominica not included in LANL
do "do CovidLongitudinal Dominica 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


do "do CovidLongitudinal Dominica 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Dominica not included in UCLA
do "do CovidLongitudinal Dominica 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Dominica not included in YYGU
do "do CovidLongitudinal Dominica 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Dominica 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



