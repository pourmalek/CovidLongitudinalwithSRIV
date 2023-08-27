
clear all

cd "$pathCovidLongitudinal/countries/Estonia"




***************************************************************************
* This is "do CovidLongitudinal Estonia.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Estonia <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Estonia ?.do" files


do "do CovidLongitudinal Estonia 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Estonia 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Estonia 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Estonia 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Estonia 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Estonia 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Estonia not included in UCLA
do "do CovidLongitudinal Estonia 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


do "do CovidLongitudinal Estonia 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **


do "do CovidLongitudinal Estonia 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



