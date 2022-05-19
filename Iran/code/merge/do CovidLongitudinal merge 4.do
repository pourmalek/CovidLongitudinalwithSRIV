
clear all

cd "$pathCovidLongitudinal"

cd merge

capture log close 

log using "log CovidLongitudinal merge 4.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal merge 4.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************




* graphs for four error types (graphs 3 to 11), updates together

* graph 3 Error
* graph 4 Absolute Error
* graph 5 Percent Error
* graph 6 Absolute Percent Error

* graph 7 mean over updates of median error by calendar months
* graph 8 Daily deaths, mean over updates of median absolute error by calendar months
* graph 9 Daily deaths, mean over updates of median % error by calendar months
* graph 10 a Daily deaths, mean over updates of median absolute % error by calendar months
* graph 10 b Daily deaths, mean over updates of median absolute % error by calendar months smooth
* (7, 8, 9, 10) (a, b); a = not smoothed, b = smoothed for better viewing

* graph 11 a Daily deaths, Avergae of Mean Error over updates and calendar months
* graph 11 b Daily deaths, Avergae of Mean Absolute Error over updates and calendar months
* graph 11 c Daily deaths, Avergae of Mean Percent Error over updates and calendar months
* graph 11 d Daily deaths, Avergae of Mean Absolute Percent Error over updates and calendar months

* input data files: "CovidLongitudinal merge.dta"
* output data files: "CovidLongitudinal merge 2.dta"






use "CovidLongitudinal merge.dta", clear 



/*


CALCULATIONS:

Error = minus (Reference minus Model) 

Absolute error = | minus (Reference minus Model) |

Percent error = 100 * (minus (Reference minus Model)) / Reference

Absolute percent error = 100 * | minus (Reference minus Model) | / Reference




Error = - (Reference - Model)

Absolute error = | - (Reference - Model) |

Percent error = 100 * (- (Reference - Model)) / Reference

Absolute percent error = 100 * | - (Reference - Model)| / Reference

*/






******
* graph 3 Daily deaths, Error

