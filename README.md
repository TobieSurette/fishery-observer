# Fishery-Observer-Data-Analysis

We aim to develop a series of functions and programs to evaluate the quality of fisheries observer data, notably for the Eastern Canadian snow crab fishery.

Most programs will be in R, but some programs may be in WinBUGS, STAN or TMB (Template Model Builder). 

## Data Similarity

Data from two different samples may be compared to evaluate their similarity. We seek to develop tools to determine whether they have:

- Common sequences of observations.
- Combinations of observations which occur in high frequencies. 

## Data Rounding

Data are generally measured to a specified degree of precision. We can check whether there is any evidence of rounding or lumping of data observations into certain categories. One approach is to check the relative frequecies of the last digts of observations. For a data series spanning a reasonnable range of values, we may generally assume that the frequencies of values should be the same (i.e. about 10%). 

## Chela Height Diagnostics

Snow crab claw (or chela) height measurements have a specific relationship with carapace width. We may use this relationship to evaluate whether:

- the observer is properly measuring claw height (i.e. is the measurement biased).
- the observer is measuring the claw height in a consistent manner (i.e. is the variability of measurements high?).
- the observations follow a pattern which is consistent with that found in nature (i.e. is the data potentially being falsified?).
