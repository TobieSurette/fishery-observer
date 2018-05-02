# Fishery-Observer-Data-Analysis

We aim to develop a series of functions and programs to evaluate the quality of fisheries observer data, notably for the Eastern Canadian snow crab fishery.

Most programs will be in R, but some programs may be in WinBUGS, STAN or TMB (Template Model Builder). 

## Data Similarity

Data from two different samples may be compared to evaluate their similarity. We seek to develop tools to determine whether they have:

- Common sequences of observations. Long runs of common sequences may indicate copying of data. Data rounding increases the probability of having common runs of observations.
- Common sets of observations. The order of the observations may be ignored and the number of common observations may indicate data rounding, data fabrication or data copying. 


## Data Rounding

Data are generally measured to a specified degree of precision. We can check whether there is any evidence of rounding or lumping of data observations into certain categories. A simple approach is to check the relative frequecies of the last digts of observations. For a data series spanning a reasonnable range of values, with moderate assumptions about the smoothness of its distribution, the frequencies of the observed values should be the same (i.e. about 10%). 

## Chela Height Diagnostics

Snow crab claw (or chela) height measurements have a specific relationship with carapace width. We may use this relationship to evaluate whether:

- the observer is properly measuring claw height (i.e. is the measurement biased).
- the observer is measuring the claw height in a consistent manner (i.e. measurement variability).
- the observations follow a pattern which is consistent with that found in nature (i.e. is the data potentially being falsified?).
