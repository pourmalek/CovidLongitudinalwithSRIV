
clear all

cd "$pathCovidLongitudinal/countries/Liechtenstein"




***************************************************************************
* This is "do CovidLongitudinal Liechtenstein.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Liechtenstein <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Liechtenstein ?.do" files


do "do CovidLongitudinal Liechtenstein 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Liechtenstein 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


/* Liechtenstein not included in IHME
do "do CovidLongitudinal Liechtenstein 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


/* Liechtenstein not included in IMPE
do "do CovidLongitudinal Liechtenstein 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **/


do "do CovidLongitudinal Liechtenstein 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Liechtenstein 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **

/* Liechtenstein not included in UCLA
do "do CovidLongitudinal Liechtenstein 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Liechtenstein not included in YYGU
do "do CovidLongitudinal Liechtenstein 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Liechtenstein 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



