
clear all

cd "$pathCovidLongitudinal"

cd IHME

capture log close 

log using "log CovidLongitudinal IHME.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal IHME.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
***************************************************************************


* download files






**********************************************
**********************************************
**********************************************

* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 1			March 25, 2020 |	20200325	2020-03-25	ihme-covid19	2020-03-25	ihme-covid19_all_locs.csv
* cd yes


clear 
				
di in red "This is Update 1, update 20200525" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-03-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd ihme-covid19

import delimited using ihme-covid19_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200325.dta", replace

shell rm -r "ihme-covid19" 







**********************************************
**********************************************
**********************************************

* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 2			March 26, 2020 |	20200326	2020-03-26	2020_03_26	2020-03-26	hospitalization_all_locs_corrected.csv
* cd yes


clear 
				
di in red "This is Update 2, update 20200526" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-03-26/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_03_26

import delimited using hospitalization_all_locs_corrected.csv, clear varnames(1)

cd ..

save "IHME 20200326.dta", replace

shell rm -r "2020_03_26" 








**********************************************
**********************************************
**********************************************

* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 3			March 27, 2020 |	20200327	2020-03-27	2020_03_27	2020-03-27	hospitalization_all_locs_corrected.csv
* cd yes


clear 
				
di in red "This is Update 3, update 20200527" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-03-27/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_03_27

import delimited using hospitalization_all_locs_corrected.csv, clear varnames(1)

cd ..

save "IHME 20200327.dta", replace

shell rm -r "2020_03_27" 





**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 4			March 29, 2020 |	20200329	2020-03-29	2020_03_29	2020-03-29	hospitalization_all_locs_corrected.csv
* cd yes

clear 
				
di in red "This is Update 4, update 20200529" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-03-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_03_29

import delimited using hospitalization_all_locs_corrected.csv, clear varnames(1)

cd ..

save "IHME 20200329.dta", replace

shell rm -r "2020_03_29" 








**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 5			March 30, 2020 |	20200330	2020-03-30	2020_03_30	2020-03-30	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 5, update 20200530" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-03-30/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_03_30

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200330.dta", replace

shell rm -r "2020_03_30" 







**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 6			March 31, 2020 |	20200331	2020-03-31	2020_03_31.1	2020-03-31	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 6, update 20200531" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-03-31/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_03_31.1

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200331.dta", replace

shell rm -r "2020_03_31.1" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 7			April 1, 2020 |		20200401	2020-04-01	2020_04_01.2	2020-04-01	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 7, update 20200401" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-01/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_01.2

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200401.dta", replace

shell rm -r "2020_04_01.2" 








**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download			urldate		filename
* 8			April 5, 2020 |		20200405	2020-04-05	2020_04_05.05.us	2020-04-05	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 8, update 20200405" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-05/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_05.05.us

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200405.dta", replace

shell rm -r "2020_04_05.05.us" 








**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download			urldate		filename
* 9			April 7, 2020 |		20200407	2020-04-07	2020_04_05.08.all	2020-04-07	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 9, update 20200407" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-07/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_05.08.all

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200407.dta", replace

shell rm -r "2020_04_05.08.all" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download			urldate		filename
* 10		April 8, 2020 |		20200408	2020-04-08	2020_04_07.06.all	2020-04-08	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 10, update 20200408" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-08/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_07.06.all

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200408.dta", replace

shell rm -r "2020_04_07.06.all" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 11		April 10, 2020 |	20200410	2020-04-10	2020_04_09.04	2020-04-10	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 11, update 20200410" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_09.04

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200410.dta", replace

shell rm -r "2020_04_09.04" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 12	April 13, 2020 |		20200413	2020-04-13	2020_04_12.02	2020-04-13	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 12, update 20200413" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-13/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_12.02

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200413.dta", replace

shell rm -r "2020_04_12.02" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 13		April 17, 2020 |	20200417	2020-04-17	2020_04_16.05	2020-04-17	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 13, update 20200417" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-17/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_16.05

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200417.dta", replace

