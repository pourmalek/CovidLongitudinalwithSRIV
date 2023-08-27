
clear all

cd "$pathCovidLongitudinal/countries/Saint Lucia"

capture log close 

log using "log CovidLongitudinal Saint Lucia 1 Process.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Saint Lucia 1 Process.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* for each country ---->> Saint Lucia <<----                                                                 
***************************************************************************



**** "do CovidLongitudinal Saint Lucia 1 Process.do"
**** Get Daily deaths forecast only: DayDeaMeFo`model'update where `model' is DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU


** input data files: "$pathCovidLongitudinal/download/`model'/`model' countries long.dta"
**                   "$pathCovidLongitudinal/download/JOHN"
**                   "$pathCovidLongitudinal/download/`model'"

** output data files: "`model' Saint Lucia.dta"
**                   "ALL MODLES Saint Lucia.dta"

** output data dictionary files: "Saint Lucia ALL MODELS update dates data dictionary.csv"
**                               "`model' Saint Lucia data dictionary.csv"
**                               "ALL MODLES Saint Lucia data dictionary.csv"

** graphs:
** "graph 02 Saint Lucia `model' C19 daily deaths all updates.pdf"
** "graph 02 Saint Lucia ALL MODELS C19 daily deaths all updates.pdf"




************************************************************************

* get update dates on which country available in each model


local list IMPE LANL SRIV

foreach model of local list {

	use "$pathCovidLongitudinal/download/`model'/`model' countries long.dta", clear 
	
	di in red "`model'" " Saint Lucia absent update_date_block"
	
	qui keep if loc_grand_name == "Saint Lucia"
	
	keep if absent == 0
	
	gen model = "`model'"
	
	order model
	
	di "`model'"
	
	di in red `r(N)'
	
	keep model loc_grand_name absent update_date_block
	
	order model loc_grand_name absent update_date_block
	
	tostring update_date_block, gen(update_date_block_string)
	
	gen slash = " ///"
	
	gen update_date_block_slash = update_date_block_string + slash
	
	drop slash
	
	label var model "epidemic model being studied"
	
	label var loc_grand_name "country"
	
	label var absent "this country is absent in this model update"
	
	label var update_date_block "update date block"
	
	label var update_date_block_string "update date block string"
	
	label var update_date_block_slash "update date block slash"

	qui compress
	
	save "Saint Lucia `model' update dates.dta", replace

}
*






use "Saint Lucia IMPE update dates.dta", clear 

local list IMPE LANL SRIV

foreach model of local list {
	
	append using "Saint Lucia `model' update dates.dta"
	
	duplicates drop
	
}
*

save "Saint Lucia ALL MODELS update dates.dta", replace
	
export excel using "Saint Lucia ALL MODELS update dates.xlsx", replace firstrow(variables) 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "Saint Lucia ALL MODELS update dates data dictionary.csv", replace 
	
restore







*********************
grstyle init

grstyle color background white







*********************
* gen calendar file

clear

di td(01jan2020) // 21915

di td(01jan2024) // 23376

di td(01jan2024) - td(01jan2020) + 1 // 732



set obs 1462

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/1462

format date %tdDDMonCCYY

codebook date

save "calendar.dta", replace







**************************************************************************

* JOHN

cd "$pathCovidLongitudinal/download/JOHN"

use "CovidLongitudinal JOHN.dta", clear 

keep if loc_grand_name == "Saint Lucia"

keep date DayDeaMeSmJOHNLCA

label var date "calendar date"

qui compress

cd "$pathCovidLongitudinal/countries/Saint Lucia"

save "JOHN Saint Lucia.dta", replace 




* graph Saint Lucia JOHN daily deaths

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, JOHN", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia JOHN C19 daily deaths reported.pdf", replace








**************************************************************************

* DELP

* Saint Lucia not included in DELP










**************************************************************************

* IHME 

* Saint Lucia not included in IHME








**************************************************************************

* IMPE

