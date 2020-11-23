cd "/Users/temanwana/Documents/MIT/Senior Year/14.33/Papers/Final Paper/Data"

import delimited full_data_combined_pt_mn.csv, clear

destring meanmathscore, replace force
destring meanelascore, replace force


// 3rd grade 1st-stage
scatter overallclasssizeaverage totalnumberofstudents if (grade == 3 & programtype == "GEN ED") || function y=x/(floor((x-1)/32)+1), range (0 400)


// title 1, 6th grade
scatter overallclasssizeaverage totalnumberofstudents if (grade == 6 & programtype == "GEN ED" & mnumber == 30) || function y=x/(floor((x-1)/30)+1), range (0 800)


// not title 1, 6th grade
scatter overallclasssizeaverage totalnumberofstudents if (grade == 6 & programtype == "GEN ED" & mnumber == 33) || function y=x/(floor((x-1)/33)+1), range (0 800)


// title 1, 8th grade
scatter overallclasssizeaverage totalnumberofstudents if (grade == 8 & programtype == "GEN ED" & mnumber == 30) || function y=x/(floor((x-1)/30)+1), range (0 800)

// mean scores vs. totalnumberofstudents
egen mean_ela = mean(meanelascore), by(totalnumberofstudents) 
egen mean_math = mean(meanmathscore), by(totalnumberofstudents) 

sort totalnumberofstudents
twoway connected mean_ela totalnumberofstudents if (grade == 8 & programtype == "GEN ED" & mnumber == 30 & mod(totalnumberofstudents, 10) == 0), connect(L)

twoway connected mean_math totalnumberofstudents if (grade == 8 & programtype == "GEN ED" & mnumber == 30 & mod(totalnumberofstudents, 10) == 0), connect(L)
