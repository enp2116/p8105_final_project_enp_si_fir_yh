EDA
================
Emily Potts
2022-11-28

``` r
## reading in data
survivor_data_final = 
  read.csv("data/survivor_data_final.csv")
```

## EDA (tables)

``` r
## overall summary table
survivor_data_final %>% 
  select(gender, poc, personality_type_binary, age_during_show, days_survived) %>% 
  tbl_summary(type = list(gender~ "categorical", poc~ "categorical", personality_type_binary~ "categorical", age_during_show ~ "continuous", days_survived ~ "continuous"), 
              statistic = list(all_continuous() ~ "{mean} ({sd})"), 
              label = list(c(gender) ~ "Gender",
                           c(poc) ~ "Race Identifier",
                           c(personality_type_binary) ~ "Personality Type",
                           c(age_during_show) ~ "Age During Show (Years)",
                           c(days_survived) ~ "Survival Time on Show (Days)")) %>% 
  bold_labels() 
```

<div id="tcweoqqraz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#tcweoqqraz .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#tcweoqqraz .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tcweoqqraz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#tcweoqqraz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#tcweoqqraz .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#tcweoqqraz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tcweoqqraz .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tcweoqqraz .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#tcweoqqraz .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#tcweoqqraz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#tcweoqqraz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#tcweoqqraz .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#tcweoqqraz .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#tcweoqqraz .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#tcweoqqraz .gt_from_md > :first-child {
  margin-top: 0;
}

#tcweoqqraz .gt_from_md > :last-child {
  margin-bottom: 0;
}

#tcweoqqraz .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#tcweoqqraz .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#tcweoqqraz .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#tcweoqqraz .gt_row_group_first td {
  border-top-width: 2px;
}

#tcweoqqraz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tcweoqqraz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#tcweoqqraz .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#tcweoqqraz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tcweoqqraz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tcweoqqraz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#tcweoqqraz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#tcweoqqraz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tcweoqqraz .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tcweoqqraz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#tcweoqqraz .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tcweoqqraz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#tcweoqqraz .gt_left {
  text-align: left;
}

#tcweoqqraz .gt_center {
  text-align: center;
}

#tcweoqqraz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#tcweoqqraz .gt_font_normal {
  font-weight: normal;
}

#tcweoqqraz .gt_font_bold {
  font-weight: bold;
}

#tcweoqqraz .gt_font_italic {
  font-style: italic;
}

#tcweoqqraz .gt_super {
  font-size: 65%;
}

#tcweoqqraz .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#tcweoqqraz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#tcweoqqraz .gt_indent_1 {
  text-indent: 5px;
}

#tcweoqqraz .gt_indent_2 {
  text-indent: 10px;
}

#tcweoqqraz .gt_indent_3 {
  text-indent: 15px;
}

#tcweoqqraz .gt_indent_4 {
  text-indent: 20px;
}

#tcweoqqraz .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 728&lt;/strong&gt;&lt;sup class=&quot;gt_footnote_marks&quot;&gt;1&lt;/sup&gt;"><strong>N = 728</strong><sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Gender</td>
<td headers="stat_0" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Female</td>
<td headers="stat_0" class="gt_row gt_center">356 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Male</td>
<td headers="stat_0" class="gt_row gt_center">368 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">4</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Race Identifier</td>
<td headers="stat_0" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    POC</td>
<td headers="stat_0" class="gt_row gt_center">199 (27%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    White</td>
<td headers="stat_0" class="gt_row gt_center">525 (73%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">4</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Personality Type</td>
<td headers="stat_0" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Extrovert</td>
<td headers="stat_0" class="gt_row gt_center">401 (56%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Introvert</td>
<td headers="stat_0" class="gt_row gt_center">320 (44%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Unknown</td>
<td headers="stat_0" class="gt_row gt_center">7</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age During Show (Years)</td>
<td headers="stat_0" class="gt_row gt_center">33 (10)</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Survival Time on Show (Days)</td>
<td headers="stat_0" class="gt_row gt_center">24 (12)</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><sup class="gt_footnote_marks">1</sup> n (%); Mean (SD)</td>
    </tr>
  </tfoot>
</table>
</div>

``` r
## days survived by variables of interest (planning to add tabs for these 3 tables)

## personality type
survivor_data_final %>% 
  group_by(personality_type_binary) %>% 
  summarize(n_personality_type = n(),
            mean_days_survived = mean(days_survived)) %>% 
    na.omit()  %>%
  knitr::kable(digits = 3, col.names = c("Personality Type", "n", "Mean Days Survived"))
```

| Personality Type |   n | Mean Days Survived |
|:-----------------|----:|-------------------:|
| Extrovert        | 401 |             23.993 |
| Introvert        | 320 |             23.606 |

``` r
## POC
survivor_data_final %>% 
  group_by(poc) %>% 
  summarize(n_poc = n(),
            mean_days_survived = mean(days_survived, na.rm = TRUE)) %>% 
    na.omit()  %>%
  knitr::kable(digits = 3, col.names = c("POC", "n", "Mean Days Survived"))
```

| POC   |   n | Mean Days Survived |
|:------|----:|-------------------:|
| POC   | 199 |             22.558 |
| White | 525 |             24.259 |

``` r
## gender
survivor_data_final %>% 
  group_by(gender) %>% 
  summarize(n_gender= n(),
            mean_days_survived = mean(days_survived, na.rm = TRUE)) %>%
    na.omit()  %>%
  knitr::kable(digits = 3, col.names = c("Gender", "n", "Mean Days Survived"))
```

| Gender |   n | Mean Days Survived |
|:-------|----:|-------------------:|
| Female | 356 |             23.051 |
| Male   | 368 |             24.508 |

## Change in Diversity (POC)

``` r
survivor_poc_over_time = survivor_data_final %>% 
  group_by(version_season, poc) %>%
  summarize(count = n()) %>%
  mutate(freq = count / sum(count)) %>%
  filter(poc == "POC") %>%
  separate(col = version_season, into = c('NA', 'season'), sep = 2) %>%
  dplyr::select(-"NA") %>%
  mutate(season = as.numeric(season))
```

    ## `summarise()` has grouped output by 'version_season'. You can override using
    ## the `.groups` argument.

``` r
ggplot(data = survivor_poc_over_time, aes(x = season, y = freq, group = 1)) +
  geom_line() +
  geom_point() +
  geom_smooth(se = FALSE) + 
  ggtitle("Change in Proportion of POC Over Time ") +
  xlab("Season") + ylab("Proportion of POC")
```

    ## `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

![](EDA_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

## Change in Diversity (Gender)

``` r
survivor_gender_over_time = survivor_data_final %>% 
  group_by(version_season, gender) %>%
  summarize(count = n()) %>%
  mutate(freq = count / sum(count)) %>%
  filter(gender == "Female") %>%
  separate(col = version_season, into = c('NA', 'season'), sep = 2) %>%
  dplyr::select(-"NA") %>%
  mutate(season = as.numeric(season))
```

    ## `summarise()` has grouped output by 'version_season'. You can override using
    ## the `.groups` argument.

``` r
ggplot(data = survivor_gender_over_time, aes(x = season, y = freq, group = 1)) +
  geom_line() +
  geom_point() +
  geom_smooth(se = FALSE) + 
  ggtitle("Change in Proportion of Women Over Time ") +
  xlab("Season") + ylab("Proportion of Women")
```

    ## `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

![](EDA_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