local list ///
20201025 ///
20201028 ///
20201101 ///
20201110 ///
20201114 ///
20201118 ///
20201123 ///
20201129 ///
20201204 ///
20201212 ///
20201220 ///
20201226 ///
20210104 ///
20210110 ///
20210112 ///
20210118 ///
20210124 ///
20210130 ///
20210203 ///
20210210 ///
20210217 ///
20210226 ///
20210305 ///
20210312 ///
20210319 ///
20210329 ///
20210406 ///
20210417 ///
20210424 ///
20210510 ///
20210516 ///
20210522 ///
20210527 ///
20210604 ///
20210611 ///
20210618 ///
20210626 ///
20210702 ///
20210709 ///
20210719 ///
20210806 ///
20210819 ///
20210825 ///
20210909 ///
20210924 ///
20211006 ///
20211021 ///
20211027 ///
20211103 ///
20211115 ///
20211121 ///
20211129 ///
20211205 ///
20211213 ///
20211226 ///
20220102 ///
20220120 ///
20220131 ///
20220315 ///
20220530 ///
20220620 ///
20220703 ///
20220712 ///
20220728 ///
20220808 ///
20220901 ///
20221225



foreach update of local list {

	cd "$pathCovidLongitudinal/download/IMPE"
	
	di in red "This is IMPE update " `update'

	use "IMPE `update'.dta", clear
		
	keep if loc_grand_name == "Saint Lucia"

	duplicates drop
		
	
	
	
	* gen daily deaths // done in /code/downloads/IMPE/do CovidLongitudinal IMPE.do
	
	
	
	
	* smooth
		
	sort date
			
	qui tsset date, daily   
			
	qui tssmooth ma DayDeaMeRaIMPE`update'_window = DayDeaMeRaIMPE`update' if DayDeaMeRaIMPE`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmIMPE`update' = DayDeaMeRaIMPE`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmIMPE`update' "Daily deaths mean smooth IMPE" 
	
	
	
	
	* gen Daily deaths smooth forecast only
			
	clonevar DayDeaMeFoIMPE`update' = DayDeaMeSmIMPE`update' 
	
	label var DayDeaMeFoIMPE`update' "Daily deaths smooth mean forecast only IMPE"
		
	gen update_date`update' = date("`update'", "YMD")
				
	qui replace DayDeaMeFoIMPE`update' = . if date < update_date`update' 
	
	
	
	capture drop fit_type death_calibrated v1
	
	label var loc_grand_name "country"
	
	label var date "calendar date"
	
	label var DayDeaMeRaIMPE`update' "Daily deaths mean raw IMPE"
	
	label var DayDeaMeSmIMPE`update' "Daily deaths mean smooth IMPE"
	
	label var DayDeaMeFoIMPE`update' "Daily deaths mean smooth forecast only IMPE"
	
	label var update_date`update' "update date"
	
	
	
	
	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/Saint Lucia"
	
	save "IMPE `update' Saint Lucia.dta", replace emptyok
	
	
	*

	
}
*




* merge updates

cd "$pathCovidLongitudinal/countries/Saint Lucia"

foreach update of local list {

	merge m:m date using "IMPE `update' Saint Lucia.dta"
	
	drop _merge

}
*	


capture drop fit_type death_calibrated v1 // IMPE extra vars 

qui compress

save "IMPE Saint Lucia.dta", replace




* add JOHN

merge m:1 date using "JOHN Saint Lucia.dta"

drop _merge

	drop if date < td(01jan2020)

	drop if date > td(01jan2023) 

qui compress

