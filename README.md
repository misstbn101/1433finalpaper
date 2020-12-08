# 1433finalpaper

Table of Contents
---------------------

 * Introduction
 * Requirements
 * Recommended modules
 * Installation
 * Data & File Organization
 * Data Description
 * Data Analysis
 * Configuration
 * Troubleshooting
 * FAQ
 * Maintainers
 
 
 ## Introduction
 There is a common belief amongst the general public that smaller class sizes yield a better educational experience for students. However, previous studies come to a less decisive conclusion. In this study, I analyze the average test scores, average class sizes, and other school characteristics of 3rd through 8th graders in New York City public schools during the 2009-2010 and 2010-2011 academic years. I also observe the use of a modified Maimonides' rule as a method for class divisions in the analysis. 
 
 
 ## Data & Script Organization
 This folder contains the data and scripts used to conduct the analysis of the study. Unless it was altered in a script, the data in the csv files is exactly as it was pulled, save a few variable name changes.
 
 ### Data
 * 2009_-_2010_Class_Size_-_School-level_Detail.csv: contains information on average class size and ICT and G&T programs by grade by school in the 2009-2010 school year
 * 2010-2011_Class_Size_-_School-level_detail.csv: contains information on average class size and ICT and G&T programs by grade by school in the 2010-2011 school year
 * 2006_-_2011_NYS_Math_Test_Results_By_Grade_-_School_Level_-_All_Students.csv: contains average math test scores by grade by school
 * 2006_-_2011_English_Language_Arts__ELA__Test_Results_by_Grade_-_School_level_-_All_Students.csv: contains average English Language Arts (ELA) test scores by grade by school
 * sam10.csv: contains whether a school received Title 1 funding in the 2009-2010 school year
 * sam09_new.csv: contains whether a school received Title 1 funding in the 2010-2011 school year
 * 2006_-_2012_School_Demographics_and_Accountability_Snapshot.csv: contains percentage of school body in the Free & Reduced Lunch program by school
 
 ### Scripts
 
 
 
 ## Data Description
Data was aggregated from the City of New York’s Open Data archives and NYC Department of Education. It provides information on class size averages, mean standardized test scores, enrollment, poverty statistics, and other school characteristics. The data can be used to estimate how different factors affect academic performance at the grade level. This study only looks at the information for grades 3 through 8 from the 2009-2010 and 2010-2011 academic years. These are the only grades and years following the 2009 class limit regulations that have enough consistent information to perform accurate regressions. 1,092 schools were surveyed, totaling 30,201 classrooms over the 2 years.


## Data Dictionary of Necessary Variables

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
* **raw_cit_sum** = Count of raw citations for all databases within each citation quartile (for 1991-2012 only)



