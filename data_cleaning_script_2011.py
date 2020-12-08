#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 13 11:28:18 2020

@author: temanwana
"""
import pandas as pd, math, numpy as np


def add_totals(school_codes, grade):
    """
    Parameters
    ----------
    school_codes : array of strings
        list of all the school codes
    grade : string
        grade level

    Returns
    -------
    None.
    
    Fills in the total number of students, total number of sections, and the overall class size average per grade for each school (class average across all
    program types, so each program type has same OVERALL CLASS SIZE AVERAGE VALUE).
    """
    for code in school_codes:
        total_students = df_grades.loc[(df_grades['SCHOOL CODE'] == code) & (df_grades['GRADE'] == grade), 'NUMBER OF STUDENTS / SEATS FILLED'].sum()
        df_grades.loc[(df_grades['SCHOOL CODE'] == code) & (df_grades['GRADE'] == grade), 'TOTAL NUMBER OF STUDENTS'] = total_students
        num_sections = df_grades.loc[(df_grades['SCHOOL CODE'] == code) & (df_grades['GRADE'] == grade), 'NUMBER OF SECTIONS'].sum()
        df_grades.loc[(df_grades['SCHOOL CODE'] == code) & (df_grades['GRADE'] == grade), 'TOTAL NUMBER OF SECTIONS'] = num_sections
        class_size_avg = total_students/num_sections
        df_grades.loc[(df_grades['SCHOOL CODE'] == code) & (df_grades['GRADE'] == grade), 'OVERALL CLASS SIZE AVERAGE'] = class_size_avg
        
        
def add_math_scores(school_DBNs, grade):
    """

    Parameters
    ----------
    school_DNBs : array of strings
        list of all the school DBN codes
    grade : TYPE
        grade level

    Returns
    -------
    None.

    Fills in the mean math scale score per grade for each school.
    """
    for dbn in school_DBNs:
        math_score = raw_math_df.loc[(raw_math_df['DBN'] == dbn) & (raw_math_df['Grade'] == grade) & (raw_math_df['Year'] == 2011), 'Mean Scale Score'].sum()
        df_grades.loc[(df_grades['SCHOOL CODE'] == dbn[2:]) & (df_grades['GRADE'] == grade), 'MEAN MATH SCORE'] = math_score
        
        
def add_ela_scores(school_DBNs, grade):
    """

    Parameters
    ----------
    school_DNBs : array of strings
        list of all the school DBN codes
    grade : TYPE
        grade level

    Returns
    -------
    None.

    Fills in the mean ela scale score per grade for each school.
    """
    for dbn in school_DBNs:
        ela_score = raw_ela_df.loc[(raw_ela_df['DBN'] == dbn) & (raw_ela_df['Grade'] == grade) & (raw_ela_df['Year'] == 2011), 'Mean Scale Score'].sum()
        df_grades.loc[(df_grades['SCHOOL CODE'] == dbn[2:]) & (df_grades['GRADE'] == grade), 'MEAN ELA SCORE'] = ela_score
        
        
def add_frl_percents(school_DBNs):
    """

    Parameters
    ----------
    school_DNBs : array of strings
        list of all the school DBN codes

    Returns
    -------
    None.

    Fills in the mean ela scale score per grade for each school.
    """
    for dbn in school_DBNs:
        frl_percent = raw_dem_df.loc[(raw_dem_df['DBN'] == dbn) & (raw_dem_df['schoolyear'] == 20102011), 'frl_percent'].sum()
        df_grades.loc[(df_grades['SCHOOL CODE'] == dbn[2:]), 'FRL PERCENT'] = frl_percent
        
        
def add_title1(school_DBNs):
    """

    Parameters
    ----------
    school_DNBs : array of strings
        list of all the school DBN codes

    Returns
    -------
    None.
    
    Fills in whether or not a school received Title 1 funding

    """
    for dbn in school_DBNs:
        title1_dummy = raw_sam_df.loc[(raw_sam_df['DBN'] == dbn), 'NT1=0'].sum()
        df_grades.loc[(df_grades['SCHOOL CODE'] == dbn[2:]), 'TITLE 1'] = title1_dummy
        
    
if __name__ == '__main__':
    # convert class size csv to pandas dataframe
    raw_df = pd.read_csv("Class Sizes/2010-2011_Class_Size_-_School-level_detail.csv")
    print(list(raw_df))
    print(type(raw_df['GRADE'][7]))
    
    
    # data of only looking at grades 3-8
    df_grades = raw_df[(raw_df['GRADE'] == '3') | (raw_df['GRADE'] == '4') | (raw_df['GRADE'] == '5') | (raw_df['GRADE'] == '6') | (raw_df['GRADE'] == '7')
                            | (raw_df['GRADE'] == '8')]
    
    # list of all the school codes for schools that have grades 3-8
    school_codes_list = df_grades['SCHOOL CODE'].unique()
    print(school_codes_list)
    
    # create columns that will contain the total number of students, total number of sections, and the overall class size averages per grade for each school
    df_grades['TOTAL NUMBER OF STUDENTS'] = pd.Series('empty', index=df_grades.index)
    df_grades['TOTAL NUMBER OF SECTIONS'] = pd.Series('empty', index=df_grades.index)
    df_grades['OVERALL CLASS SIZE AVERAGE'] = pd.Series('empty', index=df_grades.index)
    
    # fill in the total number of students, total number of sections, and the overall class size average per grade for each school
    for grade_num in range(3, 9):
        add_totals(school_codes_list, str(grade_num))
        
    
    # convert math score csv to pandas dataframe (maybe add column for percent at least Level 3)
    raw_math_df = pd.read_csv("Test Scores/2006_-_2011_NYS_Math_Test_Results_By_Grade_-_School_Level_-_All_Students.csv")
    
    # create column that will contain the mean scale math score per grade for each school
    df_grades['MEAN MATH SCORE'] = pd.Series('empty', index=df_grades.index)
    
    # list of all the school DBN codes for schools that have grades 3-8
    school_DBN_list = raw_math_df['DBN'].unique()
    
    # fill in the mean math scale score per grade for each school.
    for grade_num in range(3, 9):
        add_math_scores(school_DBN_list, str(grade_num))
        
    
    # convert ELA score csv to pandas dataframe (maybe add column for percent at least Level 3)
    raw_ela_df = pd.read_csv("Test Scores/2006_-_2011_English_Language_Arts__ELA__Test_Results_by_Grade_-_School_level_-_All_Students.csv")
    
    # create column that will contain the mean scale math score per grade for each school
    df_grades['MEAN ELA SCORE'] = pd.Series('empty', index=df_grades.index)
    
    # list of all the school DBN codes for schools that have grades 3-8
    school_DBN_ela_list = raw_ela_df['DBN'].unique()
    
    # fill in the mean math scale score per grade for each school.
    for grade_num in range(3, 9):
        add_ela_scores(school_DBN_ela_list, str(grade_num))
        
    
    # convert demographics csv to pandas dataframe (maybe add column for percent at least Level 3)
    raw_dem_df = pd.read_csv("Controls & Demographics/2006_-_2012_School_Demographics_and_Accountability_Snapshot.csv")
    
    # create column that will contain the percent of students who qualify for free or reduced priced lunch in that school
    df_grades['FRL PERCENT'] = pd.Series('empty', index=df_grades.index)
    
    # list of all the school DBN codes for schools that have grades 3-8
    school_DBN_dem_list = raw_dem_df['DBN'].unique()
    
    # fill in the mean math scale score per grade for each school.
    add_frl_percents(school_DBN_dem_list)
    
    
    # convert school allocation memorandum csv to pandas dataframe (maybe add column for percent at least Level 3)
    raw_sam_df = pd.read_csv("Controls & Demographics/sam09_new.csv")
    
    # create column that will contain a dummy for whether the school was Title 1 or not
    df_grades['TITLE 1'] = pd.Series('empty', index=df_grades.index)
    
    # list of all the school DBN codes for schools that have grades 3-8
    school_DBN_sam_list = raw_sam_df['DBN'].unique()
    
    # fill in the dummy of whether the school was Title 1 or not for each school.
    add_title1(school_DBN_sam_list)
    
    
    # create column that will contain a dummy for whether the data is from academic year 2010-2011
    df_grades['2011'] = pd.Series(1, index=df_grades.index)
    
    
    # export data as CSV
    df_grades.to_csv("full_data_2011.csv", sep=',', index=False)

    
    
    