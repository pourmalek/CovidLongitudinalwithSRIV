
clear all

cd "$pathCovidLongitudinal/countries/Cambodia"

capture log close 

log using "log CovidLongitudinal Cambodia 9 Merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Cambodia 9 Merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Merge calculations results for error measures by models
	* for each country ---->> Cambodia <<----                                                                 
***************************************************************************


* Merge calculations results for error measures by models, create graphs



** input data files: "`model' Cambodia error.dta"

** output data files: "ALL MODELS Cambodia error.dta" with all date
*                     "ALL MODELS Cambodia error - only models across error measures.dta", replace
*                     "ALL MODELS Cambodia error - only error measures across models.dta", replace

* output data dictionary files: "ALL MODELS Cambodia error data dictionary.csv"
*                               "ALL MODELS Cambodia error - only models across error measures data dictionary.csv"
*                               "ALL MODELS Cambodia error - only error measures across models data dictionary.csv"


** Graphs:
* "graph 03 Cambodia ALL MODELS C19 daily deaths error.pdf"
* "graph 04 Cambodia ALL MODELS C19 daily deaths absolute error.pdf"
* "graph 05 Cambodia ALL MODELS C19 daily deaths percent error.pdf"
* "graph 06 Cambodia ALL MODELS C19 daily deaths absolute percent error.pdf"

* "graph 07a1 Cambodia ALL MODELS C19 daily deaths average median error.pdf"
* "graph 07a2 Cambodia ALL MODELS C19 daily deaths average median error smoothed.pdf"
* "graph 08a1 Cambodia ALL MODELS C19 daily deaths average median absolute error.pdf"
* "graph 08a2 Cambodia ALL MODELS C19 daily deaths average median absolute error smoothed.pdf"
* "graph 09a1 Cambodia ALL MODELS C19 daily deaths average median percent error.pdf"
* "graph 09a2 Cambodia ALL MODELS C19 daily deaths average median percent error smoothed.pdf"
* "graph 10a1 Cambodia ALL MODELS C19 daily deaths average median absolute percent error.pdf"
* "graph 10a2 Cambodia ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf"

****** graph each same error measure across models:
* "graph 12a Cambodia ALL MODELS C19 daily deaths Average Mean Error.pdf"
* "graph 12b Cambodia ALL MODELS C19 daily deaths Average Absolute Error.pdf"
* "graph 12c Cambodia ALL MODELS C19 daily deaths Average Percent Error.pdf"
* "graph 12d Cambodia ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf"

****** graph all models across error measures:
* "graph 13a Cambodia ALL MODELS C19 daily deaths, models across error measures.pdf"

****** graph all error measures across models:
* "graph 13b Cambodia ALL MODELS C19 daily deaths, error measures across models.pdf"




grstyle init

grstyle color background white




use "DELP Cambodia error.dta", clear 

	merge m:m date using "IHME Cambodia error.dta"

	drop _merge
	
	merge m:m date using "IMPE Cambodia error.dta"
	
	drop _merge
	
	merge m:m date using "LANL Cambodia error.dta"	
	
	drop _merge
	
	merge m:m date using "SRIV Cambodia error.dta"	

	drop _merge
	
qui compress









******
* graph 03 Daily deaths, Error // <<-- modify 1

