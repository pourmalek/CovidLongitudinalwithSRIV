
***************************************************************************
* This is "do CovidLongitudinal merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Describe the predictive performance of models and assess the determinants                                                                       
***************************************************************************

cd "$pathCovidLongitudinal/merge"

capture log close

log using "log CovidLongitudinal merge.smcl", replace 




use "$pathCovidLongitudinal/countries/Afghanistan/ALL MODELS Afghanistan error - only error measures across models.dta", clear




local list `" "Albania" "Algeria" "Argentina" "Iran" "United States of America" "'

foreach country of local list {
	
	qui append using "$pathCovidLongitudinal/countries/`country'/ALL MODELS `country' error - only error measures across models.dta"

	
}
*

order *, alpha


qui compress


save "ALL MODELS all countries error - only error measures across models.dta", replace




* summarize models' AbPeEr across all countries

summ *AbPeEr









view "log CovidLongitudinal merge.smcl"

log close _all

exit, clear



