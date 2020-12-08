#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov  5 07:38:04 2020

@author: temanwana
"""

import pandas as pd, math, numpy as np


# convert 2009-2010 full data csv to pandas dataframe
full_data_2010 = pd.read_csv("full_data_2010.csv")

# convert 2010-2011 full data csv to pandas dataframe (changed column name BOROUGH --> BORO)
full_data_2011 = pd.read_csv("full_data_2011.csv")

# convert 2010-2011 full data csv to pandas dataframe
middle_schools = pd.read_csv("2018_DOE_Middle_School_Directory.csv")


# combine full data csv's into 1
full_data_complete = pd.concat([full_data_2010, full_data_2011], ignore_index=True)

school_DBN_list = full_data_complete['SCHOOL CODE'].unique()

# create column that will contain dummy for whether the grade for that school had a CTT class
full_data_complete['CTT'] = pd.Series(0, index=full_data_complete.index)

# create column that will contain dummy for whether the grade for that school had a G&T class
full_data_complete['GT'] = pd.Series(0, index=full_data_complete.index)

for code in school_DBN_list:
    for grade in [3,4,5,6,7,8]:
        for year in [0,1]:
            ctt_dummy = full_data_complete.loc[(full_data_complete['SCHOOL CODE'] == code) & (full_data_complete['GRADE'] == grade) 
                                                           & (full_data_complete['2011'] == year) & (full_data_complete['PROGRAM TYPE'] == "CTT"), 'PROGRAM TYPE']
            if not(ctt_dummy.empty):
                full_data_complete.loc[(full_data_complete['SCHOOL CODE'] == code) & (full_data_complete['GRADE'] == grade) 
                                                           & (full_data_complete['2011'] == year), 'CTT'] = 1
                
for code in school_DBN_list:
    for grade in [3,4,5,6,7,8]:
        for year in [0,1]:
            gt_dummy = full_data_complete.loc[(full_data_complete['SCHOOL CODE'] == code) & (full_data_complete['GRADE'] == grade) 
                                                           & (full_data_complete['2011'] == year) & (full_data_complete['PROGRAM TYPE'] == "G&T"), 'PROGRAM TYPE']
            if not(gt_dummy.empty):
                full_data_complete.loc[(full_data_complete['SCHOOL CODE'] == code) & (full_data_complete['GRADE'] == grade) 
                                                           & (full_data_complete['2011'] == year), 'GT'] = 1
                
# create column that will contain the Maimonide's number for the grade for each school
full_data_complete['M NUMBER'] = pd.Series(32, index=full_data_complete.index)

school_DBN_ms_list = middle_schools['schooldbn'].unique()

for code in school_DBN_ms_list:
    full_data_complete.loc[(full_data_complete['SCHOOL CODE'] == code[2:]) & (full_data_complete['TITLE 1'] == 0), 'M NUMBER'] = 33
    
for code in school_DBN_ms_list:
    full_data_complete.loc[(full_data_complete['SCHOOL CODE'] == code[2:]) & (full_data_complete['TITLE 1'] == 1), 'M NUMBER'] = 30


# export data as CSV
# full_data_complete.to_csv("full_data_combined.csv", sep=',', index=False)

# export data as CSV
# full_data_complete.to_csv("full_data_combined_ctt.csv", sep=',', index=False)

# export data as CSV
# full_data_complete.to_csv("full_data_combined_pt.csv", sep=',', index=False)

# export data as CSV
full_data_complete.to_csv("full_data_combined_pt_mn.csv", sep=',', index=False)


# # deleting unecessary rows 
# def del_unec(school_codes):
#     for code in school_codes:
#         res = full_data_complete[full_data_complete['ID'].str[0] == 'T'].groupby('sku')['ID'].nunique()