twoway ///
(line DDErrorDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210212 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210213 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210214 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210215 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210216 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210217 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210218 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210219 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210225 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210226 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210227 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210228 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210301 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210302 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210303 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210304 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210305 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210317 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210318 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210319 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210320 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210321 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210322 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210323 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210324 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210423 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210424 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210425 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210426 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210427 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210428 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210429 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210430 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210501 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210502 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210503 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210504 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210505 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210506 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210507 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210508 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210509 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210510 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210511 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210512 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210513 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210521 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210522 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210523 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210524 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210525 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210526 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210527 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDErrorSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDErrorSRIV20220916 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220917 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220918 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220919 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220920 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220921 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220922 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220923 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220924 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220925 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220926 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220927 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220928 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220929 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20220930 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221001 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221002 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221003 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221004 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221005 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221006 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221007 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221008 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221009 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221010 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221011 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221012 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221013 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221014 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221015 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221016 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221017 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221018 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221019 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221020 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221021 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221022 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221023 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20221024 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221025 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221026 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221027 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221028 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221029 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221030 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221031 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221101 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221102 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221114 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221115 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221117 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20221118 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221119 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221120 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221121 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221122 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221123 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221124 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221125 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221126 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221127 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221128 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221129 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221130 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221201 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221202 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221203 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221204 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221205 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221206 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221207 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221208 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221209 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221210 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221211 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221212 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221213 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221214 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221215 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorSRIV20221216 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221217 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221218 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221219 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221220 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221221 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221222 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221223 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221224 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorSRIV20221225 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221226 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221227 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221228 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221229 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221230 date, sort lwidth(thin) lcolor(green)) ///
(line DDErrorSRIV20221231 date, sort lwidth(thin) lcolor(green)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Cambodia, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 806 "IHME" 197 "IMPE" 392 "LANL" 4 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 03 Cambodia ALL MODELS C19 daily deaths error.pdf", replace










******
* graph 04 Daily deaths, AbsErr // <<-- modify 2

twoway ///
(line DDAbsErrDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210228 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210301 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210302 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210303 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210304 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210305 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210317 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210318 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210319 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210320 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210321 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210322 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210323 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210324 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210423 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210424 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210425 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210426 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210427 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210428 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210429 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210430 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210501 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210502 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210503 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210504 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210505 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210506 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210507 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210508 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210509 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210510 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210511 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210512 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210513 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210521 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210522 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210523 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210524 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210525 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210526 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210527 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbsErrSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbsErrSRIV20220916 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220917 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220918 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220919 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220920 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220921 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220922 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220923 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220924 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220925 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220926 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220927 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220928 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220929 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20220930 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221001 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221002 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221003 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221004 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221005 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221006 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221007 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221008 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221009 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221010 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221011 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221012 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221013 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221014 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221015 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221016 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221017 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221018 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221019 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221020 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221021 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221022 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221023 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20221024 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221025 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221026 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221027 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221028 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221029 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221030 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221031 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20221118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrSRIV20221216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrSRIV20221225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221228 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221229 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221230 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbsErrSRIV20221231 date, sort lwidth(thin) lcolor(green)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Cambodia, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 806 "IHME" 197 "IMPE" 392 "LANL" 4 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 04 Cambodia ALL MODELS C19 daily deaths absolute error.pdf", replace









******
* graph 05 Daily deaths, Percent Error <<-- modify 3

twoway ///
(line DDPerErrDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210212 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210213 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210214 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210215 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210216 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210217 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210218 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210219 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210225 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210226 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210227 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210228 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210301 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210302 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210303 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210304 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210305 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210317 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210318 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210319 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210320 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210321 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210322 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210323 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210324 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210423 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210424 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210425 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210426 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210427 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210428 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210429 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210430 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210501 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210502 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210503 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210504 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210505 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210506 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210507 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210508 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210509 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210510 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210511 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210512 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210513 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210521 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210522 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210523 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210524 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210525 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210526 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210527 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDPerErrSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDPerErrSRIV20220916 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220917 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220918 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220919 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220920 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220921 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220922 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220923 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220924 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220925 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220926 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220927 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220928 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220929 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20220930 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221001 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221002 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221003 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221004 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221005 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221006 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221007 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221008 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221009 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221010 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221011 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221012 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221013 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221014 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221015 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221016 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221017 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221018 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221019 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221020 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221021 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221022 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221023 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20221024 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221025 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221026 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221027 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221028 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221029 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221030 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221031 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221101 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221102 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221114 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221115 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221117 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20221118 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221119 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221120 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221121 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221122 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221123 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221124 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221125 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221126 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221127 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221128 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221129 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221130 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221201 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221202 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221203 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221204 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221205 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221206 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221207 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221208 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221209 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221210 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221211 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221212 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221213 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221214 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221215 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrSRIV20221216 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221217 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221218 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221219 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221220 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221221 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221222 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221223 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221224 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrSRIV20221225 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221226 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221227 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221228 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221229 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221230 date, sort lwidth(thin) lcolor(green)) ///
(line DDPerErrSRIV20221231 date, sort lwidth(thin) lcolor(green)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Cambodia, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 806 "IHME" 197 "IMPE" 392 "LANL" 4 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 05 Cambodia ALL MODELS C19 daily deaths percent error.pdf", replace












******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 4

twoway ///
(line DDAbPeErDELP20200417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20200424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20200501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200502 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200503 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200504 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200505 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200506 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200507 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200508 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200509 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200510 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200511 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200512 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200513 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200514 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200515 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200516 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200517 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200518 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200519 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200520 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200521 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200522 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200523 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200524 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200525 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200526 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200527 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200528 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200529 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200530 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200531 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200601 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200602 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200603 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200604 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200605 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200606 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200607 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200608 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200609 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200610 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200611 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200612 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200613 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200614 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200615 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200616 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200617 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200618 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200619 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200620 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200621 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200622 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200623 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200624 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200625 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200626 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200627 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200628 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200629 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200630 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200701 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200702 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200703 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200704 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200705 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200706 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200707 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200708 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200709 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200710 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200711 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200712 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200713 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200714 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200715 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200716 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200717 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200718 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200719 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200720 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200721 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200722 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200723 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200724 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200725 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200726 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200727 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200728 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200729 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200730 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200731 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200801 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200802 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200803 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200804 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200805 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200806 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200807 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200808 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200809 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200810 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200811 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200812 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200813 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200814 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200815 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200816 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200817 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200818 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200819 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200820 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200821 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200822 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200823 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200824 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200825 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200826 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200827 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200828 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200829 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200830 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200831 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200901 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200902 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200903 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200904 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200905 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200906 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200907 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200908 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200909 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200910 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200911 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200912 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200913 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200914 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200915 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200916 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200917 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200918 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200919 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200920 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200921 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200922 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200923 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200924 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200925 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20200926 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20200926 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200927 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200928 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200929 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20200930 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201001 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201002 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201003 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201004 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201006 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201007 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201008 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201008 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201009 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201010 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201011 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201012 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201013 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201014 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201015 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201016 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201017 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201018 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201019 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201020 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201021 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201022 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201022 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201023 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201024 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201025 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201026 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201027 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201028 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201029 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201030 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201031 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201105 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201107 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201113 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20201226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201229 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20201230 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20201231 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20201231 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210107 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210113 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210131 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210228 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210301 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210302 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210303 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210304 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210305 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210306 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210307 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210308 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210309 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210310 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210311 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210312 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210313 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210314 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210315 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210316 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210317 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210318 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210319 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210320 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210321 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210322 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210323 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210324 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210325 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210326 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210327 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210328 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210329 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210330 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210331 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210401 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210402 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210403 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210404 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210405 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210406 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210407 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210407 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210408 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210409 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210410 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210411 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210411 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210412 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210413 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210414 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210414 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210415 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210416 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210417 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210418 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210418 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210419 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210420 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210421 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210421 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210422 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210423 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210424 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210425 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210425 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210426 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210427 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210428 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210428 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210429 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210430 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210501 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210502 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210502 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210503 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210504 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210505 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210505 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210506 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210507 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210508 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210509 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210509 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210510 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210511 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210512 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210512 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210513 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210514 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210515 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210516 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210516 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210517 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210518 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210519 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210519 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210520 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210521 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210522 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210523 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210523 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210524 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210525 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210526 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210526 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210527 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210528 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210529 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210530 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210531 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210601 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210602 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210602 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210603 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210604 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210605 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210606 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210606 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210607 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210608 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210609 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210610 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210611 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210612 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210613 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210613 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210614 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210615 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210616 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210617 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210618 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210619 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210620 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210620 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210621 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210622 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210623 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210624 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210627 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210627 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210630 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210703 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210704 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210704 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210705 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210706 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210707 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210708 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210709 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210710 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210711 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210711 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210712 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210713 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210714 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210715 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210716 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210717 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210718 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210718 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210719 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210720 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210721 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210722 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210723 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210724 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210725 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210725 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210726 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210727 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210728 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210729 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210730 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210731 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210801 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210801 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErLANL20210808 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210808 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210809 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210810 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210811 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210813 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210814 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210815 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210815 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210816 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210817 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210818 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210819 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210820 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210821 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210822 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210822 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210823 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210824 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210825 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210826 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210827 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210828 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210829 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210829 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210830 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210831 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210901 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210902 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210903 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210904 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210905 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210905 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210906 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210907 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210908 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210909 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210910 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210911 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210912 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210912 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210913 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210914 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210915 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210916 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210916 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210917 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210918 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210919 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210919 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210920 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210921 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210922 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210923 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210923 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20210924 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210925 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErLANL20210926 date, sort lwidth(thin) lcolor(brown)) ///
(line DDAbPeErSRIV20210926 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210927 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210928 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20210929 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20210930 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20210930 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211001 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211002 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211003 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211004 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211005 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211006 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211007 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211007 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211008 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211009 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211010 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211011 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211012 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211013 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211014 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211014 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211015 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211016 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211017 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211021 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211024 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211025 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211026 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211027 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211028 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211028 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211029 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211030 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211031 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211104 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211107 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211111 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20211223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20211226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20211227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20211230 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220103 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220104 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220105 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220106 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220106 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220108 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220109 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220110 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220111 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220112 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220113 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220113 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220114 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220115 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220116 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220116 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220117 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220118 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220119 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220120 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220121 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220122 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220123 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220124 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220125 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220126 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220127 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220128 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220129 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220130 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220131 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220201 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220202 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220203 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220204 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220205 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220206 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220207 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220208 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220209 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220210 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220211 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220212 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220213 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220214 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220215 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220216 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220217 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220218 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220218 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20220218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220219 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220220 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220221 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220222 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220223 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220224 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220225 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220226 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220227 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220228 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220228 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220301 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220301 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220302 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220303 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220304 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220305 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220305 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220306 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220306 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220307 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220307 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220308 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220308 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220309 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220309 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220310 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220310 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220311 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220311 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220312 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220312 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220313 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220313 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220314 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220314 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220315 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220315 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220316 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220316 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220317 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220317 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220318 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220318 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220319 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220319 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220320 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220320 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220321 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220321 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20220321 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220322 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220322 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220323 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220323 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220324 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220324 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220325 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220325 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220326 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220326 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220327 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220327 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220328 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220328 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220329 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220329 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220330 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220330 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220331 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220331 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220401 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220401 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220402 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220402 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220403 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220403 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220404 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220404 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220405 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220405 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220406 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220406 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220407 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220407 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220408 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220408 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20220408 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220409 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220409 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220410 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220410 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220411 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220411 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220412 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220413 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220413 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220414 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220415 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220416 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220417 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220417 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220418 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220418 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220419 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220419 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220420 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220420 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220421 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220421 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220422 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220422 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220423 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220423 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220424 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220424 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220425 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220425 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220426 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220426 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220427 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220427 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220428 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220428 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220429 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220429 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220430 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220430 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220501 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220501 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220502 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220502 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220503 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220504 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220505 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220506 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220507 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220508 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220508 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220509 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220510 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220511 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220512 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220513 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220514 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220515 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220515 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220516 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220516 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220517 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220517 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220518 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220518 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220519 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220519 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220520 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220520 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220521 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220521 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220522 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220522 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220523 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220524 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220525 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220526 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220527 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220528 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220529 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220530 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220531 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220601 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220602 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220602 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220603 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220603 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220604 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220605 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220605 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220606 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220606 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220607 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220607 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220608 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220608 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220609 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220609 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220610 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20220610 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220611 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220611 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220612 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220612 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220613 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220614 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220614 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220615 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220615 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220616 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220617 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220617 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220618 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220618 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220619 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220619 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220620 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220620 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220621 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220621 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220622 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220622 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220623 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220623 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220624 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220624 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220625 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220625 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220626 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220626 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220627 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220627 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220628 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220628 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220629 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220629 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220630 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220630 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220701 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220701 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220702 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220702 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220703 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220703 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220704 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220704 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220705 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220705 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220706 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220706 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220707 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220707 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220708 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220708 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220709 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220709 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220710 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220710 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220711 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220711 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220712 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220712 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220713 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220713 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220714 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220714 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220715 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220715 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220716 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220716 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220717 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220717 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220718 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220718 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220719 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220719 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20220719 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220720 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220720 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220721 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220721 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220722 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220722 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220723 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220723 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220724 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220724 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220725 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220725 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220726 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220726 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220727 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220727 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220728 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220728 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220729 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220730 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220731 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220801 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220802 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220803 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220804 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220805 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220806 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220807 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220808 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErDELP20220809 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220810 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220811 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220812 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220813 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220813 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220814 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220814 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220815 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220815 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220816 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220816 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220817 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220817 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220818 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220818 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220819 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220819 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220820 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220820 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220821 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220821 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220822 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220822 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220823 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220823 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220824 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220824 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220825 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220826 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220826 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220827 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220827 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220828 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220828 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220829 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220830 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220830 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220831 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220831 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220901 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20220901 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220902 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220903 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220904 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220905 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220906 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220907 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220907 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220908 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220909 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220910 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErDELP20220911 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220911 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220912 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErIHME20220912 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErDELP20220913 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220913 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220914 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220914 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErDELP20220915 date, sort lwidth(thin) lcolor(red)) ///
(line DDAbPeErSRIV20220916 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220917 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220918 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220919 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220920 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220921 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220922 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220923 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220924 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220925 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220926 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220927 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220928 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220929 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20220930 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221001 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221002 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221003 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221004 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221005 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221006 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221007 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221008 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221009 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221010 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221011 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221012 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221013 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221014 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221015 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221016 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221017 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221018 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221019 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221020 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221021 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221022 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221023 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIHME20221024 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20221024 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221025 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221026 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221027 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221028 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221029 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221030 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221031 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221101 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221102 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221114 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221115 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221117 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIHME20221118 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20221118 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221119 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221120 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221121 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221122 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221123 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221124 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221125 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221126 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221127 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221128 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221129 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221130 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221201 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221202 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221203 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221204 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221205 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221206 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221207 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221208 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221209 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221210 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221211 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221212 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221213 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221214 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221215 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIHME20221216 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErSRIV20221216 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221217 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221218 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221219 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221220 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221221 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221222 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221223 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221224 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErSRIV20221225 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221226 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221227 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221228 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221229 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221230 date, sort lwidth(thin) lcolor(green)) ///
(line DDAbPeErSRIV20221231 date, sort lwidth(thin) lcolor(green)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Cambodia, ALL MODELS, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "DELP" 806 "IHME" 197 "IMPE" 392 "LANL" 4 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 06 Cambodia ALL MODELS C19 daily deaths absolute percent error.pdf", replace








***************************************************************
* graph 07a1 Daily deaths, average median error 

twoway ///
(line DDErrorDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDErrorSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a1 Cambodia ALL MODELS C19 daily deaths average median error.pdf", replace 










***************************************************************
* graph 07a2 Daily deaths, average median error smoothed for better viewing

twoway ///
(line DDErrorDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDErrorSRIV_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a2 Cambodia ALL MODELS C19 daily deaths average median error smoothed.pdf", replace











***************************************************************
* graph 08a1 Daily deaths, average median absolute AbsErr 

twoway ///
(line DDAbsErrDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbsErrSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a1 Cambodia ALL MODELS C19 daily deaths average median absolute error.pdf", replace 










***************************************************************
* graph 08a2 Daily deaths, average median absolute error smoothed for better viewing

twoway ///
(line DDAbsErrDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbsErrSRIV_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a2 Cambodia ALL MODELS C19 daily deaths average median absolute error smoothed.pdf", replace











***************************************************************
* graph 09a1 Daily deaths, average median percent error 

twoway ///
(line DDPerErrDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDPerErrSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a1 Cambodia ALL MODELS C19 daily deaths average median percent error.pdf", replace










***************************************************************
* graph 09a2 Daily deaths, average median percent error smoothed for better viewing

twoway ///
(line DDPerErrDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDPerErrSRIV_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a2 Cambodia ALL MODELS C19 daily deaths average median percent error smoothed.pdf", replace










***************************************************************
* graph 10a1 Daily deaths, average median absolute percent error 

twoway ///
(line DDAbPeErDELP_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErIHME_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbPeErSRIV_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a1 Cambodia ALL MODELS C19 daily deaths average median absolute percent error.pdf", replace 





***************************************************************
* graph 10a2 Daily deaths, average median absolute percent error smoothed for better viewing

twoway ///
(line DDAbPeErDELP_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErIHME_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErLANL_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbPeErSRIV_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Cambodia, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") ///
rows(2) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a2 Cambodia ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf", replace








***********************************************
***********************************************

* graph each same error measure across models






***********************************************

* gen string "%10.0f" copy of DDError`model'_Mean2 for display

summ DDErrorDELP_Mean2, meanonly
local DDErrorDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorDELP_Mean2str
gen DDErrorDELP_Mean2str = `DDErrorDELP_Mean2str'
label var DDErrorDELP_Mean2str "DDErrorDELP Mean over calendar months of median error over updates string"

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

summ DDErrorSRIV_Mean2, meanonly
local DDErrorSRIV_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorSRIV_Mean2str
gen DDErrorSRIV_Mean2str = `DDErrorSRIV_Mean2str'
label var DDErrorSRIV_Mean2str "DDErrorSRIV Mean over calendar months of median error over updates string"



* graph 12a Daily deaths, Average of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorDELP_Mean2str /// 
(mean) DDErrorIHME_Mean2str /// 
(mean) DDErrorIMPE_Mean2str /// 
(mean) DDErrorLANL_Mean2str /// 
(mean) DDErrorSRIV_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Mean Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Cambodia", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(2)) 

qui graph export "graph 12a Cambodia ALL MODELS C19 daily deaths Average Mean Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbsErr`model'_Mean2 for display

summ DDAbsErrDELP_Mean2, meanonly
local DDAbsErrDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrDELP_Mean2str
gen DDAbsErrDELP_Mean2str = `DDAbsErrDELP_Mean2str'
label var DDAbsErrDELP_Mean2str "DDAbsErrDELP Mean over calendar months of median error over updates string"

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

summ DDAbsErrSRIV_Mean2, meanonly
local DDAbsErrSRIV_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrSRIV_Mean2str
gen DDAbsErrSRIV_Mean2str = `DDAbsErrSRIV_Mean2str'
label var DDAbsErrSRIV_Mean2str "DDAbsErrSRIV Mean over calendar months of median error over updates string"



* graph 12b Daily deaths, Average of Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrDELP_Mean2str /// 
(mean) DDAbsErrIHME_Mean2str /// 
(mean) DDAbsErrIMPE_Mean2str /// 
(mean) DDAbsErrLANL_Mean2str /// 
(mean) DDAbsErrSRIV_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Cambodia", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(2)) 

qui graph export "graph 12b Cambodia ALL MODELS C19 daily deaths Average Absolute Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDPerErr`model'_Mean2 for display

summ DDPerErrDELP_Mean2, meanonly
local DDPerErrDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrDELP_Mean2str
gen DDPerErrDELP_Mean2str = `DDPerErrDELP_Mean2str'
label var DDPerErrDELP_Mean2str "DDPerErrDELP Mean over calendar months of median error over updates string"

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

summ DDPerErrSRIV_Mean2, meanonly
local DDPerErrSRIV_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrSRIV_Mean2str
gen DDPerErrSRIV_Mean2str = `DDPerErrSRIV_Mean2str'
label var DDPerErrSRIV_Mean2str "DDPerErrSRIV Mean over calendar months of median error over updates string"


* graph 12c Daily deaths, Average of Percent PerErr over updates and calendar months

graph bar ///
(mean) DDPerErrDELP_Mean2str /// 
(mean) DDPerErrIHME_Mean2str /// 
(mean) DDPerErrIMPE_Mean2str /// 
(mean) DDPerErrLANL_Mean2str /// 
(mean) DDPerErrSRIV_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Cambodia", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(2)) 

qui graph export "graph 12c Cambodia ALL MODELS C19 daily deaths Average Percent Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbPeEr`model'_Mean2 for display

summ DDAbPeErDELP_Mean2, meanonly
local DDAbPeErDELP_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErDELP_Mean2str
gen DDAbPeErDELP_Mean2str = `DDAbPeErDELP_Mean2str'
label var DDAbPeErDELP_Mean2str "DDAbPeErDELP Mean over calendar months of median error over updates string"

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

summ DDAbPeErSRIV_Mean2, meanonly
local DDAbPeErSRIV_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErSRIV_Mean2str
gen DDAbPeErSRIV_Mean2str = `DDAbPeErSRIV_Mean2str'
label var DDAbPeErSRIV_Mean2str "DDAbPeErSRIV Mean over calendar months of median error over updates string"


* graph 12d Daily deaths, Average of Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErDELP_Mean2str /// 
(mean) DDAbPeErIHME_Mean2str /// 
(mean) DDAbPeErIMPE_Mean2str /// 
(mean) DDAbPeErLANL_Mean2str /// 
(mean) DDAbPeErSRIV_Mean2str /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Cambodia", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(2)) 

qui graph export "graph 12d Cambodia ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf", replace





qui compress

save "ALL MODELS Cambodia error.dta", replace





******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Cambodia error data dictionary.csv", replace 
	
restore









***********************************************
***********************************************

* graph all models across error measures


use "ALL MODELS Cambodia error.dta", clear

save "ALL MODELS Cambodia error - only models across error measures.dta", replace



keep *Mean2 


foreach var of varlist * {
	
	summ `var', meanonly
	
	qui replace `var' = r(mean)
}


keep in 1 


* get equal-length varnames before reshape // change Error to Errorr so that all Errorr, AbsErr, PerErr, and AbPeEr have same lenght (6 characters)
rename ///
(DDErrorDELP_Mean2 DDErrorIHME_Mean2 DDErrorIMPE_Mean2 DDErrorLANL_Mean2 DDErrorSRIV_Mean2) ///
(DDErrorrDELP_Mean2 DDErrorrIHME_Mean2 DDErrorrIMPE_Mean2 DDErrorrLANL_Mean2 DDErrorrSRIV_Mean2) 




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

save "CovidLongitudinal Cambodia merge temp.dta", replace 


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
subtitle("Over updates and calendar months; forecast only; Cambodia", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 13a Cambodia ALL MODELS C19 daily deaths, models across error measures.pdf", replace


qui compress

save "ALL MODELS Cambodia error - only models across error measures.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Cambodia error - only models across error measures data dictionary.csv", replace 
	
restore






***********************************************
***********************************************

* graph all error measures across models


use "CovidLongitudinal Cambodia merge temp.dta", clear 


gen i = _n


* temp rename models from A1 to A7 and Error Measures to E1 to E4 for reshaping:

rename (DDErrorrDELP DDErrorrIHME DDErrorrIMPE DDErrorrLANL DDErrorrSRIV) ///
       (DDA1E1 DDA2E1 DDA3E1 DDA4E1 DDA5E1) 
label var DDA1E1 "Daily Deaths Error mean of medians over updates and calendar months DELP"
label var DDA2E1 "Daily Deaths Error mean of medians over updates and calendar months IHME"
label var DDA3E1 "Daily Deaths Error mean of medians over updates and calendar months IMPE"
label var DDA4E1 "Daily Deaths Error mean of medians over updates and calendar months LANL"
label var DDA5E1 "Daily Deaths Error mean of medians over updates and calendar months SRIV"

	   
rename (DDAbsErrDELP DDAbsErrIHME DDAbsErrIMPE DDAbsErrLANL DDAbsErrSRIV) ///
       (DDA1E2 DDA2E2 DDA3E2 DDA4E2 DDA5E2) 
label var DDA1E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months DELP"
label var DDA2E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IHME"
label var DDA3E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IMPE"
label var DDA4E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months LANL"
label var DDA5E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months SRIV"
	   
rename (DDPerErrDELP DDPerErrIHME DDPerErrIMPE DDPerErrLANL DDPerErrSRIV) ///
       (DDA1E3 DDA2E3 DDA3E3 DDA4E3 DDA5E3) 	   
label var DDA1E3 "Daily Deaths Percent Error mean of medians over updates and calendar months DELP"
label var DDA2E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IHME"
label var DDA3E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IMPE"
label var DDA4E3 "Daily Deaths Percent Error mean of medians over updates and calendar months LANL"
label var DDA5E3 "Daily Deaths Percent Error mean of medians over updates and calendar months SRIV"

rename (DDAbPeErDELP DDAbPeErIHME DDAbPeErIMPE DDAbPeErLANL DDAbPeErSRIV) ///
       (DDA1E4 DDA2E4 DDA3E4 DDA4E4 DDA5E4) 
label var DDA1E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months DELP"
label var DDA2E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IHME"
label var DDA3E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IMPE"
label var DDA4E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months LANL"
label var DDA5E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months SRIV"

	   
reshape long DDA1 DDA2 DDA3 DDA4 DDA5, i(i) j(E, string)

gen type = . 
label var type "Error measure type"
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"


label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type


qui compress


graph bar DDA1 DDA2 DDA3 DDA4 DDA5, over(type) ///
bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, average of error measures across models", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Cambodia", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(2)) 

qui graph export "graph 13b Cambodia ALL MODELS C19 daily deaths, error measures across models.pdf", replace





* reshape wide


drop type

reshape wide DDA1 DDA2 DDA3 DDA4 DDA5, i(i) j(E, string)


rename (DDA1E1 DDA2E1 DDA3E1 DDA4E1 DDA5E1) ///
       (DD_DELP_Errorr DD_IHME_Errorr DD_IMPE_Errorr DD_LANL_Errorr DD_SRIV_Errorr)

label var DD_DELP_Errorr "Daily Deaths DELP Error mean of medians over updates and calendar months"
label var DD_IHME_Errorr "Daily Deaths IHME Error mean of medians over updates and calendar months"
label var DD_IMPE_Errorr "Daily Deaths IMPE Error mean of medians over updates and calendar months"
label var DD_LANL_Errorr "Daily Deaths LANL Error mean of medians over updates and calendar months"
label var DD_SRIV_Errorr "Daily Deaths SRIV Error mean of medians over updates and calendar months"


rename (DDA1E2 DDA2E2 DDA3E2 DDA4E2 DDA5E2) ///
       (DD_DELP_AbsErr DD_IHME_AbsErr DD_IMPE_AbsErr DD_LANL_AbsErr DD_SRIV_AbsErr)

label var DD_DELP_AbsErr "Daily Deaths DELP Absolute Error mean of medians over updates and calendar months"
label var DD_IHME_AbsErr "Daily Deaths IHME Absolute Error mean of medians over updates and calendar months"
label var DD_IMPE_AbsErr "Daily Deaths IMPE Absolute Error mean of medians over updates and calendar months"
label var DD_LANL_AbsErr "Daily Deaths LANL Absolute Error mean of medians over updates and calendar months"
label var DD_SRIV_AbsErr "Daily Deaths SRIV Absolute Error mean of medians over updates and calendar months"


rename (DDA1E3 DDA2E3 DDA3E3 DDA4E3 DDA5E3) ///
       (DD_DELP_PerErr DD_IHME_PerErr DD_IMPE_PerErr DD_LANL_PerErr DD_SRIV_PerErr)

label var DD_DELP_PerErr "Daily Deaths DELP Percent Error mean of medians over updates and calendar months"
label var DD_IHME_PerErr "Daily Deaths IHME Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_PerErr "Daily Deaths IMPE Percent Error mean of medians over updates and calendar months"
label var DD_LANL_PerErr "Daily Deaths LANL Percent Error mean of medians over updates and calendar months"
label var DD_SRIV_PerErr "Daily Deaths SRIV Percent Error mean of medians over updates and calendar months"


rename (DDA1E4 DDA2E4 DDA3E4 DDA4E4 DDA5E4) ///
(DD_DELP_AbPeEr DD_IHME_AbPeEr DD_IMPE_AbPeEr DD_LANL_AbPeEr DD_SRIV_AbPeEr)

label var DD_DELP_AbPeEr "Daily Deaths DELP Absolute Percent Error mean of medians over updates and calendar months"
label var DD_IHME_AbPeEr "Daily Deaths IHME Absolute Percent Error mean of medians over updates and calendar months"
label var DD_IMPE_AbPeEr "Daily Deaths IMPE Absolute Percent Error mean of medians over updates and calendar months"
label var DD_LANL_AbPeEr "Daily Deaths LANL Absolute Percent Error mean of medians over updates and calendar months"
label var DD_SRIV_AbPeEr "Daily Deaths SRIV Absolute Percent Error mean of medians over updates and calendar months"



drop i

gen country = "Cambodia"

gen iso = "KHM"

order country iso

qui compress

save "ALL MODELS Cambodia error - only error measures across models.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Cambodia error - only error measures across models data dictionary.csv", replace 
	
restore







view "log CovidLongitudinal Cambodia 9 Merge.smcl"

log close

exit, clear