save "IMPE Saint Lucia.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IMPE Saint Lucia data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Saint Lucia IMPE daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoIMPE`update' date, sort lwidth(thin) lcolor(magenta)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, IMPE, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Saint Lucia, forecast only") legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Saint Lucia IMPE daily deaths update `update'.pdf", replace	

}
*/




* graph Saint Lucia IMPE daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, IMPE, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia IMPE C19 daily deaths all updates.pdf", replace















**************************************************************************

* LANL

local list ///
20210214 ///
20210217 ///
20210221 ///
20210224 ///
20210228 ///
20210303 ///
20210307 ///
20210310 ///
20210314 ///
20210321 ///
20210324 ///
20210328 ///
20210331 ///
20210404 ///
20210407 ///
20210411 ///
20210414 ///
20210418 ///
20210421 ///
20210425 ///
20210428 ///
20210502 ///
20210505 ///
20210509 ///
20210512 ///
20210516 ///
20210519 ///
20210523 ///
20210526 ///
20210602 ///
20210606 ///
20210613 ///
20210620 ///
20210627 ///
20210704 ///
20210711 ///
20210718 ///
20210725 ///
20210801 ///
20210808 ///
20210815 ///
20210822 ///
20210829 ///
20210905 ///
20210912 ///
20210919 ///
20210926



foreach update of local list {

	cd "$pathCovidLongitudinal/download/LANL"
	
	di in red "This is LANL update " `update'

	use "CovidLongitudinal LANL `update'.dta", clear
	
	keep if loc_grand_name == "Saint Lucia" 

	duplicates drop
		
	
	
	
	* gen daily deaths // done in /code/downloads/LANL/do CovidLongitudinal LANL.do
	
	
	
	* smooth
		
	sort loc_grand_name date
			
	qui tsset date, daily   
			        
	qui tssmooth ma DayDeaMeRaLANL`update'_window = DayDeaMeRaLANL`update' if DayDeaMeRaLANL`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmLANL`update' = DayDeaMeRaLANL`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmLANL`update' "Daily deaths mean smooth LANL" 
	
	
	
	
	* gen Daily deaths smooth forecast only 
				
	clonevar DayDeaMeFoLANL`update' = DayDeaMeSmLANL`update' 
	
	label var DayDeaMeFoLANL`update' "Daily deaths mean smooth forecast only LANL"
	
	gen update_date`update' = date("`update'", "YMD")
			
	replace DayDeaMeFoLANL`update' = . if date < update_date`update' 
	
	
	
	label var date "calendar date"
	
	label var DayDeaMeRaLANL`update' "Daily deaths mean raw LANL"
	
	label var loc_grand_name "country"
	
	label var date "calendar date"
	
	label var update_date`update' "update date"
	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/Saint Lucia"
	
	save "LANL `update' Saint Lucia.dta", replace 
	

}
*





* merge updates

cd "$pathCovidLongitudinal/countries/Saint Lucia"

foreach update of local list {

	merge m:m date using "LANL `update' Saint Lucia.dta"
	
	drop _merge

}
*	

qui compress

save "LANL Saint Lucia.dta", replace




* add JOHN

merge m:1 date using "JOHN Saint Lucia.dta"

drop _merge

qui compress

