#!/usr/bin/env python
# coding: utf-8

# # Creation of the Training and Test Data Sets (WML Project)

# Let's import all necessary **libraries**!

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt
import datetime as dt
import glob


# From all the available NYC CitiBike Data (105 months, from June 2013 till February 2022), 80% will be kept for training and 20% for test.

# 1. Building the first colum and rows (84 months) for the **training set** (21 months) for the **test set** in two different data frames with the right date format.

# In[2]:


dates_trn = pd.date_range(start = "2013-06-01", end = "2020-05-01", freq='MS')
df_training = pd.DataFrame({'dates':dates_trn})
df_training.head()


# In[3]:


dates_test = pd.date_range(start = "2020-06-01", end = "2022-02-01", freq='MS')
df_test = pd.DataFrame({'dates':dates_test})
df_test.head()


# 2. Incorporating the **NYC CitiBike Data** (Number of Trips per month) to the corresponding data frames (training and test). Source: *https://s3.amazonaws.com/tripdata/index.html*

# In[4]:


path_trn = "data_bikes/training/"
all_files = glob.glob(path_trn + "*.csv")
all_files.sort()

num_trips = []
for filename in all_files:
    df_01 = pd.read_csv(filename)
    df_02 = len(df_01)
    num_trips.append(df_02)

df_training["trips"] = num_trips  
df_training


# In[6]:


path_tst = "data_bikes/test/"
all_files_02 = glob.glob(path_tst + "*.csv")
all_files_02.sort()

num_trips_tst = []
for filename_tst in all_files_02:
    df_tst_01 = pd.read_csv(filename_tst)
    df_tst_02 = len(df_tst_01)
    num_trips_tst.append(df_tst_02)

df_test["trips"] = num_trips_tst  
df_test


# 4. Reading and editing **NYC monthly historical weather data** (precipitation and temperature).
# Source: *https://www.weather.gov/wrh/Climate?wfo=okx*

# In[7]:


rain_raw = pd.read_csv("weather_data/monthly_rainfall_average_nyc.csv")
rain = rain_raw.transpose()
rain.columns = rain.iloc[0]
rain = rain.reset_index(drop=True)
rain = rain.drop(0)

temp_raw = pd.read_csv("weather_data/monthly_average_temp_nyc.csv")
temp = temp_raw.transpose()
temp.columns = temp.iloc[0]
temp = temp.reset_index(drop=True)
temp = temp.drop(0)
rain


# In[8]:


#export inverted
rain.to_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/weather_data/rain_m.csv', index = False, header = True)
temp.to_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/weather_data/temp_m.csv', index = False, header = True)


# 5. **Adding** the weather data to the corresponding data frames and **exporting** it.

# In[9]:


rain_training = pd.read_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/weather_data/rain_training.csv')
rain_test = pd.read_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/weather_data/rain_test.csv')
temp_training = pd.read_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/weather_data/temp_traing.csv')
temp_test = pd.read_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/weather_data/temp_test.csv')

df_training['Rain'] = rain_training['month_average_training']
df_training['Temperature'] = temp_training['monthly_av_training']
df_test['Rain'] = rain_test['month_average_test']
df_test['Temperature'] = temp_test['monthly_av_test']

df_training.to_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/training.csv', index = False, header = True)
df_test.to_csv('/Users/alexherrera/Desktop/JupiterNotebook/Bicing_Prediction_WML/test.csv', index = False, header = True)

