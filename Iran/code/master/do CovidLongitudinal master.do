
***************************************************************************
* This is "do CovidLongitudinal master.do"
                                                                                                          
* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

clear all

global country Iran // <<-- set here the country of choice - countries without subnational estimates     
                                                      ***************************
di "$country"                               // <<<--- *   change country here   *
                                                      ***************************




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
	global pathCovidLongitudinal "/Users/`usrnam'/Downloads/CovidLongitudinal-main/Iran/code/" 
}
else if regexm(c(os),"Windows") {
	global pathCovidLongitudinal = "C:\Users\\`usrnam'\Downloads\Downloads\CovidLongitudinal-main\Iran\code\"
}
*      


di "$pathCovidLongitudinal"

cd "$pathCovidLongitudinal"
 
cd master




* preserve native scheme (of the local machine; will be eventually restored at the end of "do CovidLongitudinal merge.do")

di c(scheme)

global nativescheme `c(scheme)'

di "$nativescheme"



* get grstyle for graphs and its dependencies

ssc install grstyle, replace
ssc install palettes, replace
ssc install colrspace, replace

grstyle init
set scheme _GRSTYLE_ 
grstyle color background white




/* 

List of component studies:

JOHN
DELP
IHME
IMPE
LANL 
SRIV
*/




* runs the do files for each study and merge them. 



do "$pathCovidLongitudinal/JOHN/do CovidLongitudinal JOHN.do" 

do "$pathCovidLongitudinal/DELP/do CovidLongitudinal DELP.do" 

do "$pathCovidLongitudinal/IHME/do CovidLongitudinal IHME.do" 

do "$pathCovidLongitudinal/IMPE/do CovidLongitudinal IMPE.do" 

do "$pathCovidLongitudinal/LANL/do CovidLongitudinal LANL.do" 

do "$pathCovidLongitudinal/SRIV/do CovidLongitudinal SRIV.do" 

do "$pathCovidLongitudinal/merge/do CovidLongitudinal merge.do" 









