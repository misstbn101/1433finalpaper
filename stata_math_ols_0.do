cd "/Users/temanwana/Documents/MIT/Senior Year/14.33/Papers/Final Paper/Data"

import delimited full_data_combined_pt_mn.csv, clear

destring meanmathscore, replace force


// all significant, grades 4 and 5, somewhat substantial 10 less kids, 10 more points, but very expensive

gen scaledmath3 = ((meanmathscore/10 - 46) - 1) * (99/30) + 1 if grade == 3
regress scaledmath3 overallclasssizeaverage v24 if (grade == 3 & programtype == "GEN ED") , cluster(schoolcode)

gen scaledmath4 = ((meanmathscore/10 - 47.5) - 1) * (99/31.5) + 1 if grade == 4
regress scaledmath4 overallclasssizeaverage v24 if (grade == 4 & programtype == "GEN ED") , cluster(schoolcode)

gen scaledmath5 = ((meanmathscore/10 - 48.5) - 1) * (99/28.5) + 1 if grade == 5
regress scaledmath5 overallclasssizeaverage v24 if (grade == 5 & programtype == "GEN ED") , cluster(schoolcode)

gen scaledmath6 = ((meanmathscore/10 - 49) - 1) * (99/28) + 1 if grade == 6
regress scaledmath6 overallclasssizeaverage v24 if (grade == 6 & programtype == "GEN ED") , cluster(schoolcode)

gen scaledmath7 = ((meanmathscore/10 - 49) - 1) * (99/30) + 1 if grade == 7
regress scaledmath7 overallclasssizeaverage v24 if (grade == 7 & programtype == "GEN ED") , cluster(schoolcode)

gen scaledmath8 = ((meanmathscore/10 - 47) - 1) * (99/29.5) + 1 if grade == 8
regress scaledmath8 overallclasssizeaverage v24 if (grade == 8 & programtype == "GEN ED") , cluster(schoolcode)