twoway ///
(line DDErrorA0120200417 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0120200424 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200426 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0420200429 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0120200501 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200506 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200509 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200510 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200513 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200517 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200517 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200520 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200524 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200524 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200527 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200531 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200531 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200603 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200607 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200607 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200610 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200614 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200617 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200621 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200621 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200623 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200625 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200626 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200628 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0420200628 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200628 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200629 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200701 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200701 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200702 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200704 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200705 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200708 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200712 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200715 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200718 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200719 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200722 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200723 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200726 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200729 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200801 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200802 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200802 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200803 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200804 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200805 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200805 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200806 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200807 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200809 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200812 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200812 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200815 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200816 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200819 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200823 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200826 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200829 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200830 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200902 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200906 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200909 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200912 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200913 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200916 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200920 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420200923 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520200924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520200925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120200926 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520200926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200927 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520200929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420200930 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520200930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201004 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201007 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201008 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520201008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201011 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201014 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201018 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201018 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201019 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201020 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201021 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201021 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201022 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201022 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201023 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420201025 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420201028 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420201101 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201104 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201105 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520201105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201108 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201111 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201115 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420201118 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201122 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201125 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420201129 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201202 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201203 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201206 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201209 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201213 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420201216 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201217 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520201217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420201220 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0420201223 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520201223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520201226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201229 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520201230 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120201231 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520201231 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210103 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210105 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210110 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210113 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210114 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210117 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210120 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210124 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210127 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210128 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210131 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210131 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210203 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210207 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210210 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210211 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210214 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210217 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210221 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210224 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210225 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210228 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210228 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210301 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210302 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210303 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210303 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210304 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210305 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210306 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210307 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210307 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210308 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210309 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210310 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210310 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210311 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210311 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210312 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210313 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210314 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210314 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210315 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210316 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210317 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210318 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210319 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210320 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210321 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210321 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210322 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210323 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210324 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210324 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210325 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210325 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210326 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210327 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210328 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210328 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210329 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210330 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210331 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210331 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210401 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210402 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210403 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210404 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210404 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210405 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210406 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210407 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210407 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210408 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210408 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210409 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210410 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210411 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210411 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210412 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210413 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210414 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210414 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210415 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210416 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210417 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210418 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210418 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210419 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210420 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210421 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210421 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210422 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210422 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210423 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210424 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210425 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210425 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210426 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210427 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210428 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210428 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210429 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210430 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210501 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210502 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210505 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210506 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210509 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210512 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210516 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210519 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210520 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210523 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210526 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210602 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210603 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210606 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210610 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210617 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210620 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210624 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210627 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210701 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210704 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210708 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210711 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210715 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210718 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210722 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210725 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210729 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210801 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210805 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0420210808 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210812 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520210813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210815 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210819 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210822 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210826 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210829 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210902 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210905 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210909 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210912 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210916 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0420210919 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDErrorA0520210919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210923 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520210924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520210929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120210930 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520210930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211005 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211007 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211014 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520211015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211021 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211028 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211104 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0220211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0520211104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211111 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211118 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211125 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211202 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211209 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211216 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0520211216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0220211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDErrorA0120211223 date, sort lwidth(thin) lcolor(red)) /// 
(line DDErrorA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDErrorA0520211226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0520211227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDErrorA0120211230 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths errors, all models", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("$country, all updates, forecast only", size(small)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 86 "IHME" 67 "IMPE" 3 "LANL" 6 "SRIV") size(small) row(1)) 

qui graph export "graph 3 C19 daily deaths error, $country, all updates.pdf", replace








******
* graph 4 Daily deaths, Absolute Error

twoway ///
(line DDAbsErrA0120200417 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0120200424 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200426 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0420200429 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0120200501 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200506 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200509 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200510 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200513 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200517 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200517 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200520 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200524 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200524 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200527 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200531 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200531 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200603 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200607 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200607 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200610 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200614 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200617 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200621 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200621 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200623 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200625 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200626 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200628 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0420200628 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200628 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200629 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200701 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200701 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200702 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200704 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200705 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200708 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200712 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200715 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200718 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200719 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200722 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200723 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200726 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200729 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200801 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200802 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200802 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200803 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200804 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200805 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200805 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200806 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200807 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200809 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200812 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200812 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200815 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200816 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200819 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200823 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200826 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200829 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200830 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200902 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200906 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200909 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200912 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200913 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200916 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200920 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420200923 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520200924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520200925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120200926 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520200926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200927 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520200929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420200930 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520200930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201004 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201007 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201008 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520201008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201011 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201014 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201018 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201018 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201019 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201020 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201021 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201021 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201022 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201022 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201023 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420201025 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420201028 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420201101 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201104 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201105 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520201105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201108 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201111 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201115 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420201118 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201122 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201125 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420201129 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201202 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201203 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201206 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201209 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201213 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420201216 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201217 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520201217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420201220 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0420201223 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520201223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520201226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201229 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520201230 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120201231 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520201231 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210103 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210105 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210110 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210113 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210114 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210117 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210120 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210124 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210127 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210128 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210131 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210131 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210203 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210207 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210210 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210211 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210214 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210217 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210221 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210224 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210225 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210228 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210228 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210301 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210302 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210303 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210303 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210304 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210305 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210306 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210307 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210307 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210308 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210309 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210310 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210310 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210311 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210311 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210312 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210313 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210314 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210314 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210315 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210316 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210317 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210318 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210319 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210320 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210321 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210321 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210322 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210323 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210324 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210324 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210325 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210325 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210326 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210327 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210328 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210328 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210329 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210330 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210331 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210331 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210401 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210402 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210403 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210404 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210404 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210405 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210406 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210407 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210407 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210408 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210408 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210409 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210410 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210411 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210411 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210412 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210413 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210414 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210414 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210415 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210416 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210417 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210418 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210418 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210419 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210420 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210421 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210421 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210422 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210422 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210423 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210424 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210425 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210425 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210426 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210427 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210428 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210428 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210429 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210430 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210501 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210502 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210505 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210506 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210509 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210512 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210516 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210519 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210520 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210523 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210526 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210602 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210603 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210606 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210610 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210617 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210620 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210624 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210627 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210701 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210704 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210708 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210711 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210715 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210718 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210722 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210725 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210729 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210801 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210805 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0420210808 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210812 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520210813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210815 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210819 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210822 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210826 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210829 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210902 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210905 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210909 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210912 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210916 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0420210919 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbsErrA0520210919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210923 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520210924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520210929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120210930 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520210930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211005 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211007 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211014 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520211015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211021 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211028 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211104 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0220211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0520211104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211111 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211118 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211125 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211202 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211209 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211216 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0520211216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0220211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbsErrA0120211223 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbsErrA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbsErrA0520211226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0520211227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbsErrA0120211230 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("$country, all updates, forecast only", size(small)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 86 "IHME" 67 "IMPE" 3 "LANL" 6 "SRIV") size(small) row(1)) 

qui graph export "graph 4 C19 daily deaths absolute error, $country, all updates.pdf", replace








******
* graph 5 Daily deaths, % Error

twoway ///
(line DDPerErrA0120200417 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0120200424 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200426 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0420200429 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0120200501 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200506 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200509 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200510 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200513 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200517 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200517 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200520 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200524 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200524 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200527 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200531 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200531 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200603 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200607 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200607 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200610 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200614 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200617 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200621 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200621 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200623 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200625 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200626 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200628 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0420200628 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200628 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200629 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200701 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200701 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200702 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200704 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200705 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200708 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200712 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200715 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200718 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200719 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200722 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200723 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200726 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200729 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200801 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200802 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200802 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200803 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200804 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200805 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200805 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200806 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200807 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200809 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200812 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200812 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200815 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200816 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200819 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200823 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200826 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200829 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200830 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200902 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200906 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200909 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200912 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200913 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200916 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200920 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420200923 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520200924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520200925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120200926 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520200926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200927 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520200929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420200930 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520200930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201004 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201007 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201008 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520201008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201011 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201014 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201018 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201018 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201019 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201020 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201021 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201021 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201022 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201022 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201023 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420201025 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420201028 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420201101 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201104 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201105 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520201105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201108 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201111 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201115 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420201118 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201122 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201125 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420201129 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201202 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201203 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201206 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201209 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201213 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420201216 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201217 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520201217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420201220 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0420201223 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520201223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520201226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201229 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520201230 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120201231 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520201231 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210103 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210105 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210110 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210113 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210114 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210117 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210120 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210124 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210127 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210128 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210131 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210131 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210203 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210207 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210210 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210211 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210214 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210217 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210221 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210224 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210225 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210228 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210228 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210301 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210302 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210303 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210303 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210304 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210305 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210306 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210307 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210307 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210308 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210309 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210310 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210310 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210311 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210311 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210312 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210313 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210314 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210314 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210315 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210316 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210317 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210318 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210319 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210320 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210321 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210321 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210322 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210323 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210324 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210324 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210325 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210325 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210326 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210327 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210328 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210328 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210329 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210330 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210331 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210331 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210401 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210402 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210403 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210404 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210404 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210405 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210406 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210407 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210407 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210408 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210408 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210409 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210410 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210411 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210411 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210412 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210413 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210414 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210414 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210415 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210416 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210417 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210418 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210418 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210419 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210420 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210421 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210421 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210422 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210422 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210423 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210424 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210425 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210425 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210426 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210427 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210428 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210428 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210429 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210430 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210501 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210502 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210505 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210506 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210509 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210512 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210516 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210519 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210520 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210523 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210526 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210602 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210603 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210606 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210610 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210617 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210620 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210624 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210627 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210701 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210704 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210708 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210711 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210715 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210718 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210722 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210725 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210729 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210801 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210805 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0420210808 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210812 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520210813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210815 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210819 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210822 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210826 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210829 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210902 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210905 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210909 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210912 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210916 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0420210919 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDPerErrA0520210919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210923 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520210924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520210929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120210930 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520210930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211005 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211007 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211014 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520211015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211021 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211028 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211104 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0220211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0520211104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211111 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211118 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211125 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211202 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211209 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211216 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0520211216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0220211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDPerErrA0120211223 date, sort lwidth(thin) lcolor(red)) /// 
(line DDPerErrA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDPerErrA0520211226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0520211227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDPerErrA0120211230 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("$country, all updates, forecast only", size(small)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 86 "IHME" 67 "IMPE" 3 "LANL" 6 "SRIV") size(small) row(1)) 

qui graph export "graph 5 C19 daily deaths % error, $country, all updates.pdf", replace








******
* graph 6 Daily deaths, Absolute % Error

twoway ///
(line DDAbPeErA0120200417 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0120200424 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200426 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0420200429 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0120200501 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200506 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200509 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200510 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200513 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200517 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200517 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200520 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200524 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200524 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200527 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200531 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200531 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200603 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200607 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200607 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200610 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200614 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320200614 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200616 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200617 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200619 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200621 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200621 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200623 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200623 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200625 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200626 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200628 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0420200628 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200628 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200629 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200629 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200701 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200701 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200702 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200703 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200704 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320200704 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200705 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200707 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320200707 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200708 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200711 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200712 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200714 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320200714 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200715 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200715 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200718 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320200718 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200719 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200720 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200722 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320200722 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200722 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200723 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200725 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200726 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200727 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200729 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200731 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200801 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200802 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200802 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200803 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200804 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200805 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200805 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200806 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200807 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200808 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200809 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200810 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200811 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200812 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200812 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200813 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200814 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200815 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200816 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200817 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200819 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200821 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200823 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200823 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200826 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200827 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320200827 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200829 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200830 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200831 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200902 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200902 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200903 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200906 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200906 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200908 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200909 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200911 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200912 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320200912 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200913 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200915 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200916 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200918 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200919 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200920 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200923 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420200923 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220200924 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520200924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320200925 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520200925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120200926 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520200926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200927 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520200929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420200930 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520200930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201002 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201003 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201004 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201007 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201008 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520201008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201009 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201011 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201012 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201014 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201018 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201018 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201019 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201019 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201020 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201021 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201021 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201022 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220201022 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201022 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201023 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201025 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420201025 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201028 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420201028 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201029 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201101 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420201101 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201104 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201105 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520201105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201108 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201111 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201112 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201114 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201115 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420201118 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0120201119 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220201119 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201122 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201123 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201125 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420201129 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201202 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201203 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220201203 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201204 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201206 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201209 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201210 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201212 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201213 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420201216 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201217 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220201217 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520201217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201220 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420201220 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220201223 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0420201223 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520201223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320201226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520201226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201229 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520201230 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120201231 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520201231 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210103 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210105 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210110 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210110 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210112 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210113 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210113 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210114 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210115 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210117 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210118 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210120 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210122 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210123 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210124 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210124 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210125 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210127 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210128 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210128 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210130 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210131 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210131 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210203 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210203 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210204 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210204 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210206 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210207 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210210 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210210 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210211 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210212 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210214 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210217 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210217 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210220 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210220 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210221 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210221 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210222 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210223 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210224 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210224 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210225 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210225 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210225 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210228 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210228 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210301 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210302 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210303 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210303 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210304 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210305 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210305 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210306 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210306 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210307 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210307 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210308 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210309 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210310 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210310 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210311 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210311 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210311 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210312 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210312 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210313 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210314 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210314 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210315 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210316 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210317 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210317 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210318 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210319 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210319 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210320 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210321 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210321 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210322 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210323 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210324 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210324 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210325 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210325 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210325 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210326 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210327 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210328 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210328 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210329 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210329 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210330 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210331 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210331 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210401 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210401 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210402 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210403 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210404 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210404 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210405 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210406 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210406 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210407 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210407 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210408 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210408 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210409 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210409 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210410 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210411 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210411 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210412 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210413 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210414 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210414 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210415 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210416 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210416 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210417 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210417 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210418 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210418 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210419 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210420 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210421 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210421 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210422 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210422 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210423 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210423 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210424 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210424 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210425 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210425 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210426 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210427 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210428 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210428 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210429 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210430 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210501 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210502 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210502 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210503 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210504 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210505 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210505 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210506 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210506 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210506 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210507 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210508 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210509 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210509 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210510 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210510 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210511 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210512 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210512 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210513 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210514 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210514 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210515 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210516 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210516 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210516 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210517 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210518 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210519 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210519 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210520 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210520 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210521 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210521 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210522 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210522 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210523 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210523 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210524 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210525 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210526 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210526 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210527 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210527 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210528 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210528 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210529 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210530 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210531 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210601 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210602 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210602 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210603 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210603 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210604 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320210604 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210604 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210605 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210606 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210606 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210607 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210608 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210609 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210610 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210610 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210610 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210611 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210611 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210612 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210613 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210613 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210614 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210615 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210616 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210617 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210617 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210618 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320210618 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210618 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210619 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210620 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210620 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210621 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210622 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210623 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210624 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210624 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210625 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320210626 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210627 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210627 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210630 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210701 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210702 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320210702 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210703 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210704 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210704 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210705 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210706 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210707 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210708 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210708 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210709 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210709 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210710 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210711 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210711 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210712 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210713 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210714 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210715 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210715 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210715 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210716 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210717 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210718 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210718 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210719 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210719 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210720 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210721 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210722 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210722 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210723 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210723 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210724 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210725 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210725 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210726 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210727 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210728 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210729 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210729 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210730 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210730 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210731 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210801 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210801 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210805 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210806 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320210806 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0420210808 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210808 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210809 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210810 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210811 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210812 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520210813 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210814 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210815 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210815 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210816 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210817 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210818 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210819 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320210819 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210819 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210820 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210820 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210821 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210822 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210822 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210823 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210824 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210825 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210825 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210826 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210826 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210826 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210827 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210828 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210829 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210829 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210830 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210831 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210901 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210902 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210902 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210902 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210903 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210904 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210905 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210905 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210906 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210907 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210908 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210909 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320210909 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210909 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220210910 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210910 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210911 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210912 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210912 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210913 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210914 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210915 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210916 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210916 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210916 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210917 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210918 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0420210919 date, sort lwidth(thin) lcolor(brown)) /// 
(line DDAbPeErA0520210919 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210920 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210921 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210922 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210923 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210923 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210923 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320210924 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520210924 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210925 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210926 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210927 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210928 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520210929 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120210930 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220210930 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520210930 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211001 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211002 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211003 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211004 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211005 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211006 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211006 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211007 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211007 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211008 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211009 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211010 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211011 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211012 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211013 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211014 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211014 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220211015 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520211015 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211016 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211017 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211021 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220211021 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0320211021 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211024 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211025 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211026 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211027 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211027 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211028 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211028 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211029 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211030 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211031 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211101 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211102 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211103 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211103 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211104 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0220211104 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0520211104 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211105 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211106 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211107 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211108 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211109 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211110 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211111 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211111 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211112 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211114 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211115 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211115 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211116 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211117 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211118 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211118 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211119 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211120 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211121 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211121 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211122 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211124 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211125 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211126 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211127 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211128 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211129 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211129 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211130 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211201 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211202 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211202 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211203 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211205 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211205 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211207 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211208 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211209 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211209 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211210 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211211 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211212 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0320211213 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211213 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211214 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211215 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211216 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0520211216 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211217 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211218 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211219 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0220211221 date, sort lwidth(thin) lcolor(black)) ///
(line DDAbPeErA0120211223 date, sort lwidth(thin) lcolor(red)) /// 
(line DDAbPeErA0320211226 date, sort lwidth(thin) lcolor(magenta)) ///
(line DDAbPeErA0520211226 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0520211227 date, sort lwidth(thin) lcolor(green)) /// 
(line DDAbPeErA0120211230 date, sort lwidth(thin) lcolor(red)) ///
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths absolute percent errors", size(medium) color(black)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
subtitle("$country, all updates, forecast only", size(small)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 86 "IHME" 67 "IMPE" 3 "LANL" 6 "SRIV") size(small) row(1)) 

