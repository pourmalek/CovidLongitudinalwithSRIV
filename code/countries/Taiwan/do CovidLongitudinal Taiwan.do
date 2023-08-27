
clear all

cd "$pathCovidLongitudinal/countries/Taiwan"




***************************************************************************
* This is "do CovidLongitudinal Taiwan.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Taiwan <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Taiwan ?.do" files


do "do CovidLongitudinal Taiwan 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Taiwan not included in DELP
do "do CovidLongitudinal Taiwan 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Taiwan not included in IHME
do "do CovidLongitudinal Taiwan 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Taiwan 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Taiwan 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


/* Taiwan not included in SRIV
do "do CovidLongitudinal Taiwan 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/


/* Taiwan not included in UCLA
do "do CovidLongitudinal Taiwan 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Taiwan not included in YYGU
do "do CovidLongitudinal Taiwan 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Taiwan 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



