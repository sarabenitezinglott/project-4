import numpy as np
import pandas as pd
from tqdm import tqdm  #Faster for loops
from matplotlib import pyplot as plt
import mne
from warnings import simplefilter

#For a correct visualization we must transpose the data 
#Data pre-processing:
    #1. Transpose data so in each row we have the all the electrical activity of one sigle lead,
    #so we can visualize all the sensor electrical activity at once.

def transpose(df):
    print(df.columns)

    transpose_df_list = []
    for i in tqdm(df.groupby(["name", "trial number", "matching condition", "sensor position", "subject identifier"])):
        _df = pd.DataFrame(i[1]["sensor value"]).T
        _df.columns = [f'sample_{j}' for j in range(256)]
        _df["name"] = i[0][0]
        _df["trial number"] = i[0][1]
        _df["matching condition"] = i[0][2]
        _df["sensor position"] = i[0][3]
        _df["subject identifier"] = i[0][4]

        transpose_df_list.append(_df)
    df = pd.concat(transpose_df_list)
    df = df[[*df.columns[-5:],*df.columns[0:-5]]]
    df = df.reset_index(drop=True)

    return df

#Obtain the information from each sensor position. Pre-preparation for the data visualization
def get_records(df, name, trial_number, matching_condition, channel_list):
    df_record = df[df["name"].eq(name) & df["trial number"].eq(trial_number) & df["matching condition"].eq(matching_condition)].set_index(["sensor position"]).loc[channel_list]
    return df_record

#Extract from the get_recordss function an array just from the electrical activity of each sensor, so it is possible to plot
def signal_array(df, name, trial_number, matching_condition, channel_list):
    df_record = get_records(df, name, trial_number, matching_condition, channel_list)
    return df_record.to_numpy()[:, 4:]


#All the leads from the EEG recording
channel_list = ["AF1","AF2","AF7","AF8","AFZ","C1","C2","C3","C4","C5","C6","CP1","CP2","CP3","CP4","CP5","CP6","CPZ","CZ","F1","F2","F3","F4","F5","F6","F7","F8","FC1",
                "FC2","FC3","FC4","FC5","FC6","FCZ","FP1","FP2","FPZ","FT7","FT8","FZ","O1","O2","OZ","P1","P2","P3","P4","P5","P6","P7","P8","PO1","PO2","PO7","PO8","POZ",
                "PZ","T7","T8","TP7","TP8"]

def plot(arr_list):
    fig, axes = plt.subplots(1, 5, figsize=(25, 5))
    for idx, arr in enumerate(arr_list):
        ax = axes[idx]
        for i in channel_list:
            ax.set_xlabel("61 leads")
        ax.plot(arr)
    fig.suptitle("All channels electrical activity during the EEG recording", fontsize =16)
    plt.show()


# def eeg_plot(arr_list):
#     fig, axes = plt.subplots(1, 5, figsize=(25, 5))
#     for idx, arr in enumerate(arr_list):
#         ax = axes[idx]
#         for i in channel_list:
#             ax.set_ylabel(i)
#             ax.plot()
#     plt.show()

def eeg():
    
    simplefilter(action='ignore', category=FutureWarning)