save "LANL Saint Lucia.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL Saint Lucia data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Saint Lucia LANL daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoLANL`update' date, sort lwidth(thin) lcolor(brown)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, LANL, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Saint Lucia, forecast only") legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Saint Lucia LANL daily deaths update `update'.pdf", replace	

}
*/




* graph Saint Lucia LANL daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, LANL, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia LANL C19 daily deaths all updates.pdf", replace












**************************************************************************

* SRIV

local list ///
20200502 ///
20200503 ///
20200504 ///
20200505 ///
20200506 ///
20200507 ///
20200508 ///
20200509 ///
20200510 ///
20200511 ///
20200512 ///
20200513 ///
20200514 ///
20200515 ///
20200516 ///
20200517 ///
20200518 ///
20200519 ///
20200520 ///
20200521 ///
20200522 ///
20200523 ///
20200524 ///
20200525 ///
20200526 ///
20200527 ///
20200528 ///
20200529 ///
20200530 ///
20200531 ///
20200601 ///
20200602 ///
20200603 ///
20200604 ///
20200605 ///
20200606 ///
20200607 ///
20200608 ///
20200609 ///
20200610 ///
20200611 ///
20200612 ///
20200613 ///
20200614 ///
20200615 ///
20200616 ///
20200617 ///
20200618 ///
20200619 ///
20200620 ///
20200621 ///
20200622 ///
20200623 ///
20200624 ///
20200625 ///
20200626 ///
20200627 ///
20200628 ///
20200629 ///
20200630 ///
20200701 ///
20200702 ///
20200703 ///
20200704 ///
20200705 ///
20200706 ///
20200707 ///
20200708 ///
20200709 ///
20200710 ///
20200711 ///
20200712 ///
20200713 ///
20200714 ///
20200715 ///
20200716 ///
20200717 ///
20200718 ///
20200719 ///
20200720 ///
20200721 ///
20200722 ///
20200723 ///
20200724 ///
20200725 ///
20200726 ///
20200727 ///
20200728 ///
20200729 ///
20200730 ///
20200731 ///
20200801 ///
20200802 ///
20200803 ///
20200804 ///
20200805 ///
20200806 ///
20200807 ///
20200808 ///
20200809 ///
20200810 ///
20200811 ///
20200812 ///
20200813 ///
20200814 ///
20200815 ///
20200816 ///
20200817 ///
20200818 ///
20200819 ///
20200820 ///
20200821 ///
20200822 ///
20200823 ///
20200824 ///
20200825 ///
20200826 ///
20200827 ///
20200828 ///
20200829 ///
20200830 ///
20200831 ///
20200901 ///
20200902 ///
20200903 ///
20200904 ///
20200905 ///
20200906 ///
20200907 ///
20200908 ///
20200909 ///
20200910 ///
20200911 ///
20200912 ///
20200913 ///
20200914 ///
20200915 ///
20200916 ///
20200917 ///
20200918 ///
20200919 ///
20200920 ///
20200921 ///
20200922 ///
20200923 ///
20200924 ///
20200925 ///
20200926 ///
20200927 ///
20200928 ///
20200929 ///
20200930 ///
20201001 ///
20201002 ///
20201003 ///
20201004 ///
20201006 ///
20201007 ///
20201008 ///
20201009 ///
20201010 ///
20201011 ///
20201012 ///
20201013 ///
20201014 ///
20201015 ///
20201016 ///
20201017 ///
20201018 ///
20201019 ///
20201020 ///
20201021 ///
20201022 ///
20201023 ///
20201024 ///
20201025 ///
20201026 ///
20201027 ///
20201028 ///
20201029 ///
20201030 ///
20201031 ///
20201101 ///
20201102 ///
20201103 ///
20201104 ///
20201105 ///
20201106 ///
20201107 ///
20201108 ///
20201109 ///
20201110 ///
20201111 ///
20201112 ///
20201113 ///
20201114 ///
20201115 ///
20201116 ///
20201117 ///
20201118 ///
20201119 ///
20201120 ///
20201121 ///
20201122 ///
20201123 ///
20201124 ///
20201125 ///
20201126 ///
20201127 ///
20201128 ///
20201129 ///
20201130 ///
20201201 ///
20201202 ///
20201203 ///
20201204 ///
20201205 ///
20201206 ///
20201207 ///
20201208 ///
20201209 ///
20201210 ///
20201211 ///
20201212 ///
20201213 ///
20201214 ///
20201216 ///
20201217 ///
20201218 ///
20201219 ///
20201220 ///
20201221 ///
20201222 ///
20201223 ///
20201224 ///
20201225 ///
20201226 ///
20201227 ///
20201229 ///
20201230 ///
20201231 ///
20210101 ///
20210103 ///
20210104 ///
20210105 ///
20210106 ///
20210107 ///
20210108 ///
20210109 ///
20210110 ///
20210111 ///
20210112 ///
20210113 ///
20210114 ///
20210115 ///
20210116 ///
20210117 ///
20210118 ///
20210119 ///
20210120 ///
20210121 ///
20210122 ///
20210123 ///
20210124 ///
20210125 ///
20210126 ///
20210127 ///
20210128 ///
20210129 ///
20210130 ///
20210131 ///
20210201 ///
20210202 ///
20210203 ///
20210204 ///
20210205 ///
20210206 ///
20210207 ///
20210208 ///
20210209 ///
20210210 ///
20210211 ///
20210212 ///
20210213 ///
20210214 ///
20210215 ///
20210216 ///
20210217 ///
20210218 ///
20210219 ///
20210220 ///
20210221 ///
20210222 ///
20210223 ///
20210224 ///
20210225 ///
20210226 ///
20210227 ///
20210228 ///
20210301 ///
20210302 ///
20210303 ///
20210304 ///
20210305 ///
20210306 ///
20210307 ///
20210308 ///
20210309 ///
20210310 ///
20210311 ///
20210312 ///
20210313 ///
20210314 ///
20210315 ///
20210316 ///
20210317 ///
20210318 ///
20210319 ///
20210320 ///
20210321 ///
20210322 ///
20210323 ///
20210324 ///
20210325 ///
20210326 ///
20210327 ///
20210328 ///
20210329 ///
20210330 ///
20210331 ///
20210401 ///
20210402 ///
20210403 ///
20210404 ///
20210405 ///
20210406 ///
20210407 ///
20210408 ///
20210409 ///
20210410 ///
20210411 ///
20210412 ///
20210413 ///
20210414 ///
20210415 ///
20210416 ///
20210417 ///
20210418 ///
20210419 ///
20210420 ///
20210421 ///
20210422 ///
20210423 ///
20210424 ///
20210425 ///
20210426 ///
20210427 ///
20210428 ///
20210429 ///
20210430 ///
20210501 ///
20210502 ///
20210503 ///
20210504 ///
20210505 ///
20210506 ///
20210507 ///
20210508 ///
20210509 ///
20210510 ///
20210511 ///
20210512 ///
20210513 ///
20210514 ///
20210515 ///
20210516 ///
20210517 ///
20210518 ///
20210519 ///
20210520 ///
20210521 ///
20210522 ///
20210523 ///
20210524 ///
20210525 ///
20210526 ///
20210527 ///
20210528 ///
20210529 ///
20210530 ///
20210531 ///
20210601 ///
20210602 ///
20210603 ///
20210604 ///
20210605 ///
20210606 ///
20210607 ///
20210608 ///
20210609 ///
20210610 ///
20210611 ///
20210612 ///
20210613 ///
20210614 ///
20210615 ///
20210616 ///
20210617 ///
20210618 ///
20210619 ///
20210620 ///
20210621 ///
20210622 ///
20210623 ///
20210624 ///
20210627 ///
20210630 ///
20210703 ///
20210704 ///
20210705 ///
20210706 ///
20210707 ///
20210708 ///
20210709 ///
20210710 ///
20210711 ///
20210712 ///
20210713 ///
20210714 ///
20210715 ///
20210716 ///
20210717 ///
20210718 ///
20210719 ///
20210720 ///
20210721 ///
20210722 ///
20210723 ///
20210724 ///
20210725 ///
20210726 ///
20210727 ///
20210728 ///
20210729 ///
20210730 ///
20210731 ///
20210801 ///
20210808 ///
20210809 ///
20210810 ///
20210811 ///
20210813 ///
20210814 ///
20210815 ///
20210816 ///
20210817 ///
20210818 ///
20210819 ///
20210820 ///
20210821 ///
20210822 ///
20210823 ///
20210824 ///
20210825 ///
20210826 ///
20210827 ///
20210828 ///
20210829 ///
20210830 ///
20210831 ///
20210901 ///
20210902 ///
20210903 ///
20210904 ///
20210905 ///
20210906 ///
20210907 ///
20210908 ///
20210909 ///
20210910 ///
20210911 ///
20210912 ///
20210913 ///
20210914 ///
20210915 ///
20210916 ///
20210917 ///
20210918 ///
20210919 ///
20210920 ///
20210921 ///
20210922 ///
20210923 ///
20210924 ///
20210925 ///
20210926 ///
20210927 ///
20210928 ///
20210929 ///
20210930 ///
20211001 ///
20211002 ///
20211003 ///
20211004 ///
20211005 ///
20211006 ///
20211007 ///
20211008 ///
20211009 ///
20211010 ///
20211011 ///
20211012 ///
20211013 ///
20211014 ///
20211015 ///
20211016 ///
20211017 ///
20211024 ///
20211025 ///
20211026 ///
20211027 ///
20211028 ///
20211029 ///
20211030 ///
20211031 ///
20211101 ///
20211102 ///
20211103 ///
20211104 ///
20211105 ///
20211106 ///
20211107 ///
20211108 ///
20211109 ///
20211110 ///
20211111 ///
20211112 ///
20211114 ///
20211115 ///
20211116 ///
20211117 ///
20211118 ///
20211119 ///
20211120 ///
20211121 ///
20211122 ///
20211124 ///
20211126 ///
20211127 ///
20211128 ///
20211129 ///
20211130 ///
20211201 ///
20211202 ///
20211203 ///
20211205 ///
20211207 ///
20211208 ///
20211209 ///
20211210 ///
20211211 ///
20211212 ///
20211213 ///
20211214 ///
20211215 ///
20211216 ///
20211217 ///
20211218 ///
20211219 ///
20211222 ///
20211223 ///
20211226 ///
20211227 ///
20220101 ///
20220102 ///
20220103 ///
20220104 ///
20220105 ///
20220106 ///
20220108 ///
20220109 ///
20220110 ///
20220111 ///
20220112 ///
20220113 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220129 ///
20220130 ///
20220204 ///
20220205 ///
20220206 ///
20220207 ///
20220208 ///
20220209 ///
20220210 ///
20220211 ///
20220212 ///
20220213 ///
20220214 ///
20220215 ///
20220216 ///
20220217 ///
20220218 ///
20220219 ///
20220220 ///
20220221 ///
20220222 ///
20220223 ///
20220224 ///
20220225 ///
20220226 ///
20220227 ///
20220228 ///
20220301 ///
20220305 ///
20220306 ///
20220307 ///
20220308 ///
20220309 ///
20220310 ///
20220311 ///
20220312 ///
20220313 ///
20220314 ///
20220315 ///
20220316 ///
20220317 ///
20220318 ///
20220319 ///
20220320 ///
20220321 ///
20220322 ///
20220323 ///
20220324 ///
20220325 ///
20220326 ///
20220327 ///
20220328 ///
20220329 ///
20220330 ///
20220331 ///
20220401 ///
20220402 ///
20220403 ///
20220404 ///
20220405 ///
20220406 ///
20220407 ///
20220408 ///
20220409 ///
20220410 ///
20220411 ///
20220413 ///
20220417 ///
20220418 ///
20220419 ///
20220420 ///
20220421 ///
20220422 ///
20220423 ///
20220424 ///
20220425 ///
20220426 ///
20220427 ///
20220428 ///
20220429 ///
20220430 ///
20220501 ///
20220502 ///
20220508 ///
20220515 ///
20220516 ///
20220517 ///
20220518 ///
20220519 ///
20220520 ///
20220521 ///
20220522 ///
20220602 ///
20220603 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220614 ///
20220615 ///
20220617 ///
20220618 ///
20220619 ///
20220620 ///
20220621 ///
20220622 ///
20220623 ///
20220624 ///
20220625 ///
20220626 ///
20220627 ///
20220628 ///
20220629 ///
20220630 ///
20220701 ///
20220702 ///
20220703 ///
20220704 ///
20220705 ///
20220706 ///
20220707 ///
20220708 ///
20220709 ///
20220710 ///
20220711 ///
20220712 ///
20220713 ///
20220714 ///
20220715 ///
20220716 ///
20220717 ///
20220718 ///
20220719 ///
20220720 ///
20220721 ///
20220722 ///
20220723 ///
20220724 ///
20220725 ///
20220726 ///
20220727 ///
20220728 ///
20220813 ///
20220814 ///
20220815 ///
20220816 ///
20220817 ///
20220818 ///
20220819 ///
20220820 ///
20220821 ///
20220822 ///
20220823 ///
20220824 ///
20220826 ///
20220827 ///
20220828 ///
20220830 ///
20220831 ///
20220901 ///
20220907 ///
20220911 ///
20220913 ///
20220914 ///
20220916 ///
20220917 ///
20220918 ///
20220919 ///
20220920 ///
20220921 ///
20220922 ///
20220923 ///
20220924 ///
20220925 ///
20220926 ///
20220927 ///
20220928 ///
20220929 ///
20220930 ///
20221001 ///
20221002 ///
20221003 ///
20221004 ///
20221005 ///
20221006 ///
20221007 ///
20221008 ///
20221009 ///
20221010 ///
20221011 ///
20221012 ///
20221013 ///
20221014 ///
20221015 ///
20221016 ///
20221017 ///
20221018 ///
20221019 ///
20221020 ///
20221021 ///
20221022 ///
20221023 ///
20221024 ///
20221025 ///
20221026 ///
20221027 ///
20221028 ///
20221029 ///
20221030 ///
20221031 ///
20221101 ///
20221102 ///
20221114 ///
20221115 ///
20221117 ///
20221118 ///
20221119 ///
20221120 ///
20221121 ///
20221122 ///
20221123 ///
20221124 ///
20221125 ///
20221126 ///
20221127 ///
20221128 ///
20221129 ///
20221130 ///
20221201 ///
20221202 ///
20221203 ///
20221204 ///
20221205 ///
20221206 ///
20221207 ///
20221208 ///
20221209 ///
20221210 ///
20221211 ///
20221212 ///
20221213 ///
20221214 ///
20221215 ///
20221216 ///
20221217 ///
20221218 ///
20221219 ///
20221220 ///
20221221 ///
20221222 ///
20221223 ///
20221224 ///
20221225 ///
20221226 ///
20221227 ///
20221228 ///
20221229 ///
20221230 ///
20221231


foreach update of local list {

	cd "$pathCovidLongitudinal/download/SRIV"
	
	di in red "This is SRIV update " `update'

	use "SRIV `update'.dta", clear
	
	rename country loc_grand_name
	
	keep if loc_grand_name == "Saint Lucia" 

	duplicates drop
	


	

	
	* gen daily deaths
			
	gen DayDeaMeRaSRIV`update' =  TotDeaMeRaSRIV`update'[_n] - TotDeaMeRaSRIV`update'[_n-1] 
	
	drop TotDeaMeRaSRIV`update' 
		
	
	
	* smooth
		
	sort loc_grand_name date
	
	qui tsset date, daily   
			        
	qui tssmooth ma DayDeaMeRaSRIV`update'_window = DayDeaMeRaSRIV`update' if DayDeaMeRaSRIV`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmSRIV`update' = DayDeaMeRaSRIV`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmSRIV`update' "Daily deaths smooth mean SRIV" 
	
	*
	
	
	
	
	* gen Daily deaths smooth forecast only 
				
	clonevar DayDeaMeFoSRIV`update' = DayDeaMeSmSRIV`update' 
	
	label var DayDeaMeFoSRIV`update' "Daily deaths mean smooth forecast only SRIV"
	
	gen update_date`update' = date("`update'", "YMD")
			
	replace DayDeaMeFoSRIV`update' = . if date < update_date`update' 
	
	
	
	
	label var date "calendar date"
	
	label var DayDeaMeRaSRIV`update' "Daily deaths mean raw SRIV"
	
	label var loc_grand_name "country"
	
	label var date "calendar date"
	
	label var update_date`update' "update date"


	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/Saint Lucia"
	
	save "SRIV `update' Saint Lucia.dta", replace 
	
	*

}
*