shell rm -r "2020_04_16.05" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download			urldate		filename
* 14		April 21, 2020 |	20200421	2020-04-21	2020_04_20.02.all	2020-04-21	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 14, update 20200421" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-21/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_20.02.all

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200421.dta", replace

shell rm -r "2020_04_20.02.all" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download			urldate		filename
* 15		April 22, 2020 | 	20200422	2020-04-22	2020_04_21.08		2020_04_21	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 15, update 20200422" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_21.08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200422.dta", replace

shell rm -r "2020_04_21.08" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 16		April 27, 2020 | 	20200427	2020-04-27	2020_04_26.08	2020_04_26	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 16, update 20200427" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-27/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_26.08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200427.dta", replace

shell rm -r "2020_04_26.08" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 17		April 28, 2020 | 	20200428	2020-04-28	2020_04_27.05.c	2020_04_28	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 17, update 20200428" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-28/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_27.05.c

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200428.dta", replace

shell rm -r "2020_04_27.05.c" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 18		April 29, 2020 | 	20200429	2020-04-29	2020_04_28.02	2020-04-29	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 18, update 20200429" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-04-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_04_28.02

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200429.dta", replace

shell rm -r "2020_04_28.02" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 19		May 4, 2020 | 		20200504	2020-05-04	2020_05_04	2020-05-04	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 19, update 20200504" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-04/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_04

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200504.dta", replace

shell rm -r "2020_05_04" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 20		May 10, 2020 | 		20200510	2020-05-10	2020_05_08	2020-05-10	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 20, update 20200510" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200510.dta", replace

shell rm -r "2020_05_08" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 21		May 12, 2020 | 		20200512	2020-05-12	2020_05_10	2020-05-12	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 21, update 20200512" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-12/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_10

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200512.dta", replace

shell rm -r "2020_05_10" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 22		May 20, 2020 | 		20200520	2020-05-20	2020_05_19	2020-05-20	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 22, update 20200520" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-20/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_19

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200520.dta", replace

shell rm -r "2020_05_19" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 23		May 25, 2020 | 		20200525	2020-05-25	2020_05_23	2020-05-25	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 23, update 20200525" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_23

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200525.dta", replace

shell rm -r "2020_05_23" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 24		May 26, 2020 | 		20200526	2020-05-26	2020_05_23.03	2020-05-26	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 24, update 20200526" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-26/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_23.03

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200526.dta", replace

shell rm -r "2020_05_23.03" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 25		May 29, 2020 | 		20200529	2020-05-29	2020_05_28		2020-05-29	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 25, update 20200529" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-05-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_05_28

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200529.dta", replace

shell rm -r "2020_05_28" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 26		June 5, 2020 | 		20200605	2020-06-05	2020_06_03	2020-06-05	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 26, update 20200605" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-05/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_03

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200605.dta", replace

shell rm -r "2020_06_03" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 27		June 8, 2020 | 		20200608	2020-06-08	2020_06_06	2020-06-08	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 27, update 20200608" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-08/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_06

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200608.dta", replace

shell rm -r "2020_06_06" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 28		June 10, 2020 | 	20200610	2020-06-10	2020_06_08	2020-06-10	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 28, update 20200610" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_08

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200610.dta", replace

shell rm -r "2020_06_08" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 29		June 15, 2020 | 	20200615	2020-06-15	2020_06_13	2020-06-15	Hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 29, update 20200615" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_13

import delimited using Hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200615.dta", replace

shell rm -r "2020_06_13" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download		urldate		filename
* 30		June 25, 2020 | 	20200625	2020-06-25	2020_06_24.02	2020-06-25	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 30, update 20200625" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_24.02

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200625.dta", replace

shell rm -r "2020_06_24.02" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 31		June 29, 2020 | 	20200629	2020-06-29	2020_06_27	2020-06-29	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 31, update 20200629" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-06-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_06_27

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200629.dta", replace

