#!/usr/bin/env python
# coding: utf-8

# 
# 1. Скачайте датасет fifаs2.сsv. Проанализируйте его и определите, какие данные являются неполными. Удалите
# ненужные колонки и недостающие значения.
# 
# 2. Найдите в датафрейме полные дубликаты и удалите их. Значения могут быть одинаковыми, но написаны по-разному. Например, может отличаться размер регистра (заглавные и строчные буквы). Особое внимание уделить колонке с названиями команд.
# 
# 3. Напишите функцию, которая добавит колонку с разбиением возраста по группам: до 20, от 20 до 30, от 30 до
# 36 и старше 36. Посчитайте количество футболистов в каждой категории

# In[74]:


import pandas as pd
import numpy as np
df = pd.read_csv("fifa_s2.csv")
df.head()


# In[75]:


df.info()


# In[76]:


df.describe()


# In[77]:


df.isna().sum()


# In[78]:


df = df.dropna()
df.head()


# In[79]:


df.isna().sum()


# In[81]:


df.duplicated().sum()


# In[80]:


df.drop('Potential', axis=1, inplace= True )
df.head()


# In[87]:


def count_age(arg):
    if arg['Age'] <= 20:
        return 'Grupp_20'
    elif 20 < arg['Age'] <= 30:
        return 'Grupp_20_30'
    elif arg['Age'] > 30:
        return 'Grupp_30_and_more'
    else:
        return 'Unknoun'
        




# In[92]:


df['Grupp_age'] = df.apply(count_age, axis=1)
df.head()


# In[ ]: