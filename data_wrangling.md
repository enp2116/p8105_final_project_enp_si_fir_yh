data_wrangling
================
2022-11-21

``` r
## calculating percent NAs for all variables
survivor_data_final %>% summarise_all(list(name = ~sum(is.na(.))/length(.)))
```

    ## # A tibble: 1 × 17
    ##   version_seas…¹ full_…² age_d…³ race_…⁴ poc_n…⁵ date_…⁶ date_…⁷ occup…⁸ gende…⁹
    ##            <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    ## 1              0       0       0   0.724 0.00627 0.00877   0.985 0.00627 0.00627
    ## # … with 8 more variables: ethnicity_name <dbl>,
    ## #   personality_type_binary_name <dbl>, episode_name <dbl>,
    ## #   days_survived_name <dbl>, order_name <dbl>, contestant_count_name <dbl>,
    ## #   result_name <dbl>, percent_survived_name <dbl>, and abbreviated variable
    ## #   names ¹​version_season_name, ²​full_name_name, ³​age_during_show_name,
    ## #   ⁴​race_name, ⁵​poc_name, ⁶​date_of_birth_name, ⁷​date_of_death_name,
    ## #   ⁸​occupation_name, ⁹​gender_name