shell rm -r "2020_06_27" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 32		July 7, 2020 | 		20200707	2020-07-07	2020_07_04	2020-07-07	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 32, update 20200707" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-07/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_04

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200707.dta", replace

shell rm -r "2020_07_04" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 33		July 14, 2020 | 	20200714	2020-07-14	2020_07_11	2020-07-14	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 33, update 20200714" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-14/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_11

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200714.dta", replace

shell rm -r "2020_07_11" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 34		July 22, 2020 | 	20200722	2020-07-22	2020_07_18	2020-07-22	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 34, update 20200722" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_18

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200722.dta", replace

shell rm -r "2020_07_18" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 35		July 30, 2020 | 	20200730	2020-07-30	2020_07_26	2020-07-30	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 35, update 20200730" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-07-30/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_07_26

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200730.dta", replace

shell rm -r "2020_07_26" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 36		August 06, 2020 | 	20200806	2020-08-06	2020_08_06	2020-08-06	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 36, update 20200806" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-08-06/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_08_06

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200806.dta", replace

shell rm -r "2020_08_06" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 37		August 21, 2020 | 	20200821	2020-08-21	2020_08_21	2020-08-21	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 37, update 20200821" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-08-21/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_08_21

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200821.dta", replace

shell rm -r "2020_08_21" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 38		August 27, 2020 | 	20200827	2020-08-27	2020_08_27	2020-08-27	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 38, update 20200827" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-08-27/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_08_27

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200827.dta", replace

shell rm -r "2020_08_27" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt				linkdatenum	linkdate	download	urldate		filename
* 39		September 03, 2020 | 	20200903	2020-09-03	2020_09_02	2020-09-03	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 39, update 20200903" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-03/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_02

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200903.dta", replace

shell rm -r "2020_09_02" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt				linkdatenum	linkdate	download	urldate		filename
* 40		September 11, 2020 | 	20200911	2020-09-11	2020_09_11	2020-09-11	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 40, update 20200911" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-11/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_11

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200911.dta", replace

shell rm -r "2020_09_11" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt				linkdatenum	linkdate	download	urldate		filename
* 41		September 18, 2020 | 	20200918	2020-09-18	2020_09_18	2020-09-18	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 41, update 20200918" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-18/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_18

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200918.dta", replace

shell rm -r "2020_09_18" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt				linkdatenum	linkdate	download	urldate		filename
* 42		September 24, 2020 | 	20200924	2020-09-24	2020_09_24	2020-09-24	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 42, update 20200924" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-09-24/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_09_24

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20200924.dta", replace

shell rm -r "2020_09_24" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 43		October 2, 2020 | 	20201002	2020-10-02	2020_10_02	2020-10-02	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 43, update 20201002" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-02/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_02

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201002.dta", replace

shell rm -r "2020_10_02" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 44		October 9, 2020 | 	20201009	2020-10-09	2020_10_09	2020-10-09	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 44, update 20201009" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-09/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_09

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201009.dta", replace

shell rm -r "2020_10_09" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 45		October 15, 2020 | 	20201015	2020-10-15	2020_10_15	2020-10-15	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 45, update 20201015" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_15

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201015.dta", replace

shell rm -r "2020_10_15" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 46		October 22, 2020 | 	20201022	2020-10-22	2020_10_22	2020-10-22	Reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 46, update 20201022" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_22

import delimited using Reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201022.dta", replace

shell rm -r "2020_10_22" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 47		October 29, 2020 | 	20201029	2020-10-29	2020_10_29	2020-10-29	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 47, update 20201029" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-10-29/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_10_29

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201029.dta", replace

shell rm -r "2020_10_29" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 48		November 12, 2020 | 20201112	2020-11-12	2020_11_12	2020-11-12	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 48, update 20201112" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-11-12/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_11_12

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201112.dta", replace

shell rm -r "2020_11_12" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 49		November 19, 2020 | 20201119	2020-11-19	2020_11_19	2020-11-19	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 49, update 20201119" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-11-19/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_11_19

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201119.dta", replace

shell rm -r "2020_11_19" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 50		December 3, 2020 | 	20201203	2020-12-03	2020_12_03	2020-12-03	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 50, update 20201203" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-03/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_03

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201203.dta", replace

shell rm -r "2020_12_03" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 51		December 10, 2020 | 20201210	2020-12-10	2020_12_10	2020-12-10	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 51, update 20201210" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-10/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_10

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201210.dta", replace

shell rm -r "2020_12_10" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 52		December 17, 2020 | 20201217	2020-12-17	2020_12_17	2020-12-17	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 52, update 20201217" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-17/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_17

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201217.dta", replace

shell rm -r "2020_12_17" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 53	December 23, 2020 |		20201223	2020-12-23	2020_12_23	2020-12-23	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 53, update 20201223" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2020-12-23/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2020_12_23

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20201223.dta", replace

shell rm -r "2020_12_23" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 54		January 15, 2021 | 	20210115	2021-01-15	2021-01-15	2021-01-15	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 54, update 20210115" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-01-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021-01-15

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210115.dta", replace

shell rm -r "2021-01-15" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 55		January 22, 2021 | 	20210122	2021-01-22	2021_01_22	2021-01-22	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 55, update 20210122" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-01-22/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_01_22

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210122.dta", replace

shell rm -r "2021_01_22" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 56		January 28, 2021 | 	20210128	2021-01-28	2021_01_28	2021-01-28	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 56, update 20210128" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-01-28/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_01_28

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210128.dta", replace

shell rm -r "2021_01_28" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 57		February 4, 2021 | 	20210204	2021-02-04	2021_02_04	2021-02-04	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 57, update 20210204" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-04/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_04

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210204.dta", replace

shell rm -r "2021_02_04" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 58		February 12, 2021 | 20210212	2021-02-12	2021_02_12	2021-02-12	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 58, update 20210212" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-12/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_12

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210212.dta", replace

shell rm -r "2021_02_12" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 59		February 20, 2021 | 20210220	2021-02-20	2021_02_20	2021-02-20	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 59, update 20210220" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-20/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_20

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210220.dta", replace

shell rm -r "2021_02_20" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 60		February 25, 2021 | 20210225	2021-02-25	2021_02_25	2021-02-25	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 60, update 20210225" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-02-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_02_25

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210225.dta", replace

shell rm -r "2021_02_25" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 61		March 6, 2021 | 	20210306	2021-03-06	2021_03_06	2021-03-06	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 61, update 20210306" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-06/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_06

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210306.dta", replace

shell rm -r "2021_03_06" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 62		March 11, 2021 | 	20210311	2021-03-11	2021_03_11	2021-03-11	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 62, update 20210311" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-11/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_11

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210311.dta", replace

shell rm -r "2021_03_11" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 63		March 17, 2021 | 	20210317	2021-03-17	2021_03_17	2021-03-17	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 63, update 20210317" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-17/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_17

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210317.dta", replace

shell rm -r "2021_03_17" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 64		March 25, 2021 | 	20210325	2021-03-25	2021_03_25	2021-03-25	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 64, update 20210325" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-03-25/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_03_25

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210325.dta", replace

shell rm -r "2021_03_25" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 65		April 1, 2021 | 	20210401	2021-04-01	2021_04_01	2021-04-01	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 65, update 20210401" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-04-01/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_04_01

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210401.dta", replace

shell rm -r "2021_04_01" 






**********************************************
**********************************************
**********************************************


* updatenum	linkdatetxt			linkdatenum	linkdate	download	urldate		filename
* 66		April 9, 2021 | 	20210409	2021-04-09	2021_04_09	2021-04-09	reference_hospitalization_all_locs.csv
* cd yes

clear 
				
di in red "This is Update 66, update 20210409" 

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-04-09/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

cd 2021_04_09

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

cd ..

save "IHME 20210409.dta", replace

shell rm -r "2021_04_09" 






**











*

view "log CovidLongitudinal IHME.smcl"

log close

exit, clear