* merge updates

cd "$pathCovidLongitudinal/countries/Saint Lucia"

foreach update of local list {

	merge m:m date using "SRIV `update' Saint Lucia.dta"
	
	drop _merge

}
*	

drop update update_date // extra

qui compress

save "SRIV Saint Lucia.dta", replace




* add JOHN

merge m:1 date using "JOHN Saint Lucia.dta"

drop _merge

qui compress

save "SRIV Saint Lucia.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "SRIV Saint Lucia data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph Saint Lucia SRIV daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoSRIV`update' date, sort lwidth(thin) lcolor(green)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, SRIV, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("Saint Lucia, forecast only") legend(position(6) order(1 "JOHN" 2 "SRIV forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 Saint Lucia SRIV daily deaths update `update'.pdf", replace	

}
*/



* graph Saint Lucia SRIV daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210301 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210302 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210303 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210304 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210305 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210317 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210318 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210319 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210320 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210321 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210322 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210323 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210324 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210423 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210424 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210425 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210426 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210427 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210428 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210429 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210430 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210501 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210503 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210504 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210505 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210506 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210507 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210509 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210510 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210511 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210512 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210513 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210523 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210524 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210525 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210526 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210527 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221005 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221018 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221019 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221020 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221021 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221022 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221023 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221229 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221230 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221231 date, sort lwidth(thin) lcolor(green)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, SRIV, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "SRIV forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia SRIV C19 daily deaths all updates.pdf", replace















