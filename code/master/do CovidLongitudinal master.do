
***************************************************************************
* This is "do CovidLongitudinal master.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Run the do files in located in directories                                                                        
***************************************************************************

capture log close master

log using "log CovidLongitudinal master.smcl", replace name(master)




* display last run attributes

local date `c(current_date)'
local time `c(current_time)'
local vers `c(stata_version)'
local mem  `c(memory)'
local flav = cond(`c(MP)' , "MP", cond(`c(SE)', "SE", "IC"))

display in red  _newline "**** This do file was last run on `date' at `time' using Stata/`flav' version `vers' ****"





* prepare Stata

clear all

clear mata

macro drop _all

set maxvar 32767 // Stata MP & SE

set segmentsize 2g // Stata MP 2-core

set min_memory 1520g // Stata MP on a 1.5TB computer



* setup Stata path by operating system 

set more off 

set mem 1000m // for older versions of Stata

clear all

dis "`c(username)'"

local usrnam = "`c(username)'"

di "`usrnam'"




****** set path based on local operating system ******

if regexm(c(os),"Mac") == 1 { 
	global pathCovidLongitudinal "/Users/`usrnam'/Downloads/CovidLongitudinal-main/code/" 
}
else if regexm(c(os),"Windows") {
	global pathCovidLongitudinal = "C:\Users\\`usrnam'\Downloads\Downloads\CovidLongitudinal-main\code\"
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




**************************************************************************
** Run the do files in located in directories:


* Create list of countries' names and other attributes
do "$pathCovidLongitudinal/master/do CovidLongitudinal loc_grand_name.do"


* Download estimates by models
do "$pathCovidLongitudinal/download/do CovidLongitudinal download.do"


* Process estimates for countries  
do "$pathCovidLongitudinal/countries/do CovidLongitudinal countries.do"






view "log CovidLongitudinal master.smcl"

log close _all

exit, clear



