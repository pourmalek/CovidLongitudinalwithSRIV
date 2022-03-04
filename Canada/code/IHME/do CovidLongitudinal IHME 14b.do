
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME 1b.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME 1b.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* months time bin

* compile the data created by IHME 6b.do to IHME 13b.do, for 8 locations: National and 7 provinces
* graphs provinces together

* input data files: "CovidLongitudinal IHME 3b _LOCATION_.dta", where LOCATION is National and 7 provinces
*                   "CovidLongitudinal IHME 4.dta" // weekly compiled
* output data files: "CovidLongitudinal IHME 5.dta" // monthly compiled
*                    "CovidLongitudinal IHME 6.dta" // weekly and monthly compiled



use "CovidLongitudinal IHME 3b National", clear

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b Alberta.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b British Columbia.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b Manitoba.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b Nova Scotia.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b Ontario.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b Quebec.dta"

drop _merge

qui merge m:m provincestate date using "CovidLongitudinal IHME 3b Saskatchewan.dta"

drop _merge



qui compress 

save "CovidLongitudinal IHME 5", replace 





* graphs

***********************************************

* 11 2 1 Daily deaths, provinces together, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA02XXX_Mean1b date, sort lwidth(vthick) lcolor(gray)) /// 1 "CAN" 
(line DDAbPeErA02XAB_Mean1b date, sort lwidth(medium) lcolor(cyan)) /// 2 "AB" cyan
(line DDAbPeErA02XBC_Mean1b date, sort lwidth(medium) lcolor(blue)) /// 3 "BC" blue
(line DDAbPeErA02XMB_Mean1b date, sort lwidth(medium) lcolor(lime)) /// 4 "MB" lime
(line DDAbPeErA02XNS_Mean1b date, sort lwidth(medium) lcolor(magenta)) /// 5 "NS" magenta
(line DDAbPeErA02XON_Mean1b date, sort lwidth(medium) lcolor(red)) /// 6 "ON" red
(line DDAbPeErA02XQC_Mean1b date, sort lwidth(medium) lcolor(black)) /// 7 "QC" black
(line DDAbPeErA02XSK_Mean1b date, sort lwidth(medium) lcolor(brown)) /// 8 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, IHME, Forecast only", size(small)) /// 
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NS" 6 "ON" 7 "QC" 8 "SK") rows(3) size(small))  

qui graph export "graph 11 2 1 C19 daily deaths, $country, provinces together, IHME, absolute % Error Mean1b.pdf", replace









* 11 1 2 Daily deaths, provinces together, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA02XAB_Mean1b date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DDAbPeErA02XBC_Mean1b date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DDAbPeErA02XMB_Mean1b date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DDAbPeErA02XNS_Mean1b date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DDAbPeErA02XQC_Mean1b date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DDAbPeErA02XSK_Mean1b date, sort lwidth(medium) lcolor(brown)) /// 6 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, IHME, Forecast only, without extremes CAN ON", size(small)) /// 
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NS" 5 "QC" 6 "SK") rows(2) size(small))  

qui graph export "graph 11 2 2 C19 daily deaths, $country, provinces together, IHME, absolute % Error Mean1b.pdf", replace






* 11 2 3 Daily deaths, provinces together, mean over updates of median absolute % error by calendar months