**************************************************************************

* UCLA
* Saint Lucia not included in UCLA



**************************************************************************

* YYGU
* Saint Lucia not included in YYGU








*************************************************************

* merge models

local list IMPE LANL SRIV

use "IMPE Saint Lucia.dta", clear

foreach model of local list {

	merge m:m date loc_grand_name using "`model' Saint Lucia.dta", force
	
	drop _merge
	
	isid date loc_grand_name, missok
	
}
*

qui compress

save "ALL MODLES Saint Lucia.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODLES Saint Lucia data dictionary.csv", replace 
	
restore

	

	


* graph Saint Lucia ALL MODELS daily deaths all updates

twoway ///
(line DayDeaMeFoSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210214 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210217 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210228 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210301 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210302 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210303 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210303 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210304 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210305 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210317 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210318 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210319 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210320 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210321 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210321 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210322 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210323 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210324 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210324 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210423 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210424 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210425 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210426 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210427 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210428 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210429 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210430 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210501 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210503 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210504 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210505 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210506 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210507 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210509 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210510 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210511 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210512 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210513 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210523 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210524 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210525 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210526 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210527 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221005 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221018 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221019 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221020 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221021 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221022 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221023 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20221225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221229 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221230 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20221231 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeSmJOHNLCA date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, Saint Lucia, all models, all updates, forecast only", size(medium) color(black)) ///
legend(position(6) order(975 "JOHN" 176 "IMPE" 305 "LANL" 1 "SRIV") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 Saint Lucia ALL MODELS C19 daily deaths all updates.pdf", replace

	






cd "$pathCovidLongitudinal/countries/Saint Lucia"


view "log CovidLongitudinal Saint Lucia 1 Process.smcl"

log close

exit, clear
