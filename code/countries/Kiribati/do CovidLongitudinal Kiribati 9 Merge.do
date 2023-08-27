
clear all

cd "$pathCovidLongitudinal/countries/Kiribati"

capture log close 

log using "log CovidLongitudinal Kiribati 9 Merge.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Kiribati 9 Merge.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Merge calculations results for error measures by models
	* for each country ---->> Kiribati <<----                                                                 
***************************************************************************


* Merge calculations results for error measures by models, create graphs



** input data files: "`model' Kiribati error.dta"

** output data files: "ALL MODELS Kiribati error.dta" with all date
*                     "ALL MODELS Kiribati error - only models across error measures.dta", replace
*                     "ALL MODELS Kiribati error - only error measures across models.dta", replace

* output data dictionary files: "ALL MODELS Kiribati error data dictionary.csv"
*                               "ALL MODELS Kiribati error - only models across error measures data dictionary.csv"
*                               "ALL MODELS Kiribati error - only error measures across models data dictionary.csv"


** Graphs:
* "graph 03 Kiribati ALL MODELS C19 daily deaths error.pdf"
* "graph 04 Kiribati ALL MODELS C19 daily deaths absolute error.pdf"
* "graph 05 Kiribati ALL MODELS C19 daily deaths percent error.pdf"
* "graph 06 Kiribati ALL MODELS C19 daily deaths absolute percent error.pdf"

* "graph 07a1 Kiribati ALL MODELS C19 daily deaths average median error.pdf"
* "graph 07a2 Kiribati ALL MODELS C19 daily deaths average median error smoothed.pdf"
* "graph 08a1 Kiribati ALL MODELS C19 daily deaths average median absolute error.pdf"
* "graph 08a2 Kiribati ALL MODELS C19 daily deaths average median absolute error smoothed.pdf"
* "graph 09a1 Kiribati ALL MODELS C19 daily deaths average median percent error.pdf"
* "graph 09a2 Kiribati ALL MODELS C19 daily deaths average median percent error smoothed.pdf"
* "graph 10a1 Kiribati ALL MODELS C19 daily deaths average median absolute percent error.pdf"
* "graph 10a2 Kiribati ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf"

****** graph each same error measure across models:
* "graph 12a Kiribati ALL MODELS C19 daily deaths Average Mean Error.pdf"
* "graph 12b Kiribati ALL MODELS C19 daily deaths Average Absolute Error.pdf"
* "graph 12c Kiribati ALL MODELS C19 daily deaths Average Percent Error.pdf"
* "graph 12d Kiribati ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf"

****** graph all models across error measures:
* "graph 13a Kiribati ALL MODELS C19 daily deaths, models across error measures.pdf"

****** graph all error measures across models:
* "graph 13b Kiribati ALL MODELS C19 daily deaths, error measures across models.pdf"




grstyle init

grstyle color background white




use "IMPE Kiribati error.dta", clear 
	
qui compress









******
* graph 03 Daily deaths, Error // <<-- modify 1

twoway ///
(line DDErrorIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Kiribati, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 03 Kiribati ALL MODELS C19 daily deaths error.pdf", replace










******
* graph 04 Daily deaths, AbsErr // <<-- modify 2

twoway ///
(line DDAbsErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Kiribati, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 04 Kiribati ALL MODELS C19 daily deaths absolute error.pdf", replace









******
* graph 05 Daily deaths, Percent Error <<-- modify 3

twoway ///
(line DDPerErrIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Kiribati, all Models, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 05 Kiribati ALL MODELS C19 daily deaths percent error.pdf", replace












******
* graph 06 Daily deaths, Absolute Percent Error // <<-- modify 4

twoway ///
(line DDAbPeErIMPE20201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210104 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220102 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220120 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220131 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220315 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220530 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220620 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220712 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220728 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20220901 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErIMPE20221225 date, sort lwidth(thin) lcolor(magenta)) ///
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("Kiribati, ALL MODELS, all updates, forecast only", size(small)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 06 Kiribati ALL MODELS C19 daily deaths absolute percent error.pdf", replace








***************************************************************
* graph 07a1 Daily deaths, average median error 

twoway ///
(line DDErrorIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a1 Kiribati ALL MODELS C19 daily deaths average median error.pdf", replace 










***************************************************************
* graph 07a2 Daily deaths, average median error smoothed for better viewing

twoway ///
(line DDErrorIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 07a2 Kiribati ALL MODELS C19 daily deaths average median error smoothed.pdf", replace











***************************************************************
* graph 08a1 Daily deaths, average median absolute AbsErr 

twoway ///
(line DDAbsErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a1 Kiribati ALL MODELS C19 daily deaths average median absolute error.pdf", replace 










***************************************************************
* graph 08a2 Daily deaths, average median absolute error smoothed for better viewing

twoway ///
(line DDAbsErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 08a2 Kiribati ALL MODELS C19 daily deaths average median absolute error smoothed.pdf", replace











***************************************************************
* graph 09a1 Daily deaths, average median percent error 

twoway ///
(line DDPerErrIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a1 Kiribati ALL MODELS C19 daily deaths average median percent error.pdf", replace










***************************************************************
* graph 09a2 Daily deaths, average median percent error smoothed for better viewing

twoway ///
(line DDPerErrIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 09a2 Kiribati ALL MODELS C19 daily deaths average median percent error smoothed.pdf", replace










***************************************************************
* graph 10a1 Daily deaths, average median absolute percent error 

twoway ///
(line DDAbPeErIMPE_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a1 Kiribati ALL MODELS C19 daily deaths average median absolute percent error.pdf", replace 





***************************************************************
* graph 10a2 Daily deaths, average median absolute percent error smoothed for better viewing

twoway ///
(line DDAbPeErIMPE_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2023) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent error", size(medium) color(black)) /// 
subtitle("Kiribati, all Models, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(position(6) order(1 "IMPE") ///
rows(1) size(small)) legend(region(lcolor(none))) legend(bexpand)

qui graph export "graph 10a2 Kiribati ALL MODELS C19 daily deaths average median absolute percent error smoothed.pdf", replace








***********************************************
***********************************************

* graph each same error measure across models






***********************************************

* gen string "%10.0f" copy of DDError`model'_Mean2 for display

summ DDErrorIMPE_Mean2, meanonly
local DDErrorIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDErrorIMPE_Mean2str
gen DDErrorIMPE_Mean2str = `DDErrorIMPE_Mean2str'
label var DDErrorIMPE_Mean2str "DDErrorIMPE Mean over calendar months of median error over updates string"



* graph 12a Daily deaths, Average of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorIMPE_Mean2str /// 
, bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Mean Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Kiribati", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IMPE") size(small) row(1)) 

qui graph export "graph 12a Kiribati ALL MODELS C19 daily deaths Average Mean Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbsErr`model'_Mean2 for display

summ DDAbsErrIMPE_Mean2, meanonly
local DDAbsErrIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbsErrIMPE_Mean2str
gen DDAbsErrIMPE_Mean2str = `DDAbsErrIMPE_Mean2str'
label var DDAbsErrIMPE_Mean2str "DDAbsErrIMPE Mean over calendar months of median error over updates string"



* graph 12b Daily deaths, Average of Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrIMPE_Mean2str /// 
, bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Kiribati", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IMPE") size(small) row(1)) 

qui graph export "graph 12b Kiribati ALL MODELS C19 daily deaths Average Absolute Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDPerErr`model'_Mean2 for display

summ DDPerErrIMPE_Mean2, meanonly
local DDPerErrIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDPerErrIMPE_Mean2str
gen DDPerErrIMPE_Mean2str = `DDPerErrIMPE_Mean2str'
label var DDPerErrIMPE_Mean2str "DDPerErrIMPE Mean over calendar months of median error over updates string"



* graph 12c Daily deaths, Average of Percent PerErr over updates and calendar months

graph bar ///
(mean) DDPerErrIMPE_Mean2str /// 
, bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Kiribati", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IMPE") size(small) row(1)) 

qui graph export "graph 12c Kiribati ALL MODELS C19 daily deaths Average Percent Error.pdf", replace











***********************************************

* gen string "%10.0f" copy of DDAbPeEr`model'_Mean2 for display

summ DDAbPeErIMPE_Mean2, meanonly
local DDAbPeErIMPE_Mean2str = string(r(mean),"%10.0f")
capture drop DDAbPeErIMPE_Mean2str
gen DDAbPeErIMPE_Mean2str = `DDAbPeErIMPE_Mean2str'
label var DDAbPeErIMPE_Mean2str "DDAbPeErIMPE Mean over calendar months of median error over updates string"



* graph 12d Daily deaths, Average of Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErIMPE_Mean2str /// 
, bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average Absolute Percent Error") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths average of Absolute Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Kiribati", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IMPE") size(small) row(1)) 

qui graph export "graph 12d Kiribati ALL MODELS C19 daily deaths Average Absolute Percent Error.pdf", replace





qui compress

save "ALL MODELS Kiribati error.dta", replace





******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Kiribati error data dictionary.csv", replace 
	
restore









***********************************************
***********************************************

* graph all models across error measures


use "ALL MODELS Kiribati error.dta", clear

save "ALL MODELS Kiribati error - only models across error measures.dta", replace



keep *Mean2 


foreach var of varlist * {
	
	summ `var', meanonly
	
	qui replace `var' = r(mean)
}


keep in 1 


* get equal-length varnames before reshape // change Error to Errorr so that all Errorr, AbsErr, PerErr, and AbPeEr have same lenght (6 characters)
rename ///
(DDErrorIMPE_Mean2 ) ///
(DDErrorrIMPE_Mean2) 




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

save "CovidLongitudinal Kiribati merge temp.dta", replace 


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
subtitle("Over updates and calendar months; forecast only; Kiribati", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 13a Kiribati ALL MODELS C19 daily deaths, models across error measures.pdf", replace


qui compress

save "ALL MODELS Kiribati error - only models across error measures.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Kiribati error - only models across error measures data dictionary.csv", replace 
	
restore






***********************************************
***********************************************

* graph all error measures across models


use "CovidLongitudinal Kiribati merge temp.dta", clear 


gen i = _n


* temp rename models from A1 to A7 and Error Measures to E1 to E4 for reshaping:

rename (DDErrorrIMPE) ///
       (DDA1E1) 
label var DDA1E1 "Daily Deaths Error mean of medians over updates and calendar months IMPE"
	   
rename (DDAbsErrIMPE) ///
       (DDA1E2) 
label var DDA1E2 "Daily Deaths Absolute Error mean of medians over updates and calendar months IMPE"
	   
rename (DDPerErrIMPE) ///
       (DDA1E3) 	   
label var DDA1E3 "Daily Deaths Percent Error mean of medians over updates and calendar months IMPE"

rename (DDAbPeErIMPE) ///
       (DDA1E4 ) 
label var DDA1E4 "Daily Deaths Absolute Percent Error mean of medians over updates and calendar months IMPE"

	   
reshape long DDA1, i(i) j(E, string)

gen type = . 
label var type "Error measure type"
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"


label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type


qui compress


graph bar DDA1, over(type) ///
bar(1, fcolor(magenta) lcolor(magenta)) ///
blabel(bar, size(vsmall) color(white) position(inside) orientation(vertical) format(%30.0fc)) ///
ytitle("Average error measures") yscale(titlegap(2)) ylabel(, labsize(small) angle(forty_five) format(%30.0fc)) ///
title("C19 daily deaths, average of error measures across models", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; Kiribati", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(position(6) order(1 "IMPE") size(small) row(1)) 

qui graph export "graph 13b Kiribati ALL MODELS C19 daily deaths, error measures across models.pdf", replace





* reshape wide


drop type

reshape wide DDA1, i(i) j(E, string)


rename (DDA1E1) ///
       (DD_IMPE_Errorr)

label var DD_IMPE_Errorr "Daily Deaths IMPE Error mean of medians over updates and calendar months"


rename (DDA1E2) ///
       (DD_IMPE_AbsErr)

label var DD_IMPE_AbsErr "Daily Deaths IMPE Absolute Error mean of medians over updates and calendar months"


rename (DDA1E3) ///
       (DD_IMPE_PerErr)

label var DD_IMPE_PerErr "Daily Deaths IMPE Percent Error mean of medians over updates and calendar months"


rename (DDA1E4) ///
(DD_IMPE_AbPeEr)

label var DD_IMPE_AbPeEr "Daily Deaths IMPE Absolute Percent Error mean of medians over updates and calendar months"



drop i

gen country = "Kiribati"

gen iso = "KIR"

order country iso

qui compress

save "ALL MODELS Kiribati error - only error measures across models.dta", replace






******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "ALL MODELS Kiribati error - only error measures across models data dictionary.csv", replace 
	
restore







view "log CovidLongitudinal Kiribati 9 Merge.smcl"

log close

exit, clear
