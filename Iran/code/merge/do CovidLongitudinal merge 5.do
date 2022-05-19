
clear all

cd "$pathCovidLongitudinal"

cd merge

capture log close 

log using "log CovidLongitudinal merge 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal merge 5.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* graph error types and models together
* "graph 12 a C19 daily deaths, $country, average of error measures - error types, models"
* "graph 12 b C19 daily deaths, $country, average of error measures - models, error types"



use "CovidLongitudinal merge 2.dta", clear 


keep *Mean2r

keep in 1 


* get equal-length varnames 
rename ///
(DDErrorA01_Mean2r DDErrorA02_Mean2r DDErrorA03_Mean2r DDErrorA04_Mean2r DDErrorA05_Mean2r) ///
(DDErrorrA01_Mean2r DDErrorrA02_Mean2r DDErrorrA03_Mean2r DDErrorrA04_Mean2r DDErrorrA05_Mean2r) 





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


renvars *, postdrop(7)

save "CovidLongitudinal merge temp.dta", replace 


gen i = _n

reshape long DDErrorr DDAbsErr DDPerErr DDAbPeEr, i(i) j(A, string)

rename A model

drop i

replace model = "DELP" if model == "A01"
replace model = "IHME" if model == "A02"
replace model = "IMPE" if model == "A03"
replace model = "LANL" if model == "A04"
replace model = "SRIV" if model == "A05"


graph bar DDErrorr DDAbsErr DDPerErr DDAbPeEr, over(model) ///
bar(1, fcolor(stone) lcolor(stone)) ///
bar(2, fcolor(sand) lcolor(sand)) ///
bar(3, fcolor(ltblue) lcolor(ltblue)) ///
bar(4, fcolor(ebblue) lcolor(ebblue)) ///
blabel(bar) ytitle("Error measure") yscale(titlegap(2)) ///
title("C19 daily deaths average of error measures", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; $country", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Error" 2 "Absolute error" 3 "Percent error" 4 "Absolute percent error" ) size(small) row(1)) 

qui graph export "graph 12 a C19 daily deaths, $country, average of error measures - error types, models.pdf", replace

*



use "CovidLongitudinal merge temp.dta", clear 

gen i = _n

rename (DDErrorrA01 DDErrorrA02 DDErrorrA03 DDErrorrA04 DDErrorrA05) ///
       (DDA1E1 DDA2E1 DDA3E1 DDA4E1 DDA5E1) 
	   
rename (DDAbsErrA01 DDAbsErrA02 DDAbsErrA03 DDAbsErrA04 DDAbsErrA05) ///
       (DDA1E2 DDA2E2 DDA3E2 DDA4E2 DDA5E2) 
	   
rename (DDPerErrA01 DDPerErrA02 DDPerErrA03 DDPerErrA04 DDPerErrA05) ///
       (DDA1E3 DDA2E3 DDA3E3 DDA4E3 DDA5E3) 	   

rename (DDAbPeErA01 DDAbPeErA02 DDAbPeErA03 DDAbPeErA04 DDAbPeErA05) ///
       (DDA1E4 DDA2E4 DDA3E4 DDA4E4 DDA5E4) 
	   
reshape long DDA1 DDA2 DDA3 DDA4 DDA5, i(i) j(E, string)

gen type = .
replace type = 1 if E == "E1"
replace type = 2 if E == "E2"
replace type = 3 if E == "E3"
replace type = 4 if E == "E4"

label define type 1 "Error" 2 "Absolute Error" 3 "Percent Error" 4 "Absolute % Error"
label values type type




graph bar DDA1 DDA2 DDA3 DDA4 DDA5, over(type) ///
bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar) ytitle("Error measure") yscale(titlegap(2)) ///
title("C19 daily deaths average of error measures", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; $country", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 12 b C19 daily deaths, $country, average of error measures - models, error types.pdf", replace







*

qui compress

save "CovidLongitudinal merge 3.dta", replace 




view "log CovidLongitudinal merge 5.smcl"

log close

exit, clear
