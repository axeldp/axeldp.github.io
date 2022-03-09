#!/usr/bin/env python
# coding: utf-8

# # 1 Minute Chart Bitcoin Trading Stratgy Data Analysis

# Let's import all necessary **libraries** and read the **data**!

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
df = pd.read_csv('btc_strategy_demo.csv')
df


# Is the data format adequate? I used Pandas .dtypes to know what type of data is in the csv file.

# In[2]:


df.dtypes


# There is no need to have the **first row** on the data set, since it doesn'r represent a trade itself and would distort the averages and further calculations. I use Panda's .iloc in order to drop rows.

# In[3]:


df = df.iloc[1:]
df.head()


# ## Plot 1 
# **Portfolio Value Over 30 Days in Euros**

# In[4]:


sns.set_theme(style="darkgrid")
sns.lineplot(x="Day", y="Total", data=df, ci=None).set(title='Portfolio Value Over 30 Days in €')
plt.savefig("value_evolution.png",format='png',dpi=300)


# ## Plot 2
# **Percentaje of Wins and Loses in Positions taken**
# First I need to calculate how many positions generated profit (.gt(0)  --> greater than Zero) and how many generted loses (.lt(0) --> lower than Zero). A data frame is created in order to plot it.

# In[5]:


positive = df['Result'].gt(0).sum()
negative = df['Result'].lt(0).sum()
data = [positive,negative]

labels = ["Wins","Loses"]
colors = sns.color_palette('pastel')[0:2]
plt.pie(data, labels = labels, colors = colors, autopct='%.0f%%')
plt.savefig("wins_loses.png",format='png',dpi=300)
plt.show()


# In order to create the next plot, a **new data frame** is created where we can observe in one column the **average benefit each day** and another colum where the **total average benefit** is showed.

# In[6]:


final = []
for day in range (1,31):
    df_new =df[df['Day'] == day]
    df_new['Avg_Benefit_Day'] = df_new['Benefit'].mean()
    final.append(df_new)
    
final_df = pd.concat(final, ignore_index=True)

avg_benf_df = final_df[['Day','Avg_Benefit_Day']].drop_duplicates()
avg_benf_df['Avg_Total'] = avg_benf_df['Avg_Benefit_Day'].mean()
avg_benf_df['Zero_Line'] = 0
avg_benf_df.head()


# ## Plot 3
# **Average Benefits Obtained each Day & Total Average in €**

# In[7]:


fig = plt.figure
ax1 = plt.subplot(111)
plt.title("Average Benefits Obtained each Day & Total Average in €")
ax1.plot(avg_benf_df.Day, avg_benf_df.Avg_Benefit_Day, linewidth=2, label='Daily Average')
ax1.plot(avg_benf_df.Day, avg_benf_df.Avg_Total, '--', label='Total Average')
plt.xlabel("Days")
plt.ylabel("Euros")
plt.legend(loc='best')
ax1.plot(avg_benf_df.Day, avg_benf_df.Zero_Line, color='k', linewidth=0.7)
plt.savefig("average_graph.png",format='png',dpi=300)
plt.show()


# Final calculations for the **Return Of Investment** over the 30 days, a posible **Annual Percentage Yield** and the **average number of positions** taken every day.

# In[8]:


final = df.at[123,'Total']
roi = (((final)-10000)*100)/10000
roi


# In[9]:


apy = (roi*365)/30
apy


# In[10]:


day_count = df.pivot_table(columns=['Day'], aggfunc='size')
day_count = day_count.reset_index()
day_count[0].mean()

