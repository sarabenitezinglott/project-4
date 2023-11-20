<div style="text-align:center">
  <h1> EEG dataset: A comparative study between Alcoholic and Control individuals with epilepsy predisposition </h1>
</div>

## Introduction
<div style="text-align:justify">

Epilepsy is one of the most serious brain disorders that causes recurring and unprovoked seizures, and which affects approximately to 70 million people worldwide. Furthermore, it is most developed in infants and older people, so it has a bimodal distribution regarding the age. Unlike many other diseases, epilepsy seizures vary widely among those with the condition, as they can arise in any part of the brain. Tp facilitate the undestanding, the [Epilepsy Foundation](https://www.epilepsy.com/what-is-epilepsy/seizure-types) has established a general seizure classification:  

- Focal onset: seizures start in one area or side of the brain. It has two subgroups:

    - Focal Aware Seizure: As the name tells, the individual is awake and aware during the seizure. 

    - Focal Impaired Awareness: The individual is confused or their awareness is affected during the seizure. It is a more complex partial attack. 

- Generalized onset: Both brain sides are simultaneously affected. 

- Unknown onset: The beggining of the seizure is unknown or when it is not witnessed or seen by anyone, such as at night. 

The complexity of seizure classification extends further due to the brain's anatomical divisions and specialized functions. Depending on where the seizure originates, specific brain functions are affected.

Understanding epilepsy involves not only the recognizion of the diverse seizures types, and the age-related pattern but also the high impact it has on cognitive ans motor functions. 

Moreover, as techonoly and brain knowledge is evolving constantly, different tools have improved: 

Diagnosis: electroencephalography (EEG), ElectrocorticogramoG, Deep Brain Recording, Deep Brain Stimulation.

Treatments: Anti-epileptic drugs (AEDs) or Temporal lobectomy, in which a part of the temporal lobe is removed.


## Data extraction 

There are different ways of extracting the electrical activity of a patient with epilepsy. For this study, a non-invasive method is used for this aim, the electroencephalogram (EEG) with 64 leads. Furthermore, the data was obtained from [UC Irvine Machine Learning Repossitory - EEG Database](https://archive.ics.uci.edu/dataset/121/eeg+database) study. This dataset contains:

1. Four subjects: 2 alcoholics and 2 controls. All suffer from epilepsy, and for this research, they where stimulated in order to provoke the seizure.

    - For stimulation, Snodgrass and Vanderwart pictures set from 1980 were used. 

2. 5 trials per patient.

3. EEG with 64 leads, 256 samples per patient. 

## Workflow
To study this dataset different approaches were used:

1st Python pandas library: cleaning and exploration of the dataset.

2nd MySQL: to obtain essential information of each patient, such as the number of sensors per each patient the recording time of the EEG, the maximal and imal sernsor electrical activity for each patient, and the number of samples per second. 

3rd Tableau: to visualize what I have extracted from SQL.

4th Python visualization, with matplotlib.


## Results

Number of sensors per group:

![Number of sensors](/images/barplots.png)


Alcoholic group 
Alcoholic 1: 

![Alcoholic 1](/images/alcoholic%201.png)

![Alcoholic 2](/images/alcoholic%202.png)

![Control 1](/images/control%201.png)

![Control 1](/images/control%202.png)

## Links

[Epilepsy Foundation](https://www.epilepsy.com/what-is-epilepsy/seizure-types)

[Tableau publication](https://public.tableau.com/views/project-5EEGdifferencesbetweenalcoholicsandcontrolgroups_1/Story1?:language=es-ES&publish=yes&:display_count=n&:origin=viz_share_link)

 [UC Irvine Machine Learning Repossitory - EEG Database](https://archive.ics.uci.edu/dataset/121/eeg+database)


