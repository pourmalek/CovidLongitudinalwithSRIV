
clear all

cd "$pathCovidLongitudinal/countries/France"

capture log close 

log using "log CovidLongitudinal France 1 Process.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal France 1 Process.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process the reported deaths by JOHN and 
	* the estimates by models (DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU)
	* for each country ---->> France <<----                                                                 
***************************************************************************



**** "do CovidLongitudinal France 1 Process.do"
**** Get Daily deaths forecast only: DayDeaMeFo`model'update where `model' is DELP, IHME, IMPE, LANL, SRIV, UCLA, YYGU


** input data files: "$pathCovidLongitudinal/download/`model'/`model' countries long.dta"
**                   "$pathCovidLongitudinal/download/JOHN"
**                   "$pathCovidLongitudinal/download/`model'"

** output data files: "`model' France.dta"
**                   "ALL MODLES France.dta"

** output data dictionary files: "France ALL MODELS update dates data dictionary.csv"
**                               "`model' France data dictionary.csv"
**                               "ALL MODLES France data dictionary.csv"

** graphs:
** "graph 02 France `model' C19 daily deaths all updates.pdf"
** "graph 02 France ALL MODELS C19 daily deaths all updates.pdf"




************************************************************************

* get update dates on which country available in each model


local list DELP IHME IMPE LANL SRIV UCLA YYGU

foreach model of local list {

	use "$pathCovidLongitudinal/download/`model'/`model' countries long.dta", clear 
	
	di in red "`model'" " France absent update_date_block"
	
	qui keep if loc_grand_name == "France"
	
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
	
	save "France `model' update dates.dta", replace

}
*






use "France DELP update dates.dta", clear 

local list DELP IHME IMPE LANL SRIV UCLA YYGU

foreach model of local list {
	
	append using "France `model' update dates.dta"
	
	duplicates drop
	
}
*

save "France ALL MODELS update dates.dta", replace
	
export excel using "France ALL MODELS update dates.xlsx", replace firstrow(variables) 



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "France ALL MODELS update dates data dictionary.csv", replace 
	
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

keep if loc_grand_name == "France"

keep date DayDeaMeSmJOHNFRA

label var date "calendar date"

qui compress

cd "$pathCovidLongitudinal/countries/France"

save "JOHN France.dta", replace 




* graph France JOHN daily deaths

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, JOHN", size(medium) color(black)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France JOHN C19 daily deaths reported.pdf", replace








**************************************************************************

* DELP

local list ///
20200417 ///
20200424 ///
20200501 ///
20200509 ///
20200517 ///
20200524 ///
20200531 ///
20200607 ///
20200614 ///
20200621 ///
20200628 ///
20200704 ///
20200718 ///
20200723 ///
20200801 ///
20200815 ///
20200829 ///
20200912 ///
20200926 ///
20201008 ///
20201022 ///
20201105 ///
20201119 ///
20201203 ///
20201217 ///
20201231 ///
20210114 ///
20210128 ///
20210211 ///
20210225 ///
20210311 ///
20210325 ///
20210408 ///
20210422 ///
20210506 ///
20210520 ///
20210603 ///
20210610 ///
20210617 ///
20210624 ///
20210701 ///
20210708 ///
20210715 ///
20210722 ///
20210729 ///
20210805 ///
20210812 ///
20210819 ///
20210826 ///
20210902 ///
20210909 ///
20210916 ///
20210923 ///
20210930 ///
20211007 ///
20211014 ///
20211021 ///
20211028 ///
20211104 ///
20211111 ///
20211118 ///
20211125 ///
20211202 ///
20211209 ///
20211216 ///
20211223 ///
20211230 ///
20220106 ///
20220113 ///
20220114 ///
20220115 ///
20220116 ///
20220117 ///
20220118 ///
20220119 ///
20220120 ///
20220121 ///
20220122 ///
20220123 ///
20220124 ///
20220125 ///
20220126 ///
20220127 ///
20220128 ///
20220129 ///
20220130 ///
20220131 ///
20220201 ///
20220202 ///
20220203 ///
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
20220302 ///
20220303 ///
20220304 ///
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
20220412 ///
20220413 ///
20220414 ///
20220415 ///
20220416 ///
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
20220503 ///
20220504 ///
20220505 ///
20220506 ///
20220507 ///
20220508 ///
20220509 ///
20220510 ///
20220511 ///
20220512 ///
20220513 ///
20220514 ///
20220515 ///
20220516 ///
20220517 ///
20220518 ///
20220519 ///
20220520 ///
20220521 ///
20220522 ///
20220523 ///
20220524 ///
20220525 ///
20220526 ///
20220527 ///
20220528 ///
20220529 ///
20220530 ///
20220531 ///
20220601 ///
20220602 ///
20220603 ///
20220604 ///
20220605 ///
20220606 ///
20220607 ///
20220608 ///
20220609 ///
20220610 ///
20220611 ///
20220612 ///
20220613 ///
20220614 ///
20220615 ///
20220616 ///
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
20220729 ///
20220730 ///
20220731 ///
20220801 ///
20220802 ///
20220803 ///
20220804 ///
20220805 ///
20220806 ///
20220807 ///
20220808 ///
20220809 ///
20220810 ///
20220811 ///
20220812 ///
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
20220825 ///
20220826 ///
20220827 ///
20220828 ///
20220829 ///
20220830 ///
20220831 ///
20220901 ///
20220902 ///
20220903 ///
20220904 ///
20220905 ///
20220906 ///
20220907 ///
20220908 ///
20220909 ///
20220910 ///
20220911 ///
20220912 ///
20220913 ///
20220914 ///
20220915

foreach update of local list {
	 	
	cd "$pathCovidLongitudinal/download/DELP"
	
	di in red "This is DELP update " `update'

	use "CovidLongitudinal DELP `update'.dta", clear
	
	keep if loc_grand_name == "France" 

	duplicates drop		
	
	
	
	* gen daily deaths
		
	gen DayDeaMeRaDELP`update' =  TotDeaMeRaDELP`update'[_n] - TotDeaMeRaDELP`update'[_n-1] 
	
	label var DayDeaMeRaDELP`update' "Daily deaths mean raw DELP"
	
	drop TotDeaMeRaDELP`update' 
	
	
	
	
	* smooth
	
	sort loc_grand_name date
	
	qui tsset date, daily   
			
	qui tssmooth ma DayDeaMeRaDELP`update'_window = DayDeaMeRaDELP`update' if DayDeaMeRaDELP`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmDELP`update' = DayDeaMeRaDELP`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmDELP`update' "Daily deaths mean smooth DELP" 
	
	
	
	* gen Daily deaths smooth forecast only 
			
	clonevar DayDeaMeFoDELP`update' = DayDeaMeSmDELP`update' 
	
	label var DayDeaMeFoDELP`update' "Daily deaths mean smooth forecast only DELP"
				
	replace DayDeaMeFoDELP`update' = . if date < update_date`update' 

	
	
	
	cd "$pathCovidLongitudinal/countries/France"
	
	
	merge m:1 date using "calendar.dta"
	
	drop _merge
	
	qui compress
	
	save "DELP `update' France.dta", replace 

}
*




* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "DELP `update' France.dta"
	
	drop _merge

}
*	

qui compress

save "DELP France.dta", replace




* add JOHN

merge m:m date using "JOHN France.dta"

drop _merge

qui compress

save "DELP France.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "DELP France data dictionary.csv", replace 
	
restore



/* foreach update of local list {
	
	* graph France DELP daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoDELP`update' date, sort lwidth(thin) lcolor(red)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, DELP, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "DELP forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France DELP daily deaths update `update'.pdf", replace	

}
*/




* graph France DELP daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) ///
(line DayDeaMeFoDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, DELP, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "DELP forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France DELP C19 daily deaths all updates.pdf", replace














**************************************************************************

* IHME 


local list ///
20200407 ///
20200408 ///
20200410 ///
20200413 ///
20200417 ///
20200421 ///
20200422 ///
20200427 ///
20200428 ///
20200429 ///
20200504 ///
20200510 ///
20200512 ///
20200520 ///
20200525 ///
20200526 ///
20200529 ///
20200605 ///
20200608 ///
20200610 ///
20200615 ///
20200625 ///
20200629 ///
20200707 ///
20200714 ///
20200722 ///
20200730 ///
20200806 ///
20200821 ///
20200827 ///
20200903 ///
20200911 ///
20200918 ///
20200924 ///
20201002 ///
20201009 ///
20201015 ///
20201022 ///
20201029 ///
20201112 ///
20201119 ///
20201203 ///
20201210 ///
20201217 ///
20201223 ///
20210115 ///
20210122 ///
20210128 ///
20210204 ///
20210212 ///
20210220 ///
20210225 ///
20210306 ///
20210311 ///
20210317 ///
20210325 ///
20210401 ///
20210409 ///
20210416 ///
20210423 ///
20210506 ///
20210514 ///
20210521 ///
20210528 ///
20210604 ///
20210610 ///
20210618 ///
20210625 ///
20210702 ///
20210715 ///
20210723 ///
20210730 ///
20210806 ///
20210820 ///
20210826 ///
20210902 ///
20210910 ///
20210916 ///
20210923 ///
20210930 ///
20211015 ///
20211021 ///
20211104 ///
20211119 ///
20211221 ///
20220108 ///
20220114 ///
20220121 ///
20220204 ///
20220218 ///
20220321 ///
20220408 ///
20220506 ///
20220610 ///
20220719 ///
20220912 ///
20221024 ///
20221118 ///
20221216


foreach update of local list {

	cd "$pathCovidLongitudinal/download/IHME"
	
	di in red "This is IHME update " `update'

	use "IHME all countries `update'.dta", clear
	
	rename location_name country
	
	keep if country == "France" 
	
	duplicates drop
	
	capture drop counter one_or_two
	
	rename country loc_grand_name
	
	label var loc_grand_name "country"

	capture label var DayDeaMeRaIHME`update' "Daily deaths mean raw IHME" 

	label var DayDeaMeSmIHME`update' "Daily deaths mean smoothed IHME" 
	
	label var date "calendar date"
	

	
	* gen daily deaths // done in /code/downloads/IHME/do CovidLongitudinal IHME.do
	
	
	
	* smooth // done in /code/downloads/IHME/do CovidLongitudinal IHME.do
	
		

	
	
	* gen Daily deaths smooth forecast only
			
	clonevar DayDeaMeFoIHME`update' = DayDeaMeSmIHME`update' 
	
	label var DayDeaMeFoIHME`update' "Daily deaths mean smooth forecast only IHME"
	
	gen update_date`update' = date("`update'", "YMD")
	
	gen epoch`update' = update_date`update'
	
	replace DayDeaMeFoIHME`update' = . if date < update_date`update' 


	
	/* local epoch`update' = epoch`update' // for xline(`epoch202YNNDD',
	
	di %td `epoch`update''
	
	local wanted : di %td `epoch`update'' // for denoted with red line: `wanted'"
	
	
	* graph France IHME daily deaths epoch each update 
	
	twoway ///
	(line DayDeaMeFoIHME`update' date, sort lwidth(thin) lcolor(black)) /// 
	if date >= td(01Jan2020) & loc_grand_name != "" ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.2fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, France, IHME, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	xline(`epoch`update'', lwidth(thin) lcolor(red)) ///
	subtitle("forecast  start date is denoted with red line: `wanted'") ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) */
	
	
	cd "$pathCovidLongitudinal/countries/France"
	
	/* qui graph export "graph 00 France IHME daily deaths epoch `update'.pdf", replace */
	
	capture drop location_id population_2022 population_2021 population_2020
	
	label var update_date`update' "update date"

	label var epoch`update' "epoch IHME"
	
	capture label var location_id "location id IHME"
	
	capture label var deaths_data_type "deaths data type IHME"
	
	merge m:1 date using "calendar.dta"
	
	drop _merge
	
	qui compress
	
	save "IHME `update' France.dta", replace emptyok	
	


}
*












* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "IHME `update' France.dta"
	
	drop _merge

}
*	

qui compress

save "IHME France.dta", replace




* add JOHN

merge m:1 date using "JOHN France.dta"

drop _merge

qui compress

save "IHME France.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IHME France data dictionary.csv", replace 
	
restore



/* foreach update of local list {
	
	* graph France IHME daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoIHME`update' date, sort lwidth(thin) lcolor(black)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, IHME, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "IHME forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France IHME daily deaths update `update'.pdf", replace	

}
*/



* graph France IHME daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, IHME, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "IHME forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France IHME C19 daily deaths all updates.pdf", replace












**************************************************************************

* IMPE

local list ///
20200601 ///
20200603 ///
20200606 ///
20200614 ///
20200616 ///
20200619 ///
20200623 ///
20200702 ///
20200703 ///
20200704 ///
20200707 ///
20200711 ///
20200714 ///
20200715 ///
20200718 ///
20200720 ///
20200722 ///
20200725 ///
20200727 ///
20200731 ///
20200808 ///
20200810 ///
20200811 ///
20200813 ///
20200814 ///
20200817 ///
20200823 ///
20200825 ///
20200827 ///
20200831 ///
20200902 ///
20200906 ///
20200908 ///
20200912 ///
20200915 ///
20200919 ///
20200923 ///
20200925 ///
20201003 ///
20201006 ///
20201012 ///
20201019 ///
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
		
	keep if loc_grand_name == "France"

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
	
	cd "$pathCovidLongitudinal/countries/France"
	
	save "IMPE `update' France.dta", replace emptyok
	
	
	*

	
}
*




* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "IMPE `update' France.dta"
	
	drop _merge

}
*	


capture drop fit_type death_calibrated v1 // IMPE extra vars 

qui compress

save "IMPE France.dta", replace




* add JOHN

merge m:1 date using "JOHN France.dta"

drop _merge

	drop if date < td(01jan2020)

	drop if date > td(01jan2023) 

qui compress

save "IMPE France.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "IMPE France data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph France IMPE daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoIMPE`update' date, sort lwidth(thin) lcolor(magenta)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, IMPE, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France IMPE daily deaths update `update'.pdf", replace	

}
*/




