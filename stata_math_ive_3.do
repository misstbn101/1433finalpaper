cd "/Users/temanwana/Documents/MIT/Senior Year/14.33/Papers/Final Paper/Data"

import delimited full_data_combined_pt_mn.csv, clear

destring meanmathscore, replace force

gen sizeive = totalnumberofstudents/(floor((totalnumberofstudents-1)/mnumber)+1)



gen scaledmath3 = ((meanmathscore/10 - 46) - 1) * (99/30) + 1 if grade == 3
ivregress 2sls scaledmath3 totalnumberofstudents frlpercent title1 v24 (overallclasssizeaverage = sizeive) if (grade == 3 & programtype == "GEN ED") , cluster(schoolcode)

gen scaledmath4 = ((meanmathscore/10 - 47.5) - 1) * (99/31.5) + 1 if grade == 4
ivregress 2sls scaledmath4 totalnumberofstudents frlpercent title1 v24 (overallclasssizeaverage = sizeive) if (grade == 4 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledmath5 = ((meanmathscore/10 - 48.5) - 1) * (99/28.5) + 1 if grade == 5
ivregress 2sls meanmathscore totalnumberofstudents frlpercent title1 v24 (overallclasssizeaverage = sizeive) if (grade == 5 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledmath6 = ((meanmathscore/10 - 49) - 1) * (99/28) + 1 if grade == 6
ivregress 2sls scaledmath6 totalnumberofstudents frlpercent title1 v24 (overallclasssizeaverage = sizeive) if (grade == 6 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledmath7 = ((meanmathscore/10 - 49) - 1) * (99/30) + 1 if grade == 7
ivregress 2sls scaledmath7 totalnumberofstudents frlpercent title1 v24 (overallclasssizeaverage = sizeive) if (grade == 7 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledmath8 = ((meanmathscore/10 - 47) - 1) * (99/29.5) + 1 if grade == 8
ivregress 2sls scaledmath8 totalnumberofstudents frlpercent title1 v24 (overallclasssizeaverage = sizeive) if (grade == 8 & programtype == "GEN ED") , cluster(schoolcode)
