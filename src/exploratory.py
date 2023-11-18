import pandas as pd

def exploration(df):
    head = df.head()
    info = df.info()
    nulls = df.isnull().sum()

    return head, info, nulls