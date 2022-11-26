Survival Analysis
================
2022-11-26

## Survival Analysis

#### Create new variable ethnicity

``` r
survivor_data_final <- survivor_data_final %>%
  mutate(ethnicity = ifelse(
      str_detect(poc, 'White'), survivor_data_final$poc, survivor_data_final$race))
```

#### Create time and status variable

``` r
## drop missing values of days_survived where all US43 seasons participants
survivor_final <- drop_na(survivor_data_final, days_survived)

## time to event: in this data, the event is voted out
## time is 39 days
## censors are participant who survived for 39 days and participant who quit the game

check_length_time <- survivor_data_final %>% 
  filter(result %in% c("Sole Survivor","Co-runner-up","Runner-up"))

## season 41 and 42, the longest survival time is 26 days, exclude these seasons
## season 2, the longest survival time is 42 days, exclude this season
survivor_final <- survivor_final %>% 
  filter(version_season != "US02") %>%
  filter(version_season != "US41") %>%
  filter(version_season != "US42") %>%
  mutate(personality_type_binary = as.factor(personality_type_binary))

status <- c()
time <- c()
for (i in 1:nrow(survivor_final))
  {
  if(survivor_final[i,14] == "Quit"){
    status[i] <- 0
    time[i] <- survivor_final$days_survived[i]
  }
  if(survivor_final[i,14] == "Sole Survivor"){
    status[i] <- 0
    time[i] <- survivor_final$days_survived[i]
  } 
  else {
    status[i] <- 1
    time[i] <- survivor_final$days_survived[i]
  }
}
survivor_final[,17] <- status
survivor_final[,18] <- time

colnames(survivor_final)[17] <- "status"
colnames(survivor_final)[18] <- "time"
```

## Survival Unadjected Model

``` r
surv_model_unadj <- survfit(Surv(time, status) ~ 1)

plot(surv_model_unadj, xlab = "Days",
     ylab = "Estimated Probability of Survival")
```

