
clear all

cd "$pathCovidLongitudinal"

cd master

capture log close 

log using "log CovidLongitudinal loc_grand_name.smcl", replace

***************************************************************************
* This is "do CovidLongitudinal loc_grand_name.do"

* Project: Longitudinal assessment of COVID-19 models                                                                         
* Person: Farshad Pourmalek 
***************************************************************************


* create location grand name and id // loc_grand_name and loc_grand_id
	
* input file(s): loc_grand_name.xlsx
* output file(s): loc_grand_name.dta

* output data dictionary file(s): "loc_grand_name data dictionary.csv"





import excel using "loc_grand_name.xlsx", clear firstrow


label define country ///
1 "Afghanistan" ///
2 "Albania" ///
3 "Algeria" ///
4 "Andorra" ///
5 "Angola" ///
6 "Antigua and Barbuda" ///
7 "Argentina" ///
8 "Armenia" ///
9 "Australia" ///
10 "Austria" ///
11 "Azerbaijan" ///
12 "Bahamas" ///
13 "Bahrain" ///
14 "Bangladesh" ///
15 "Barbados" ///
16 "Belarus" ///
17 "Belgium" ///
18 "Belize" ///
19 "Benin" ///
20 "Bhutan" ///
21 "Bolivia" ///
22 "Bosnia and Herzegovina" ///
23 "Botswana" ///
24 "Brazil" ///
25 "Brunei" ///
26 "Bulgaria" ///
27 "Burkina Faso" ///
28 "Burundi" ///
29 "Cambodia" ///
30 "Cameroon" ///
31 "Canada" ///
32 "Cape Verde" ///
33 "Central African Republic" ///
34 "Chad" ///
35 "Chile" ///
36 "China" ///
37 "Colombia" ///
38 "Comoros" ///
39 "Congo" ///
40 "Congo DR" ///
41 "Costa Rica" ///
42 "Cote d'Ivoire" ///
43 "Croatia" ///
44 "Cuba" ///
45 "Cyprus" ///
46 "Czechia" ///
47 "Denmark" ///
48 "Djibouti" ///
49 "Dominica" ///
50 "Dominican Republic" ///
51 "Ecuador" ///
52 "Egypt" ///
53 "El Salvador" ///
54 "Equatorial Guinea" ///
55 "Eritrea" ///
56 "Estonia" ///
57 "Eswatini" ///
58 "Ethiopia" ///
59 "Fiji" ///
60 "Finland" ///
61 "France" ///
62 "Gabon" ///
63 "Gambia" ///
64 "Georgia" ///
65 "Germany" ///
66 "Ghana" ///
67 "Greece" ///
68 "Grenada" ///
69 "Guatemala" ///
70 "Guinea" ///
71 "Guinea Bissau" ///
72 "Guyana" ///
73 "Haiti" ///
74 "Holy See" ///
75 "Honduras" ///
76 "Hungary" ///
77 "Iceland" ///
78 "India" ///
79 "Indonesia" ///
80 "Iran" ///
81 "Iraq" ///
82 "Ireland" ///
83 "Israel" ///
84 "Italy" ///
85 "Jamaica" ///
86 "Japan" ///
87 "Jordan" ///
88 "Kazakhstan" ///
89 "Kenya" ///
90 "Kiribati" ///
91 "Korea North" ///
92 "Korea South" ///
93 "Kosovo" ///
94 "Kuwait" ///
95 "Kyrgyzstan" ///
96 "Laos" ///
97 "Latvia" ///
98 "Lebanon" ///
99 "Lesotho" ///
100 "Liberia" ///
101 "Libya" ///
102 "Liechtenstein" ///
103 "Lithuania" ///
104 "Luxembourg" ///
105 "Madagascar" ///
106 "Malawi" ///
107 "Malaysia" ///
108 "Maldives" ///
109 "Mali" ///
110 "Malta" ///
111 "Mauritania" ///
112 "Mauritius" ///
113 "Mexico" ///
114 "Micronesia" ///
115 "Moldova" ///
116 "Monaco" ///
117 "Mongolia" ///
118 "Montenegro" ///
119 "Morocco" ///
120 "Mozambique" ///
121 "Myanmar" ///
122 "Namibia" ///
123 "Nepal" ///
124 "Netherlands" ///
125 "New Zealand" ///
126 "Nicaragua" ///
127 "Niger" ///
128 "Nigeria" ///
129 "North Macedonia" ///
130 "Norway" ///
131 "Oman" ///
132 "Pakistan" ///
133 "Palestine" ///
134 "Panama" ///
135 "Papua New Guinea" ///
136 "Paraguay" ///
137 "Peru" ///
138 "Philippines" ///
139 "Poland" ///
140 "Portugal" ///
141 "Qatar" ///
142 "Romania" ///
143 "Russia" ///
144 "Rwanda" ///
145 "Saint Kitts and Nevis" ///
146 "Saint Lucia" ///
147 "Saint Vincent and the Grenadines" ///
148 "Samoa" ///
149 "San Marino" ///
150 "Sao Tome and Principe" ///
151 "Saudi Arabia" ///
152 "Senegal" ///
153 "Serbia" ///
154 "Seychelles" ///
155 "Sierra Leone" ///
156 "Singapore" ///
157 "Slovakia" ///
158 "Slovenia" ///
159 "Solomon Islands" ///
160 "Somalia" ///
161 "South Africa" ///
162 "South Sudan" ///
163 "Spain" ///
164 "Sri Lanka" ///
165 "Sudan" ///
166 "Suriname" ///
167 "Sweden" ///
168 "Switzerland" ///
169 "Syria" ///
170 "Tajikistan" ///
171 "Taiwan" ///
172 "Tanzania" ///
173 "Thailand" ///
174 "Timor Leste" ///
175 "Togo" ///
176 "Tonga" ///
177 "Trinidad and Tobago" ///
178 "Tunisia" ///
179 "Turkey" ///
180 "Uganda" ///
181 "Ukraine" ///
182 "United Arab Emirates" ///
183 "United Kingdom" ///
184 "United States of America" ///
185 "Uruguay" ///
186 "Uzbekistan" ///
187 "Vanuatu" ///
188 "Venezuela" ///
189 "Viet Nam" ///
190 "Western Sahara" ///
190 "Yemen" ///
191 "Zambia" ///
192 "Zimbabwe"


