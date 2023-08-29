
clear all

cd "$pathCovidLongitudinal/download/JOHN"


capture log close 

log using "log CovidLongitudinal JOHN.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal JOHN.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         

* Objective: Download data files for JOHN                                                                    
***************************************************************************


* input data files: "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

* output data files: "CovidLongitudinal JOHN.dta"

* output data dictionary files: "CovidLongitudinal JOHN data dictionary.csv"




****************************************
****************************************

* get Johns Hopkins data for deaths


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(1:2)

save "time_series_covid19_deaths_global col 2.dta", replace


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(5)

save "time_series_covid19_deaths_global col 5 on.dta", replace


use "time_series_covid19_deaths_global col 2.dta", clear 

merge 1:1 _n using "time_series_covid19_deaths_global col 5 on.dta"

drop _merge

order provincestate countryregion, last

count

qui destring v*, replace

collapse (sum) v*, by(countryregion) // sum to add subnational estimates to national level and omit subnational estimates

count

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name


gen counter = _n

reshape long v, i(counter) 


rename v TotDeaMeRaJOHN

label var TotDeaMeRaJOHN "Total deaths raw JOHN JOHN"

bysort loc_grand_name: gen DayDeaMeRaJOHN =  TotDeaMeRaJOHN[_n] - TotDeaMeRaJOHN[_n-1]

label var DayDeaMeRaJOHN "Daily deaths raw JOHN JOHN"

drop TotDeaMeRaJOHN



* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

bysort loc_grand_name: replace date = date + _j - 1

format date %td

label var date "calendar date"

codebook date

drop counter _j


replace DayDeaMeRaJOHN = 0 if date == td(22jan2020)
	
replace DayDeaMeRaJOHN = 17 if date == td(22jan2020) & loc_grand_name == "China" // first day report frpm China



**********************************************
**********************************************
* change JOHN country names to loc_grand_name country names

replace loc_grand_name = "Cape Verde" if loc_grand_name == "Cabo Verde"
replace loc_grand_name = "Congo DR" if loc_grand_name == "Congo (Kinshasa)"
replace loc_grand_name = "Congo" if loc_grand_name == "Congo (Brazzaville)"
replace loc_grand_name = "Guinea Bissau" if loc_grand_name == "Guinea-Bissau"
replace loc_grand_name = "Korea North" if loc_grand_name == "Korea, North"
replace loc_grand_name = "Korea South" if loc_grand_name == "Korea, South"
replace loc_grand_name = "Myanmar" if loc_grand_name == "Burma"
replace loc_grand_name = "Palestine" if loc_grand_name == "West Bank and Gaza"
replace loc_grand_name = "Saint Vincent and the Grenadines" if loc_grand_name == "St. Vincent and the Grenadines"
replace loc_grand_name = "Taiwan" if loc_grand_name == "Taiwan*"
replace loc_grand_name = "Timor Leste" if loc_grand_name == "Timor-Leste"
replace loc_grand_name = "United States of America" if loc_grand_name == "US"
replace loc_grand_name = "Viet Nam" if loc_grand_name == "Vietnam"


* drop non-countries

drop if loc_grand_name == "Antarctica"
drop if loc_grand_name == "Diamond Princess"
drop if loc_grand_name == "MS Zaandam"
drop if loc_grand_name == "Summer Olympics 2020"
drop if loc_grand_name == "Winter Olympics 2022"

codebook loc_grand_name



qui compress

save "CovidLongitudinal JOHN interim.dta", replace


shell rm -r "time_series_covid19_deaths_global col 2.dta"
shell rm -r "time_series_covid19_deaths_global col 5 on.dta"





use "CovidLongitudinal JOHN interim.dta", clear 

merge m:m loc_grand_name using "$pathCovidLongitudinal/master/loc_grand_name.dta"

keep if _merge == 3

drop _merge



* smooth

sort loc_grand_name date

encode loc_grand_name, gen(loc_grand_name_encoded)

qui tsset loc_grand_name_encoded date, daily   

	levelsof loc_grand_iso, local(levels) 
		
	foreach iso of local levels {
			
		di "Smoothing Daily Deaths; The current country iso is: " "`iso'"
					
		qui tssmooth ma DayDeaMeRaJOHN`iso'`update'_window = DayDeaMeRaJOHN`update' if DayDeaMeRaJOHN`update' >= 0 & loc_grand_iso == "`iso'", window(3 1 3) 

		qui tssmooth ma DayDeaMeSmJOHN`iso'`update' = DayDeaMeRaJOHN`iso'`update'_window if loc_grand_iso == "`iso'", weights( 1 2 3 <4> 3 2 1) replace

		drop *_window
		
		qui label var DayDeaMeSmJOHN`iso'`update' "Daily deaths smooth mean JOHN `iso'" 
		
}
*

