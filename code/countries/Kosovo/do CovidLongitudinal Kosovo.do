
clear all

cd "$pathCovidLongitudinal/countries/Kosovo"




***************************************************************************
* This is "do CovidLongitudinal Kosovo.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Kosovo <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Kosovo ?.do" files


do "do CovidLongitudinal Kosovo 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Kosovo 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


/* Kosovo not included in IHME
do "do CovidLongitudinal Kosovo 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


/* Kosovo not included in IMPE
do "do CovidLongitudinal Kosovo 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **/


do "do CovidLongitudinal Kosovo 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Kosovo 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Kosovo not included in UCLA
do "do CovidLongitudinal Kosovo 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Kosovo not included in YYGU
do "do CovidLongitudinal Kosovo 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Kosovo 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



