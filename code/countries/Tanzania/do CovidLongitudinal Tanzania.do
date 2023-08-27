
clear all

cd "$pathCovidLongitudinal/countries/Tanzania"




***************************************************************************
* This is "do CovidLongitudinal Tanzania.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Tanzania <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Tanzania ?.do" files


do "do CovidLongitudinal Tanzania 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Tanzania 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


/* Tanzania not included in IHME
do "do CovidLongitudinal Tanzania 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


/* Tanzania not included in IMPE
do "do CovidLongitudinal Tanzania 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **/


do "do CovidLongitudinal Tanzania 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Tanzania 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Tanzania not included in UCLA
do "do CovidLongitudinal Tanzania 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Tanzania not included in YYGU
do "do CovidLongitudinal Tanzania 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Tanzania 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



