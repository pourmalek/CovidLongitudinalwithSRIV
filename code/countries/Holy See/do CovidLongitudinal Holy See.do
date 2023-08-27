
clear all

cd "$pathCovidLongitudinal/countries/Holy See"




***************************************************************************
* This is "do CovidLongitudinal Holy See.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Holy See <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Holy See ?.do" files


do "do CovidLongitudinal Holy See 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Holy See not included in DELP
do "do CovidLongitudinal Holy See 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Holy See not included in IHME
do "do CovidLongitudinal Holy See 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


/* Holy See not included in IMPE
do "do CovidLongitudinal Holy See 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **/


/* Holy See not included in LANL
do "do CovidLongitudinal Holy See 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


do "do CovidLongitudinal Holy See 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Holy See not included in UCLA
do "do CovidLongitudinal Holy See 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Holy See not included in YYGU
do "do CovidLongitudinal Holy See 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Holy See 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



