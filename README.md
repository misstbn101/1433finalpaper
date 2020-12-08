# 1433finalpaper

Table of Contents
---------------------

 * Introduction
 * Data Description
 * Data Analysis
 
 
 
 ## Introduction
 There is a common belief amongst the general public that smaller class sizes yield a better educational experience for students. However, previous studies come to a less decisive conclusion. In this study, I analyze the average test scores, average class sizes, and other school characteristics of 3rd through 8th graders in New York City public schools during the 2009-2010 and 2010-2011 academic years. I also observe the use of a modified Maimonides' rule as a method for class divisions in the analysis. 

 
 
 ## Data Description
Data was aggregated from the City of New York’s Open Data archives and NYC Department of Education. It provides information on class size averages, mean standardized test scores, enrollment, poverty statistics, and other school characteristics. The data can be used to estimate how different factors affect academic performance at the grade level. This study only looks at the information for grades 3 through 8 from the 2009-2010 and 2010-2011 academic years. These are the only grades and years following the 2009 class limit regulations that have enough consistent information to perform accurate regressions. 1,092 schools were surveyed, totaling 30,201 classrooms over the 2 years. Unless it was altered in a script, the data in the csv files is exactly as it was pulled, save a few variable name changes.


 ### Data Files
 * 2009_-_2010_Class_Size_-_School-level_Detail.csv: contains information on average class size and ICT and G&T programs by grade by school in the 2009-2010 school year
 * 2010-2011_Class_Size_-_School-level_detail.csv: contains information on average class size and ICT and G&T programs by grade by school in the 2010-2011 school year
 * 2006_-_2011_NYS_Math_Test_Results_By_Grade_-_School_Level_-_All_Students.csv: contains average math test scores by grade by school
 * 2006_-_2011_English_Language_Arts__ELA__Test_Results_by_Grade_-_School_level_-_All_Students.csv: contains average English Language Arts (ELA) test scores by grade by school
 * sam10.csv: contains whether a school received Title 1 funding in the 2009-2010 school year
 * sam09_new.csv: contains whether a school received Title 1 funding in the 2010-2011 school year
 * 2006_-_2012_School_Demographics_and_Accountability_Snapshot.csv: contains percentage of school body in the Free & Reduced Lunch program by school


### Data Dictionary of Necessary Variables

#### Variables for 2009_-_2010_Class_Size_-_School-level_Detail.csv
* "SCHOOL CODE": school's unique code ID
* "GRADE": grade level
* "PROGRAM TYPE": class's program type (ie, "GEN ED", "GT")
* "NUMBER OF CLASSES": number of classes
* "TOTAL REGISTER": student enrollment
* "AVERAGE CLASS SIZE": average class size

#### Variables for 2010-2011_Class_Size_-_School-level_detail.csv
* "SCHOOL CODE": school's unique code ID
* "GRADE": grade level
* "PROGRAM TYPE": class's program type (ie, "GEN ED", "GT")
* "NUMBER OF SECTIONS": number of classes
* "NUMBER OF STUDENTS / SEATS FILLED": student enrollment
* "AVERAGE CLASS SIZE": average class size

#### Variables for 2006_-_2011_NYS_Math_Test_Results_By_Grade_-_School_Level_-_All_Students.csv
* "DBN": school's unique DBN code (can be matched with code ID)
* "Grade": grade level
* "Year": school year
* "Mean Scale Score": average scaled math score

#### Variables for 2006_-_2011_English_Language_Arts__ELA__Test_Results_by_Grade_-_School_level_-_All_Students.csv
* "DBN": school's unique DBN code (can be matched with code ID)
* "Grade": grade level
* "Year": school year
* "Mean Scale Score": average scaled math score

#### Variables for sam10.csv
* "DBN": school's unique DBN code (can be matched with code ID)
* "NT1=0": dummy variable for whether or not the school received Title 1 funding (1: yes)

#### Variables for sam09_new.csv
* "DBN": school's unique DBN code (can be matched with code ID)
* "NT1=0": dummy variable for whether or not the school received Title 1 funding (1: yes)

#### Variables for 2006_-_2012_School_Demographics_and_Accountability_Snapshot.csv
* "DBN": school's unique DBN code (can be matched with code ID)
* "schoolyear"" school year
* "frl_percent": percent of school body in the Free & Reduced Lunch program