drop DayDeaMeRaJOHN

qui compress

save "CovidLongitudinal JOHN.dta", replace







* gen calendar file

clear

di td(01jan2020) // 21915

di td(01jan2023) // 23011

di td(01jan2023) - td(01jan2020) + 1 // 1097



set obs 1097

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/1097

format date %tdDDMonCCYY

codebook date

save "calendar file.dta", replace

merge m:m date using "CovidLongitudinal JOHN.dta"

drop _merge


isid loc_grand_name date, sort missok



qui compress
	
save "CovidLongitudinal JOHN.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "CovidLongitudinal JOHN data dictionary.csv", replace 
	
restore




* graph all countries JOHN daily deaths

twoway ///
(line DayDeaMeSmJOHNAFG date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNALB date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNDZA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNAND date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNAGO date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNATG date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNARG date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNARM date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNAUS date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNAUT date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNAZE date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNBHS date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNBHR date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNBGD date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNBRB date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNBLR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNBEL date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNBLZ date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNBEN date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNBTN date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNBOL date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNBIH date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNBWA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNBRA date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNBRN date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNBGR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNBFA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNBDI date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNKHM date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNCMR date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNCAN date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNCPV date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNCAF date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNTCD date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNCHL date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNCHN date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNCOL date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNCOM date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNCOG date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNCOD date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNCRI date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNCIV date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNHRV date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNCUB date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNCYP date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNCZE date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNDNK date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNDJI date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNDMA date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNDOM date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNECU date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNEGY date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNSLV date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNGNQ date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNERI date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNEST date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNSWZ date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNETH date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNFJI date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNFIN date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNGAB date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNGMB date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNGEO date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNDEU date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNGHA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNGRC date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNGRD date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNGTM date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNGIN date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNGNB date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNGUY date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNHTI date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNVAT date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNHND date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNHUN date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNISL date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNIND date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNIDN date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNIRN date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNIRQ date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNIRL date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNISR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNITA date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNJAM date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNJPN date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNJOR date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNKAZ date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNKEN date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNKIR date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNPRK date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNKOR date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNKOS date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNKWT date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNKGZ date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNLAO date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNLVA date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNLBN date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNLSO date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNLBR date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNLBY date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNLIE date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNLTU date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNLUX date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNMDG date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMWI date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMYS date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNMDV date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNMLI date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMLT date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNMRT date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMUS date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMEX date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNFSM date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNMDA date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNMCO date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNMNG date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNMNE date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNMAR date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNMOZ date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMMR date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNNAM date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNNPL date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNNLD date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNNZL date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNNIC date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNNER date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNNGA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNMKD date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNNOR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNOMN date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNPAK date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNPSE date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNPAN date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNPNG date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNPRY date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNPER date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNPHL date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNPOL date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNPRT date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNQAT date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNROU date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNRUS date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNRWA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNKNA date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNVCT date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNWSM date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNSMR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNSTP date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNSAU date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNSEN date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNSRB date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNSYC date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNSLE date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNSGP date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNSVK date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNSVN date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNSLB date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNSOM date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNZAF date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNSSD date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNESP date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNLKA date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNSDN date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNSUR date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNSWE date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNCHE date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNSYR date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNTJK date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNTWN date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNTZA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNTHA date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNTLS date, sort lwidth(thin) lcolor(cyan)) ///
(line DayDeaMeSmJOHNTGO date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNTON date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNTTO date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNTUN date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNTUR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNUGA date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNUKR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNARE date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNGBR date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNUSA date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNURY date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNUZB date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNVUT date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNVEN date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeSmJOHNVNM date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeSmJOHNYEM date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeSmJOHNZMB date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeSmJOHNZWE date, sort lwidth(thin) lcolor(brown)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, all countries, JOHN", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
legend(position(6) order(3 "AFR countries" 6 "AMR countries" 1 "EMR countries" ///
 2 "EUR countries" 14 "SEAR countries" 9 "WPR countries") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand) ///

qui graph export "graph 03 all countries JOHN C19 daily deaths reported.pdf", replace








view "log CovidLongitudinal JOHN.smcl"

log close

exit, clear




