cd "/Users/temanwana/Documents/MIT/Senior Year/14.33/Papers/Final Paper/Data"

import delimited full_data_combined_pt_mn.csv, clear 

destring meanelascore, replace force

gen class2 = overallclasssizeaverage^2



gen scaledela3 = ((meanelascore/10 - 46.5) - 1) * (99/30.5) + 1 if grade == 3

regress scaledela3 overallclasssizeaverage v24 if (grade == 3 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledela4 = ((meanelascore/10 - 42) - 1) * (99/34.5) + 1 if grade == 4

regress scaledela4 overallclasssizeaverage v24 if (grade == 4 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledela5 = ((meanelascore/10 - 48.5) - 1) * (99/30) + 1 if grade == 5

regress scaledela5 overallclasssizeaverage v24 if (grade == 5 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledela6 = ((meanelascore/10 - 47) - 1) * (99/30.5) + 1 if grade == 6

regress scaledela6 overallclasssizeaverage v24 if (grade == 6 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledela7 = ((meanelascore/10 - 46) - 1) * (99/32) + 1 if grade == 7

regress scaledela7 overallclasssizeaverage v24 if (grade == 7 & programtype == "GEN ED") , cluster(schoolcode)


gen scaledela8 = ((meanelascore/10 - 42) - 1) * (99/36) + 1 if grade == 8

regress scaledela8 overallclasssizeaverage v24 if (grade == 8 & programtype == "GEN ED") , cluster(schoolcode)
