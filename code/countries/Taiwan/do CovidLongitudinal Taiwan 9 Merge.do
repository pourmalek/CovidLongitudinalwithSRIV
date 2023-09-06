
clear all

cd "$pathCovidLongitudinal/countries/Taiwan"

capture log close 

log using "log CovidLongitudinal Taiwan 9 Merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Taiwan 9 Merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Merge calculations results for error measures by models
	* for each country ---->> Taiwan <<----                                                                 
***************************************************************************


* Merge calculations results for error measures by models, create graphs



** input data files: "`model' Taiwan error.dta"

** output data files: "ALL MODELS Taiwan error.dta" with all date
*                     "ALL MODELS Taiwan error - only models across error measures.dta", replace
*                     "ALL MODELS Taiwan error - only error measures across models.dta", replace

* output data dictionary files: "ALL MODELS Taiwan error data dictionary.csv"
*                               "ALL MODELS Taiwan error - only models across error measures data dictionary.csv"
*                               "ALL MODELS Taiwan error - only error measures across models data dictionary.csv"


** Graphs:
* "graph 03 Taiwan ALL MODELS C19 daily deaths error.pdf"
* "graph 04 Taiwan ALL MODELS C19 daily deaths absolute error.pdf"
* "graph 05 Taiwan ALL MODELS C19 daily deaths percent error.pdf"
* "graph 06 Taiwan ALL MODELS C19 daily deaths absolute percent error.pdf"

* "graph 07a1 Taiwan ALL MODELS C19 daily deaths average median error.pdf"
* "graph 07a2 Taiwan ALL MODELS C19 daily deaths average median error smoothed.pdf"
* "graph 08a1 Taiwan ALL MODELS C19 daily deaths average median absolute error.pdf"
* "graph 08a2 Taiwan ALL MODELS C19 daily deaths average median absolute error smoothed.pdf"
* "graph 09a1 Taiwan ALL MODELS C19 daily deaths average median percent error.pdf"
* "graph 09a2 Taiwan ALL MODELS C19 daily deaths average median percent error smoothed.pdf"
* "graph 10a1 Taiwan ALL MODELS C19 daily deaths average median absolute percent error.pdf"
* "graph 10a2 Taiwan ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf"

****** graph each same error measure across models:
* "graph 12a Taiwan ALL MODELS C19 daily deaths Average Mean Error.pdf"
* "graph 12b Taiwan ALL MODELS C19 daily deaths Average Absolute Error.pdf"
* "graph 12c Taiwan ALL MODELS C19 daily deaths Average Percent Error.pdf"
* "graph 12d Taiwan ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf"

****** graph all models across error measures:
* "graph 13a Taiwan ALL MODELS C19 daily deaths, models across error measures.pdf"

****** graph all error measures across models:
* "graph 13b Taiwan ALL MODELS C19 daily deaths, error measures across models.pdf"




grstyle init

grstyle color background white




use "IHME Taiwan error.dta", clear 

	merge m:m date using "IMPE Taiwan error.dta"	
	
	drop _merge
	
	merge m:m date using "LANL Taiwan error.dta"	
	
	drop _merge
	
qui compress









******
* graph 03 Daily deaths, Error // <<-- modify 1