gen loc_grand_name_numlabel = loc_grand_id

label values loc_grand_name_numlabel country

tab loc_grand_id



* gen loc_grand_name_snail and replace all spaces with indeline

gen loc_grand_name_snail = loc_grand_name

replace loc_grand_name_snail = subinstr(loc_grand_name_snail, " ", "_", .)




label var loc_grand_order "country order"

label var loc_grand_name "country name"

label var loc_grand_id "country id number"

label var loc_grand_iso "country iso3 code"

label var loc_grand_name_numlabel "country name number label"

label var loc_grand_name_snail "country name snail"


label var DELP "country names used in DELP COVID-19 epidemic model"
label var IHME "country names used in IHME COVID-19 epidemic model"
label var IMPE "country names used in IMPE COVID-19 epidemic model"
label var LANL "country names used in LANL COVID-19 epidemic model"
label var SRIV "country names used in SRIV COVID-19 epidemic model"
label var UCLA "country names used in UCLA COVID-19 epidemic model"
label var YYGU "country names used in YYGU COVID-19 epidemic model"
label var JOHN "country names used in JOHNs Hopkins COVID-19 epidemic data"


label var UNFPA2020 "country names used in UNFPA 2020 population estimates"
label var population2020 "UNFPA 2020 population estimates"
label var UNFPA2021 "country names used in UNFPA 2021 population estimates"
label var population2021 "UNFPA 2021 population estimates"
label var UNFPA2022 "country names used in UNFPA 2022 population estimates"
label var population2022 "UNFPA 2022 population estimates"
label var region "WHO region"




******

* make lists for transforming country names to loc_grand_name

local list DELP IHME IMPE LANL SRIV UCLA YYGU JOHN

foreach model of local list {

list loc_grand_name `model' if loc_grand_name != `model' & `model' != "", noo clean

}
*


codebook loc_grand_name if loc_grand_id != .

tab mapping if loc_grand_id == .

list loc_grand_name mapping if loc_grand_id == .


codebook DELP IHME IMPE LANL SRIV UCLA YYGU JOHN


label var modelmix "Presence 1 or absence 0 of country in models DELP IHME IMPE LANL SRIV UCLA YYGU" 

tab modelmix, sort


label var modelsnumber "Number of models country present in"

tab modelsnumber


label var mapping "mapping plan"

tab mapping


label var mappingcolor "mapping color code"

tab mappingcolor


label var mappingcolormeaning "mapping plan meaning"

tab mappingcolormeaning

drop Y Z



qui compress

save "loc_grand_name.dta", replace


******

* create data dictionary

preserve

    describe, replace
	
    export delimited name varlab using "loc_grand_name data dictionary.csv", replace 
	
restore




view "log CovidLongitudinal loc_grand_name.smcl"

exit, clear