twoway ///
(line DDAbPeErA02XAB_Mean1b date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DDAbPeErA02XBC_Mean1b date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DDAbPeErA02XMB_Mean1b date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DDAbPeErA02XNS_Mean1b date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DDAbPeErA02XSK_Mean1b date, sort lwidth(medium) lcolor(brown)) /// 5 "SK" orange
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
yscale(titlegap(2)) ytitle(Daily deaths error measure) ///
title("C19 daily deaths, mean over updates of median absolute % error by calendar months", size(medsmall)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("$country, provinces together, IHME, Forecast only, without extremes CAN ON QC", size(small)) /// 
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NS" 5 "SK") rows(1) size(small))  

qui graph export "graph 11 2 3 C19 daily deaths, $country, provinces together, IHME, absolute % Error Mean1b.pdf", replace







***********************************************

capture drop *2r

gen DDAbPeErA02XXX_Mean2br = round(DDAbPeErA02XXX_Mean2,0.1)
gen DDAbPeErA02XAB_Mean2br = round(DDAbPeErA02XAB_Mean2,0.1)
gen DDAbPeErA02XBC_Mean2br = round(DDAbPeErA02XBC_Mean2,0.1)
gen DDAbPeErA02XMB_Mean2br = round(DDAbPeErA02XMB_Mean2,0.1)
gen DDAbPeErA02XNS_Mean2br = round(DDAbPeErA02XNS_Mean2,0.1)
gen DDAbPeErA02XON_Mean2br = round(DDAbPeErA02XON_Mean2,0.1)
gen DDAbPeErA02XQC_Mean2br = round(DDAbPeErA02XQC_Mean2,0.1)
gen DDAbPeErA02XSK_Mean2br = round(DDAbPeErA02XSK_Mean2,0.1)

* 12 2 1 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA02XXX_Mean2br /// 1 "CAN" gray
(mean) DDAbPeErA02XAB_Mean2br /// 2 "AB" cyan
(mean) DDAbPeErA02XBC_Mean2br /// 3 "BC" blue
(mean) DDAbPeErA02XMB_Mean2br /// 4 "MB" lime
(mean) DDAbPeErA02XNS_Mean2br /// 5 "NS" magenta
(mean) DDAbPeErA02XON_Mean2br /// 6 "ON" red
(mean) DDAbPeErA02XQC_Mean2br /// 7 "QC" black
(mean) DDAbPeErA02XSK_Mean2br /// 8 "SK" orange
, bar(1, fcolor(gray) lcolor(gray)) ///
bar(2, fcolor(cyan) lcolor(cyan)) ///
bar(3, fcolor(blue) lcolor(blue)) ///
bar(4, fcolor(lime) lcolor(lime)) ///
bar(5, fcolor(magenta) lcolor(magenta)) ///
bar(6, fcolor(red) lcolor(red)) ///
bar(7, fcolor(black) lcolor(black)) ///
bar(8, fcolor(orange) lcolor(orange)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medsmall)) ///
subtitle("$country, provinces, IHME, Forecast only. MAPE: Median Absolute % Error", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 2 "AB" 3 "BC" 4 "MB" 5 "NS" 6 "ON" 7 "QC" 8 "SK") rows(2) size(small))

qui graph export "graph 12 2 1 C19 daily deaths, $country, provinces together, IHME, Average MAPE.pdf", replace







* 12 2 2 Daily deaths, provinces together, Avergae of MAPE over updates and calendar months

