
clear all

cd "$pathCovidLongitudinal"

cd DELP

capture log close 

log using "log CovidLongitudinal DELP 5.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal DELP 5.do"

* Project: Longitudinal assessment of C19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************

* weeks time bin

* run calculations - daily deaths: four error types (graphs 110-119, 5, 6, 7, 8), updates together
* 2 Error
* 3 Absolute Error
* 4 Percent Error
* 5 Absolute Percent Error
* 6  median error by epi weeks and updates
* 7  mean over updates of median error by epi weeks
* 8  median absolute error by epi weeks and updates
* 9  mean over updates of median absolute error by epi weeks
* 10 median percent error by epi weeks and updates
* 11 mean over updates of median percent error by epi weeks
* 12 median absolute percent error by epi weeks and updates
* 13 mean over updates of median absolute percent error by epi weeks
* 14 average MAPE over updates and epi weeks (single value for each location-model)
* input data files: "CovidLongitudinal DELP.dta"
* output data files: "CovidLongitudinal DELP 2.dta" (with weekly error measures saved)


/*

Reference = JOHN, Model = DELP

Error = Reference minus Model 

absolute Error = | Reference minus Model |

percent Error = 100 * (Reference minus Model) / Reference

absolute percent Error = 100 * | Reference minus Model | / Reference



`update' = Model update date

`XYZ' = location

Error = DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update'

absolute Error = | DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update' |

percent Error = 100 * (DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update') / DayDeaMeSmA00S00`XYZ’

absolute percent Error = 100 * | DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ’`update' | / DayDeaMeSmA00S00`XYZ'



graph / `XYZ' / location

110 XXX National 
111 XAB Alberta 
112 XBC British Columbia
113 XMB Manitoba
114 XNB New Brunswick
115 XNL Newfoundland & Labrador
116 XNS Nova Scotia
117 XON Ontario
118 XQC Quebec
119 XSK Saskatchewan

*/






use "CovidLongitudinal DELP.dta", clear 


*

ssc install epiweek


* Create new variables epi_week and epi_year from calendar date

epiweek date, epiw(epi_week) epiy(epi_year)

label var epi_week "Epidemiological week"
label var epi_year "Epidemiological year"


* Create new variables - calendar date with starting Sunday from and ending Saturday to

egen epi_yrwk = concat(epi_year epi_week), p(w)

label var epi_yrwk "Epidemiological year and week"

epiweek2 epi_yrwk, s(epi_week_from) e(epi_week_to)

label var epi_week_from "Epidemiological week start date"
label var epi_week_to "Epidemiological week end date"






* 142 individual updates


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
20211018 ///
20211019 ///
20211020 ///
20211021 ///
20211022 ///
20211023 ///
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
20211113 ///
20211114 ///
20211115 ///
20211116 ///
20211117 ///
20211118 ///
20211119 ///
20211120 ///
20211121 ///
20211122 ///
20211123 ///
20211124 ///
20211125 ///
20211126 ///
20211127 ///
20211128 ///
20211129 ///
20211130 ///
20211201 ///
20211202 ///
20211203 ///
20211204 ///
20211205 ///
20211206 ///
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
20211220 ///
20211221 ///
20211222 ///
20211223 ///
20211224 ///
20211225 ///
20211226 ///
20211227 ///
20211228 ///
20211229 ///
20211230 ///
20211231




foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {

	foreach update of local list {

		qui gen DayDeaFOREA01S00`XYZ'`update' = DayDeaFOREA01S00`update'
		
		qui label var DayDeaFOREA01S00`XYZ'`update' "DayDeaFOREA01S00`XYZ'`update'"

	}	

}
*


foreach update of local list {

	qui {

	replace DayDeaFOREA01S00XAB`update' = . if provincestate != "Alberta"
	replace DayDeaFOREA01S00XBC`update' = . if provincestate != "British Columbia"
	replace DayDeaFOREA01S00XMB`update' = . if provincestate != "Manitoba"
	replace DayDeaFOREA01S00XXX`update' = . if provincestate != " National"
	replace DayDeaFOREA01S00XNB`update' = . if provincestate != "New Brunswick"
	replace DayDeaFOREA01S00XNL`update' = . if provincestate != "Newfoundland and Labrador"
	replace DayDeaFOREA01S00XNS`update' = . if provincestate != "Nova Scotia"
	replace DayDeaFOREA01S00XON`update' = . if provincestate != "Ontario"
	replace DayDeaFOREA01S00XQC`update' = . if provincestate != "Quebec"
	replace DayDeaFOREA01S00XSK`update' = . if provincestate != "Saskatchewan"
	
	}
}
*
	

qui compress


sort provincestate date


* (1) gen error TYPES by epi weeks and model updates

foreach update of local list {

	* Running not quietly displays that the Stata is working and has not frozen. 

		foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {

gen DDErrorA01`XYZ'`update' = DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update'
label var DDErrorA01`XYZ'`update' "DayDeaFOREA01S00`XYZ'`update' error"

gen DDAbsErrA01`XYZ'`update' = abs(DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update')
label var DDAbsErrA01`XYZ'`update' "DayDeaFOREA01S00`XYZ'`update' absolute error"

gen DDPerErrA01`XYZ'`update' = (100 * (DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update')) / DayDeaMeSmA00S00`XYZ'
label var DDPerErrA01`XYZ'`update' "DayDeaFOREA01S00`XYZ'`update' percent error"

gen DDAbPeErA01`XYZ'`update' = (100 * abs(DayDeaMeSmA00S00`XYZ' - DayDeaFOREA01S00`XYZ'`update')) / DayDeaMeSmA00S00`XYZ'
label var DDAbPeErA01`XYZ'`update' "DayDeaFOREA01S00`XYZ'`update' absolute percent error" 

		

	}

}
*




* (2) gen MEDIAN of error types by epi weeks and updates = _Med1

* Wait note: wait ...

foreach update of local list {

	

		foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {
		
bysort epi_yrwk : egen DDErrorA01`XYZ'`update'_Med1 = median(DDErrorA01`XYZ'`update')
label var DDErrorA01`XYZ'`update'_Med1 "DayDeaA01 median error by epi weeks and updates"

bysort epi_yrwk : egen DDAbsErrA01`XYZ'`update'_Med1 = median(DDAbsErrA01`XYZ'`update')
label var DDAbsErrA01`XYZ'`update'_Med1 "DayDeaA01 median absolute error by epi weeks and updates"

bysort epi_yrwk : egen DDPerErrA01`XYZ'`update'_Med1 = median(DDPerErrA01`XYZ'`update')
label var DDPerErrA01`XYZ'`update'_Med1 "DayDeaA01 median % error by epi weeks and updates"

bysort epi_yrwk : egen DDAbPeErA01`XYZ'`update'_Med1 = median(DDAbPeErA01`XYZ'`update')
label var DDAbPeErA01`XYZ'`update'_Med1 "DayDeaA01 median absolute % error by epi weeks and updates" 

		

	}

}
*



 
* (3) gen AVERAGE over updates of MEDIAN of error types by epi weeks = _Mean1

* Wait note: wait ...



 

foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {
		
		 
		
		order DDErrorA01`XYZ'*_Med1
		
egen DDErrorA01`XYZ'_Mean1 = rowmean(DDErrorA01`XYZ'20200417_Med1-DDErrorA01`XYZ'20211231_Med1) 
label var DDErrorA01`XYZ'_Mean1 "DDErrorA01 mean over updates of median error by epi weeks"


		order DDAbsErrA01`XYZ'*_Med1 

egen DDAbsErrA01`XYZ'_Mean1 = rowmean(DDAbsErrA01`XYZ'20200417_Med1-DDAbsErrA01`XYZ'20211231_Med1) 
label var DDAbsErrA01`XYZ'_Mean1 "DDAbsErrA01 mean over updates of median absolute error by epi weeks"


		order DDPerErrA01`XYZ'*_Med1

egen DDPerErrA01`XYZ'_Mean1 = rowmean(DDPerErrA01`XYZ'20200417_Med1-DDPerErrA01`XYZ'20211231_Med1) 
label var DDPerErrA01`XYZ'_Mean1 "DDPerErrA01 mean over updates of median % error by epi weeks"


		order DDAbPeErA01`XYZ'*_Med1 

egen DDAbPeErA01`XYZ'_Mean1 = rowmean(DDAbPeErA01`XYZ'20200417_Med1-DDAbPeErA01`XYZ'20211231_Med1) 
label var DDAbPeErA01`XYZ'_Mean1 "DDAbPeErA01 mean over updates of median absolute % error by epi weeks"



}
* 
 
 
 
 




* (4) gen AVERAGE over epi weeks of _Mean1  = _Mean2

* Wait note: wait ...



	foreach XYZ in XAB XBC XMB XXX XNB XNL XNS XON XQC XSK {
		
egen DDErrorA01`XYZ'_Mean2 = mean(DDErrorA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DDErrorA01`XYZ'_Mean2 "DDErrorA01 Mean over epi weeks of median error over updates"

egen DDAbsErrA01`XYZ'_Mean2 = mean(DDAbsErrA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbsErrA01`XYZ'_Mean2 "DDAbsErrA01 Mean over epi weeks of median absolute error over updates"

egen DDPerErrA01`XYZ'_Mean2 = mean(DDPerErrA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DDPerErrA01`XYZ'_Mean2 "DDPerErrA01 Mean over epi weeks of median % error over updates"

egen DDAbPeErA01`XYZ'_Mean2 = mean(DDAbPeErA01`XYZ'_Mean1) // get mean for all epi weeks of _Mean1
label var DDAbPeErA01`XYZ'_Mean2 "DDAbPeErA01 Mean over epi weeks of median absolute % error over updates"

	

}
*








******

qui compress 

save "CovidLongitudinal DELP 2.dta", replace 






view "log CovidLongitudinal DELP 5.smcl"

log close

exit, clear