qui graph export "graph 6 C19 daily deaths absolute % error, $country, all updates.pdf", replace












***************************************************************
* graph 7 a Daily deaths, average median errors 

twoway ///
(line DDErrorA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDErrorA05_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium)) /// 
subtitle("$country, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 7 a C19 daily deaths error, $country, Error Mean1.pdf", replace







***************************************************************
* graph 7 b Daily deaths, average median errors 

twoway ///
(line DDErrorA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDErrorA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDErrorA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDErrorA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDErrorA05_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median errors", size(medium)) /// 
subtitle("$country, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 7 b C19 daily deaths error, $country, Error Mean1 smooth.pdf", replace







***************************************************************
* graph 8 a Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbsErrA05_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 8 a C19 daily deaths error, $country, Absolute Error Mean1.pdf", replace








***************************************************************
* graph 8 b Daily deaths, average median absolute errors 

twoway ///
(line DDAbsErrA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbsErrA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbsErrA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbsErrA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbsErrA05_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute errors", size(medium) color(black)) /// 
subtitle("$country, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 8 b C19 daily deaths error, $country, Absolute Error Mean1 smooth.pdf", replace









***************************************************************
* graph 9 a Daily deaths, average median percent errors

twoway ///
(line DDPerErrA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDPerErrA05_Mean1 date, sort lcolor(green) lwidth(medium)) ///  
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 9 a C19 daily deaths error, $country, % Error Mean1.pdf", replace








***************************************************************
* graph 9 b Daily deaths, average median percent errors

twoway ///
(line DDPerErrA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDPerErrA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDPerErrA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDPerErrA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDPerErrA05_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median percent errors", size(medium) color(black)) /// 
subtitle("$country, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 9 b C19 daily deaths error, $country, % Error Mean1 smooth.pdf", replace







***************************************************************
* graph 10 a Daily deaths, average median absolute percent errors

twoway ///
(line DDAbPeErA01_Mean1 date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA02_Mean1 date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErA03_Mean1 date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErA04_Mean1 date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbPeErA05_Mean1 date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, forecast only", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 10 a C19 daily deaths error, $country, Absolute % Error Mean1.pdf", replace










***************************************************************
* graph 10 b Daily deaths, average median absolute percent errors, smooth

twoway ///
(line DDAbPeErA01_Mean1_sm date, sort lcolor(red) lwidth(medium)) /// 
(line DDAbPeErA02_Mean1_sm date, sort lcolor(black) lwidth(medium)) /// 
(line DDAbPeErA03_Mean1_sm date, sort lcolor(magenta) lwidth(medium)) /// 
(line DDAbPeErA04_Mean1_sm date, sort lcolor(brown) lwidth(medium)) /// 
(line DDAbPeErA05_Mean1_sm date, sort lcolor(green) lwidth(medium)) /// 
if date >= td(01jan2020) & date <= td(01jan2022) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths error measure) title("C19 daily deaths, average median absolute percent errors", size(medium) color(black)) /// 
subtitle("$country, forecast only; smoothed for better viewing", size(small)) xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(3)) ///
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 10 b C19 daily deaths error, $country, Absolute % Error Mean1, smooth.pdf", replace















***********************************************

capture drop DDErrorA01_Mean2r DDErrorA02_Mean2r DDErrorA03_Mean2r DDErrorA04_Mean2r DDErrorA05_Mean2r
gen DDErrorA01_Mean2r = round(DDErrorA01_Mean2,0.1)
gen DDErrorA02_Mean2r = round(DDErrorA02_Mean2,0.1)
gen DDErrorA03_Mean2r = round(DDErrorA03_Mean2,0.1)
gen DDErrorA04_Mean2r = round(DDErrorA04_Mean2,0.1)
gen DDErrorA05_Mean2r = round(DDErrorA05_Mean2,0.1)


* graph 11 a Daily deaths, Avergae of Mean Error over updates and calendar months

graph bar ///
(mean) DDErrorA01_Mean2r /// 
(mean) DDErrorA02_Mean2r /// 
(mean) DDErrorA03_Mean2r /// 
(mean) DDErrorA04_Mean2r /// 
(mean) DDErrorA05_Mean2r /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average of Mean Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; $country", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 11 a C19 daily deaths, $country, Average Mean Error.pdf", replace










***********************************************

capture drop DDAbsErrA01_Mean2r DDAbsErrA02_Mean2r DDAbsErrA03_Mean2r DDAbsErrA04_Mean2r DDAbsErrA05_Mean2r
gen DDAbsErrA01_Mean2r = round(DDAbsErrA01_Mean2,0.1)
gen DDAbsErrA02_Mean2r = round(DDAbsErrA02_Mean2,0.1)
gen DDAbsErrA03_Mean2r = round(DDAbsErrA03_Mean2,0.1)
gen DDAbsErrA04_Mean2r = round(DDAbsErrA04_Mean2,0.1)
gen DDAbsErrA05_Mean2r = round(DDAbsErrA05_Mean2,0.1)


* graph 11 b Daily deaths, Avergae of Mean Absolute Error over updates and calendar months

graph bar ///
(mean) DDAbsErrA01_Mean2r /// 
(mean) DDAbsErrA02_Mean2r /// 
(mean) DDAbsErrA03_Mean2r /// 
(mean) DDAbsErrA04_Mean2r /// 
(mean) DDAbsErrA05_Mean2r /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average of Mean Absolute Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; $country", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 11 b C19 daily deaths, $country, Average Mean Absolute Error.pdf", replace









***********************************************

capture drop DDPerErrA01_Mean2r DDPerErrA02_Mean2r DDPerErrA03_Mean2r DDPerErrA04_Mean2r DDPerErrA05_Mean2r
gen DDPerErrA01_Mean2r = round(DDPerErrA01_Mean2,0.1)
gen DDPerErrA02_Mean2r = round(DDPerErrA02_Mean2,0.1)
gen DDPerErrA03_Mean2r = round(DDPerErrA03_Mean2,0.1)
gen DDPerErrA04_Mean2r = round(DDPerErrA04_Mean2,0.1)
gen DDPerErrA05_Mean2r = round(DDPerErrA05_Mean2,0.1)


* graph 11 c Daily deaths, Avergae of Mean Percent Error over updates and calendar months

graph bar ///
(mean) DDPerErrA01_Mean2r /// 
(mean) DDPerErrA02_Mean2r /// 
(mean) DDPerErrA03_Mean2r /// 
(mean) DDPerErrA04_Mean2r /// 
(mean) DDPerErrA05_Mean2r /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average of Mean Percent Error", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; $country", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 11 c C19 daily deaths, $country, Average Mean Percent Error.pdf", replace











***********************************************

capture drop DDAbPeErA01_Mean2r DDAbPeErA02_Mean2r DDAbPeErA03_Mean2r DDAbPeErA04_Mean2r DDAbPeErA05_Mean2r
gen DDAbPeErA01_Mean2r = round(DDAbPeErA01_Mean2,0.1)
gen DDAbPeErA02_Mean2r = round(DDAbPeErA02_Mean2,0.1)
gen DDAbPeErA03_Mean2r = round(DDAbPeErA03_Mean2,0.1)
gen DDAbPeErA04_Mean2r = round(DDAbPeErA04_Mean2,0.1)
gen DDAbPeErA05_Mean2r = round(DDAbPeErA05_Mean2,0.1)


* graph 11 d Daily deaths, Avergae of Mean Absolute Percent Error over updates and calendar months

graph bar ///
(mean) DDAbPeErA01_Mean2r /// 
(mean) DDAbPeErA02_Mean2r /// 
(mean) DDAbPeErA03_Mean2r /// 
(mean) DDAbPeErA04_Mean2r /// 
(mean) DDAbPeErA05_Mean2r /// 
, bar(1, fcolor(red) lcolor(red)) ///
bar(2, fcolor(black) lcolor(black)) ///
bar(3, fcolor(magenta) lcolor(magenta)) ///
bar(4, fcolor(brown) lcolor(brown)) ///
bar(5, fcolor(green) lcolor(green)) ///
blabel(bar) ytitle("Average MAPE") yscale(titlegap(2)) ///
title("C19 daily deaths average of Mean Absolute Percent Error (MAPE)", size(medium) color(black)) ///
subtitle("Over updates and calendar months; forecast only; $country", size(small)) /// 
legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP" 2 "IHME" 3 "IMPE" 4 "LANL" 5 "SRIV") size(small) row(1)) 

qui graph export "graph 11 d C19 daily deaths, $country, Average MAPE.pdf", replace







*

qui compress

save "CovidLongitudinal merge 2.dta", replace 




view "log CovidLongitudinal merge 4.smcl"

log close

exit, clear