graph bar ///
(mean) DDAbPeErA02XAB_Mean2br /// 1 "AB" cyan
(mean) DDAbPeErA02XBC_Mean2br /// 2 "BC" blue
(mean) DDAbPeErA02XMB_Mean2br /// 3 "MB" lime
(mean) DDAbPeErA02XNS_Mean2br /// 4 "NS" magenta
(mean) DDAbPeErA02XON_Mean2br /// 5 "ON" red
(mean) DDAbPeErA02XQC_Mean2br /// 6 "QC" black
(mean) DDAbPeErA02XSK_Mean2br /// 7 "SK" orange
, bar(1, fcolor(cyan) lcolor(cyan)) ///
bar(2, fcolor(blue) lcolor(blue)) ///
bar(3, fcolor(lime) lcolor(lime)) ///
bar(4, fcolor(magenta) lcolor(magenta)) ///
bar(5, fcolor(red) lcolor(red)) ///
bar(6, fcolor(black) lcolor(black)) ///
bar(7, fcolor(orange) lcolor(orange)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and calendar months", size(medsmall)) ///
subtitle("$country, provinces, IHME, Forecast only. MAPE: Median Absolute % Error" ///
"without extremes CAN", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NS" 5 "ON" 6 "QC" 7 "SK") rows(2) size(small))

qui graph export "graph 12 2 2 C19 daily deaths, $country, provinces together, IHME, Average MAPE.pdf", replace




*

save "CovidLongitudinal IHME 5", replace








**************************************************

* time intervals (weekly and monthly) together



* add weekly to monthly


use "CovidLongitudinal IHME 5", clear // monthly

append using "CovidLongitudinal IHME 4.dta" // weekly

save "CovidLongitudinal IHME 6.dta", replace




capture drop *2r

gen DDAbPeErA02XXX_Mean2r = round(DDAbPeErA02XXX_Mean2,0.1)
gen DDAbPeErA02XAB_Mean2r = round(DDAbPeErA02XAB_Mean2,0.1)
gen DDAbPeErA02XBC_Mean2r = round(DDAbPeErA02XBC_Mean2,0.1)
gen DDAbPeErA02XMB_Mean2r = round(DDAbPeErA02XMB_Mean2,0.1)
gen DDAbPeErA02XNS_Mean2r = round(DDAbPeErA02XNS_Mean2,0.1)
gen DDAbPeErA02XON_Mean2r = round(DDAbPeErA02XON_Mean2,0.1)
gen DDAbPeErA02XQC_Mean2r = round(DDAbPeErA02XQC_Mean2,0.1)
gen DDAbPeErA02XSK_Mean2r = round(DDAbPeErA02XSK_Mean2,0.1)



* 13 1 Daily deaths, provinces together, Avergae of MAPE over updates 
* and epi weeks or calendar months

graph bar ///
(mean) DDAbPeErA02XXX_Mean2br /// 	1 "CAN" gray monthly
(mean) DDAbPeErA02XXX_Mean2r ///  	2 "CAN" gray weekly
(mean) DDAbPeErA02XAB_Mean2br /// 	3 "AB" cyan monthly
(mean) DDAbPeErA02XAB_Mean2r ///  	4 "AB" cyan weekly
(mean) DDAbPeErA02XBC_Mean2br /// 	5 "BC" blue monthly
(mean) DDAbPeErA02XBC_Mean2r ///  	6 "BC" blue weekly
(mean) DDAbPeErA02XMB_Mean2br /// 	7 "MB" lime monthly
(mean) DDAbPeErA02XMB_Mean2r ///  	8 "MB" lime weekly
(mean) DDAbPeErA02XNS_Mean2br ///	9 "NS" magenta monthly
(mean) DDAbPeErA02XNS_Mean2r /// 	10 "NS" magenta weekly
(mean) DDAbPeErA02XON_Mean2br ///	11 "ON" red monthly
(mean) DDAbPeErA02XON_Mean2r /// 	12 "ON" red weekly
(mean) DDAbPeErA02XQC_Mean2br ///	13 "QC" black monthly
(mean) DDAbPeErA02XQC_Mean2r /// 	14 "QC" black weekly
(mean) DDAbPeErA02XSK_Mean2br ///	15 "SK" orange monthly
(mean) DDAbPeErA02XSK_Mean2r /// 	16 "SK" orange weekly
, bar(1, fcolor(gray) lcolor(white)) ///			1 "CAN" gray monthly
bar(2, fcolor(gray*0.3) lcolor(white)) ///  		2 "CAN" gray weekly
bar(3, fcolor(cyan) lcolor(white)) ///				3 "AB" cyan monthly
bar(4, fcolor(cyan*0.3) lcolor(white)) ///			4 "AB" cyan weekly
bar(5, fcolor(blue) lcolor(white)) ///				5 "BC" blue monthly
bar(6, fcolor(blue*0.5) lcolor(white)) ///			6 "BC" blue weekly
bar(7, fcolor(lime) lcolor(white)) ///				7 "MB" lime monthly
bar(8, fcolor(lime*0.3) lcolor(white)) ///			8 "MB" lime weekly
bar(9, fcolor(magenta) lcolor(white)) ///			9 "NS" magenta monthly
bar(10, fcolor(magenta*0.3) lcolor(white)) ///		10 "NS" magenta weekly
bar(11, fcolor(red) lcolor(white)) ///				11 "ON" red monthly
bar(12, fcolor(red*0.3) lcolor(white)) ///			12 "ON" red weekly
bar(13, fcolor(black) lcolor(white)) ///			13 "QC" black monthly
bar(14, fcolor(black*0.3) lcolor(white)) ///		14 "QC" black weekly
bar(15, fcolor(orange) lcolor(white)) ///			15 "SK" orange monthly
bar(16, fcolor(orange*0.3) lcolor(white)) ///		16 "SK" orange weekly
ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and time intervals", size(medsmall)) ///
subtitle("$country, provinces, IHME, Forecast only. MAPE: Median Absolute % Error", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "CAN" 3 "AB" 5 "BC" 7 "MB" 9 "NS" 11 "ON" 13 "QC" 15 "SK") rows(2) size(small)) ///
note("Time intervals: Darker left bars show monthly. Paler right bars show weekly.", size(small))

qui graph export "graph 13 1 C19 daily deaths, $country, provinces together, IHME, Average MAPE.pdf", replace







* 13 2 Daily deaths, provinces together, Avergae of MAPE over updates 
* and epi weeks or calendar months, without extremes CAN

graph bar ///
(mean) DDAbPeErA02XAB_Mean2br /// 	1 "AB" cyan monthly
(mean) DDAbPeErA02XAB_Mean2r ///  	2 "AB" cyan weekly
(mean) DDAbPeErA02XBC_Mean2br /// 	3 "BC" blue monthly
(mean) DDAbPeErA02XBC_Mean2r ///  	4 "BC" blue weekly
(mean) DDAbPeErA02XMB_Mean2br /// 	5 "MB" lime monthly
(mean) DDAbPeErA02XMB_Mean2r ///  	6 "MB" lime weekly
(mean) DDAbPeErA02XNS_Mean2br ///	7 "NS" magenta monthly
(mean) DDAbPeErA02XNS_Mean2r /// 	8 "NS" magenta weekly
(mean) DDAbPeErA02XON_Mean2br ///	9 "ON" red monthly
(mean) DDAbPeErA02XON_Mean2r /// 	10 "ON" red weekly
(mean) DDAbPeErA02XQC_Mean2br ///	11 "QC" black monthly
(mean) DDAbPeErA02XQC_Mean2r /// 	12 "QC" black weekly
(mean) DDAbPeErA02XSK_Mean2br ///	13 "SK" orange monthly
(mean) DDAbPeErA02XSK_Mean2r /// 	14 "SK" orange weekly
, bar(1, fcolor(cyan) lcolor(white)) ///			1 "AB" cyan monthly
bar(2, fcolor(cyan*0.3) lcolor(white)) ///			2 "AB" cyan weekly
bar(3, fcolor(blue) lcolor(white)) ///				3 "BC" blue monthly
bar(4, fcolor(blue*0.5) lcolor(white)) ///			4 "BC" blue weekly
bar(5, fcolor(lime) lcolor(white)) ///				5 "MB" lime monthly
bar(6, fcolor(lime*0.3) lcolor(white)) ///			6 "MB" lime weekly
bar(7, fcolor(magenta) lcolor(white)) ///			7 "NS" magenta monthly
bar(8, fcolor(magenta*0.3) lcolor(white)) ///		8 "NS" magenta weekly
bar(9, fcolor(red) lcolor(white)) ///				9 "ON" red monthly
bar(10, fcolor(red*0.3) lcolor(white)) ///			10 "ON" red weekly
bar(11, fcolor(black) lcolor(white)) ///			11 "QC" black monthly
bar(12, fcolor(black*0.3) lcolor(white)) ///		12 "QC" black weekly
bar(13, fcolor(orange) lcolor(white)) ///			13 "SK" orange monthly
bar(14, fcolor(orange*0.3) lcolor(white)) ///		14 "SK" orange weekly
ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average MAPE over updates and time intervals", size(medsmall)) ///
subtitle("$country, provinces, IHME, Forecast only. MAPE: Median Absolute % Error" ///
"without extremes CAN", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 3 "BC" 5 "MB" 7 "NS" 9 "ON" 11 "QC" 13 "SK") rows(2) size(small)) ///
note("Time intervals: Darker left bars show monthly. Paler right bars show weekly.", size(small))


qui graph export "graph 13 2 C19 daily deaths, $country, provinces together, IHME, Average MAPE.pdf", replace










**********************

view "log CovidLongitudinal IHME 1b.smcl"

log close

exit, clear
