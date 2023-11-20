import pandas as pd

def import_tables():
    A1 = pd.read_csv("data/MYDATA/A1.csv",sep=";")
    A2 = pd.read_csv("data/MYDATA/A2.csv",sep=";")
    A3 = pd.read_csv("data/MYDATA/A3.csv",sep=";")
    A4 = pd.read_csv("data/MYDATA/A4.csv",sep=";")
    A5 = pd.read_csv("data/MYDATA/A5.csv",sep=";")
  
    Aa1 = pd.read_csv("data/MYDATA/Aa170.csv",sep=";")
    Aa2 = pd.read_csv("data/MYDATA/Aa172.csv",sep=";")
    Aa3 = pd.read_csv("data/MYDATA/Aa174.csv",sep=";")
    Aa4 = pd.read_csv("data/MYDATA/Aa175.csv",sep=";")
    Aa5 = pd.read_csv("data/MYDATA/Aa176.csv",sep=";")

    C1 = pd.read_csv("data/MYDATA/C1.csv",sep=";")
    C2 = pd.read_csv("data/MYDATA/C2.csv",sep=";")
    C3 = pd.read_csv("data/MYDATA/C3.csv",sep=";")
    C4 = pd.read_csv("data/MYDATA/C4.csv",sep=";")
    C5 = pd.read_csv("data/MYDATA/C5.csv",sep=";")
    C6 = pd.read_csv("data/MYDATA/C6.csv",sep=";")
    C7 = pd.read_csv("data/MYDATA/C7.csv",sep=";")
    C8 = pd.read_csv("data/MYDATA/C8.csv",sep=";")
    C9 = pd.read_csv("data/MYDATA/C9.csv",sep=";")

    Cc1 = pd.read_csv("data/MYDATA/Cc317.csv",sep=";")
    Cc2 = pd.read_csv("data/MYDATA/Cc319.csv",sep=";")
    Cc3 = pd.read_csv("data/MYDATA/Cc322.csv",sep=";")
    Cc4 = pd.read_csv("data/MYDATA/Cc325.csv",sep=";")
    Cc5 = pd.read_csv("data/MYDATA/Cc326.csv",sep=";")
   
    return A1,A2,A3,A4,A5,Aa1,Aa2,Aa3,Aa4,Aa5,C1,C2,C3,C4,C5,C6,C7,C8,C9,Cc1,Cc2,Cc3,Cc4,Cc5

def drop_first_column(df):
    df.drop(df.columns[0], inplace = True, axis=1)
    return df

#Now that we cleaned each table, we need only those table that have S1 and S2 stimulis to be matching, or just S1 to be present. 
#For this aim we need to make a for loop inside the matching conditions column, and return True, or False:
    # True: S1 obj or S2 match
    # False: S2 nomatch

def matching_condition(df, df_name):
    for i in df["matching condition"]:
        if i == "S1 obj" or i == "S2 match":
            return
    return f"{df_name} is S2 nomatch, table not useful"


def concat_df(dataframes):
    concatenated_df = pd.concat(dataframes, axis=0, ignore_index=True)
    return concatenated_df

#The info from the database, there are some unknown leads positions, so they need to be removed from the database

def delete_and_repacements_leads(df):
    mask = (df["sensor position"] == "X") | (df["sensor position"] == "Y") | (df["sensor position"] == "nd")
    df.drop(df[mask].index, inplace=True)
    df["sensor position"].replace({"AF1": "AF3", "AF2": "AF4", "PO1": "PO3", "PO2": "PO4"}, inplace=True)
    return df