
clear all

cd "$pathCovidLongitudinal/countries/Solomon Islands"




***************************************************************************
* This is "do CovidLongitudinal Solomon Islands.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Solomon Islands <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Solomon Islands ?.do" files


do "do CovidLongitudinal Solomon Islands 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Solomon Islands not included in DELP
do "do CovidLongitudinal Solomon Islands 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Solomon Islands not included in IHME
do "do CovidLongitudinal Solomon Islands 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Solomon Islands 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Solomon Islands not included in LANL
do "do CovidLongitudinal Solomon Islands 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Solomon Islands not included in SRIV
do "do CovidLongitudinal Solomon Islands 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/

/* Solomon Islands not included in UCLA
do "do CovidLongitudinal Solomon Islands 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Solomon Islands not included in YYGU
do "do CovidLongitudinal Solomon Islands 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Solomon Islands 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



