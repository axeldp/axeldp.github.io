{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf610
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red0\green0\blue0;\red10\green82\blue135;
\red29\green38\blue43;\red251\green0\blue129;\red18\green139\blue2;\red109\green109\blue109;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\csgray\c0\c0;\cssrgb\c0\c40000\c60000;
\cssrgb\c15294\c19608\c22353;\cssrgb\c100000\c7843\c57647;\cssrgb\c0\c60000\c0;\cssrgb\c50196\c50196\c50196;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl352\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 from selenium import webdriver\
import\strokec5  \cf2 \strokec2 schedule\cf2 \strokec5 \
\strokec4 import\strokec5  \cf2 \strokec2 time\cf2 \strokec5 \
\
\pard\pardeftab720\sl320\partightenfactor0

\f1\fs26 \cf2 \cb1 \strokec2 driver = webdriver.Chrome(\'91local/executable/path\'92)\
driver.get("http://innovation.group.com/productionstats\'94)\
time.sleep(5)\
\pard\pardeftab720\sl352\partightenfactor0

\f0\fs24 \cf2 \cb3 \strokec5 \'a0\'a0\
\strokec4 def\strokec5  \cf2 \strokec2 func():\cf2 \strokec5 \
\'a0\'a0\'a0\'a0\strokec6 driver.refersh()\strokec5 \
\'a0\'a0\
\pard\pardeftab720\sl352\partightenfactor0
\cf2 \strokec2 schedule.every(\cf2 \strokec7 1\cf2 \strokec2 ).minutes.do(func)\cf2 \strokec5 \
\'a0\'a0\
\pard\pardeftab720\sl352\partightenfactor0
\cf2 \strokec4 while\strokec5  \strokec8 True\cf2 \strokec2 :\cf2 \strokec5 \
\'a0\'a0\'a0\'a0\cf2 \strokec2 schedule.run_pending()\cf2 \strokec5 \
\'a0\'a0\'a0\'a0\cf2 \strokec2 time.sleep(\cf2 \strokec7 1\cf2 \strokec2 )\cf2 \strokec5 \
}