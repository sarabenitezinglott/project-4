import pandas as pd

def import_tables():
    A1 = pd.read_csv("data/MYDATA/A1.csv",sep=";")
    A2 = pd.read_csv("data/MYDATA/A2.csv",sep=";")
    A3 = pd.read_csv("data/MYDATA/A3.csv",sep=";")
    A4 = pd.read_csv("data/MYDATA/A4.csv",sep=";")
    A5 = pd.read_csv("data/MYDATA/A5.csv",sep=";")
    A6 = pd.read_csv("data/MYDATA/A6.csv",sep=";")
    A7 = pd.read_csv("data/MYDATA/A7.csv",sep=";")
    A8 = pd.read_csv("data/MYDATA/A8.csv",sep=";")
    A9 = pd.read_csv("data/MYDATA/A9.csv",sep=";")
    A10 = pd.read_csv("data/MYDATA/A10.csv",sep=";")

    C1 = pd.read_csv("data/MYDATA/C1.csv",sep=";")
    C2 = pd.read_csv("data/MYDATA/C2.csv",sep=";")
    C3 = pd.read_csv("data/MYDATA/C3.csv",sep=";")
    C4 = pd.read_csv("data/MYDATA/C4.csv",sep=";")
    C5 = pd.read_csv("data/MYDATA/C5.csv",sep=";")
    C6 = pd.read_csv("data/MYDATA/C6.csv",sep=";")
    C7 = pd.read_csv("data/MYDATA/C7.csv",sep=";")
    C8 = pd.read_csv("data/MYDATA/C8.csv",sep=";")
    C9 = pd.read_csv("data/MYDATA/C9.csv",sep=";")
    C10 = pd.read_csv("data/MYDATA/C10.csv",sep=";")
    C11 = pd.read_csv("data/MYDATA/C11.csv",sep=";")
    C12 = pd.read_csv("data/MYDATA/C12.csv",sep=";")
    C13 = pd.read_csv("data/MYDATA/C13.csv",sep=";")
    C14 = pd.read_csv("data/MYDATA/C14.csv",sep=";")
    C15 = pd.read_csv("data/MYDATA/C15.csv",sep=";")
    C16 = pd.read_csv("data/MYDATA/C16.csv",sep=";")

    return A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16

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
    pd.concat(dataframes,axis = 0)