twoway ///
(line DDErrorIHME20200903 date, sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20200911 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20200918 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20200924 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20201002 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20201009 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20201015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20201022 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20201029 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20201112 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201114 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20201119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201123 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20201203 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201204 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20201210 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201212 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20201217 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201220 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20201223 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20201226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210104 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210112 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210115 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210122 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210124 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210128 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210130 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210203 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210210 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210212 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210217 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210220 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20210225 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210305 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210306 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20210311 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210312 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210317 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210319 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210325 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210329 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210401 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210406 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210409 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20210416 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210417 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210423 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210424 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210510 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210514 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210516 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210521 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210522 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210523 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210526 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210527 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210528 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210602 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210604 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210604 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210606 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210611 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210613 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210618 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210618 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210620 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210625 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210626 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210627 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210702 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210702 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210704 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210709 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210711 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210715 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210718 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210719 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210723 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210725 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210730 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210801 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210806 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210806 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210808 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorLANL20210815 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210819 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210820 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210822 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210825 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210826 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210829 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210902 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210905 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIMPE20210909 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20210910 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210912 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210916 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorLANL20210919 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210923 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20210924 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210926 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDErrorIHME20210930 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20211006 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20211021 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20211021 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211027 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211103 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211104 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20211115 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20211121 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211205 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211213 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20211221 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20211226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220102 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220108 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20220114 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20220120 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220121 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20220131 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20220218 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20220315 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220321 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20220408 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20220506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20220530 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20220620 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220703 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220712 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220719 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20220728 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220808 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220901 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIHME20220912 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20221024 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20221118 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIHME20221216 date,  sort lwidth(thin) lcolor(black))  ///
(line DDErrorIMPE20221225 date,  sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Taiwan, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IHME" 10 "IMPE" 63 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 03 Taiwan ALL MODELS C19 daily deaths error.pdf", replace










******
* graph 04 Daily deaths, AbsErr // <<-- modify 2

twoway ///
(line DDAbsErrIHME20200903 date, sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20200911 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20200918 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20200924 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20201002 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20201009 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20201015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20201022 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20201029 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20201112 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201114 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20201119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201123 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20201203 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201204 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20201210 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201212 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20201217 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201220 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20201223 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20201226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210104 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210112 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210115 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210122 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210124 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210128 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210130 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210203 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210210 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210212 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210217 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210220 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20210225 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210305 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210306 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20210311 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210312 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210317 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210319 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210325 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210329 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210401 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210406 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210409 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20210416 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210417 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210423 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210424 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210510 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210514 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210516 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210521 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210522 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210523 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210526 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210527 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210528 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210602 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210604 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210604 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210606 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210611 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210613 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210618 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210618 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210620 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210625 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210626 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210627 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210702 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210702 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210704 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210709 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210711 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210715 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210718 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210719 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210723 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210725 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210730 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210801 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210806 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210806 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210808 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrLANL20210815 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210819 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210820 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210822 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210825 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210826 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210829 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210902 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210905 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIMPE20210909 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20210910 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210912 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210916 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrLANL20210919 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210923 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20210924 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210926 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrIHME20210930 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20211006 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20211021 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20211021 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211027 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211103 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211104 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20211115 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20211121 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211205 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211213 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20211221 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20211226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220102 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220108 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20220114 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20220120 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220121 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20220131 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20220218 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20220315 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220321 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20220408 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20220506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20220530 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20220620 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220703 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220712 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220719 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20220728 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220808 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220901 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIHME20220912 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20221024 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20221118 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIHME20221216 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbsErrIMPE20221225 date,  sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Taiwan, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IHME" 10 "IMPE" 63 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 04 Taiwan ALL MODELS C19 daily deaths absolute error.pdf", replace









******
* graph 05 Daily deaths, Percent Error <<-- modify 3

twoway ///
(line DDPerErrIHME20200903 date, sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20200911 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20200918 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20200924 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20201002 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20201009 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20201015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20201022 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20201029 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20201112 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201114 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20201119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201123 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20201203 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201204 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20201210 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201212 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20201217 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201220 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20201223 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20201226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210104 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210112 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210115 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210122 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210124 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210128 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210130 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210203 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210210 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210212 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210217 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210220 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20210225 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210305 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210306 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20210311 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210312 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210317 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210319 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210325 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210329 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210401 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210406 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210409 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20210416 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210417 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210423 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210424 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210510 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210514 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210516 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210521 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210522 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210523 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210526 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210527 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210528 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210602 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210604 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210604 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210606 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210611 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210613 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210618 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210618 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210620 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210625 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210626 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210627 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210702 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210702 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210704 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210709 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210711 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210715 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210718 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210719 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210723 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210725 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210730 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210801 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210806 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210806 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210808 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrLANL20210815 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210819 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210820 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210822 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210825 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210826 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210829 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210902 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210905 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIMPE20210909 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20210910 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210912 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210916 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrLANL20210919 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210923 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20210924 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210926 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrIHME20210930 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20211006 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20211021 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20211021 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211027 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211103 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211104 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20211115 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20211121 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211205 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211213 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20211221 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20211226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220102 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220108 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20220114 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20220120 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220121 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20220131 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20220218 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20220315 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220321 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20220408 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20220506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20220530 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20220620 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220703 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220712 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220719 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20220728 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220808 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220901 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIHME20220912 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20221024 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20221118 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIHME20221216 date,  sort lwidth(thin) lcolor(black))  ///
(line DDPerErrIMPE20221225 date,  sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Taiwan, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IHME" 10 "IMPE" 63 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 05 Taiwan ALL MODELS C19 daily deaths percent error.pdf", replace












******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 4

twoway ///
(line DDAbPeErIHME20200903 date, sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20200911 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20200918 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20200924 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20201002 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20201009 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20201015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20201022 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20201029 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20201112 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201114 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20201119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201123 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20201203 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201204 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20201210 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201212 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20201217 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201220 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20201223 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20201226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210104 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210110 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210112 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210115 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210118 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210122 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210124 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210128 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210130 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210203 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210210 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210212 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210217 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210220 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20210225 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210305 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210306 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20210311 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210312 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210317 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210319 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210325 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210329 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210401 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210406 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210409 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20210416 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210417 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210423 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210424 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210510 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210514 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210516 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210521 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210522 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210523 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210526 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210527 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210528 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210602 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210604 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210604 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210606 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210611 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210613 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210618 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210618 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210620 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210625 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210626 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210627 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210702 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210702 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210704 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210709 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210711 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210715 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210718 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210719 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210723 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210725 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210730 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210801 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210806 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210806 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210808 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErLANL20210815 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210819 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210820 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210822 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210825 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210826 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210829 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210902 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210905 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIMPE20210909 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20210910 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210912 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210916 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErLANL20210919 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210923 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20210924 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210926 date,  sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErIHME20210930 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20211006 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211015 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20211021 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20211021 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211027 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211103 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211104 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20211115 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211119 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20211121 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211129 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211205 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211213 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20211221 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20211226 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220102 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220108 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20220114 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20220120 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220121 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20220131 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220204 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20220218 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20220315 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220321 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20220408 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20220506 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20220530 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220610 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20220620 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220703 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220712 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220719 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20220728 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220808 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220901 date,  sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIHME20220912 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20221024 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20221118 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIHME20221216 date,  sort lwidth(thin) lcolor(black))  ///
(line DDAbPeErIMPE20221225 date,  sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Taiwan, ALL MODELS, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IHME" 10 "IMPE" 63 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 06 Taiwan ALL MODELS C19 daily deaths absolute percent error.pdf", replace








***************************************************************
* graph 07a1 Daily deaths, average median error 

twoway ///
(line DDErrorIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a1 Taiwan ALL MODELS C19 daily deaths average median error.pdf", replace 










***************************************************************
* graph 07a2 Daily deaths, average median error smoothed for better viewing

twoway ///
(line DDErrorIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a2 Taiwan ALL MODELS C19 daily deaths average median error smoothed.pdf", replace











***************************************************************
* graph 08a1 Daily deaths, average median absolute AbsErr 

twoway ///
(line DDAbsErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a1 Taiwan ALL MODELS C19 daily deaths average median absolute error.pdf", replace 










***************************************************************
* graph 08a2 Daily deaths, average median absolute error smoothed for better viewing

twoway ///
(line DDAbsErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a2 Taiwan ALL MODELS C19 daily deaths average median absolute error smoothed.pdf", replace











***************************************************************
* graph 09a1 Daily deaths, average median percent error 

twoway ///
(line DDPerErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a1 Taiwan ALL MODELS C19 daily deaths average median percent error.pdf", replace










***************************************************************
* graph 09a2 Daily deaths, average median percent error smoothed for better viewing

twoway ///
(line DDPerErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a2 Taiwan ALL MODELS C19 daily deaths average median percent error smoothed.pdf", replace










***************************************************************
* graph 10a1 Daily deaths, average median absolute percent error 

twoway ///
(line DDAbPeErIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a1 Taiwan ALL MODELS C19 daily deaths average median absolute percent error.pdf", replace 





***************************************************************
* graph 10a2 Daily deaths, average median absolute percent error smoothed for better viewing

twoway ///
(line DDAbPeErIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Taiwan, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a2 Taiwan ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf", replace








***********************************************
***********************************************

* graph each same error measure across models






***********************************************

* gen string "%10.0f" copy of DDError`model'_Mean2 for display

summ DDErrorIHME_Mean2, meanonly
local DDErrorIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorIHME_Mean2str
gen DDErrorIHME_Mean2str = `DDErrorIHME_Mean2str'
label var DDErrorIHME_Mean2str "DDErrorIHME Mean over calendar months of median error over updates string"

summ DDErrorIMPE_Mean2, meanonly
local DDErrorIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorIMPE_Mean2str
gen DDErrorIMPE_Mean2str = `DDErrorIMPE_Mean2str'
label var DDErrorIMPE_Mean2str "DDErrorIMPE Mean over calendar months of median error over updates string"

summ DDErrorLANL_Mean2, meanonly
local DDErrorLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorLANL_Mean2str
gen DDErrorLANL_Mean2str = `DDErrorLANL_Mean2str'
label var DDErrorLANL_Mean2str "DDErrorLANL Mean over calendar months of median error over updates string"


* graph 12a Daily deaths, Average of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorIHME_Mean2str /// 
(mean) DDErrorIMPE_Mean2str /// 
(mean) DDErrorLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Mean Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Taiwan", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12a Taiwan ALL MODELS C19 daily deaths Average Mean Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbsErr`model'_Mean2 for display

summ DDAbsErrIHME_Mean2, meanonly
local DDAbsErrIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrIHME_Mean2str
gen DDAbsErrIHME_Mean2str = `DDAbsErrIHME_Mean2str'
label var DDAbsErrIHME_Mean2str "DDAbsErrIHME Mean over calendar months of median error over updates string"

summ DDAbsErrIMPE_Mean2, meanonly
local DDAbsErrIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrIMPE_Mean2str
gen DDAbsErrIMPE_Mean2str = `DDAbsErrIMPE_Mean2str'
label var DDAbsErrIMPE_Mean2str "DDAbsErrIMPE Mean over calendar months of median error over updates string"

summ DDAbsErrLANL_Mean2, meanonly
local DDAbsErrLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrLANL_Mean2str
gen DDAbsErrLANL_Mean2str = `DDAbsErrLANL_Mean2str'
label var DDAbsErrLANL_Mean2str "DDAbsErrLANL Mean over calendar months of median error over updates string"



* graph 12b Daily deaths, Average of Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrIHME_Mean2str /// 
(mean) DDAbsErrIMPE_Mean2str /// 
(mean) DDAbsErrLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Taiwan", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12b Taiwan ALL MODELS C19 daily deaths Average Absolute Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDPerErr`model'_Mean2 for display

summ DDPerErrIHME_Mean2, meanonly
local DDPerErrIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrIHME_Mean2str
gen DDPerErrIHME_Mean2str = `DDPerErrIHME_Mean2str'
label var DDPerErrIHME_Mean2str "DDPerErrIHME Mean over calendar months of median error over updates string"

summ DDPerErrIMPE_Mean2, meanonly
local DDPerErrIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrIMPE_Mean2str
gen DDPerErrIMPE_Mean2str = `DDPerErrIMPE_Mean2str'
label var DDPerErrIMPE_Mean2str "DDPerErrIMPE Mean over calendar months of median error over updates string"

summ DDPerErrLANL_Mean2, meanonly
local DDPerErrLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrLANL_Mean2str
gen DDPerErrLANL_Mean2str = `DDPerErrLANL_Mean2str'
label var DDPerErrLANL_Mean2str "DDPerErrLANL Mean over calendar months of median error over updates string"



* graph 12c Daily deaths, Average of Percent PerErr over updates and calendar months

graph bar ///
(mean) DDPerErrIHME_Mean2str /// 
(mean) DDPerErrIMPE_Mean2str /// 
(mean) DDPerErrLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Taiwan", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12c Taiwan ALL MODELS C19 daily deaths Average Percent Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbPeEr`model'_Mean2 for display

summ DDAbPeErIHME_Mean2, meanonly
local DDAbPeErIHME_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErIHME_Mean2str
gen DDAbPeErIHME_Mean2str = `DDAbPeErIHME_Mean2str'
label var DDAbPeErIHME_Mean2str "DDAbPeErIHME Mean over calendar months of median error over updates string"

summ DDAbPeErIMPE_Mean2, meanonly
local DDAbPeErIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErIMPE_Mean2str
gen DDAbPeErIMPE_Mean2str = `DDAbPeErIMPE_Mean2str'
label var DDAbPeErIMPE_Mean2str "DDAbPeErIMPE Mean over calendar months of median error over updates string"

summ DDAbPeErLANL_Mean2, meanonly
local DDAbPeErLANL_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErLANL_Mean2str
gen DDAbPeErLANL_Mean2str = `DDAbPeErLANL_Mean2str'
label var DDAbPeErLANL_Mean2str "DDAbPeErLANL Mean over calendar months of median error over updates string"



* graph 12d Daily deaths, Average of Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErIHME_Mean2str /// 
(mean) DDAbPeErIMPE_Mean2str /// 
(mean) DDAbPeErLANL_Mean2str /// 
, bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Taiwan", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 12d Taiwan ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf", replace





qui compress

save "ALL MODELS Taiwan error.dta", replace





******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Taiwan error data dictionary.csv", replace 
	
restore









***********************************************
***********************************************

* graph all models across error measures


use "ALL MODELS Taiwan error.dta", clear

save "ALL MODELS Taiwan error - only models across error measures.dta", replace



keep *Mean2 


foreach var of varlist * {
	
	summ `var', meanonly
	
	qui replace `var' = r(mean)
}


keep in 1 


* get equal-length varnames before reshape // change Error to Errorr so that all Errorr, AbsErr, PerErr, and AbPeEr have same lenght (6 characters)
rename ///
(DDErrorIHME_Mean2 DDErrorIMPE_Mean2 DDErrorLANL_Mean2) ///
(DDErrorrIHME_Mean2 DDErrorrIMPE_Mean2 DDErrorrLANL_Mean2) 




* get renvars



/*

* After 
net from  http://www.stata-journal.com/software/sj5-4
Stata might return the following:

host not found
http://www.stata-journal.com/software/sj5-4/ either
  1)  is not a valid URL, or
  2)  could not be contacted, or
  3)  is not a Stata download site (has no stata.toc file).

current site is still http://fmwww.bc.edu/repec/bocode/g/

* Bad internet connetion is the issue. Try again / later. 


*/

net from  http://www.stata-journal.com/software/sj5-4

net describe dm88_1

net install dm88_1

*


renvars *, postdrop(6)

save "CovidLongitudinal Taiwan merge temp.dta", replace 


gen i = _n

reshape long DDErrorr DDAbsErr DDPerErr DDAbPeEr, i(i) j(A, string)

rename A model

drop i



label var model "epidemic model being studied"
label var DDErrorr "Daily deaths Error mean of medians over updates and calendar months"
label var DDAbsErr "Daily deaths Absolute Error mean of medians over updates and calendar months"
label var DDPerErr "Daily deaths Percent Error mean of medians over updates and calendar months"
label var DDAbPeEr "Daily deaths Absolute Percent Error mean of medians over updates and calendar months"


graph bar DDErrorr DDAbsErr DDPerErr DDAbPeEr, over(model) ///
bar(1, fcolor(stone) lcolor(stone)) ///
bar(2, fcolor(sand) lcolor(sand)) ///
bar(3, fcolor(ltblue) lcolor(ltblue)) ///
bar(4, fcolor(ebblue) lcolor(ebblue)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, models across average error measures", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Taiwan", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 13a Taiwan ALL MODELS C19 daily deaths, models across error measures.pdf", replace


qui compress

save "ALL MODELS Taiwan error - only models across error measures.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Taiwan error - only models across error measures data dictionary.csv", replace 
	
restore






***********************************************
***********************************************

* graph all error measures across models


use "CovidLongitudinal Taiwan merge temp.dta", clear 


gen i = _n


* temp rename models from A1 to A7 and Error Measures to E1 to E4 for reshaping:

rename (DDErrorrIHME DDErrorrIMPE DDErrorrLANL) ///
       (DDA1E1 DDA2E1 DDA3E1) 
label var DDA1E1 "Daily Deaths Error mean of medians over updates and calendar months IHME"
label var DDA2E1 "Daily Deaths Error mean of medians over updates and calendar months IMPE"
label var DDA3E1 "Daily Deaths Error mean of medians over updates and calendar months LANL"

rename (DDAbsErrIHME DDAbsErrIMPE DDAbsErrLANL) ///
       (DDA1E2 DDA2E2 DDA3E2) 
label var DDA1E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IHME"
label var DDA2E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IMPE"
label var DDA3E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months LANL"
	   
rename (DDPerErrIHME DDPerErrIMPE DDPerErrLANL) ///
       (DDA1E3 DDA2E3 DDA3E3) 	   
label var DDA1E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IHME"
label var DDA2E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IMPE"
label var DDA3E3 "Daily Deaths Percent Error mean of medians over updates and calendar months LANL"

rename (DDAbPeErIHME DDAbPeErIMPE DDAbPeErLANL) ///
       (DDA1E4 DDA2E4 DDA3E4) 
label var DDA1E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IHME"
label var DDA2E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IMPE"
label var DDA3E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months LANL"

	   
reshape long DDA1 DDA2 DDA3, i(i) j(E, string)

gen type = . 
label var type "Error measure type"
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"


label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type


qui compress


graph bar DDA1 DDA2 DDA3, over(type) ///
bar(1, fcolor(black) lcolor(black)) ///
bar(2, fcolor(magenta) lcolor(magenta)) ///
bar(3, fcolor(brown) lcolor(brown)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, average of error measures across models", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Taiwan", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IHME" 2 "IMPE" 3 "LANL") size(small) row(1)) 

qui graph export "graph 13b Taiwan ALL MODELS C19 daily deaths, error measures across models.pdf", replace





* reshape wide


drop type

reshape wide DDA1 DDA2 DDA3, i(i) j(E, string)


rename (DDA1E1 DDA2E1 DDA3E1) ///
       (DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr)

label var DD_IHME_Errorr "Daily Deaths IHME Error mean of medians over updates and calendar months"
label var DD_IMPE_Errorr "Daily Deaths IMPE Error mean of medians over updates and calendar months"
label var DD_LANL_Errorr "Daily Deaths LANL Error mean of medians over updates and calendar months"


rename (DDA1E2 DDA2E2 DDA3E2) ///
       (DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr)

label var DD_IHME_AbsErr "Daily Deaths IHME Absolute Error mean of medians over updates and calendar months"
label var DD_IMPE_AbsErr "Daily Deaths IMPE Absolute Error mean of medians over updates and calendar months"
label var DD_LANL_AbsErr "Daily Deaths LANL Absolute Error mean of medians over updates and calendar months"


rename (DDA1E3 DDA2E3 DDA3E3) ///
       (DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr)

label var DD_IHME_PerErr "Daily Deaths IHME Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_PerErr "Daily Deaths IMPE Percent Error mean of medians over updates and calendar months"
label var DD_LANL_PerErr "Daily Deaths LANL Percent Error mean of medians over updates and calendar months"


rename (DDA1E4 DDA2E4 DDA3E4) ///
(DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr)

label var DD_IHME_AbPeEr "Daily Deaths IHME Absolute Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_AbPeEr "Daily Deaths IMPE Absolute Percent Error mean of medians over updates and calendar months"
label var DD_LANL_AbPeEr "Daily Deaths LANL Absolute Percent Error mean of medians over updates and calendar months"



drop i

gen country = "Taiwan"

gen iso = "TWN"

order country iso

qui compress

save "ALL MODELS Taiwan error - only error measures across models.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Taiwan error - only error measures across models data dictionary.csv", replace 
	
restore







view "log CovidLongitudinal Taiwan 9 Merge.smcl"

log close

exit, clear
