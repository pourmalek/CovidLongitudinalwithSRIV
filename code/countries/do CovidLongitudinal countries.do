
clear all

cd "$pathCovidLongitudinal/countries/"

***************************************************************************
* This is "do CovidLongitudinal countries.do"

* Project: Longitudinal assessment of COVID-19 models 

* Objective: Process estimates for countries  
                                                              
***************************************************************************



**** "do CovidLongitudinal countries.do"
**** Process estimates for countries - by running the do file of reach country - do CovidLongitudinal `country'.do


** input data files: estimates files by models and JOHN

** main output data files: main file = "ALL MODELS `country' error - only error measures across models.dta"







************************************************************************

* get error for each country 


local list `" "Afghanistan" "Albania" "Algeria" "Andorra" "Angola" "Antigua and Barbuda" "Argentina" "Armenia" "Australia" "Austria" "Azerbaijan" "Bahamas" "Bahrain" "Bangladesh" "Barbados" "Belarus" "Belgium" "Belize" "Benin" "Bhutan" "Bolivia" "Bosnia and Herzegovina" "Botswana" "Brazil" "Brunei" "Bulgaria" "Burkina Faso" "Burundi" "Cambodia" "Cameroon" "Canada" "Cape Verde" "Central African Republic" "Chad" "Chile" "China" "Colombia" "Comoros" "Congo" "Congo DR" "Costa Rica" "Cote d'Ivoire" "Croatia" "Cuba" "Cyprus" "Czechia" "Denmark" "Djibouti" "Dominica" "Dominican Republic" "Ecuador" "Egypt" "El Salvador" "Equatorial Guinea" "Eritrea" "Estonia" "Eswatini" "Ethiopia" "Fiji" "Finland" "France" "Gabon" "Gambia" "Georgia" "Germany" "Ghana" "Greece" "Grenada" "Guatemala" "Guinea" "Guinea Bissau" "Guyana" "Haiti" "Honduras" "Hungary" "Iceland" "India" "Indonesia" "Iran" "Iraq" "Ireland" "Israel" "Italy" "Jamaica" "Japan" "Jordan" "Kazakhstan" "Kenya" "Kiribati" "Korea North" "Korea South" "Kosovo" "Kuwait" "Kyrgyzstan" "Laos" "Latvia" "Lebanon" "Lesotho" "Liberia" "Libya" "Liechtenstein" "Lithuania" "Luxembourg" "Madagascar" "Malawi" "Malaysia" "Maldives" "Mali" "Malta" "Mauritania" "Mauritius" "Mexico" "Micronesia" "Moldova" "Monaco" "Mongolia" "Montenegro" "Morocco" "Mozambique" "Myanmar" "Namibia" "Nepal" "Netherlands" "New Zealand" "Nicaragua" "Niger" "Nigeria" "North Macedonia" "Norway" "Oman" "Pakistan" "Palestine" "Panama" "Papua New Guinea" "Paraguay" "Peru" "Philippines" "Poland" "Portugal" "Qatar" "Romania" "Russia" "Rwanda" "Saint Kitts and Nevis" "Saint Lucia" "Saint Vincent and the Grenadines" "Samoa" "San Marino" "Sao Tome and Principe" "Saudi Arabia" "Senegal" "Serbia" "Seychelles" "Sierra Leone" "Singapore" "Slovakia" "Slovenia" "Solomon Islands" "Somalia" "South Africa" "South Sudan" "Spain" "Sri Lanka" "Sudan" "Suriname" "Sweden" "Switzerland" "Syria" "Taiwan" "Tajikistan" "Tanzania" "Thailand" "Timor Leste" "Togo" "Tonga" "Trinidad and Tobago" "Tunisia" "Turkey" "Uganda" "Ukraine" "United Arab Emirates" "United Kingdom" "United States of America" "Uruguay" "Uzbekistan" "Vanuatu" "Venezuela" "Viet Nam" "Yemen" "Zambia" "Zimbabwe" "'

foreach country of local list {
	
	di "`country'"
	
	cd "$pathCovidLongitudinal/countries/`country'"
		
	do "do CovidLongitudinal `country'.do"
	
}
*



cd "$pathCovidLongitudinal/countries/"


