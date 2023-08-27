
clear all

cd "$pathCovidLongitudinal/countries/Korea North"




***************************************************************************
* This is "do CovidLongitudinal Korea North.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Korea North <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Korea North ?.do" files


do "do CovidLongitudinal Korea North 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Korea North not included in DELP
do "do CovidLongitudinal Korea North 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Korea North not included in IHME
do "do CovidLongitudinal Korea North 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Korea North 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Korea North not included in LANL
do "do CovidLongitudinal Korea North 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Korea North not included in SRIV
do "do CovidLongitudinal Korea North 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/

/* Korea North not included in UCLA
do "do CovidLongitudinal Korea North 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Korea North not included in YYGU
do "do CovidLongitudinal Korea North 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Korea North 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