* graph France IMPE daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
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
ytitle(Daily deaths) title("C19 daily deaths, France, IMPE, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "IMPE forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France IMPE C19 daily deaths all updates.pdf", replace















**************************************************************************

* LANL

local list ///
20200426 ///
20200429 ///
20200503 ///
20200506 ///
20200510 ///
20200513 ///
20200517 ///
20200520 ///
20200524 ///
20200527 ///
20200531 ///
20200603 ///
20200607 ///
20200610 ///
20200613 ///
20200617 ///
20200621 ///
20200623 ///
20200628 ///
20200701 ///
20200705 ///
20200708 ///
20200712 ///
20200715 ///
20200719 ///
20200722 ///
20200726 ///
20200729 ///
20200802 ///
20200805 ///
20200809 ///
20200812 ///
20200816 ///
20200819 ///
20200823 ///
20200826 ///
20200830 ///
20200902 ///
20200906 ///
20200909 ///
20200913 ///
20200916 ///
20200920 ///
20200923 ///
20200927 ///
20200930 ///
20201004 ///
20201007 ///
20201011 ///
20201014 ///
20201018 ///
20201021 ///
20201025 ///
20201028 ///
20201101 ///
20201104 ///
20201108 ///
20201111 ///
20201115 ///
20201118 ///
20201122 ///
20201125 ///
20201129 ///
20201202 ///
20201206 ///
20201209 ///
20201213 ///
20201216 ///
20201220 ///
20201223 ///
20210103 ///
20210105 ///
20210110 ///
20210113 ///
20210117 ///
20210120 ///
20210124 ///
20210127 ///
20210131 ///
20210203 ///
20210207 ///
20210210 ///
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
	
	keep if loc_grand_name == "France" 

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
	
	cd "$pathCovidLongitudinal/countries/France"
	
	save "LANL `update' France.dta", replace 
	

}
*





* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "LANL `update' France.dta"
	
	drop _merge

}
*	

qui compress

save "LANL France.dta", replace




* add JOHN

merge m:1 date using "JOHN France.dta"

drop _merge

qui compress

save "LANL France.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "LANL France data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph France LANL daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoLANL`update' date, sort lwidth(thin) lcolor(brown)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, LANL, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France LANL daily deaths update `update'.pdf", replace	

}
*/




* graph France LANL daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
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
ytitle(Daily deaths) title("C19 daily deaths, France, LANL, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "LANL forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France LANL C19 daily deaths all updates.pdf", replace












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
	
	keep if loc_grand_name == "France" 

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
	
	cd "$pathCovidLongitudinal/countries/France"
	
	save "SRIV `update' France.dta", replace 
	
	*

}
*



* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "SRIV `update' France.dta"
	
	drop _merge

}
*	

drop update update_date // extra

qui compress

save "SRIV France.dta", replace




* add JOHN

merge m:1 date using "JOHN France.dta"

drop _merge

qui compress

save "SRIV France.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "SRIV France data dictionary.csv", replace 
	
restore




/* foreach update of local list {
	
	* graph France SRIV daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoSRIV`update' date, sort lwidth(thin) lcolor(green)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, SRIV, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "SRIV forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France SRIV daily deaths update `update'.pdf", replace	

}
*/



* graph France SRIV daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
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
ytitle(Daily deaths) title("C19 daily deaths, France, SRIV, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "SRIV forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France SRIV C19 daily deaths all updates.pdf", replace















**************************************************************************

* UCLA



local list ///
20210103 ///
20210110 ///
20210206 ///
20210307 ///
20210315 ///
20210328 ///
20210404 ///
20210712 ///
20210719 ///
20210726 ///
20210802 ///
20210809 ///
20210816 ///
20210823 ///
20210830 ///
20210906 ///
20210913 ///
20210920 ///
20210927 ///
20211004 ///
20211011 ///
20211018 ///
20211025 ///
20211101 ///
20211108 ///
20211122 ///
20211129 ///
20211206 ///
20211213 ///
20211220


foreach update of local list {

	cd "$pathCovidLongitudinal/download/UCLA"
	
	di in red "This is UCLA update " `update'

	use "CovidLongitudinal UCLA `update'.dta", clear
		
	keep if loc_grand_name == "France" 

	duplicates drop
		
	
	
	
	* gen daily deaths // avilable form downloaded data
			
		
	
	
	* smooth
		
	sort loc_grand_name date
	
	qui tsset date, daily   
			        
	qui tssmooth ma DayDeaMeRaUCLA`update'_window = DayDeaMeRaUCLA`update' if DayDeaMeRaUCLA`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmUCLA`update' = DayDeaMeRaUCLA`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmUCLA`update' "Daily deaths mean smooth UCLA" 
	
	*
	
	
	
	
	* gen Daily deaths smooth forecast only  
				
	clonevar DayDeaMeFoUCLA`update' = DayDeaMeSmUCLA`update' 
	
	label var DayDeaMeFoUCLA`update' "Daily deaths mean smooth forecast only UCLA"
	
	capture gen update_date`update' = date("`update'", "YMD")
			
	replace DayDeaMeFoUCLA`update' = . if date < update_date`update' 
	
	
	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/France"
	
	save "UCLA `update' France.dta", replace 
	
	/* line DayDeaMeRaUCLA`update' DayDeaMeSmUCLA`update' DayDeaMeFoUCLA`update' date

	qui graph export "UCLA `update' France.pdf", replace */
	
}
*




* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "UCLA `update' France.dta"
	
	drop _merge

}
*	

qui compress

save "UCLA France.dta", replace




* add JOHN

merge m:1 date using "JOHN France.dta"

drop _merge

qui compress

save "UCLA France.dta", replace




******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "UCLA France data dictionary.csv", replace 
	
restore


/* foreach update of local list {
	
	* graph France UCLA daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoUCLA`update' date, sort lwidth(thin) lcolor(blue)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, UCLA, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "UCLA forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France UCLA daily deaths update `update'.pdf", replace	

}
*/



* graph France UCLA daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, UCLA, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "UCLA forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France UCLA C19 daily deaths all updates.pdf", replace












**************************************************************************

* YYGU

local list ///
20200403 ///
20200404 ///
20200405 ///
20200406 ///
20200407 ///
20200408 ///
20200409 ///
20200410 ///
20200411 ///
20200412 ///
20200413 ///
20200414 ///
20200415 ///
20200416 ///
20200417 ///
20200418 ///
20200419 ///
20200420 ///
20200421 ///
20200422 ///
20200423 ///
20200424 ///
20200425 ///
20200426 ///
20200427 ///
20200428 ///
20200429 ///
20200430 ///
20200501 ///
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
20201005


foreach update of local list {

	cd "$pathCovidLongitudinal/download/YYGU"
	
	di in red "This is YYGU update " `update'

	use "CovidLongitudinal YYGU `update'.dta", clear
		
	keep if loc_grand_name == "France" 

	duplicates drop
	
	duplicates drop loc_grand_name date, force
	
	
	
	
	* gen daily deaths // avilable form downloaded data
			
		
	
	
	* smooth
		
	sort loc_grand_name date
	
	qui tsset date, daily   
			        
	qui tssmooth ma DayDeaMeRaYYGU`update'_window = DayDeaMeRaYYGU`update' if DayDeaMeRaYYGU`update' >= 0, window(3 1 3) 

	qui tssmooth ma DayDeaMeSmYYGU`update' = DayDeaMeRaYYGU`update'_window, weights( 1 2 3 <4> 3 2 1) replace

	drop *_window
	
	label var DayDeaMeSmYYGU`update' "Daily deaths smooth mean YYGU" 
	
	*
	
	
	
	
	* gen FORE, that is forecast only 
				
	clonevar DayDeaMeFoYYGU`update' = DayDeaMeSmYYGU`update' 
	
	label var DayDeaMeFoYYGU`update' "Daily deaths smooth mean forecast only YYGU"
	
	capture gen update_date`update' = date("`update'", "YMD")
			
	replace DayDeaMeFoYYGU`update' = . if date < update_date`update' 
	
	qui compress	
	
	cd "$pathCovidLongitudinal/countries/France"
	
	save "YYGU `update' France.dta", replace 
	
	/* line DayDeaMeRaYYGU`update' DayDeaMeSmYYGU`update' DayDeaMeFoYYGU`update' date

	qui graph export "YYGU `update' France.pdf", replace */
	
}
*




* merge updates

cd "$pathCovidLongitudinal/countries/France"

foreach update of local list {

	merge m:m date using "YYGU `update' France.dta"
	
	drop _merge

}
*	

qui compress

save "YYGU France.dta", replace




* add JOHN

merge m:m date using "JOHN France.dta"

drop _merge

qui compress

save "YYGU France.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "YYGU France data dictionary.csv", replace 
	
restore



/* foreach update of local list {
	
	* graph France YYGU daily deaths each update 
	
	twoway ///
	(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 	
	(line DayDeaMeFoYYGU`update' date, sort lwidth(thin) lcolor(blue)) /// 
	if date >= td(01Jan2020) & date <= td(01Jan2023) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
	ytitle(Daily deaths) title("C19 daily deaths, YYGU, update `update'", size(medium) color(black)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("France, forecast only") legend(position(6) order(1 "JOHN" 2 "YYGU forecast ") rows(1) size(small)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) 
	
	qui graph export "graph 01 France YYGU daily deaths update `update'.pdf", replace	

}
*/


* graph France YYGU daily deaths all updates

