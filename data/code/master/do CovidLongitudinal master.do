
***************************************************************************
* This is "do CovidLongitudinal master.do"
                                                                                                          
* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

clear all

clear mata

set maxvar 32767 // Stata MP & SE



* setup Stata path by operating system 

set more off 

set mem 1000m // for older versions of Stata

clear all

dis "`c(username)'"

local usrnam = "`c(username)'"

di "`usrnam'"

****** set path based on local operating system ******

if regexm(c(os),"Mac") == 1 { 
	global pathCovidLongitudinal "/Users/`usrnam'/Downloads/CovidLongitudinal-main/data/code/" 
}
else if regexm(c(os),"Windows") {
	global pathCovidLongitudinal = "C:\Users\\`usrnam'\Downloads\Downloads\CovidLongitudinal-main\data\code\"
}
*      


di "$pathCovidLongitudinal"

cd "$pathCovidLongitudinal"
 
cd master
 


/*

do "$pathCovidLongitudinal/JOHN/do CovidLongitudinal JOHN.do" 

do "$pathCovidLongitudinal/DELP/do CovidLongitudinal DELP.do" 

do "$pathCovidLongitudinal/IHME/do CovidLongitudinal IHME.do" 

do "$pathCovidLongitudinal/IMPE/do CovidLongitudinal IMPE.do" 

do "$pathCovidLongitudinal/SRIV/do CovidLongitudinal SRIV.do" 