![](survival_analysis_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

## Cox-proposional hazard model 1

``` r
surv_model_cox1 <- coxph(data = survivor_final,
  Surv(time, status) ~  poc + age_during_show + personality_type_binary)

summary(surv_model_cox1)
```

    ## Call:
    ## coxph(formula = Surv(time, status) ~ poc + age_during_show + 
    ##     personality_type_binary, data = survivor_final)
    ## 
    ##   n= 721, number of events= 684 
    ##    (8 observations deleted due to missingness)
    ## 
    ##                                       coef exp(coef)  se(coef)      z Pr(>|z|)
    ## pocWhite                         -0.100109  0.904739  0.085668 -1.169    0.243
    ## age_during_show                   0.001591  1.001592  0.003802  0.419    0.676
    ## personality_type_binaryIntrovert  0.076241  1.079223  0.077186  0.988    0.323
    ## 
    ##                                  exp(coef) exp(-coef) lower .95 upper .95
    ## pocWhite                            0.9047     1.1053    0.7649     1.070
    ## age_during_show                     1.0016     0.9984    0.9942     1.009
    ## personality_type_binaryIntrovert    1.0792     0.9266    0.9277     1.255
    ## 
    ## Concordance= 0.523  (se = 0.013 )
    ## Likelihood ratio test= 2.66  on 3 df,   p=0.4
    ## Wald test            = 2.69  on 3 df,   p=0.4
    ## Score (logrank) test = 2.69  on 3 df,   p=0.4

## Cox-proposional hazard model 2

``` r
surv_model_cox2 <- coxph(data = survivor_final,
  Surv(time, status) ~  ethnicity + age_during_show + personality_type_binary)

summary(surv_model_cox2)
```

    ## Call:
    ## coxph(formula = Surv(time, status) ~ ethnicity + age_during_show + 
    ##     personality_type_binary, data = survivor_final)
    ## 
    ##   n= 687, number of events= 653 
    ##    (42 observations deleted due to missingness)
    ## 
    ##                                       coef exp(coef)  se(coef)      z Pr(>|z|)
    ## ethnicityAsian, Black             3.314567 27.510470  1.025336  3.233 0.001226
    ## ethnicityBlack                    0.022859  1.023122  0.177856  0.129 0.897735
    ## ethnicityBrazilian               -0.265301  0.766975  0.723864 -0.367 0.713987
    ## ethnicityChilean American         1.757175  5.796039  1.016022  1.729 0.083726
    ## ethnicityColombian American      -0.123718  0.883629  1.012205 -0.122 0.902720
    ## ethnicityCuban American           0.350168  1.419306  0.722236  0.485 0.627791
    ## ethnicityMexican American        -0.063179  0.938775  0.405112 -0.156 0.876068
    ## ethnicityPanamanian American      3.399649 29.953581  1.027074  3.310 0.000933
    ## ethnicityPeruvian American        1.868441  6.478190  1.014797  1.841 0.065593
    ## ethnicityPuerto Rican American   -0.219585  0.802852  0.721533 -0.304 0.760875
    ## ethnicityVenezuelan American      1.091260  2.978024  1.012317  1.078 0.281042
    ## ethnicityWhite                   -0.079944  0.923168  0.150159 -0.532 0.594454
    ## age_during_show                   0.001613  1.001614  0.003878  0.416 0.677501
    ## personality_type_binaryIntrovert  0.068956  1.071390  0.080682  0.855 0.392733
    ##                                     
    ## ethnicityAsian, Black            ** 
    ## ethnicityBlack                      
    ## ethnicityBrazilian                  
    ## ethnicityChilean American        .  
    ## ethnicityColombian American         
    ## ethnicityCuban American             
    ## ethnicityMexican American           
    ## ethnicityPanamanian American     ***
    ## ethnicityPeruvian American       .  
    ## ethnicityPuerto Rican American      
    ## ethnicityVenezuelan American        
    ## ethnicityWhite                      
    ## age_during_show                     
    ## personality_type_binaryIntrovert    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ##                                  exp(coef) exp(-coef) lower .95 upper .95
    ## ethnicityAsian, Black              27.5105    0.03635    3.6875   205.242
    ## ethnicityBlack                      1.0231    0.97740    0.7220     1.450
    ## ethnicityBrazilian                  0.7670    1.30382    0.1856     3.169
    ## ethnicityChilean American           5.7960    0.17253    0.7912    42.459
    ## ethnicityColombian American         0.8836    1.13170    0.1215     6.425
    ## ethnicityCuban American             1.4193    0.70457    0.3446     5.846
    ## ethnicityMexican American           0.9388    1.06522    0.4244     2.077
    ## ethnicityPanamanian American       29.9536    0.03338    4.0013   224.231
    ## ethnicityPeruvian American          6.4782    0.15436    0.8865    47.342
    ## ethnicityPuerto Rican American      0.8029    1.24556    0.1952     3.302
    ## ethnicityVenezuelan American        2.9780    0.33579    0.4095    21.658
    ## ethnicityWhite                      0.9232    1.08323    0.6878     1.239
    ## age_during_show                     1.0016    0.99839    0.9940     1.009
    ## personality_type_binaryIntrovert    1.0714    0.93337    0.9147     1.255
    ## 
    ## Concordance= 0.529  (se = 0.013 )
    ## Likelihood ratio test= 17.15  on 14 df,   p=0.2
    ## Wald test            = 32.11  on 14 df,   p=0.004
    ## Score (logrank) test = 65.27  on 14 df,   p=1e-08

## Kaplan-Meier plotter-personality

``` r
surv_model_per <- survfit(Surv(time, status)~ survivor_final$personality_type_binary)

ggsurvplot(
  surv_model_per,
  data = survivor_final,
  size = 1,                 # change line size
  palette =
    c("#E7B800", "#2E9FDF"),# custom color palettes
  conf.int = FALSE,          # Add confidence interval
  pval = TRUE,              # Add p-value
  risk.table = TRUE,        # Add risk table
  risk.table.col = "strata",# Risk table color by groups
  legend.labs =
    c("Extrovert", "Introvert"),    # Change legend labels
  risk.table.height = 0.25, # Useful to change when you have multiple groups
  ggtheme = theme_bw()      # Change ggplot2 theme
)
```

![](survival_analysis_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

``` r
#basic graph
# plot(surv_model_per, xlab = "Days",
#      ylab = "Estimated Probability of Survival", col = c(2,4))
```

## Kaplan-Meier plotter-White vs Non-White

``` r
surv_model_poc <- survfit(Surv(time, status)~ survivor_final$poc)

ggsurvplot(
  surv_model_poc,
  data = survivor_final,
  size = 1,                 # change line size
  conf.int = FALSE,          # Add confidence interval
  pval = TRUE,              # Add p-value
  risk.table = TRUE,        # Add risk table
  risk.table.col = "strata",# Risk table color by groups
  legend.labs =
    c("POC", "White"),    # Change legend labels
  risk.table.height = 0.25, # Useful to change when you have multiple groups
  ggtheme = theme_bw()      # Change ggplot2 theme
)
```

![](survival_analysis_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

## log-rank