twoway ///
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
(line DayDeaMeFoYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201005 date, sort lwidth(thin) lcolor(gold)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, YYGU, all updates", size(medium) color(black)) ///
legend(position(6) order(1 "JOHN" 2 "YYGU forecast ") rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France YYGU C19 daily deaths all updates.pdf", replace







*************************************************************

* merge models

local list IHME IMPE LANL SRIV UCLA YYGU

use "DELP France.dta", clear

foreach model of local list {

	merge m:m date loc_grand_name using "`model' France.dta", force
	
	drop _merge
	
	isid date loc_grand_name, missok
	
}
*

qui compress

save "ALL MODLES France.dta", replace



******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODLES France data dictionary.csv", replace 
	
restore

	

	


* graph France ALL MODELS daily deaths all updates

twoway ///
(line DayDeaMeFoYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201005 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
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
(line DayDeaMeFoIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, all models, all updates, forecast only", size(medium) color(black)) ///
legend(position(6) order(1728 "JOHN" 19 "DELP" 5 "IHME" 125 "IMPE" 33 "LANL" 45 "SRIV" 626 "UCLA" 1 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2))

qui graph export "graph 02 France ALL MODELS C19 daily deaths all updates.pdf", replace

	

	
	
	
	
	
	
* graph France ALL MODELS daily deaths all updates - restrict yvar to 5 times of max reported by JOHN	
	
local list ///	
DayDeaMeFoYYGU20200403 ///
DayDeaMeFoYYGU20200404 ///
DayDeaMeFoYYGU20200405 ///
DayDeaMeFoYYGU20200406 ///
DayDeaMeFoIHME20200407 ///
DayDeaMeFoYYGU20200407 ///
DayDeaMeFoIHME20200408 ///
DayDeaMeFoYYGU20200408 ///
DayDeaMeFoYYGU20200409 ///
DayDeaMeFoIHME20200410 ///
DayDeaMeFoYYGU20200410 ///
DayDeaMeFoYYGU20200411 ///
DayDeaMeFoYYGU20200412 ///
DayDeaMeFoIHME20200413 ///
DayDeaMeFoYYGU20200413 ///
DayDeaMeFoYYGU20200414 ///
DayDeaMeFoYYGU20200415 ///
DayDeaMeFoYYGU20200416 ///
DayDeaMeFoDELP20200417 ///
DayDeaMeFoIHME20200417 ///
DayDeaMeFoYYGU20200417 ///
DayDeaMeFoYYGU20200418 ///
DayDeaMeFoYYGU20200419 ///
DayDeaMeFoYYGU20200420 ///
DayDeaMeFoIHME20200421 ///
DayDeaMeFoYYGU20200421 ///
DayDeaMeFoIHME20200422 ///
DayDeaMeFoYYGU20200422 ///
DayDeaMeFoYYGU20200423 ///
DayDeaMeFoDELP20200424 ///
DayDeaMeFoYYGU20200424 ///
DayDeaMeFoYYGU20200425 ///
DayDeaMeFoLANL20200426 ///
DayDeaMeFoYYGU20200426 ///
DayDeaMeFoIHME20200427 ///
DayDeaMeFoYYGU20200427 ///
DayDeaMeFoIHME20200428 ///
DayDeaMeFoYYGU20200428 ///
DayDeaMeFoIHME20200429 ///
DayDeaMeFoLANL20200429 ///
DayDeaMeFoYYGU20200429 ///
DayDeaMeFoYYGU20200430 ///
DayDeaMeFoDELP20200501 ///
DayDeaMeFoYYGU20200501 ///
DayDeaMeFoSRIV20200502 ///
DayDeaMeFoYYGU20200502 ///
DayDeaMeFoLANL20200503 ///
DayDeaMeFoSRIV20200503 ///
DayDeaMeFoYYGU20200503 ///
DayDeaMeFoIHME20200504 ///
DayDeaMeFoSRIV20200504 ///
DayDeaMeFoYYGU20200504 ///
DayDeaMeFoSRIV20200505 ///
DayDeaMeFoYYGU20200505 ///
DayDeaMeFoLANL20200506 ///
DayDeaMeFoSRIV20200506 ///
DayDeaMeFoYYGU20200506 ///
DayDeaMeFoSRIV20200507 ///
DayDeaMeFoYYGU20200507 ///
DayDeaMeFoSRIV20200508 ///
DayDeaMeFoYYGU20200508 ///
DayDeaMeFoDELP20200509 ///
DayDeaMeFoSRIV20200509 ///
DayDeaMeFoYYGU20200509 ///
DayDeaMeFoIHME20200510 ///
DayDeaMeFoLANL20200510 ///
DayDeaMeFoSRIV20200510 ///
DayDeaMeFoYYGU20200510 ///
DayDeaMeFoSRIV20200511 ///
DayDeaMeFoYYGU20200511 ///
DayDeaMeFoIHME20200512 ///
DayDeaMeFoSRIV20200512 ///
DayDeaMeFoYYGU20200512 ///
DayDeaMeFoLANL20200513 ///
DayDeaMeFoSRIV20200513 ///
DayDeaMeFoYYGU20200513 ///
DayDeaMeFoSRIV20200514 ///
DayDeaMeFoYYGU20200514 ///
DayDeaMeFoSRIV20200515 ///
DayDeaMeFoYYGU20200515 ///
DayDeaMeFoSRIV20200516 ///
DayDeaMeFoYYGU20200516 ///
DayDeaMeFoDELP20200517 ///
DayDeaMeFoLANL20200517 ///
DayDeaMeFoSRIV20200517 ///
DayDeaMeFoYYGU20200517 ///
DayDeaMeFoSRIV20200518 ///
DayDeaMeFoYYGU20200518 ///
DayDeaMeFoSRIV20200519 ///
DayDeaMeFoYYGU20200519 ///
DayDeaMeFoIHME20200520 ///
DayDeaMeFoLANL20200520 ///
DayDeaMeFoSRIV20200520 ///
DayDeaMeFoYYGU20200520 ///
DayDeaMeFoSRIV20200521 ///
DayDeaMeFoYYGU20200521 ///
DayDeaMeFoSRIV20200522 ///
DayDeaMeFoYYGU20200522 ///
DayDeaMeFoSRIV20200523 ///
DayDeaMeFoYYGU20200523 ///
DayDeaMeFoDELP20200524 ///
DayDeaMeFoLANL20200524 ///
DayDeaMeFoSRIV20200524 ///
DayDeaMeFoYYGU20200524 ///
DayDeaMeFoIHME20200525 ///
DayDeaMeFoSRIV20200525 ///
DayDeaMeFoYYGU20200525 ///
DayDeaMeFoIHME20200526 ///
DayDeaMeFoSRIV20200526 ///
DayDeaMeFoYYGU20200526 ///
DayDeaMeFoLANL20200527 ///
DayDeaMeFoSRIV20200527 ///
DayDeaMeFoYYGU20200527 ///
DayDeaMeFoSRIV20200528 ///
DayDeaMeFoYYGU20200528 ///
DayDeaMeFoIHME20200529 ///
DayDeaMeFoSRIV20200529 ///
DayDeaMeFoYYGU20200529 ///
DayDeaMeFoSRIV20200530 ///
DayDeaMeFoYYGU20200530 ///
DayDeaMeFoDELP20200531 ///
DayDeaMeFoLANL20200531 ///
DayDeaMeFoSRIV20200531 ///
DayDeaMeFoYYGU20200531 ///
DayDeaMeFoIMPE20200601 ///
DayDeaMeFoSRIV20200601 ///
DayDeaMeFoYYGU20200601 ///
DayDeaMeFoSRIV20200602 ///
DayDeaMeFoYYGU20200602 ///
DayDeaMeFoIMPE20200603 ///
DayDeaMeFoLANL20200603 ///
DayDeaMeFoSRIV20200603 ///
DayDeaMeFoYYGU20200603 ///
DayDeaMeFoSRIV20200604 ///
DayDeaMeFoYYGU20200604 ///
DayDeaMeFoIHME20200605 ///
DayDeaMeFoSRIV20200605 ///
DayDeaMeFoYYGU20200605 ///
DayDeaMeFoIMPE20200606 ///
DayDeaMeFoSRIV20200606 ///
DayDeaMeFoYYGU20200606 ///
DayDeaMeFoDELP20200607 ///
DayDeaMeFoLANL20200607 ///
DayDeaMeFoSRIV20200607 ///
DayDeaMeFoYYGU20200607 ///
DayDeaMeFoIHME20200608 ///
DayDeaMeFoSRIV20200608 ///
DayDeaMeFoYYGU20200608 ///
DayDeaMeFoSRIV20200609 ///
DayDeaMeFoYYGU20200609 ///
DayDeaMeFoIHME20200610 ///
DayDeaMeFoLANL20200610 ///
DayDeaMeFoSRIV20200610 ///
DayDeaMeFoYYGU20200610 ///
DayDeaMeFoSRIV20200611 ///
DayDeaMeFoYYGU20200611 ///
DayDeaMeFoSRIV20200612 ///
DayDeaMeFoYYGU20200612 ///
DayDeaMeFoLANL20200613 ///
DayDeaMeFoSRIV20200613 ///
DayDeaMeFoYYGU20200613 ///
DayDeaMeFoDELP20200614 ///
DayDeaMeFoIMPE20200614 ///
DayDeaMeFoSRIV20200614 ///
DayDeaMeFoYYGU20200614 ///
DayDeaMeFoIHME20200615 ///
DayDeaMeFoSRIV20200615 ///
DayDeaMeFoYYGU20200615 ///
DayDeaMeFoIMPE20200616 ///
DayDeaMeFoSRIV20200616 ///
DayDeaMeFoYYGU20200616 ///
DayDeaMeFoLANL20200617 ///
DayDeaMeFoSRIV20200617 ///
DayDeaMeFoYYGU20200617 ///
DayDeaMeFoSRIV20200618 ///
DayDeaMeFoYYGU20200618 ///
DayDeaMeFoIMPE20200619 ///
DayDeaMeFoSRIV20200619 ///
DayDeaMeFoYYGU20200619 ///
DayDeaMeFoSRIV20200620 ///
DayDeaMeFoYYGU20200620 ///
DayDeaMeFoDELP20200621 ///
DayDeaMeFoLANL20200621 ///
DayDeaMeFoSRIV20200621 ///
DayDeaMeFoYYGU20200621 ///
DayDeaMeFoSRIV20200622 ///
DayDeaMeFoYYGU20200622 ///
DayDeaMeFoIMPE20200623 ///
DayDeaMeFoLANL20200623 ///
DayDeaMeFoSRIV20200623 ///
DayDeaMeFoYYGU20200623 ///
DayDeaMeFoSRIV20200624 ///
DayDeaMeFoYYGU20200624 ///
DayDeaMeFoIHME20200625 ///
DayDeaMeFoSRIV20200625 ///
DayDeaMeFoYYGU20200625 ///
DayDeaMeFoSRIV20200626 ///
DayDeaMeFoYYGU20200626 ///
DayDeaMeFoSRIV20200627 ///
DayDeaMeFoYYGU20200627 ///
DayDeaMeFoDELP20200628 ///
DayDeaMeFoLANL20200628 ///
DayDeaMeFoSRIV20200628 ///
DayDeaMeFoYYGU20200628 ///
DayDeaMeFoIHME20200629 ///
DayDeaMeFoSRIV20200629 ///
DayDeaMeFoYYGU20200629 ///
DayDeaMeFoSRIV20200630 ///
DayDeaMeFoYYGU20200630 ///
DayDeaMeFoLANL20200701 ///
DayDeaMeFoSRIV20200701 ///
DayDeaMeFoYYGU20200701 ///
DayDeaMeFoIMPE20200702 ///
DayDeaMeFoSRIV20200702 ///
DayDeaMeFoYYGU20200702 ///
DayDeaMeFoIMPE20200703 ///
DayDeaMeFoSRIV20200703 ///
DayDeaMeFoYYGU20200703 ///
DayDeaMeFoDELP20200704 ///
DayDeaMeFoIMPE20200704 ///
DayDeaMeFoSRIV20200704 ///
DayDeaMeFoYYGU20200704 ///
DayDeaMeFoLANL20200705 ///
DayDeaMeFoSRIV20200705 ///
DayDeaMeFoYYGU20200705 ///
DayDeaMeFoSRIV20200706 ///
DayDeaMeFoYYGU20200706 ///
DayDeaMeFoIHME20200707 ///
DayDeaMeFoIMPE20200707 ///
DayDeaMeFoSRIV20200707 ///
DayDeaMeFoYYGU20200707 ///
DayDeaMeFoLANL20200708 ///
DayDeaMeFoSRIV20200708 ///
DayDeaMeFoYYGU20200708 ///
DayDeaMeFoSRIV20200709 ///
DayDeaMeFoYYGU20200709 ///
DayDeaMeFoSRIV20200710 ///
DayDeaMeFoYYGU20200710 ///
DayDeaMeFoIMPE20200711 ///
DayDeaMeFoSRIV20200711 ///
DayDeaMeFoYYGU20200711 ///
DayDeaMeFoLANL20200712 ///
DayDeaMeFoSRIV20200712 ///
DayDeaMeFoYYGU20200712 ///
DayDeaMeFoSRIV20200713 ///
DayDeaMeFoYYGU20200713 ///
DayDeaMeFoIHME20200714 ///
DayDeaMeFoIMPE20200714 ///
DayDeaMeFoSRIV20200714 ///
DayDeaMeFoYYGU20200714 ///
DayDeaMeFoIMPE20200715 ///
DayDeaMeFoLANL20200715 ///
DayDeaMeFoSRIV20200715 ///
DayDeaMeFoYYGU20200715 ///
DayDeaMeFoSRIV20200716 ///
DayDeaMeFoYYGU20200716 ///
DayDeaMeFoSRIV20200717 ///
DayDeaMeFoYYGU20200717 ///
DayDeaMeFoDELP20200718 ///
DayDeaMeFoIMPE20200718 ///
DayDeaMeFoSRIV20200718 ///
DayDeaMeFoYYGU20200718 ///
DayDeaMeFoLANL20200719 ///
DayDeaMeFoSRIV20200719 ///
DayDeaMeFoYYGU20200719 ///
DayDeaMeFoIMPE20200720 ///
DayDeaMeFoSRIV20200720 ///
DayDeaMeFoYYGU20200720 ///
DayDeaMeFoSRIV20200721 ///
DayDeaMeFoYYGU20200721 ///
DayDeaMeFoIHME20200722 ///
DayDeaMeFoIMPE20200722 ///
DayDeaMeFoLANL20200722 ///
DayDeaMeFoSRIV20200722 ///
DayDeaMeFoYYGU20200722 ///
DayDeaMeFoDELP20200723 ///
DayDeaMeFoSRIV20200723 ///
DayDeaMeFoYYGU20200723 ///
DayDeaMeFoSRIV20200724 ///
DayDeaMeFoYYGU20200724 ///
DayDeaMeFoIMPE20200725 ///
DayDeaMeFoSRIV20200725 ///
DayDeaMeFoYYGU20200725 ///
DayDeaMeFoLANL20200726 ///
DayDeaMeFoSRIV20200726 ///
DayDeaMeFoYYGU20200726 ///
DayDeaMeFoIMPE20200727 ///
DayDeaMeFoSRIV20200727 ///
DayDeaMeFoYYGU20200727 ///
DayDeaMeFoSRIV20200728 ///
DayDeaMeFoYYGU20200728 ///
DayDeaMeFoLANL20200729 ///
DayDeaMeFoSRIV20200729 ///
DayDeaMeFoYYGU20200729 ///
DayDeaMeFoIHME20200730 ///
DayDeaMeFoSRIV20200730 ///
DayDeaMeFoYYGU20200730 ///
DayDeaMeFoIMPE20200731 ///
DayDeaMeFoSRIV20200731 ///
DayDeaMeFoYYGU20200731 ///
DayDeaMeFoDELP20200801 ///
DayDeaMeFoSRIV20200801 ///
DayDeaMeFoYYGU20200801 ///
DayDeaMeFoLANL20200802 ///
DayDeaMeFoSRIV20200802 ///
DayDeaMeFoYYGU20200802 ///
DayDeaMeFoSRIV20200803 ///
DayDeaMeFoYYGU20200803 ///
DayDeaMeFoSRIV20200804 ///
DayDeaMeFoYYGU20200804 ///
DayDeaMeFoLANL20200805 ///
DayDeaMeFoSRIV20200805 ///
DayDeaMeFoYYGU20200805 ///
DayDeaMeFoIHME20200806 ///
DayDeaMeFoSRIV20200806 ///
DayDeaMeFoYYGU20200806 ///
DayDeaMeFoSRIV20200807 ///
DayDeaMeFoYYGU20200807 ///
DayDeaMeFoIMPE20200808 ///
DayDeaMeFoSRIV20200808 ///
DayDeaMeFoYYGU20200808 ///
DayDeaMeFoLANL20200809 ///
DayDeaMeFoSRIV20200809 ///
DayDeaMeFoYYGU20200809 ///
DayDeaMeFoIMPE20200810 ///
DayDeaMeFoSRIV20200810 ///
DayDeaMeFoYYGU20200810 ///
DayDeaMeFoIMPE20200811 ///
DayDeaMeFoSRIV20200811 ///
DayDeaMeFoYYGU20200811 ///
DayDeaMeFoLANL20200812 ///
DayDeaMeFoSRIV20200812 ///
DayDeaMeFoYYGU20200812 ///
DayDeaMeFoIMPE20200813 ///
DayDeaMeFoSRIV20200813 ///
DayDeaMeFoYYGU20200813 ///
DayDeaMeFoIMPE20200814 ///
DayDeaMeFoSRIV20200814 ///
DayDeaMeFoYYGU20200814 ///
DayDeaMeFoDELP20200815 ///
DayDeaMeFoSRIV20200815 ///
DayDeaMeFoYYGU20200815 ///
DayDeaMeFoLANL20200816 ///
DayDeaMeFoSRIV20200816 ///
DayDeaMeFoYYGU20200816 ///
DayDeaMeFoIMPE20200817 ///
DayDeaMeFoSRIV20200817 ///
DayDeaMeFoYYGU20200817 ///
DayDeaMeFoSRIV20200818 ///
DayDeaMeFoYYGU20200818 ///
DayDeaMeFoLANL20200819 ///
DayDeaMeFoSRIV20200819 ///
DayDeaMeFoYYGU20200819 ///
DayDeaMeFoSRIV20200820 ///
DayDeaMeFoYYGU20200820 ///
DayDeaMeFoIHME20200821 ///
DayDeaMeFoSRIV20200821 ///
DayDeaMeFoYYGU20200821 ///
DayDeaMeFoSRIV20200822 ///
DayDeaMeFoYYGU20200822 ///
DayDeaMeFoIMPE20200823 ///
DayDeaMeFoLANL20200823 ///
DayDeaMeFoSRIV20200823 ///
DayDeaMeFoYYGU20200823 ///
DayDeaMeFoSRIV20200824 ///
DayDeaMeFoYYGU20200824 ///
DayDeaMeFoIMPE20200825 ///
DayDeaMeFoSRIV20200825 ///
DayDeaMeFoYYGU20200825 ///
DayDeaMeFoLANL20200826 ///
DayDeaMeFoSRIV20200826 ///
DayDeaMeFoYYGU20200826 ///
DayDeaMeFoIHME20200827 ///
DayDeaMeFoIMPE20200827 ///
DayDeaMeFoSRIV20200827 ///
DayDeaMeFoYYGU20200827 ///
DayDeaMeFoSRIV20200828 ///
DayDeaMeFoYYGU20200828 ///
DayDeaMeFoDELP20200829 ///
DayDeaMeFoSRIV20200829 ///
DayDeaMeFoYYGU20200829 ///
DayDeaMeFoLANL20200830 ///
DayDeaMeFoSRIV20200830 ///
DayDeaMeFoYYGU20200830 ///
DayDeaMeFoIMPE20200831 ///
DayDeaMeFoSRIV20200831 ///
DayDeaMeFoYYGU20200831 ///
DayDeaMeFoSRIV20200901 ///
DayDeaMeFoYYGU20200901 ///
DayDeaMeFoIMPE20200902 ///
DayDeaMeFoLANL20200902 ///
DayDeaMeFoSRIV20200902 ///
DayDeaMeFoYYGU20200902 ///
DayDeaMeFoIHME20200903 ///
DayDeaMeFoSRIV20200903 ///
DayDeaMeFoYYGU20200903 ///
DayDeaMeFoSRIV20200904 ///
DayDeaMeFoYYGU20200904 ///
DayDeaMeFoSRIV20200905 ///
DayDeaMeFoYYGU20200905 ///
DayDeaMeFoIMPE20200906 ///
DayDeaMeFoLANL20200906 ///
DayDeaMeFoSRIV20200906 ///
DayDeaMeFoYYGU20200906 ///
DayDeaMeFoSRIV20200907 ///
DayDeaMeFoYYGU20200907 ///
DayDeaMeFoIMPE20200908 ///
DayDeaMeFoSRIV20200908 ///
DayDeaMeFoYYGU20200908 ///
DayDeaMeFoLANL20200909 ///
DayDeaMeFoSRIV20200909 ///
DayDeaMeFoYYGU20200909 ///
DayDeaMeFoSRIV20200910 ///
DayDeaMeFoYYGU20200910 ///
DayDeaMeFoIHME20200911 ///
DayDeaMeFoSRIV20200911 ///
DayDeaMeFoYYGU20200911 ///
DayDeaMeFoDELP20200912 ///
DayDeaMeFoIMPE20200912 ///
DayDeaMeFoSRIV20200912 ///
DayDeaMeFoYYGU20200912 ///
DayDeaMeFoLANL20200913 ///
DayDeaMeFoSRIV20200913 ///
DayDeaMeFoYYGU20200913 ///
DayDeaMeFoSRIV20200914 ///
DayDeaMeFoYYGU20200914 ///
DayDeaMeFoIMPE20200915 ///
DayDeaMeFoSRIV20200915 ///
DayDeaMeFoYYGU20200915 ///
DayDeaMeFoLANL20200916 ///
DayDeaMeFoSRIV20200916 ///
DayDeaMeFoYYGU20200916 ///
DayDeaMeFoSRIV20200917 ///
DayDeaMeFoYYGU20200917 ///
DayDeaMeFoIHME20200918 ///
DayDeaMeFoSRIV20200918 ///
DayDeaMeFoYYGU20200918 ///
DayDeaMeFoIMPE20200919 ///
DayDeaMeFoSRIV20200919 ///
DayDeaMeFoYYGU20200919 ///
DayDeaMeFoLANL20200920 ///
DayDeaMeFoSRIV20200920 ///
DayDeaMeFoYYGU20200920 ///
DayDeaMeFoSRIV20200921 ///
DayDeaMeFoYYGU20200921 ///
DayDeaMeFoSRIV20200922 ///
DayDeaMeFoYYGU20200922 ///
DayDeaMeFoIMPE20200923 ///
DayDeaMeFoLANL20200923 ///
DayDeaMeFoSRIV20200923 ///
DayDeaMeFoYYGU20200923 ///
DayDeaMeFoIHME20200924 ///
DayDeaMeFoSRIV20200924 ///
DayDeaMeFoYYGU20200924 ///
DayDeaMeFoIMPE20200925 ///
DayDeaMeFoSRIV20200925 ///
DayDeaMeFoYYGU20200925 ///
DayDeaMeFoDELP20200926 ///
DayDeaMeFoSRIV20200926 ///
DayDeaMeFoYYGU20200926 ///
DayDeaMeFoLANL20200927 ///
DayDeaMeFoSRIV20200927 ///
DayDeaMeFoYYGU20200927 ///
DayDeaMeFoSRIV20200928 ///
DayDeaMeFoYYGU20200928 ///
DayDeaMeFoSRIV20200929 ///
DayDeaMeFoYYGU20200929 ///
DayDeaMeFoLANL20200930 ///
DayDeaMeFoSRIV20200930 ///
DayDeaMeFoYYGU20200930 ///
DayDeaMeFoSRIV20201001 ///
DayDeaMeFoYYGU20201001 ///
DayDeaMeFoIHME20201002 ///
DayDeaMeFoSRIV20201002 ///
DayDeaMeFoYYGU20201002 ///
DayDeaMeFoIMPE20201003 ///
DayDeaMeFoSRIV20201003 ///
DayDeaMeFoYYGU20201003 ///
DayDeaMeFoLANL20201004 ///
DayDeaMeFoSRIV20201004 ///
DayDeaMeFoYYGU20201004 ///
DayDeaMeFoYYGU20201005 ///
DayDeaMeFoIMPE20201006 ///
DayDeaMeFoSRIV20201006 ///
DayDeaMeFoLANL20201007 ///
DayDeaMeFoSRIV20201007 ///
DayDeaMeFoDELP20201008 ///
DayDeaMeFoSRIV20201008 ///
DayDeaMeFoIHME20201009 ///
DayDeaMeFoSRIV20201009 ///
DayDeaMeFoSRIV20201010 ///
DayDeaMeFoLANL20201011 ///
DayDeaMeFoSRIV20201011 ///
DayDeaMeFoIMPE20201012 ///
DayDeaMeFoSRIV20201012 ///
DayDeaMeFoSRIV20201013 ///
DayDeaMeFoLANL20201014 ///
DayDeaMeFoSRIV20201014 ///
DayDeaMeFoIHME20201015 ///
DayDeaMeFoSRIV20201015 ///
DayDeaMeFoSRIV20201016 ///
DayDeaMeFoSRIV20201017 ///
DayDeaMeFoLANL20201018 ///
DayDeaMeFoSRIV20201018 ///
DayDeaMeFoIMPE20201019 ///
DayDeaMeFoSRIV20201019 ///
DayDeaMeFoSRIV20201020 ///
DayDeaMeFoLANL20201021 ///
DayDeaMeFoSRIV20201021 ///
DayDeaMeFoDELP20201022 ///
DayDeaMeFoIHME20201022 ///
DayDeaMeFoSRIV20201022 ///
DayDeaMeFoSRIV20201023 ///
DayDeaMeFoSRIV20201024 ///
DayDeaMeFoIMPE20201025 ///
DayDeaMeFoLANL20201025 ///
DayDeaMeFoSRIV20201025 ///
DayDeaMeFoSRIV20201026 ///
DayDeaMeFoSRIV20201027 ///
DayDeaMeFoIMPE20201028 ///
DayDeaMeFoLANL20201028 ///
DayDeaMeFoSRIV20201028 ///
DayDeaMeFoIHME20201029 ///
DayDeaMeFoSRIV20201029 ///
DayDeaMeFoSRIV20201030 ///
DayDeaMeFoSRIV20201031 ///
DayDeaMeFoIMPE20201101 ///
DayDeaMeFoLANL20201101 ///
DayDeaMeFoSRIV20201101 ///
DayDeaMeFoSRIV20201102 ///
DayDeaMeFoSRIV20201103 ///
DayDeaMeFoLANL20201104 ///
DayDeaMeFoSRIV20201104 ///
DayDeaMeFoDELP20201105 ///
DayDeaMeFoSRIV20201105 ///
DayDeaMeFoSRIV20201106 ///
DayDeaMeFoSRIV20201107 ///
DayDeaMeFoLANL20201108 ///
DayDeaMeFoSRIV20201108 ///
DayDeaMeFoSRIV20201109 ///
DayDeaMeFoIMPE20201110 ///
DayDeaMeFoSRIV20201110 ///
DayDeaMeFoLANL20201111 ///
DayDeaMeFoSRIV20201111 ///
DayDeaMeFoIHME20201112 ///
DayDeaMeFoSRIV20201112 ///
DayDeaMeFoSRIV20201113 ///
DayDeaMeFoIMPE20201114 ///
DayDeaMeFoSRIV20201114 ///
DayDeaMeFoLANL20201115 ///
DayDeaMeFoSRIV20201115 ///
DayDeaMeFoSRIV20201116 ///
DayDeaMeFoSRIV20201117 ///
DayDeaMeFoIMPE20201118 ///
DayDeaMeFoLANL20201118 ///
DayDeaMeFoSRIV20201118 ///
DayDeaMeFoDELP20201119 ///
DayDeaMeFoIHME20201119 ///
DayDeaMeFoSRIV20201119 ///
DayDeaMeFoSRIV20201120 ///
DayDeaMeFoSRIV20201121 ///
DayDeaMeFoLANL20201122 ///
DayDeaMeFoSRIV20201122 ///
DayDeaMeFoIMPE20201123 ///
DayDeaMeFoSRIV20201123 ///
DayDeaMeFoSRIV20201124 ///
DayDeaMeFoLANL20201125 ///
DayDeaMeFoSRIV20201125 ///
DayDeaMeFoSRIV20201126 ///
DayDeaMeFoSRIV20201127 ///
DayDeaMeFoSRIV20201128 ///
DayDeaMeFoIMPE20201129 ///
DayDeaMeFoLANL20201129 ///
DayDeaMeFoSRIV20201129 ///
DayDeaMeFoSRIV20201130 ///
DayDeaMeFoSRIV20201201 ///
DayDeaMeFoLANL20201202 ///
DayDeaMeFoSRIV20201202 ///
DayDeaMeFoDELP20201203 ///
DayDeaMeFoIHME20201203 ///
DayDeaMeFoSRIV20201203 ///
DayDeaMeFoIMPE20201204 ///
DayDeaMeFoSRIV20201204 ///
DayDeaMeFoSRIV20201205 ///
DayDeaMeFoLANL20201206 ///
DayDeaMeFoSRIV20201206 ///
DayDeaMeFoSRIV20201207 ///
DayDeaMeFoSRIV20201208 ///
DayDeaMeFoLANL20201209 ///
DayDeaMeFoSRIV20201209 ///
DayDeaMeFoIHME20201210 ///
DayDeaMeFoSRIV20201210 ///
DayDeaMeFoSRIV20201211 ///
DayDeaMeFoIMPE20201212 ///
DayDeaMeFoSRIV20201212 ///
DayDeaMeFoLANL20201213 ///
DayDeaMeFoSRIV20201213 ///
DayDeaMeFoSRIV20201214 ///
DayDeaMeFoLANL20201216 ///
DayDeaMeFoSRIV20201216 ///
DayDeaMeFoDELP20201217 ///
DayDeaMeFoIHME20201217 ///
DayDeaMeFoSRIV20201217 ///
DayDeaMeFoSRIV20201218 ///
DayDeaMeFoSRIV20201219 ///
DayDeaMeFoIMPE20201220 ///
DayDeaMeFoLANL20201220 ///
DayDeaMeFoSRIV20201220 ///
DayDeaMeFoSRIV20201221 ///
DayDeaMeFoSRIV20201222 ///
DayDeaMeFoIHME20201223 ///
DayDeaMeFoLANL20201223 ///
DayDeaMeFoSRIV20201223 ///
DayDeaMeFoSRIV20201224 ///
DayDeaMeFoSRIV20201225 ///
DayDeaMeFoIMPE20201226 ///
DayDeaMeFoSRIV20201226 ///
DayDeaMeFoSRIV20201227 ///
DayDeaMeFoSRIV20201229 ///
DayDeaMeFoSRIV20201230 ///
DayDeaMeFoDELP20201231 ///
DayDeaMeFoSRIV20201231 ///
DayDeaMeFoSRIV20210101 ///
DayDeaMeFoLANL20210103 ///
DayDeaMeFoSRIV20210103 ///
DayDeaMeFoUCLA20210103 ///
DayDeaMeFoIMPE20210104 ///
DayDeaMeFoSRIV20210104 ///
DayDeaMeFoLANL20210105 ///
DayDeaMeFoSRIV20210105 ///
DayDeaMeFoSRIV20210106 ///
DayDeaMeFoSRIV20210107 ///
DayDeaMeFoSRIV20210108 ///
DayDeaMeFoSRIV20210109 ///
DayDeaMeFoIMPE20210110 ///
DayDeaMeFoLANL20210110 ///
DayDeaMeFoSRIV20210110 ///
DayDeaMeFoUCLA20210110 ///
DayDeaMeFoSRIV20210111 ///
DayDeaMeFoIMPE20210112 ///
DayDeaMeFoSRIV20210112 ///
DayDeaMeFoLANL20210113 ///
DayDeaMeFoSRIV20210113 ///
DayDeaMeFoDELP20210114 ///
DayDeaMeFoSRIV20210114 ///
DayDeaMeFoIHME20210115 ///
DayDeaMeFoSRIV20210115 ///
DayDeaMeFoSRIV20210116 ///
DayDeaMeFoLANL20210117 ///
DayDeaMeFoSRIV20210117 ///
DayDeaMeFoIMPE20210118 ///
DayDeaMeFoSRIV20210118 ///
DayDeaMeFoSRIV20210119 ///
DayDeaMeFoLANL20210120 ///
DayDeaMeFoSRIV20210120 ///
DayDeaMeFoSRIV20210121 ///
DayDeaMeFoIHME20210122 ///
DayDeaMeFoSRIV20210122 ///
DayDeaMeFoSRIV20210123 ///
DayDeaMeFoIMPE20210124 ///
DayDeaMeFoLANL20210124 ///
DayDeaMeFoSRIV20210124 ///
DayDeaMeFoSRIV20210125 ///
DayDeaMeFoSRIV20210126 ///
DayDeaMeFoLANL20210127 ///
DayDeaMeFoSRIV20210127 ///
DayDeaMeFoDELP20210128 ///
DayDeaMeFoIHME20210128 ///
DayDeaMeFoSRIV20210128 ///
DayDeaMeFoSRIV20210129 ///
DayDeaMeFoIMPE20210130 ///
DayDeaMeFoSRIV20210130 ///
DayDeaMeFoLANL20210131 ///
DayDeaMeFoSRIV20210131 ///
DayDeaMeFoSRIV20210201 ///
DayDeaMeFoSRIV20210202 ///
DayDeaMeFoIMPE20210203 ///
DayDeaMeFoLANL20210203 ///
DayDeaMeFoSRIV20210203 ///
DayDeaMeFoIHME20210204 ///
DayDeaMeFoSRIV20210204 ///
DayDeaMeFoSRIV20210205 ///
DayDeaMeFoSRIV20210206 ///
DayDeaMeFoUCLA20210206 ///
DayDeaMeFoLANL20210207 ///
DayDeaMeFoSRIV20210207 ///
DayDeaMeFoSRIV20210208 ///
DayDeaMeFoSRIV20210209 ///
DayDeaMeFoIMPE20210210 ///
DayDeaMeFoLANL20210210 ///
DayDeaMeFoSRIV20210210 ///
DayDeaMeFoDELP20210211 ///
DayDeaMeFoSRIV20210211 ///
DayDeaMeFoIHME20210212 ///
DayDeaMeFoSRIV20210212 ///
DayDeaMeFoSRIV20210213 ///
DayDeaMeFoLANL20210214 ///
DayDeaMeFoSRIV20210214 ///
DayDeaMeFoSRIV20210215 ///
DayDeaMeFoSRIV20210216 ///
DayDeaMeFoIMPE20210217 ///
DayDeaMeFoLANL20210217 ///
DayDeaMeFoSRIV20210217 ///
DayDeaMeFoSRIV20210218 ///
DayDeaMeFoSRIV20210219 ///
DayDeaMeFoIHME20210220 ///
DayDeaMeFoSRIV20210220 ///
DayDeaMeFoLANL20210221 ///
DayDeaMeFoSRIV20210221 ///
DayDeaMeFoSRIV20210222 ///
DayDeaMeFoSRIV20210223 ///
DayDeaMeFoLANL20210224 ///
DayDeaMeFoSRIV20210224 ///
DayDeaMeFoDELP20210225 ///
DayDeaMeFoIHME20210225 ///
DayDeaMeFoSRIV20210225 ///
DayDeaMeFoIMPE20210226 ///
DayDeaMeFoSRIV20210226 ///
DayDeaMeFoSRIV20210227 ///
DayDeaMeFoLANL20210228 ///
DayDeaMeFoSRIV20210228 ///
DayDeaMeFoSRIV20210301 ///
DayDeaMeFoSRIV20210302 ///
DayDeaMeFoLANL20210303 ///
DayDeaMeFoSRIV20210303 ///
DayDeaMeFoSRIV20210304 ///
DayDeaMeFoIMPE20210305 ///
DayDeaMeFoSRIV20210305 ///
DayDeaMeFoIHME20210306 ///
DayDeaMeFoSRIV20210306 ///
DayDeaMeFoLANL20210307 ///
DayDeaMeFoSRIV20210307 ///
DayDeaMeFoUCLA20210307 ///
DayDeaMeFoSRIV20210308 ///
DayDeaMeFoSRIV20210309 ///
DayDeaMeFoLANL20210310 ///
DayDeaMeFoSRIV20210310 ///
DayDeaMeFoDELP20210311 ///
DayDeaMeFoIHME20210311 ///
DayDeaMeFoSRIV20210311 ///
DayDeaMeFoIMPE20210312 ///
DayDeaMeFoSRIV20210312 ///
DayDeaMeFoSRIV20210313 ///
DayDeaMeFoLANL20210314 ///
DayDeaMeFoSRIV20210314 ///
DayDeaMeFoSRIV20210315 ///
DayDeaMeFoUCLA20210315 ///
DayDeaMeFoSRIV20210316 ///
DayDeaMeFoIHME20210317 ///
DayDeaMeFoSRIV20210317 ///
DayDeaMeFoSRIV20210318 ///
DayDeaMeFoIMPE20210319 ///
DayDeaMeFoSRIV20210319 ///
DayDeaMeFoSRIV20210320 ///
DayDeaMeFoLANL20210321 ///
DayDeaMeFoSRIV20210321 ///
DayDeaMeFoSRIV20210322 ///
DayDeaMeFoSRIV20210323 ///
DayDeaMeFoLANL20210324 ///
DayDeaMeFoSRIV20210324 ///
DayDeaMeFoDELP20210325 ///
DayDeaMeFoIHME20210325 ///
DayDeaMeFoSRIV20210325 ///
DayDeaMeFoSRIV20210326 ///
DayDeaMeFoSRIV20210327 ///
DayDeaMeFoLANL20210328 ///
DayDeaMeFoSRIV20210328 ///
DayDeaMeFoUCLA20210328 ///
DayDeaMeFoIMPE20210329 ///
DayDeaMeFoSRIV20210329 ///
DayDeaMeFoSRIV20210330 ///
DayDeaMeFoLANL20210331 ///
DayDeaMeFoSRIV20210331 ///
DayDeaMeFoIHME20210401 ///
DayDeaMeFoSRIV20210401 ///
DayDeaMeFoSRIV20210402 ///
DayDeaMeFoSRIV20210403 ///
DayDeaMeFoLANL20210404 ///
DayDeaMeFoSRIV20210404 ///
DayDeaMeFoUCLA20210404 ///
DayDeaMeFoSRIV20210405 ///
DayDeaMeFoIMPE20210406 ///
DayDeaMeFoSRIV20210406 ///
DayDeaMeFoLANL20210407 ///
DayDeaMeFoSRIV20210407 ///
DayDeaMeFoDELP20210408 ///
DayDeaMeFoSRIV20210408 ///
DayDeaMeFoIHME20210409 ///
DayDeaMeFoSRIV20210409 ///
DayDeaMeFoSRIV20210410 ///
DayDeaMeFoLANL20210411 ///
DayDeaMeFoSRIV20210411 ///
DayDeaMeFoSRIV20210412 ///
DayDeaMeFoSRIV20210413 ///
DayDeaMeFoLANL20210414 ///
DayDeaMeFoSRIV20210414 ///
DayDeaMeFoSRIV20210415 ///
DayDeaMeFoIHME20210416 ///
DayDeaMeFoSRIV20210416 ///
DayDeaMeFoIMPE20210417 ///
DayDeaMeFoSRIV20210417 ///
DayDeaMeFoLANL20210418 ///
DayDeaMeFoSRIV20210418 ///
DayDeaMeFoSRIV20210419 ///
DayDeaMeFoSRIV20210420 ///
DayDeaMeFoLANL20210421 ///
DayDeaMeFoSRIV20210421 ///
DayDeaMeFoDELP20210422 ///
DayDeaMeFoSRIV20210422 ///
DayDeaMeFoIHME20210423 ///
DayDeaMeFoSRIV20210423 ///
DayDeaMeFoIMPE20210424 ///
DayDeaMeFoSRIV20210424 ///
DayDeaMeFoLANL20210425 ///
DayDeaMeFoSRIV20210425 ///
DayDeaMeFoSRIV20210426 ///
DayDeaMeFoSRIV20210427 ///
DayDeaMeFoLANL20210428 ///
DayDeaMeFoSRIV20210428 ///
DayDeaMeFoSRIV20210429 ///
DayDeaMeFoSRIV20210430 ///
DayDeaMeFoSRIV20210501 ///
DayDeaMeFoLANL20210502 ///
DayDeaMeFoSRIV20210502 ///
DayDeaMeFoSRIV20210503 ///
DayDeaMeFoSRIV20210504 ///
DayDeaMeFoLANL20210505 ///
DayDeaMeFoSRIV20210505 ///
DayDeaMeFoDELP20210506 ///
DayDeaMeFoIHME20210506 ///
DayDeaMeFoSRIV20210506 ///
DayDeaMeFoSRIV20210507 ///
DayDeaMeFoSRIV20210508 ///
DayDeaMeFoLANL20210509 ///
DayDeaMeFoSRIV20210509 ///
DayDeaMeFoIMPE20210510 ///
DayDeaMeFoSRIV20210510 ///
DayDeaMeFoSRIV20210511 ///
DayDeaMeFoLANL20210512 ///
DayDeaMeFoSRIV20210512 ///
DayDeaMeFoSRIV20210513 ///
DayDeaMeFoIHME20210514 ///
DayDeaMeFoSRIV20210514 ///
DayDeaMeFoSRIV20210515 ///
DayDeaMeFoIMPE20210516 ///
DayDeaMeFoLANL20210516 ///
DayDeaMeFoSRIV20210516 ///
DayDeaMeFoSRIV20210517 ///
DayDeaMeFoSRIV20210518 ///
DayDeaMeFoLANL20210519 ///
DayDeaMeFoSRIV20210519 ///
DayDeaMeFoDELP20210520 ///
DayDeaMeFoSRIV20210520 ///
DayDeaMeFoIHME20210521 ///
DayDeaMeFoSRIV20210521 ///
DayDeaMeFoIMPE20210522 ///
DayDeaMeFoSRIV20210522 ///
DayDeaMeFoLANL20210523 ///
DayDeaMeFoSRIV20210523 ///
DayDeaMeFoSRIV20210524 ///
DayDeaMeFoSRIV20210525 ///
DayDeaMeFoLANL20210526 ///
DayDeaMeFoSRIV20210526 ///
DayDeaMeFoIMPE20210527 ///
DayDeaMeFoSRIV20210527 ///
DayDeaMeFoIHME20210528 ///
DayDeaMeFoSRIV20210528 ///
DayDeaMeFoSRIV20210529 ///
DayDeaMeFoSRIV20210530 ///
DayDeaMeFoSRIV20210531 ///
DayDeaMeFoSRIV20210601 ///
DayDeaMeFoLANL20210602 ///
DayDeaMeFoSRIV20210602 ///
DayDeaMeFoDELP20210603 ///
DayDeaMeFoSRIV20210603 ///
DayDeaMeFoIHME20210604 ///
DayDeaMeFoIMPE20210604 ///
DayDeaMeFoSRIV20210604 ///
DayDeaMeFoSRIV20210605 ///
DayDeaMeFoLANL20210606 ///
DayDeaMeFoSRIV20210606 ///
DayDeaMeFoSRIV20210607 ///
DayDeaMeFoSRIV20210608 ///
DayDeaMeFoSRIV20210609 ///
DayDeaMeFoDELP20210610 ///
DayDeaMeFoIHME20210610 ///
DayDeaMeFoSRIV20210610 ///
DayDeaMeFoIMPE20210611 ///
DayDeaMeFoSRIV20210611 ///
DayDeaMeFoSRIV20210612 ///
DayDeaMeFoLANL20210613 ///
DayDeaMeFoSRIV20210613 ///
DayDeaMeFoSRIV20210614 ///
DayDeaMeFoSRIV20210615 ///
DayDeaMeFoSRIV20210616 ///
DayDeaMeFoDELP20210617 ///
DayDeaMeFoSRIV20210617 ///
DayDeaMeFoIHME20210618 ///
DayDeaMeFoIMPE20210618 ///
DayDeaMeFoSRIV20210618 ///
DayDeaMeFoSRIV20210619 ///
DayDeaMeFoLANL20210620 ///
DayDeaMeFoSRIV20210620 ///
DayDeaMeFoSRIV20210621 ///
DayDeaMeFoSRIV20210622 ///
DayDeaMeFoSRIV20210623 ///
DayDeaMeFoDELP20210624 ///
DayDeaMeFoSRIV20210624 ///
DayDeaMeFoIHME20210625 ///
DayDeaMeFoIMPE20210626 ///
DayDeaMeFoLANL20210627 ///
DayDeaMeFoSRIV20210627 ///
DayDeaMeFoSRIV20210630 ///
DayDeaMeFoDELP20210701 ///
DayDeaMeFoIHME20210702 ///
DayDeaMeFoIMPE20210702 ///
DayDeaMeFoSRIV20210703 ///
DayDeaMeFoLANL20210704 ///
DayDeaMeFoSRIV20210704 ///
DayDeaMeFoSRIV20210705 ///
DayDeaMeFoSRIV20210706 ///
DayDeaMeFoSRIV20210707 ///
DayDeaMeFoDELP20210708 ///
DayDeaMeFoSRIV20210708 ///
DayDeaMeFoIMPE20210709 ///
DayDeaMeFoSRIV20210709 ///
DayDeaMeFoSRIV20210710 ///
DayDeaMeFoLANL20210711 ///
DayDeaMeFoSRIV20210711 ///
DayDeaMeFoSRIV20210712 ///
DayDeaMeFoUCLA20210712 ///
DayDeaMeFoSRIV20210713 ///
DayDeaMeFoSRIV20210714 ///
DayDeaMeFoDELP20210715 ///
DayDeaMeFoIHME20210715 ///
DayDeaMeFoSRIV20210715 ///
DayDeaMeFoSRIV20210716 ///
DayDeaMeFoSRIV20210717 ///
DayDeaMeFoLANL20210718 ///
DayDeaMeFoSRIV20210718 ///
DayDeaMeFoIMPE20210719 ///
DayDeaMeFoSRIV20210719 ///
DayDeaMeFoUCLA20210719 ///
DayDeaMeFoSRIV20210720 ///
DayDeaMeFoSRIV20210721 ///
DayDeaMeFoDELP20210722 ///
DayDeaMeFoSRIV20210722 ///
DayDeaMeFoIHME20210723 ///
DayDeaMeFoSRIV20210723 ///
DayDeaMeFoSRIV20210724 ///
DayDeaMeFoLANL20210725 ///
DayDeaMeFoSRIV20210725 ///
DayDeaMeFoSRIV20210726 ///
DayDeaMeFoUCLA20210726 ///
DayDeaMeFoSRIV20210727 ///
DayDeaMeFoSRIV20210728 ///
DayDeaMeFoDELP20210729 ///
DayDeaMeFoSRIV20210729 ///
DayDeaMeFoIHME20210730 ///
DayDeaMeFoSRIV20210730 ///
DayDeaMeFoSRIV20210731 ///
DayDeaMeFoLANL20210801 ///
DayDeaMeFoSRIV20210801 ///
DayDeaMeFoUCLA20210802 ///
DayDeaMeFoDELP20210805 ///
DayDeaMeFoIHME20210806 ///
DayDeaMeFoIMPE20210806 ///
DayDeaMeFoLANL20210808 ///
DayDeaMeFoSRIV20210808 ///
DayDeaMeFoSRIV20210809 ///
DayDeaMeFoUCLA20210809 ///
DayDeaMeFoSRIV20210810 ///
DayDeaMeFoSRIV20210811 ///
DayDeaMeFoDELP20210812 ///
DayDeaMeFoSRIV20210813 ///
DayDeaMeFoSRIV20210814 ///
DayDeaMeFoLANL20210815 ///
DayDeaMeFoSRIV20210815 ///
DayDeaMeFoSRIV20210816 ///
DayDeaMeFoUCLA20210816 ///
DayDeaMeFoSRIV20210817 ///
DayDeaMeFoSRIV20210818 ///
DayDeaMeFoDELP20210819 ///
DayDeaMeFoIMPE20210819 ///
DayDeaMeFoSRIV20210819 ///
DayDeaMeFoIHME20210820 ///
DayDeaMeFoSRIV20210820 ///
DayDeaMeFoSRIV20210821 ///
DayDeaMeFoLANL20210822 ///
DayDeaMeFoSRIV20210822 ///
DayDeaMeFoSRIV20210823 ///
DayDeaMeFoUCLA20210823 ///
DayDeaMeFoSRIV20210824 ///
DayDeaMeFoIMPE20210825 ///
DayDeaMeFoSRIV20210825 ///
DayDeaMeFoDELP20210826 ///
DayDeaMeFoIHME20210826 ///
DayDeaMeFoSRIV20210826 ///
DayDeaMeFoSRIV20210827 ///
DayDeaMeFoSRIV20210828 ///
DayDeaMeFoLANL20210829 ///
DayDeaMeFoSRIV20210829 ///
DayDeaMeFoSRIV20210830 ///
DayDeaMeFoUCLA20210830 ///
DayDeaMeFoSRIV20210831 ///
DayDeaMeFoSRIV20210901 ///
DayDeaMeFoDELP20210902 ///
DayDeaMeFoIHME20210902 ///
DayDeaMeFoSRIV20210902 ///
DayDeaMeFoSRIV20210903 ///
DayDeaMeFoSRIV20210904 ///
DayDeaMeFoLANL20210905 ///
DayDeaMeFoSRIV20210905 ///
DayDeaMeFoSRIV20210906 ///
DayDeaMeFoUCLA20210906 ///
DayDeaMeFoSRIV20210907 ///
DayDeaMeFoSRIV20210908 ///
DayDeaMeFoDELP20210909 ///
DayDeaMeFoIMPE20210909 ///
DayDeaMeFoSRIV20210909 ///
DayDeaMeFoIHME20210910 ///
DayDeaMeFoSRIV20210910 ///
DayDeaMeFoSRIV20210911 ///
DayDeaMeFoLANL20210912 ///
DayDeaMeFoSRIV20210912 ///
DayDeaMeFoSRIV20210913 ///
DayDeaMeFoUCLA20210913 ///
DayDeaMeFoSRIV20210914 ///
DayDeaMeFoSRIV20210915 ///
DayDeaMeFoDELP20210916 ///
DayDeaMeFoIHME20210916 ///
DayDeaMeFoSRIV20210916 ///
DayDeaMeFoSRIV20210917 ///
DayDeaMeFoSRIV20210918 ///
DayDeaMeFoLANL20210919 ///
DayDeaMeFoSRIV20210919 ///
DayDeaMeFoSRIV20210920 ///
DayDeaMeFoUCLA20210920 ///
DayDeaMeFoSRIV20210921 ///
DayDeaMeFoSRIV20210922 ///
DayDeaMeFoDELP20210923 ///
DayDeaMeFoIHME20210923 ///
DayDeaMeFoSRIV20210923 ///
DayDeaMeFoIMPE20210924 ///
DayDeaMeFoSRIV20210924 ///
DayDeaMeFoSRIV20210925 ///
DayDeaMeFoLANL20210926 ///
DayDeaMeFoSRIV20210926 ///
DayDeaMeFoSRIV20210927 ///
DayDeaMeFoUCLA20210927 ///
DayDeaMeFoSRIV20210928 ///
DayDeaMeFoSRIV20210929 ///
DayDeaMeFoDELP20210930 ///
DayDeaMeFoIHME20210930 ///
DayDeaMeFoSRIV20210930 ///
DayDeaMeFoSRIV20211001 ///
DayDeaMeFoSRIV20211002 ///
DayDeaMeFoSRIV20211003 ///
DayDeaMeFoSRIV20211004 ///
DayDeaMeFoUCLA20211004 ///
DayDeaMeFoSRIV20211005 ///
DayDeaMeFoIMPE20211006 ///
DayDeaMeFoSRIV20211006 ///
DayDeaMeFoDELP20211007 ///
DayDeaMeFoSRIV20211007 ///
DayDeaMeFoSRIV20211008 ///
DayDeaMeFoSRIV20211009 ///
DayDeaMeFoSRIV20211010 ///
DayDeaMeFoSRIV20211011 ///
DayDeaMeFoUCLA20211011 ///
DayDeaMeFoSRIV20211012 ///
DayDeaMeFoSRIV20211013 ///
DayDeaMeFoDELP20211014 ///
DayDeaMeFoSRIV20211014 ///
DayDeaMeFoIHME20211015 ///
DayDeaMeFoSRIV20211015 ///
DayDeaMeFoSRIV20211016 ///
DayDeaMeFoSRIV20211017 ///
DayDeaMeFoUCLA20211018 ///
DayDeaMeFoDELP20211021 ///
DayDeaMeFoIHME20211021 ///
DayDeaMeFoIMPE20211021 ///
DayDeaMeFoSRIV20211024 ///
DayDeaMeFoSRIV20211025 ///
DayDeaMeFoUCLA20211025 ///
DayDeaMeFoSRIV20211026 ///
DayDeaMeFoIMPE20211027 ///
DayDeaMeFoSRIV20211027 ///
DayDeaMeFoDELP20211028 ///
DayDeaMeFoSRIV20211028 ///
DayDeaMeFoSRIV20211029 ///
DayDeaMeFoSRIV20211030 ///
DayDeaMeFoSRIV20211031 ///
DayDeaMeFoSRIV20211101 ///
DayDeaMeFoUCLA20211101 ///
DayDeaMeFoSRIV20211102 ///
DayDeaMeFoIMPE20211103 ///
DayDeaMeFoSRIV20211103 ///
DayDeaMeFoDELP20211104 ///
DayDeaMeFoIHME20211104 ///
DayDeaMeFoSRIV20211104 ///
DayDeaMeFoSRIV20211105 ///
DayDeaMeFoSRIV20211106 ///
DayDeaMeFoSRIV20211107 ///
DayDeaMeFoSRIV20211108 ///
DayDeaMeFoUCLA20211108 ///
DayDeaMeFoSRIV20211109 ///
DayDeaMeFoSRIV20211110 ///
DayDeaMeFoDELP20211111 ///
DayDeaMeFoSRIV20211111 ///
DayDeaMeFoSRIV20211112 ///
DayDeaMeFoSRIV20211114 ///
DayDeaMeFoIMPE20211115 ///
DayDeaMeFoSRIV20211115 ///
DayDeaMeFoSRIV20211116 ///
DayDeaMeFoSRIV20211117 ///
DayDeaMeFoDELP20211118 ///
DayDeaMeFoSRIV20211118 ///
DayDeaMeFoIHME20211119 ///
DayDeaMeFoSRIV20211119 ///
DayDeaMeFoSRIV20211120 ///
DayDeaMeFoIMPE20211121 ///
DayDeaMeFoSRIV20211121 ///
DayDeaMeFoSRIV20211122 ///
DayDeaMeFoUCLA20211122 ///
DayDeaMeFoSRIV20211124 ///
DayDeaMeFoDELP20211125 ///
DayDeaMeFoSRIV20211126 ///
DayDeaMeFoSRIV20211127 ///
DayDeaMeFoSRIV20211128 ///
DayDeaMeFoIMPE20211129 ///
DayDeaMeFoSRIV20211129 ///
DayDeaMeFoUCLA20211129 ///
DayDeaMeFoSRIV20211130 ///
DayDeaMeFoSRIV20211201 ///
DayDeaMeFoDELP20211202 ///
DayDeaMeFoSRIV20211202 ///
DayDeaMeFoSRIV20211203 ///
DayDeaMeFoIMPE20211205 ///
DayDeaMeFoSRIV20211205 ///
DayDeaMeFoUCLA20211206 ///
DayDeaMeFoSRIV20211207 ///
DayDeaMeFoSRIV20211208 ///
DayDeaMeFoDELP20211209 ///
DayDeaMeFoSRIV20211209 ///
DayDeaMeFoSRIV20211210 ///
DayDeaMeFoSRIV20211211 ///
DayDeaMeFoSRIV20211212 ///
DayDeaMeFoIMPE20211213 ///
DayDeaMeFoSRIV20211213 ///
DayDeaMeFoUCLA20211213 ///
DayDeaMeFoSRIV20211214 ///
DayDeaMeFoSRIV20211215 ///
DayDeaMeFoDELP20211216 ///
DayDeaMeFoSRIV20211216 ///
DayDeaMeFoSRIV20211217 ///
DayDeaMeFoSRIV20211218 ///
DayDeaMeFoSRIV20211219 ///
DayDeaMeFoUCLA20211220 ///
DayDeaMeFoIHME20211221 ///
DayDeaMeFoSRIV20211222 ///
DayDeaMeFoDELP20211223 ///
DayDeaMeFoSRIV20211223 ///
DayDeaMeFoIMPE20211226 ///
DayDeaMeFoSRIV20211226 ///
DayDeaMeFoSRIV20211227 ///
DayDeaMeFoDELP20211230 ///
DayDeaMeFoSRIV20220101 ///
DayDeaMeFoIMPE20220102 ///
DayDeaMeFoSRIV20220102 ///
DayDeaMeFoSRIV20220103 ///
DayDeaMeFoSRIV20220104 ///
DayDeaMeFoSRIV20220105 ///
DayDeaMeFoDELP20220106 ///
DayDeaMeFoSRIV20220106 ///
DayDeaMeFoIHME20220108 ///
DayDeaMeFoSRIV20220108 ///
DayDeaMeFoSRIV20220109 ///
DayDeaMeFoSRIV20220110 ///
DayDeaMeFoSRIV20220111 ///
DayDeaMeFoSRIV20220112 ///
DayDeaMeFoDELP20220113 ///
DayDeaMeFoSRIV20220113 ///
DayDeaMeFoDELP20220114 ///
DayDeaMeFoIHME20220114 ///
DayDeaMeFoDELP20220115 ///
DayDeaMeFoSRIV20220115 ///
DayDeaMeFoDELP20220116 ///
DayDeaMeFoSRIV20220116 ///
DayDeaMeFoDELP20220117 ///
DayDeaMeFoSRIV20220117 ///
DayDeaMeFoDELP20220118 ///
DayDeaMeFoSRIV20220118 ///
DayDeaMeFoDELP20220119 ///
DayDeaMeFoSRIV20220119 ///
DayDeaMeFoDELP20220120 ///
DayDeaMeFoIMPE20220120 ///
DayDeaMeFoSRIV20220120 ///
DayDeaMeFoDELP20220121 ///
DayDeaMeFoIHME20220121 ///
DayDeaMeFoDELP20220122 ///
DayDeaMeFoSRIV20220122 ///
DayDeaMeFoDELP20220123 ///
DayDeaMeFoSRIV20220123 ///
DayDeaMeFoDELP20220124 ///
DayDeaMeFoSRIV20220124 ///
DayDeaMeFoDELP20220125 ///
DayDeaMeFoSRIV20220125 ///
DayDeaMeFoDELP20220126 ///
DayDeaMeFoSRIV20220126 ///
DayDeaMeFoDELP20220127 ///
DayDeaMeFoSRIV20220127 ///
DayDeaMeFoDELP20220128 ///
DayDeaMeFoDELP20220129 ///
DayDeaMeFoSRIV20220129 ///
DayDeaMeFoDELP20220130 ///
DayDeaMeFoSRIV20220130 ///
DayDeaMeFoDELP20220131 ///
DayDeaMeFoIMPE20220131 ///
DayDeaMeFoDELP20220201 ///
DayDeaMeFoDELP20220202 ///
DayDeaMeFoDELP20220203 ///
DayDeaMeFoDELP20220204 ///
DayDeaMeFoIHME20220204 ///
DayDeaMeFoSRIV20220204 ///
DayDeaMeFoDELP20220205 ///
DayDeaMeFoSRIV20220205 ///
DayDeaMeFoDELP20220206 ///
DayDeaMeFoSRIV20220206 ///
DayDeaMeFoDELP20220207 ///
DayDeaMeFoSRIV20220207 ///
DayDeaMeFoDELP20220208 ///
DayDeaMeFoSRIV20220208 ///
DayDeaMeFoDELP20220209 ///
DayDeaMeFoSRIV20220209 ///
DayDeaMeFoDELP20220210 ///
DayDeaMeFoSRIV20220210 ///
DayDeaMeFoDELP20220211 ///
DayDeaMeFoSRIV20220211 ///
DayDeaMeFoDELP20220212 ///
DayDeaMeFoSRIV20220212 ///
DayDeaMeFoDELP20220213 ///
DayDeaMeFoSRIV20220213 ///
DayDeaMeFoDELP20220214 ///
DayDeaMeFoSRIV20220214 ///
DayDeaMeFoDELP20220215 ///
DayDeaMeFoSRIV20220215 ///
DayDeaMeFoDELP20220216 ///
DayDeaMeFoSRIV20220216 ///
DayDeaMeFoDELP20220217 ///
DayDeaMeFoSRIV20220217 ///
DayDeaMeFoDELP20220218 ///
DayDeaMeFoIHME20220218 ///
DayDeaMeFoSRIV20220218 ///
DayDeaMeFoDELP20220219 ///
DayDeaMeFoSRIV20220219 ///
DayDeaMeFoDELP20220220 ///
DayDeaMeFoSRIV20220220 ///
DayDeaMeFoDELP20220221 ///
DayDeaMeFoSRIV20220221 ///
DayDeaMeFoDELP20220222 ///
DayDeaMeFoSRIV20220222 ///
DayDeaMeFoDELP20220223 ///
DayDeaMeFoSRIV20220223 ///
DayDeaMeFoDELP20220224 ///
DayDeaMeFoSRIV20220224 ///
DayDeaMeFoDELP20220225 ///
DayDeaMeFoSRIV20220225 ///
DayDeaMeFoDELP20220226 ///
DayDeaMeFoSRIV20220226 ///
DayDeaMeFoDELP20220227 ///
DayDeaMeFoSRIV20220227 ///
DayDeaMeFoDELP20220228 ///
DayDeaMeFoSRIV20220228 ///
DayDeaMeFoDELP20220301 ///
DayDeaMeFoSRIV20220301 ///
DayDeaMeFoDELP20220302 ///
DayDeaMeFoDELP20220303 ///
DayDeaMeFoDELP20220304 ///
DayDeaMeFoDELP20220305 ///
DayDeaMeFoSRIV20220305 ///
DayDeaMeFoDELP20220306 ///
DayDeaMeFoSRIV20220306 ///
DayDeaMeFoDELP20220307 ///
DayDeaMeFoSRIV20220307 ///
DayDeaMeFoDELP20220308 ///
DayDeaMeFoSRIV20220308 ///
DayDeaMeFoDELP20220309 ///
DayDeaMeFoSRIV20220309 ///
DayDeaMeFoDELP20220310 ///
DayDeaMeFoSRIV20220310 ///
DayDeaMeFoDELP20220311 ///
DayDeaMeFoSRIV20220311 ///
DayDeaMeFoDELP20220312 ///
DayDeaMeFoSRIV20220312 ///
DayDeaMeFoDELP20220313 ///
DayDeaMeFoSRIV20220313 ///
DayDeaMeFoDELP20220314 ///
DayDeaMeFoSRIV20220314 ///
DayDeaMeFoDELP20220315 ///
DayDeaMeFoIMPE20220315 ///
DayDeaMeFoSRIV20220315 ///
DayDeaMeFoDELP20220316 ///
DayDeaMeFoSRIV20220316 ///
DayDeaMeFoDELP20220317 ///
DayDeaMeFoSRIV20220317 ///
DayDeaMeFoDELP20220318 ///
DayDeaMeFoSRIV20220318 ///
DayDeaMeFoDELP20220319 ///
DayDeaMeFoSRIV20220319 ///
DayDeaMeFoDELP20220320 ///
DayDeaMeFoSRIV20220320 ///
DayDeaMeFoDELP20220321 ///
DayDeaMeFoIHME20220321 ///
DayDeaMeFoSRIV20220321 ///
DayDeaMeFoDELP20220322 ///
DayDeaMeFoSRIV20220322 ///
DayDeaMeFoDELP20220323 ///
DayDeaMeFoSRIV20220323 ///
DayDeaMeFoDELP20220324 ///
DayDeaMeFoSRIV20220324 ///
DayDeaMeFoDELP20220325 ///
DayDeaMeFoSRIV20220325 ///
DayDeaMeFoDELP20220326 ///
DayDeaMeFoSRIV20220326 ///
DayDeaMeFoDELP20220327 ///
DayDeaMeFoSRIV20220327 ///
DayDeaMeFoDELP20220328 ///
DayDeaMeFoSRIV20220328 ///
DayDeaMeFoDELP20220329 ///
DayDeaMeFoSRIV20220329 ///
DayDeaMeFoDELP20220330 ///
DayDeaMeFoSRIV20220330 ///
DayDeaMeFoDELP20220331 ///
DayDeaMeFoSRIV20220331 ///
DayDeaMeFoDELP20220401 ///
DayDeaMeFoSRIV20220401 ///
DayDeaMeFoDELP20220402 ///
DayDeaMeFoSRIV20220402 ///
DayDeaMeFoDELP20220403 ///
DayDeaMeFoSRIV20220403 ///
DayDeaMeFoDELP20220404 ///
DayDeaMeFoSRIV20220404 ///
DayDeaMeFoDELP20220405 ///
DayDeaMeFoSRIV20220405 ///
DayDeaMeFoDELP20220406 ///
DayDeaMeFoSRIV20220406 ///
DayDeaMeFoDELP20220407 ///
DayDeaMeFoSRIV20220407 ///
DayDeaMeFoDELP20220408 ///
DayDeaMeFoIHME20220408 ///
DayDeaMeFoSRIV20220408 ///
DayDeaMeFoDELP20220409 ///
DayDeaMeFoSRIV20220409 ///
DayDeaMeFoDELP20220410 ///
DayDeaMeFoSRIV20220410 ///
DayDeaMeFoDELP20220411 ///
DayDeaMeFoSRIV20220411 ///
DayDeaMeFoDELP20220412 ///
DayDeaMeFoDELP20220413 ///
DayDeaMeFoSRIV20220413 ///
DayDeaMeFoDELP20220414 ///
DayDeaMeFoDELP20220415 ///
DayDeaMeFoDELP20220416 ///
DayDeaMeFoDELP20220417 ///
DayDeaMeFoSRIV20220417 ///
DayDeaMeFoDELP20220418 ///
DayDeaMeFoSRIV20220418 ///
DayDeaMeFoDELP20220419 ///
DayDeaMeFoSRIV20220419 ///
DayDeaMeFoDELP20220420 ///
DayDeaMeFoSRIV20220420 ///
DayDeaMeFoDELP20220421 ///
DayDeaMeFoSRIV20220421 ///
DayDeaMeFoDELP20220422 ///
DayDeaMeFoSRIV20220422 ///
DayDeaMeFoDELP20220423 ///
DayDeaMeFoSRIV20220423 ///
DayDeaMeFoDELP20220424 ///
DayDeaMeFoSRIV20220424 ///
DayDeaMeFoDELP20220425 ///
DayDeaMeFoSRIV20220425 ///
DayDeaMeFoDELP20220426 ///
DayDeaMeFoSRIV20220426 ///
DayDeaMeFoDELP20220427 ///
DayDeaMeFoSRIV20220427 ///
DayDeaMeFoDELP20220428 ///
DayDeaMeFoSRIV20220428 ///
DayDeaMeFoDELP20220429 ///
DayDeaMeFoSRIV20220429 ///
DayDeaMeFoDELP20220430 ///
DayDeaMeFoSRIV20220430 ///
DayDeaMeFoDELP20220501 ///
DayDeaMeFoSRIV20220501 ///
DayDeaMeFoDELP20220502 ///
DayDeaMeFoSRIV20220502 ///
DayDeaMeFoDELP20220503 ///
DayDeaMeFoDELP20220504 ///
DayDeaMeFoDELP20220505 ///
DayDeaMeFoDELP20220506 ///
DayDeaMeFoIHME20220506 ///
DayDeaMeFoDELP20220507 ///
DayDeaMeFoDELP20220508 ///
DayDeaMeFoSRIV20220508 ///
DayDeaMeFoDELP20220509 ///
DayDeaMeFoDELP20220510 ///
DayDeaMeFoDELP20220511 ///
DayDeaMeFoDELP20220512 ///
DayDeaMeFoDELP20220513 ///
DayDeaMeFoDELP20220514 ///
DayDeaMeFoDELP20220515 ///
DayDeaMeFoSRIV20220515 ///
DayDeaMeFoDELP20220516 ///
DayDeaMeFoSRIV20220516 ///
DayDeaMeFoDELP20220517 ///
DayDeaMeFoSRIV20220517 ///
DayDeaMeFoDELP20220518 ///
DayDeaMeFoSRIV20220518 ///
DayDeaMeFoDELP20220519 ///
DayDeaMeFoSRIV20220519 ///
DayDeaMeFoDELP20220520 ///
DayDeaMeFoSRIV20220520 ///
DayDeaMeFoDELP20220521 ///
DayDeaMeFoSRIV20220521 ///
DayDeaMeFoDELP20220522 ///
DayDeaMeFoSRIV20220522 ///
DayDeaMeFoDELP20220523 ///
DayDeaMeFoDELP20220524 ///
DayDeaMeFoDELP20220525 ///
DayDeaMeFoDELP20220526 ///
DayDeaMeFoDELP20220527 ///
DayDeaMeFoDELP20220528 ///
DayDeaMeFoDELP20220529 ///
DayDeaMeFoDELP20220530 ///
DayDeaMeFoIMPE20220530 ///
DayDeaMeFoDELP20220531 ///
DayDeaMeFoDELP20220601 ///
DayDeaMeFoDELP20220602 ///
DayDeaMeFoSRIV20220602 ///
DayDeaMeFoDELP20220603 ///
DayDeaMeFoSRIV20220603 ///
DayDeaMeFoDELP20220604 ///
DayDeaMeFoDELP20220605 ///
DayDeaMeFoSRIV20220605 ///
DayDeaMeFoDELP20220606 ///
DayDeaMeFoSRIV20220606 ///
DayDeaMeFoDELP20220607 ///
DayDeaMeFoSRIV20220607 ///
DayDeaMeFoDELP20220608 ///
DayDeaMeFoSRIV20220608 ///
DayDeaMeFoDELP20220609 ///
DayDeaMeFoSRIV20220609 ///
DayDeaMeFoDELP20220610 ///
DayDeaMeFoIHME20220610 ///
DayDeaMeFoSRIV20220610 ///
DayDeaMeFoDELP20220611 ///
DayDeaMeFoSRIV20220611 ///
DayDeaMeFoDELP20220612 ///
DayDeaMeFoSRIV20220612 ///
DayDeaMeFoDELP20220613 ///
DayDeaMeFoDELP20220614 ///
DayDeaMeFoSRIV20220614 ///
DayDeaMeFoDELP20220615 ///
DayDeaMeFoSRIV20220615 ///
DayDeaMeFoDELP20220616 ///
DayDeaMeFoDELP20220617 ///
DayDeaMeFoSRIV20220617 ///
DayDeaMeFoDELP20220618 ///
DayDeaMeFoSRIV20220618 ///
DayDeaMeFoDELP20220619 ///
DayDeaMeFoSRIV20220619 ///
DayDeaMeFoDELP20220620 ///
DayDeaMeFoIMPE20220620 ///
DayDeaMeFoSRIV20220620 ///
DayDeaMeFoDELP20220621 ///
DayDeaMeFoSRIV20220621 ///
DayDeaMeFoDELP20220622 ///
DayDeaMeFoSRIV20220622 ///
DayDeaMeFoDELP20220623 ///
DayDeaMeFoSRIV20220623 ///
DayDeaMeFoDELP20220624 ///
DayDeaMeFoSRIV20220624 ///
DayDeaMeFoDELP20220625 ///
DayDeaMeFoSRIV20220625 ///
DayDeaMeFoDELP20220626 ///
DayDeaMeFoSRIV20220626 ///
DayDeaMeFoDELP20220627 ///
DayDeaMeFoSRIV20220627 ///
DayDeaMeFoDELP20220628 ///
DayDeaMeFoSRIV20220628 ///
DayDeaMeFoDELP20220629 ///
DayDeaMeFoSRIV20220629 ///
DayDeaMeFoDELP20220630 ///
DayDeaMeFoSRIV20220630 ///
DayDeaMeFoDELP20220701 ///
DayDeaMeFoSRIV20220701 ///
DayDeaMeFoDELP20220702 ///
DayDeaMeFoSRIV20220702 ///
DayDeaMeFoDELP20220703 ///
DayDeaMeFoIMPE20220703 ///
DayDeaMeFoSRIV20220703 ///
DayDeaMeFoDELP20220704 ///
DayDeaMeFoSRIV20220704 ///
DayDeaMeFoDELP20220705 ///
DayDeaMeFoSRIV20220705 ///
DayDeaMeFoDELP20220706 ///
DayDeaMeFoSRIV20220706 ///
DayDeaMeFoDELP20220707 ///
DayDeaMeFoSRIV20220707 ///
DayDeaMeFoDELP20220708 ///
DayDeaMeFoSRIV20220708 ///
DayDeaMeFoDELP20220709 ///
DayDeaMeFoSRIV20220709 ///
DayDeaMeFoDELP20220710 ///
DayDeaMeFoSRIV20220710 ///
DayDeaMeFoDELP20220711 ///
DayDeaMeFoSRIV20220711 ///
DayDeaMeFoDELP20220712 ///
DayDeaMeFoIMPE20220712 ///
DayDeaMeFoSRIV20220712 ///
DayDeaMeFoDELP20220713 ///
DayDeaMeFoSRIV20220713 ///
DayDeaMeFoDELP20220714 ///
DayDeaMeFoSRIV20220714 ///
DayDeaMeFoDELP20220715 ///
DayDeaMeFoSRIV20220715 ///
DayDeaMeFoDELP20220716 ///
DayDeaMeFoSRIV20220716 ///
DayDeaMeFoDELP20220717 ///
DayDeaMeFoSRIV20220717 ///
DayDeaMeFoDELP20220718 ///
DayDeaMeFoSRIV20220718 ///
DayDeaMeFoDELP20220719 ///
DayDeaMeFoIHME20220719 ///
DayDeaMeFoSRIV20220719 ///
DayDeaMeFoDELP20220720 ///
DayDeaMeFoSRIV20220720 ///
DayDeaMeFoDELP20220721 ///
DayDeaMeFoSRIV20220721 ///
DayDeaMeFoDELP20220722 ///
DayDeaMeFoSRIV20220722 ///
DayDeaMeFoDELP20220723 ///
DayDeaMeFoSRIV20220723 ///
DayDeaMeFoDELP20220724 ///
DayDeaMeFoSRIV20220724 ///
DayDeaMeFoDELP20220725 ///
DayDeaMeFoSRIV20220725 ///
DayDeaMeFoDELP20220726 ///
DayDeaMeFoSRIV20220726 ///
DayDeaMeFoDELP20220727 ///
DayDeaMeFoSRIV20220727 ///
DayDeaMeFoDELP20220728 ///
DayDeaMeFoIMPE20220728 ///
DayDeaMeFoSRIV20220728 ///
DayDeaMeFoDELP20220729 ///
DayDeaMeFoDELP20220730 ///
DayDeaMeFoDELP20220731 ///
DayDeaMeFoDELP20220801 ///
DayDeaMeFoDELP20220802 ///
DayDeaMeFoDELP20220803 ///
DayDeaMeFoDELP20220804 ///
DayDeaMeFoDELP20220805 ///
DayDeaMeFoDELP20220806 ///
DayDeaMeFoDELP20220807 ///
DayDeaMeFoDELP20220808 ///
DayDeaMeFoIMPE20220808 ///
DayDeaMeFoDELP20220809 ///
DayDeaMeFoDELP20220810 ///
DayDeaMeFoDELP20220811 ///
DayDeaMeFoDELP20220812 ///
DayDeaMeFoDELP20220813 ///
DayDeaMeFoSRIV20220813 ///
DayDeaMeFoDELP20220814 ///
DayDeaMeFoSRIV20220814 ///
DayDeaMeFoDELP20220815 ///
DayDeaMeFoSRIV20220815 ///
DayDeaMeFoDELP20220816 ///
DayDeaMeFoSRIV20220816 ///
DayDeaMeFoDELP20220817 ///
DayDeaMeFoSRIV20220817 ///
DayDeaMeFoDELP20220818 ///
DayDeaMeFoSRIV20220818 ///
DayDeaMeFoDELP20220819 ///
DayDeaMeFoSRIV20220819 ///
DayDeaMeFoDELP20220820 ///
DayDeaMeFoSRIV20220820 ///
DayDeaMeFoDELP20220821 ///
DayDeaMeFoSRIV20220821 ///
DayDeaMeFoDELP20220822 ///
DayDeaMeFoSRIV20220822 ///
DayDeaMeFoDELP20220823 ///
DayDeaMeFoSRIV20220823 ///
DayDeaMeFoDELP20220824 ///
DayDeaMeFoSRIV20220824 ///
DayDeaMeFoDELP20220825 ///
DayDeaMeFoDELP20220826 ///
DayDeaMeFoSRIV20220826 ///
DayDeaMeFoDELP20220827 ///
DayDeaMeFoSRIV20220827 ///
DayDeaMeFoDELP20220828 ///
DayDeaMeFoSRIV20220828 ///
DayDeaMeFoDELP20220829 ///
DayDeaMeFoDELP20220830 ///
DayDeaMeFoSRIV20220830 ///
DayDeaMeFoDELP20220831 ///
DayDeaMeFoSRIV20220831 ///
DayDeaMeFoDELP20220901 ///
DayDeaMeFoIMPE20220901 ///
DayDeaMeFoSRIV20220901 ///
DayDeaMeFoDELP20220902 ///
DayDeaMeFoDELP20220903 ///
DayDeaMeFoDELP20220904 ///
DayDeaMeFoDELP20220905 ///
DayDeaMeFoDELP20220906 ///
DayDeaMeFoDELP20220907 ///
DayDeaMeFoSRIV20220907 ///
DayDeaMeFoDELP20220908 ///
DayDeaMeFoDELP20220909 ///
DayDeaMeFoDELP20220910 ///
DayDeaMeFoDELP20220911 ///
DayDeaMeFoSRIV20220911 ///
DayDeaMeFoDELP20220912 ///
DayDeaMeFoIHME20220912 ///
DayDeaMeFoDELP20220913 ///
DayDeaMeFoSRIV20220913 ///
DayDeaMeFoDELP20220914 ///
DayDeaMeFoSRIV20220914 ///
DayDeaMeFoDELP20220915 ///
DayDeaMeFoSRIV20220916 ///
DayDeaMeFoSRIV20220917 ///
DayDeaMeFoSRIV20220918 ///
DayDeaMeFoSRIV20220919 ///
DayDeaMeFoSRIV20220920 ///
DayDeaMeFoSRIV20220921 ///
DayDeaMeFoSRIV20220922 ///
DayDeaMeFoSRIV20220923 ///
DayDeaMeFoSRIV20220924 ///
DayDeaMeFoSRIV20220925 ///
DayDeaMeFoSRIV20220926 ///
DayDeaMeFoSRIV20220927 ///
DayDeaMeFoSRIV20220928 ///
DayDeaMeFoSRIV20220929 ///
DayDeaMeFoSRIV20220930 ///
DayDeaMeFoSRIV20221001 ///
DayDeaMeFoSRIV20221002 ///
DayDeaMeFoSRIV20221003 ///
DayDeaMeFoSRIV20221004 ///
DayDeaMeFoSRIV20221005 ///
DayDeaMeFoSRIV20221006 ///
DayDeaMeFoSRIV20221007 ///
DayDeaMeFoSRIV20221008 ///
DayDeaMeFoSRIV20221009 ///
DayDeaMeFoSRIV20221010 ///
DayDeaMeFoSRIV20221011 ///
DayDeaMeFoSRIV20221012 ///
DayDeaMeFoSRIV20221013 ///
DayDeaMeFoSRIV20221014 ///
DayDeaMeFoSRIV20221015 ///
DayDeaMeFoSRIV20221016 ///
DayDeaMeFoSRIV20221017 ///
DayDeaMeFoSRIV20221018 ///
DayDeaMeFoSRIV20221019 ///
DayDeaMeFoSRIV20221020 ///
DayDeaMeFoSRIV20221021 ///
DayDeaMeFoSRIV20221022 ///
DayDeaMeFoSRIV20221023 ///
DayDeaMeFoIHME20221024 ///
DayDeaMeFoSRIV20221024 ///
DayDeaMeFoSRIV20221025 ///
DayDeaMeFoSRIV20221026 ///
DayDeaMeFoSRIV20221027 ///
DayDeaMeFoSRIV20221028 ///
DayDeaMeFoSRIV20221029 ///
DayDeaMeFoSRIV20221030 ///
DayDeaMeFoSRIV20221031 ///
DayDeaMeFoSRIV20221101 ///
DayDeaMeFoSRIV20221102 ///
DayDeaMeFoSRIV20221114 ///
DayDeaMeFoSRIV20221115 ///
DayDeaMeFoSRIV20221117 ///
DayDeaMeFoIHME20221118 ///
DayDeaMeFoSRIV20221118 ///
DayDeaMeFoSRIV20221119 ///
DayDeaMeFoSRIV20221120 ///
DayDeaMeFoSRIV20221121 ///
DayDeaMeFoSRIV20221122 ///
DayDeaMeFoSRIV20221123 ///
DayDeaMeFoSRIV20221124 ///
DayDeaMeFoSRIV20221125 ///
DayDeaMeFoSRIV20221126 ///
DayDeaMeFoSRIV20221127 ///
DayDeaMeFoSRIV20221128 ///
DayDeaMeFoSRIV20221129 ///
DayDeaMeFoSRIV20221130 ///
DayDeaMeFoSRIV20221201 ///
DayDeaMeFoSRIV20221202 ///
DayDeaMeFoSRIV20221203 ///
DayDeaMeFoSRIV20221204 ///
DayDeaMeFoSRIV20221205 ///
DayDeaMeFoSRIV20221206 ///
DayDeaMeFoSRIV20221207 ///
DayDeaMeFoSRIV20221208 ///
DayDeaMeFoSRIV20221209 ///
DayDeaMeFoSRIV20221210 ///
DayDeaMeFoSRIV20221211 ///
DayDeaMeFoSRIV20221212 ///
DayDeaMeFoSRIV20221213 ///
DayDeaMeFoSRIV20221214 ///
DayDeaMeFoSRIV20221215 ///
DayDeaMeFoIHME20221216 ///
DayDeaMeFoSRIV20221216 ///
DayDeaMeFoSRIV20221217 ///
DayDeaMeFoSRIV20221218 ///
DayDeaMeFoSRIV20221219 ///
DayDeaMeFoSRIV20221220 ///
DayDeaMeFoSRIV20221221 ///
DayDeaMeFoSRIV20221222 ///
DayDeaMeFoSRIV20221223 ///
DayDeaMeFoSRIV20221224 ///
DayDeaMeFoIMPE20221225 ///
DayDeaMeFoSRIV20221225 ///
DayDeaMeFoSRIV20221226 ///
DayDeaMeFoSRIV20221227 ///
DayDeaMeFoSRIV20221228 ///
DayDeaMeFoSRIV20221229 ///
DayDeaMeFoSRIV20221230 ///
DayDeaMeFoSRIV20221231

summ DayDeaMeSmJOHNFRA 

capture drop DayDeaMeSmJOHNFRAby5
gen DayDeaMeSmJOHNFRAby5 = r(max) * 5 // gen yvar cut off point = 5 times of max reported by JOHN	
label var DayDeaMeSmJOHNFRAby5 "5 times maximum DayDeaMeSmJOHNFRA"

local DayDeaMeSmJOHNFRAby5 = DayDeaMeSmJOHNFRAby5


preserve

foreach update of local list {
	
	qui replace `update' = . if `update' > DayDeaMeSmJOHNFRAby5
	
}




twoway ///
(line DayDeaMeFoYYGU20200403 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200404 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200405 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200406 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200407 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200407 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200408 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200409 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200410 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200410 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200411 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200412 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200413 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200413 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200414 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200415 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200416 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20200417 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200417 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200418 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200419 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200420 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200421 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200421 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200422 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200422 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200423 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoYYGU20200424 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200425 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200426 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoYYGU20200426 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200427 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200427 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200428 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoYYGU20200428 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200429 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200429 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoYYGU20200429 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20200430 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoYYGU20200501 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200502 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200503 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200503 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200504 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200504 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200505 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200506 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200506 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200507 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200508 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200509 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200510 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200510 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200510 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200511 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200512 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200512 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200513 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200513 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200514 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200515 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200516 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200517 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200517 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200518 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200519 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200520 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200520 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200520 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200521 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200522 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200523 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200524 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200524 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200525 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200525 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200526 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200526 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200527 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200527 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200528 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200529 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200529 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200530 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200531 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200531 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200601 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200601 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200602 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200603 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200603 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200603 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200604 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200605 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200605 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200606 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200606 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200607 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200607 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200608 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200608 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200609 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20200610 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200610 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200611 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200612 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200613 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200614 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200615 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200615 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200616 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200617 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200617 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200618 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200619 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200620 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200621 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200621 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200622 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200623 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200623 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200624 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200625 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200625 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200626 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200627 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoLANL20200628 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200628 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200629 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200629 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200630 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200701 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200701 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200702 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200703 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200704 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200705 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200705 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200706 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200707 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200707 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200708 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200708 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200709 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200710 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200711 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200712 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200712 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200713 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200714 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200714 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200715 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200715 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200716 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200717 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200718 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200719 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200719 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200720 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200721 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200722 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200722 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200722 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200723 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200724 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200725 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200726 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200726 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200727 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200728 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200729 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200729 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200730 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200730 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200731 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200801 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200802 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200802 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200803 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200804 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200805 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200805 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200806 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200806 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200807 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200808 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200809 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200809 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200810 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200811 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200812 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200812 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200813 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200814 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200815 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200816 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200816 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200817 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200818 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200819 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200819 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200820 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200821 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200821 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200822 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200823 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200823 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200824 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200825 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200826 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200826 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200827 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200827 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200828 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200829 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200830 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200830 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200831 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200901 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200902 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200902 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200903 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200903 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200904 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200905 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200906 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200906 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200907 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200908 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200909 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200909 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200910 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200911 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200911 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200912 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200913 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200913 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200914 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200915 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200916 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200916 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200917 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200918 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200918 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200919 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200920 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200920 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200921 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200922 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20200923 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200923 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20200924 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200924 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200925 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200926 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200927 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200927 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200928 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200929 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20200930 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20200930 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201001 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIHME20201002 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201002 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201003 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoLANL20201004 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoYYGU20201004 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoYYGU20201005 date, sort lwidth(thin) lcolor(gold)) ///
(line DayDeaMeFoIMPE20201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201007 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201009 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201011 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201014 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201015 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201018 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201021 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201022 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201025 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201028 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201029 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201101 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201104 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201108 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201111 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201112 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201115 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201118 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201119 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201122 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201125 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201129 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201202 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201203 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201206 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201209 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201210 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201213 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20201216 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20201217 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20201220 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20201223 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoLANL20201223 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210103 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210103 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210105 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210110 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210110 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210113 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210115 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210117 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210120 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210122 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210124 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210127 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210128 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210131 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210203 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210204 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210206 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoLANL20210207 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210210 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210212 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210220 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210221 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210224 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210225 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210306 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210307 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210307 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210310 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210311 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210314 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210315 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210317 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210325 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210328 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210328 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210331 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210401 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210404 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210404 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210409 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210416 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210423 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210506 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210514 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210521 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20210528 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210604 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210618 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210625 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210702 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210712 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210715 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210719 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210723 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210726 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210730 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210802 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210806 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210809 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210816 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210820 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210823 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210826 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210830 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210902 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210906 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20210910 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210913 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210916 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210920 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210923 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DayDeaMeFoSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20210927 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20210930 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211004 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211011 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20211015 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211018 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20211021 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211025 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211101 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20211104 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211108 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20211119 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211122 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211129 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211206 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211213 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoUCLA20211220 date, sort lwidth(thin) lcolor(blue)) ///
(line DayDeaMeFoIHME20211221 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoIHME20220108 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220114 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220121 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220204 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DayDeaMeFoSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DayDeaMeFoDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DayDeaMeFoSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DayDeaMeFoDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
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
(line DayDeaMeFoIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeFoIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
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
(line DayDeaMeSmJOHNFRA date, sort lwidth(thick) lcolor(cyan)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths) title("C19 daily deaths, France, all models, all updates, forecast only", size(medium) color(black)) ///
legend(position(6) order(1728 "JOHN" 19 "DELP" 5 "IHME" 125 "IMPE" 33 "LANL" 45 "SRIV" 626 "UCLA" 1 "YYGU") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
subtitle(Visualized daily deaths' estimates restricted to less than 5 times of maximum reported by JOHN, size(small)) ///
yline(`DayDeaMeSmJOHNFRAby5', lcolor(gray))

qui graph export "graph 02b France ALL MODELS C19 daily deaths all updates yvar less 5 times max JOHN.pdf", replace


restore


cd "$pathCovidLongitudinal/countries/France"


view "log CovidLongitudinal France 1 Process.smcl"

log close

exit, clear
