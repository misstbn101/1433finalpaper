cd "/Users/temanwana/Documents/MIT/Senior Year/14.33/Papers/Final Paper/Data"

import delimited full_data_combined_pt_mn.csv, clear

destring meanmathscore, replace force
destring meanelascore, replace force



gen scaledmath3 = ((meanmathscore/10 - 46) - 1) * (99/30) + 1 if grade == 3
gen scaledmath = ((meanmathscore/10 - 46) - 1) * (99/30) + 1 if grade == 3

gen scaledmath4 = ((meanmathscore/10 - 47.5) - 1) * (99/31.5) + 1 if grade == 4
replace scaledmath = ((meanmathscore/10 - 47.5) - 1) * (99/31.5) + 1 if grade == 4

gen scaledmath5 = ((meanmathscore/10 - 48.5) - 1) * (99/28.5) + 1 if grade == 5
replace scaledmath = ((meanmathscore/10 - 48.5) - 1) * (99/28.5) + 1 if grade == 5

gen scaledmath6 = ((meanmathscore/10 - 49) - 1) * (99/28) + 1 if grade == 6
replace scaledmath = ((meanmathscore/10 - 49) - 1) * (99/28) + 1 if grade == 6

gen scaledmath7 = ((meanmathscore/10 - 49) - 1) * (99/30) + 1 if grade == 7
replace scaledmath = ((meanmathscore/10 - 49) - 1) * (99/30) + 1 if grade == 7

gen scaledmath8 = ((meanmathscore/10 - 47) - 1) * (99/29.5) + 1 if grade == 8
replace scaledmath = ((meanmathscore/10 - 47) - 1) * (99/29.5) + 1 if grade == 8


gen scaledela3 = ((meanelascore/10 - 46.5) - 1) * (99/30.5) + 1 if grade == 3
gen scaledela = ((meanelascore/10 - 46.5) - 1) * (99/30.5) + 1 if grade == 3

gen scaledela4 = ((meanelascore/10 - 42) - 1) * (99/34.5) + 1 if grade == 4
replace scaledela = ((meanelascore/10 - 42) - 1) * (99/34.5) + 1 if grade == 4

gen scaledela5 = ((meanelascore/10 - 48.5) - 1) * (99/30) + 1 if grade == 5
replace scaledela = ((meanelascore/10 - 48.5) - 1) * (99/30) + 1 if grade == 5

gen scaledela6 = ((meanelascore/10 - 47) - 1) * (99/30.5) + 1 if grade == 6
replace scaledela = ((meanelascore/10 - 47) - 1) * (99/30.5) + 1 if grade == 6

gen scaledela7 = ((meanelascore/10 - 46) - 1) * (99/32) + 1 if grade == 7
replace scaledela = ((meanelascore/10 - 46) - 1) * (99/32) + 1 if grade == 7 

gen scaledela8 = ((meanelascore/10 - 42) - 1) * (99/36) + 1 if grade == 8
replace scaledela = ((meanelascore/10 - 42) - 1) * (99/36) + 1 if grade == 8


// regress scaledmath overallclasssizeaverage totalnumberofstudents frlpercent title1 v24 ctt gt if (programtype == "GEN ED") , cluster(schoolcode)

// regress scaledela overallclasssizeaverage totalnumberofstudents frlpercent title1 v24 ctt gt if (programtype == "GEN ED") , cluster(schoolcode)


expand 2, generate(newvar)


gen scaled = scaledmath if (newvar == 0)
replace scaled = scaledela if (newvar ==1)

regress scaled overallclasssizeaverage totalnumberofstudents frlpercent title1 v24 ctt gt if (programtype == "GEN ED") , cluster(schoolcode)
