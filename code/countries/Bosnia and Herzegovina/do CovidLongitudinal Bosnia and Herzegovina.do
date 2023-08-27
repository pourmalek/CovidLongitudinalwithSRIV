
clear all

cd "$pathCovidLongitudinal/countries/Bosnia and Herzegovina"




***************************************************************************
* This is "do CovidLongitudinal Bosnia and Herzegovina.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Bosnia and Herzegovina <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Bosnia and Herzegovina ?.do" files


do "do CovidLongitudinal Bosnia and Herzegovina 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Bosnia and Herzegovina 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Bosnia and Herzegovina 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Bosnia and Herzegovina 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Bosnia and Herzegovina 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Bosnia and Herzegovina 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Bosnia and Herzegovina not included in UCLA
do "do CovidLongitudinal Bosnia and Herzegovina 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Bosnia and Herzegovina not included in YYGU
do "do CovidLongitudinal Bosnia and Herzegovina 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Bosnia and Herzegovina 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



