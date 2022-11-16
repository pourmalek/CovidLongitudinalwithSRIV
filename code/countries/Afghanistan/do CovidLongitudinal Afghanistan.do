
clear all

cd "$pathCovidLongitudinal/countries/Afghanistan"




***************************************************************************
* This is "do CovidLongitudinal Afghanistan.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* and calculate the error measures
	* for each country ---->> Afghanistan <<----                                                                 
***************************************************************************


* This do file runs the "do CovidLongitudinal Afghanistan ?.do" files


do "do CovidLongitudinal Afghanistan 1 Process.do"
* Process the reported deaths by JOHN and the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)


do "do CovidLongitudinal Afghanistan 2 DELP.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = DELP **


do "do CovidLongitudinal Afghanistan 3 IHME.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IHME **


do "do CovidLongitudinal Afghanistan 4 IMPE.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = IMPE **


do "do CovidLongitudinal Afghanistan 5 LANL.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = LANL **


do "do CovidLongitudinal Afghanistan 6 SRIV.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = SRIV **


// do "do CovidLongitudinal Afghanistan 7 UCLA.do"
// --->>> Afghanistan not included in UCLA
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = UCLA **


// do "do CovidLongitudinal Afghanistan 8 YYGU.do"
// --->>> Afghanistan not included in YYGU
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** model = YYGU **


do "do CovidLongitudinal Afghanistan 9 Merge.do"
* run calculations for error - daily deaths: four error types (graphs 3 to 11), updates together
** Merge models 



