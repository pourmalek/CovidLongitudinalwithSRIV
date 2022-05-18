
clear all

cd "$pathCovidLongitudinal"

cd Model

capture log close 

log using "log CovidLongitudinal Model 1.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal Model 1.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* input data

clear

set obs 100

gen date = _n


gen Reference = 100 + (date * 10)

gen Model_A = 800 - (date * 4)

gen Model_B = 400 - (date * 6)





*********************

/*


CALCULATIONS:

Error = minus (Reference minus Model) 

Absolute error = | minus (Reference minus Model) |

Percent error = 100 * (minus (Reference minus Model)) / Reference

Absolute percent error = 100 * | minus (Reference minus Model) | / Reference

Non-negative percent error = (100 * (minus (Reference minus Model)) / Reference) + | mimimum (100 * (minus (Reference minus Model)) / Reference) |




Error = - (Reference - Model)

Absolute error = | - (Reference - Model) |

Percent error = 100 * (- (Reference - Model)) / Reference

Absolute percent error = 100 * | - (Reference - Model)| / Reference

Non-negative percent error = (100 * (- (Reference - Model)) / Reference) + | min (100 * (- (Reference - Model)) / Reference) |

*/




gen Error_Model_A = - (Reference - Model_A)

gen AbsErr_Model_A = abs(- (Reference - Model_A))

gen PerErr_Model_A = 100 * (- (Reference - Model_A)) / Reference

gen AbPeEr_Model_A = 100 * abs(- (Reference - Model_A)) / Reference


sum PerErr_Model_A

gen PerErr_Model_A_min = r(min)

gen PerErr_Model_A_min_abs = abs(PerErr_Model_A_min)

gen Nonnegative_PerErr_Model_A = PerErr_Model_A + PerErr_Model_A_min_abs



gen Error_Model_B = - (Reference - Model_B)

gen AbsErr_Model_B = abs(- (Reference - Model_B))

gen PerErr_Model_B = 100 * (- (Reference - Model_B)) / Reference

gen AbPeEr_Model_B = 100 * abs(- (Reference - Model_B)) / Reference


sum PerErr_Model_B

gen PerErr_Model_B_min = r(min)

gen PerErr_Model_B_min_abs = abs(PerErr_Model_B_min)

gen Nonnegative_PerErr_Model_B = PerErr_Model_B + PerErr_Model_B_min_abs




***************

* graphs

grstyle init

grstyle color background white




* Model A


* Reference and Model 

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A") size(small) row(1)) 

qui graph export "graph 1 C19 daily deaths, Model_A.pdf", replace



* Error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
(line Error_Model_A date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A" 3 "Error") size(small) row(1)) 

qui graph export "graph 2 C19 daily deaths Error, Model_A.pdf", replace



* Absolute error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
(line AbsErr_Model_A date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A" 3 "Absolute error") size(small) row(1)) 

qui graph export "graph 3 C19 daily deaths absolute error, Model_A.pdf", replace



* Percent error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
(line PerErr_Model_A date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A" 3 "Percent error") size(small) row(1)) 

qui graph export "graph 4 C19 daily deaths percent error, Model_A.pdf", replace



* Absolute percent error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
(line AbPeEr_Model_A date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A" 3 "Absolute percent error") size(small) row(1)) 

qui graph export "graph 5 C19 daily deaths absolute percent error, Model_A.pdf", replace



* Non-negative percent error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
(line Nonnegative_PerErr_Model_A date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths non-negative percent error, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A" 3 "Non-negative percent error") size(small) row(1)) 

qui graph export "graph 6 C19 daily deaths non-negative percent error, Model_A.pdf", replace



* Error types together

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_A date, sort lcolor(red) lwidth(thick)) /// 
(line Error_Model_A date, sort lcolor(gold) lwidth(vthick) lpattern(tight_dot)) /// 
(line AbsErr_Model_A date, sort lcolor(orange) lwidth(medium)) /// 
(line PerErr_Model_A date, sort lcolor(green) lwidth(medium) lwidth(vthick) lpattern(tight_dot)) /// 
(line AbPeEr_Model_A date, sort lcolor(blue)) /// 
(line Nonnegative_PerErr_Model_A date, sort lcolor(brown)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error types, Model A", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model A" 3 "Error" 4 "Absolute error" 5 "Percent error" ///
6 "Absolute percent error" 7 "Non-negative percent error") size(small) row(3)) 

qui graph export "graph 7 C19 daily deaths error types, Model_A.pdf", replace









* Model B


* Reference and Model 

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B") size(small) row(1)) 

qui graph export "graph 1 C19 daily deaths, Model_B.pdf", replace



* Error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
(line Error_Model_B date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B" 3 "Error") size(small) row(1)) 

qui graph export "graph 2 C19 daily deaths Error, Model_B.pdf", replace



* Absolute error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
(line AbsErr_Model_B date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute error, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B" 3 "Absolute error") size(small) row(1)) 

qui graph export "graph 3 C19 daily deaths absolute error, Model_B.pdf", replace



* Non-negative error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
(line PerErr_Model_B date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent error, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B" 3 "Percent error") size(small) row(1)) 

qui graph export "graph 4 C19 daily deaths percent error, Model_B.pdf", replace



* Absolute percent error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
(line AbPeEr_Model_B date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent error, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B" 3 "Absolute percent error") size(small) row(1)) 

qui graph export "graph 5 C19 daily deaths absolute percent error, Model_B.pdf", replace



* Non-negative percent error

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
(line Nonnegative_PerErr_Model_B date, sort lcolor(black) lwidth(medium)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths non-negative percent error, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B" 3 "Non-negative percent error") size(small) row(1)) 

qui graph export "graph 6 C19 daily deaths non-negative percent error, Model_B.pdf", replace



* Error types together

twoway ///
(line Reference date, sort lcolor(cyan) lwidth(thick)) /// 
(line Model_B date, sort lcolor(red) lwidth(thick)) /// 
(line Error_Model_B date, sort lcolor(gold) lwidth(vthick) lpattern(tight_dot)) /// 
(line AbsErr_Model_B date, sort lcolor(orange) lwidth(medium)) /// 
(line PerErr_Model_B date, sort lcolor(green) lwidth(medium) lwidth(vthick) lpattern(tight_dot)) /// 
(line AbPeEr_Model_B date, sort lcolor(blue)) /// 
(line Nonnegative_PerErr_Model_B date, sort lcolor(brown)) /// 
, xtitle(Date) xlabel(#25, labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths error types, Model B", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Model B" 3 "Error" 4 "Absolute error" 5 "Percent error" ///
6 "Absolute percent error" 7 "non-negative percent error") size(small) row(3)) 

qui graph export "graph 7 C19 daily deaths error types, Model_B.pdf", replace








view "log CovidLongitudinal Model 1.smcl"

log close

exit, clear
