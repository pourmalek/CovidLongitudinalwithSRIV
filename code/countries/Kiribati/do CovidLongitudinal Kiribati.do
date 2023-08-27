
clear all

cd "$pathCovidLongitudinal/countries/Kiribati"




***************************************************************************
* This is "do CovidLongitudinal Kiribati.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Kiribati <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Kiribati ?.do" files


do "do CovidLongitudinal Kiribati 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


/* Kiribati not included in DELP
do "do CovidLongitudinal Kiribati 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **/


/* Kiribati not included in IHME
do "do CovidLongitudinal Kiribati 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **/


do "do CovidLongitudinal Kiribati 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


/* Kiribati not included in LANL
do "do CovidLongitudinal Kiribati 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **/


/* Kiribati not included in SRIV
do "do CovidLongitudinal Kiribati 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **/

/* Kiribati not included in UCLA
do "do CovidLongitudinal Kiribati 7 UCLA.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **/ 


/* Kiribati not included in YYGU
do "do CovidLongitudinal Kiribati 8 YYGU.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **/


do "do CovidLongitudinal Kiribati 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