## Data Analysis

#### Programs used:
* Python 3.8.3 (default, Jul  2 2020, 11:26:31)
* [Clang 10.0.0 ] :: Anaconda, Inc. on darwin
* Platform: x86_64-apple-darwin13.4.0 (64-bit)
* Running under: OS X Catalina 10.15.6
* Attached base packages:
  * pandas
* Stata/SE 16.1 for Mac (64-bit Intel)
* Revision 30 Jun 2020
* Running under: OS X Catalina 10.15.6
* Attached base packages:
  * expand
  * ivregress
  * tabstat
  * twoway

#### There are several scripts that work sequentially (folder organized differently on local computer, so check files to see if changes need to be made in order for scripts to run):

**STEP 1: Run data_cleaning_script_2010.py** Purpose: clean and combine all data for the 2009-2010 academic year
   * Program(s): Python
   * Package(s): pandas
   * Input file(s):  2009_-_2010_Class_Size_-_School-level_Detail.csv, 2006_-_2011_NYS_Math_Test_Results_By_Grade_-_School_Level_-_All_Students.csv, 2006_-_2011_English_Language_Arts__ELA__Test_Results_by_Grade_-_School_level_-_All_Students.csv, Controls & Demographics/2006_-_2012_School_Demographics_and_Accountability_Snapshot.csv, sam10.csv
   * Output file(s): full_data_2010.csv

**STEP 2: Run data_cleaning_script_2011.py** Purpose: clean and combine all data for the 2010-2011 academic year
   * Program(s): Python
   * Package(s): pandas
   * Input file(s):  2010-2011_Class_Size_-_School-level_detail.csv, 2006_-_2011_NYS_Math_Test_Results_By_Grade_-_School_Level_-_All_Students.csv, 2006_-_2011_English_Language_Arts__ELA__Test_Results_by_Grade_-_School_level_-_All_Students.csv, Controls & Demographics/2006_-_2012_School_Demographics_and_Accountability_Snapshot.csv, sam09_new.csv
   * Output file(s): full_data_2011.csv

**STEP 3: Run data_combining_script.py** Purpose: clean and combine created 2009-2010 AY and 2010-2011 AY datasets
   * Program(s): Python
   * Package(s): pandas
   * Input file(s): full_data_2010.csv, full_data_2011.csv
   * Output file(s): full_data_combined_pt_mn.csv
   
**STEP 4: Run stata_data.do** Purpose: get statistics from data to create Table I
   * Program(s): Stata/SE
   * Package(s): expand, tabstat
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 5: Run stata_1st_stage.do** Purpose: create graphs for Figures I and II
   * Program(s): Stata/SE
   * Package(s): twoway
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): graphs to save as you will
   
**STEP 6: Run stata_math_ols_x.do (x: 0-4)** Purpose: perfrom OLS regression and find estimates for class size average effects on average math scores with x covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 7: Run stata_math_ols.do** Purpose: perfrom OLS regression and find estimates for class size average effects on average math scores with all covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 8: Run stata_ela_ols_x.do (x: 0-4)** Purpose: perfrom OLS regression and find estimates for class size average effects on average ELA scores with x covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 9: Run stata_ela_ols.do** Purpose: perfrom OLS regression and find estimates for class size average effects on average ELA scores with all covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 10: Run stata_math_ive_x.do (x: 0-4)** Purpose: perfrom 2SLS regression and find estimates for class size average effects on average math scores with x covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 11: Run stata_math_ive.do** Purpose: perfrom 2SLS regression and find estimates for class size average effects on average math scores with all covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None

**STEP 12: Run stata_ela_ive_x.do (x: 0-4)** Purpose: perfrom 2SLS regression and find estimates for class size average effects on average ELA scores with x covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
   
**STEP 13: Run stata_ela_ive.do** Purpose: perfrom 2SLS regression and find estimates for class size average effects on average ELA scores with all covariates, values used to help create Tables IIIa-f
   * Program(s): Stata/SE
   * Package(s): None
   * Input file(s): full_data_combined_pt_mn.csv
   * Output file(s): None
