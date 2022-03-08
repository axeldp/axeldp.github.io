#!/usr/bin/env python
# coding: utf-8

# # Innovation Group Statistics Refresher

# Let's import all necessary **libraries**!

# In[ ]:


from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import schedule
import time


# **First step** is to execute the **Selenium driver** for the browser used, in this case it's Chorme (the path of the file is needed in order to execute it). **After** we need to acces the **URL** where the live team production statistics are displayed and wait 10 seconds for the page loading.

# In[ ]:


driver = webdriver.Chrome('local/user/desktop/chromdriver.exe')

driver.get("http://innovationgroup.com/prductionstats")

time.sleep(10)


# **Next step** is to find with Selenium the **'username'** and **'password'** fields and type the info in. We also have to look out for the adequate button ID to **validate the credentials** and click it.

# In[ ]:


username = driver.find_element_by_id("username")
password = driver.find_element_by_id("password")

username.send_keys("YourUsername")
password.send_keys("PassworD")

driver.find_element_by_name("submit").click()


# We define here then the Selenium **Function** that will refresh our desired URL and **schedule** it to refresh every 1 minute.

# In[ ]:


def func():
    driver.refresh()

schdule.every(1).minutes.do(func)


# Finally a **loop** is created in order to run the schedule function **non-stop**. Quiting the script will be done manually when the working day is over.

# In[ ]:


while True:
    schdule.run_pending()
    time.sleep(1)

