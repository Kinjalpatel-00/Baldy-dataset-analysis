##### (Note: This analysis was being done as a part of the assignment by university of St Andrews, the code can be view in PDF file)


# Which is more effiective treatment for male pattern baldness and does age influence the hair growth?
### date: October 29, 2020



Github Link of private repository: **_[Click here](https://github.com/Kinjalpatel-00/MT5763_2_200028225.git)_**


# Abstract

Significant research has been undertaken to find out which male pattern baldness treatments are more effective. Along with which factor matters in hair growth values after the treatments. This analytic paper uses the data of hair growth on randomly selected male groups after receiving different male pattern baldness (MPB) treatments over a month. Data wrangling has been done to optimize the dataset in a way that can be easier to read and operate the statistical operations. Fits Liner model to determine the effects of a person’s age over hair growth measurement after receiving different MPB treatments for a month. This study finds that luxuriant treatment is quite effective than other existing treatments. Besides, there is not much correlation between age and hair growth values according to our dataset. However, some researchers s justify that there is a relationship between hair growth and age in male pattern baldness treatments (Ellis, J. A., & Sinclair, R. D. (2008))


# Introduction

The male pattern baldness (MPB) has been a major concern in the global community. The demand for new products and treatments has increased a lot.  The MPB is the most common way to lose hair among men at age of 20-30 and it increased 10% per decade (Liu, F., Hamer, M. A., Heilmann, S., Herold, C., Moebus, S., Hofman, A., Uitterlinden, A. G., Noethen, M. M., van Duijn, C. M., Nijsten, T. E. C., & Kayser, M. (n.d.)) Thus, scientists and researchers are using an advanced statistical approach to analyze and examine the relationship between hair growth on men of different MPB treatments over their ages. This study helps to find which treatment can be more effective for which group of male population which are more or less bald. This paper concludes that luxuriant treatment is more efficient than placebo treatment for MPB. However, this study finds no relation between age and hair growth values in any treatment. 


# Analysis Description 

We have data of newly invented drugs called luxuriant and other 3 existing drugs effect over randomly allocated groups of men. Data wrangling to reshape the data in a form suitable for analysis. The given dataset neither has an extra variable nor any null values required to remove, therefore, not a single column or row was being removed from the original dataset. For further process, a copy of the dataset was made, to avoid any unintentionally change in the original dataset. The wide-to-long transformation has been implemented to get the optimized version of the data, as it would be clearer to see each row of data as one person. To obtain that, a treatment column has been added to the data. As result, the newly created dataset has 3 columns, named treatment, hair growth values, and age (figure 1). As result, the newly created dataset has 400 rows and 3 columns.

```{r out.width = "50%" , echo=FALSE ,fig.align = 'center', fig.cap = "First few rows of newly craeted dataset (wide to long transformation) "}
include_graphics("/Users/kinjalpatel/Desktop/img1.png")
```

The hair growth values have been changed from inches to millimeters to determine more human-understandable language. Statistical summary and frequency tables for numeric values have been calculated for the analysis purpose of the dataset after each operation. The liner models has been made to find the relationship between age and hair growth values of different treatments. The results of the analysis have been discussed in the below section. 

# Results

To determine, if luxuriant treatment is above or beyond the placebo, the series plot has generated. A new dataset with only treatments luxuriant and placebo was made to avoid any accidental manipulation of data with the other 2 treatments.  

```{r out.width = "60%" , echo=FALSE ,fig.align = 'center', fig.cap = "Effect of luxuriant treatment over the placbo treatment "}
include_graphics("/Users/kinjalpatel/Desktop/img2.png")
```


As per Figure 2, we can determine that the newly created drug is more effective than an existing drug placebo for all age groups. Thus, to be more specific, the statistical summary for both treatments has been discussed below. 

| Treatment        | Mean       | Std Deviation | Range    | Variance   | Std Error Mean | p Value (Student's t) |
|------------------|------------|---------------|----------|------------|----------------|-----------------------|
| luxuriant        | 12.99950   | 7.52583       | 36.40346 | 56.6380857 | 0.75258279     | <.0001                |
| placbo           | 2.485074   | 2.40679       | 13.22991 | 5.79266    | 0.24067941     |                <.0001 |
| BaldBeGone       | 36.1521295 | 19.7447168    | 96.19019 | 389.85384  | 1.97447168     |                <.0001 |
| SkinHeadNoMore   | 18.74009   | 11.02093      | 54.30731 | 121.46095  | 1.10209323     | <.0001                |

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Table 1: Statistical summary of Hair growth variable for different treatments


The mean of hair growth variable for luxuriant treatment is 12.99 whereas for placebo treatment it is only 2.48, which implies that the average hair growth value(mm) is higher in luxuriant treatment. However, we can see the variance of both treatments which are respectively 56.63 and 5.79 implies that data is more spread out around the mean for luxuriant treatment data. The value of standard error for luxuriant treatment is 0.75 which concludes that the sample mean is more likely precise estimate of the population mean. (Refer to table 1) 



```{r out.width = "60%" , echo=FALSE ,fig.align = 'center', fig.cap = "Hair growth effects of different treatments "}
include_graphics("/Users/kinjalpatel/Desktop/img3.png")

```

To find out the more effective treatment, the box plot of hair growth values was generated. (Figure 3) The boxplot shows negative result for BladBeGnone treatment as the values are spread around a lot from sample mean.Placebo treatment does have a less success rate as compared to other treatments. whereas newly created drug(Luxuriant) and skinhead more does have similar results from the experiment. But the variance of shinHeadNoMore treatment is 121.46, which says the data points has spread out a lot around the mean. (Refer to Table 1). Thus we can conclude that luxuriant and SkinHeadNoMore treatments could be more effective than the other 2 treatments. 

| Treatment | Whole dataset | luxuriant | placbo   | BaldBeGone | SkinHeadNoMore   |
|-----------|---------------|-----------|----------|------------|------------------|
| R-Square  | 0.087737      | 0.279639  | 0.270189 | 0.160687   | 0.335339         |
| Root MSE  | 17.14422      | 7.651073  | 2.378187 | 21.36000   | 10.53586         |

&nbsp;&nbsp;&nbsp;&nbsp; Table 2: Statistical summary of Linear Models between age and hair growth variables for all treatments 


Linear Models were generated to find out the relationship between hair growth and age variables. In figure 4, we can see that data was not evenly distributed, which implies that data is not normally distributed for the whole dataset. Plus the R-Square value for the whole data set is 0.087, which indicates there is no relationship between age and hair growth in our dataset. The high value of root means square error (17.14422) indicates that data values are widely around its center mean which is not good. (Refer to Table 2)

```{r out.width = "60%" , echo=FALSE ,fig.align = 'center', fig.cap = "Q-Q plot of whole dataset"}
include_graphics("/Users/kinjalpatel/Desktop/img4.png")

```

The R-square values for luxuriant treatment are also 0.27, which implies that there is no relationship between age and hair growth values for luxuriant treatment. The same logic applies for placebo, bladBeGone, and skinHeadNoMore treatments, R-squares values are 0.270, 0.160, and 0.335 respectively (Refer to Table 2), which justify that there is no relation between age and hair growth values for each individual treatments too. The lower root means square error reflects on the distribution of data and implies that data is centralized around the central moment (mean). (Moody, J. (2019, September 5)). Although our results do not match with theory, we have quite a high root MSE which refers that data is not centralized for any individual treatment. 

## Assumption Check

Hypothesis for Shapiro-Wilk test (Normality check):

* H0(null hypothesis): The population is normally distributed.
* H1: The population is not normally distributed.


| Treatment             | Whole dataset | luxuriant | placbo  | BaldBeGone | SkinHeadNo- More |
|-----------------------|---------------|-----------|---------|------------|------------------|
| Shapiro-Wilk(P Value) | <0.0001       | 0.0002    | <0.0001 | 0.0203     | <0.0001          |

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Table 3: P Value of Shapiro-Wilk test for normality

The P Value <0.0001 (which is <0.05)of Shapiro-Wilk test concludes that we reject the null hypotheses, which mean data is not normally distributed for whole datsset.(Refer to table 3) Similar, for each individual treatment P values are less than 0.05, means data is not normally distributed for any treatments individually. 

# Software use

The SAS version 3.8 (Basic Edition) was used to run the analysis of data using the university SAS edition. Also, the Apps Anywhere SAS edition was used to generate the graphs. The graph code can be found in the appendices section of this report. R Studio was being used to produce this PDF report. 


# Further research 

The provided dataset information could have more variables in it. The hair growth variable could depend on genetic factors (Ellis, J. A., & Sinclair, R. D. (2008). The quality of hair does have a bit of effect on hair growth for MPB treatments in elderly men (Rexbye, H., Petersen, I., Iachina, M., Mortensen, J., McGue, M., Vaupel, J., & Christensen, K. (n.d.)). By adding a few more variables to the dataset could give more accurate results. 

# Conclusion

This study does not find any relationship between age to hair growth values for any MPB treatments. But reaches does found some relationship between age to hair growth (Ellis, J. A., & Sinclair, R. D. (2008)). However, the newly created drug (luxuriant) performs better than existing treatments for male pattern baldness problem. Assumptions are being violated and the lower p-value(<0.0001) for Shapiro-Wil test implies that we reject the null hypothesis. thus, the given dataset is not normally distributed. The other variables such as genetic history, hair quality, mental health for the treatment period, and physical health history could affect hair growth in MPB treatments. 

# References

Ellis, J. A., & Sinclair, R. D. (2008). Male pattern baldness: current treatments, future prospects. Drug Discovery Today, 13(17), 791–797. https://doi.org/10.1016/j.drudis.2008.05.010

Swanson, N., Abramovits, W., Berman, B., Kulp, J., Rigel, D. S., & Levy, S. (2010). Imiquimod 2.5% and 3.75% for the treatment of actinic keratoses: results of two placebo-controlled studies of daily application to the face and balding scalp for two 2-week cycles. Journal of the American Academy of Dermatology, 62(4), 582-590.

Liu, F., Hamer, M. A., Heilmann, S., Herold, C., Moebus, S., Hofman, A., Uitterlinden, A. G., Noethen, M. M., van Duijn, C. M., Nijsten, T. E. C., & Kayser, M. (n.d.). Prediction of male-pattern baldness from genotypes. EUROPEAN JOURNAL OF HUMAN GENETICS, 24(6), 895–902. https://doi.org/10.1038/ejhg.2015.220

Rexbye, H., Petersen, I., Iachina, M., Mortensen, J., McGue, M., Vaupel, J., & Christensen, K. (n.d.). Hair loss among elderly men: Etiology and impact on perceived age. JOURNALS OF GERONTOLOGY SERIES A-BIOLOGICAL SCIENCES AND MEDICAL SCIENCES, 60(8), 1077–1082.

Moody, J. (2019, September 5). What does RMSE really mean? Https://Towardsdatascience.Com/. https://towardsdatascience.com/what-does-rmse-really-mean-806b65f2e48e



```
