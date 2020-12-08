cd "/Users/temanwana/Documents/MIT/Senior Year/14.33/Papers/Final Paper/Data"

import delimited full_data_combined_pt_mn.csv, clear

destring meanmathscore, replace force
destring meanelascore, replace force



tabstat overallclasssizeaverage [fweight = totalnumberofsections] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)


//enrollment
tabstat totalnumberofstudents if (programtype == "GEN ED"), statistics(n mean sd) by(grade)


// BY SCHOOL
// FRL
tabstat frlpercent if (programtype == "GEN ED"), statistics(n mean sd)


// Title 1
tabstat title1 if (programtype == "GEN ED"), statistics(n mean sd)


// BY GRADE PER SCHOOL
// ICT
tabstat ctt if (programtype == "GEN ED"), statistics(n mean sd) by(grade)


// G&T
tabstat gt if (programtype == "GEN ED"), statistics(n mean sd) by(grade)


codebook schoolcode

// BY GRADE PER SCHOOL
// class size
gen overallclasssizeaverage_0 = overallclasssizeaverage if (v24==0 & programtype == "GEN ED")
tabstat overallclasssizeaverage_0 [fweight = totalnumberofsections], statistics(n mean sd) by(grade)

gen overallclasssizeaverage_1 = overallclasssizeaverage if (v24==1 & programtype == "GEN ED")
tabstat overallclasssizeaverage_1 [fweight = totalnumberofsections], statistics(n mean sd) by(grade)


//enrollment
gen totalnumberofstudents_0 = totalnumberofstudents if (v24==0 & programtype == "GEN ED")
tabstat totalnumberofstudents_0, statistics(n mean sd) by(grade)

gen totalnumberofstudents_1 = totalnumberofstudents if (v24==1 & programtype == "GEN ED")
tabstat totalnumberofstudents_1, statistics(n mean sd) by(grade)


// BY SCHOOL
// FRL
gen frlpercent_0 = frlpercent if (v24==0 & programtype == "GEN ED")
tabstat frlpercent_0, statistics(n mean sd)

gen frlpercent_1 = frlpercent if (v24==1 & programtype == "GEN ED")
tabstat frlpercent_1, statistics(n mean sd)


// Title 1
gen title1_0 = title1 if (v24==0 & programtype == "GEN ED")
tabstat frlpercent_0, statistics(n mean sd)

gen title1_1 = title1 if (v24==1 & programtype == "GEN ED")
tabstat frlpercent_1, statistics(n mean sd)


// BY GRADE PER SCHOOL
// ICT
gen ctt_0 = ctt if (v24==0 & programtype == "GEN ED")
tabstat ctt_0, statistics(n mean sd) by(grade)

gen ctt_1 = ctt if (v24==1 & programtype == "GEN ED")
tabstat ctt_1, statistics(n mean sd) by(grade)


// G&T
gen gt_0 = gt if (v24==0 & programtype == "GEN ED")
tabstat gt_0, statistics(n mean sd) by(grade)

gen gt_1 = gt if (v24==1 & programtype == "GEN ED")
tabstat gt_1, statistics(n mean sd) by(grade)

gen scaledmath3 = ((meanmathscore/10 - 46) - 1) * (99/30) + 1 if grade == 3
tabstat scaledmath3 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledmath4 = ((meanmathscore/10 - 47.5) - 1) * (99/31.5) + 1 if grade == 4
tabstat scaledmath4 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledmath5 = ((meanmathscore/10 - 48.5) - 1) * (99/28.5) + 1 if grade == 5
tabstat scaledmath5 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledmath6 = ((meanmathscore/10 - 49) - 1) * (99/28) + 1 if grade == 6
tabstat scaledmath6 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledmath7 = ((meanmathscore/10 - 49) - 1) * (99/30) + 1 if grade == 7
tabstat scaledmath7 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledmath8 = ((meanmathscore/10 - 47) - 1) * (99/29.5) + 1 if grade == 8
tabstat scaledmath8 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)



///
gen scaledela3 = ((meanelascore/10 - 46.5) - 1) * (99/30.5) + 1 if grade == 3
tabstat scaledela3 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledela4 = ((meanelascore/10 - 42) - 1) * (99/34.5) + 1 if grade == 4
tabstat scaledela4 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledela5 = ((meanelascore/10 - 48.5) - 1) * (99/30) + 1 if grade == 5
tabstat scaledela5 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledela6 = ((meanelascore/10 - 47) - 1) * (99/30.5) + 1 if grade == 6
tabstat scaledela6 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledela7 = ((meanelascore/10 - 46) - 1) * (99/32) + 1 if grade == 7
tabstat scaledela7 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)

gen scaledela8 = ((meanelascore/10 - 42) - 1) * (99/36) + 1 if grade == 8
tabstat scaledela8 [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd) by(grade)



gen scaledmath = ((meanmathscore/10 - 46) - 1) * (99/30) + 1 if grade == 3
replace scaledmath = ((meanmathscore/10 - 47.5) - 1) * (99/31.5) + 1 if grade == 4
replace scaledmath = ((meanmathscore/10 - 48.5) - 1) * (99/28.5) + 1 if grade == 5
replace scaledmath = ((meanmathscore/10 - 49) - 1) * (99/28) + 1 if grade == 6
replace scaledmath = ((meanmathscore/10 - 49) - 1) * (99/30) + 1 if grade == 7
replace scaledmath = ((meanmathscore/10 - 47) - 1) * (99/29.5) + 1 if grade == 8

gen scaledela = ((meanelascore/10 - 46.5) - 1) * (99/30.5) + 1 if grade == 3
replace scaledela = ((meanelascore/10 - 42) - 1) * (99/34.5) + 1 if grade == 4
replace scaledela = ((meanelascore/10 - 48.5) - 1) * (99/30) + 1 if grade == 5
replace scaledela = ((meanelascore/10 - 47) - 1) * (99/30.5) + 1 if grade == 6
replace scaledela = ((meanelascore/10 - 46) - 1) * (99/32) + 1 if grade == 7 
replace scaledela = ((meanelascore/10 - 42) - 1) * (99/36) + 1 if grade == 8


expand 2, generate(newvar)


gen scaled = scaledmath if (newvar == 0)
replace scaled = scaledela if (newvar ==1)

tabstat scaled [fweight = totalnumberofstudents] if (programtype == "GEN ED"), statistics(n mean sd)
