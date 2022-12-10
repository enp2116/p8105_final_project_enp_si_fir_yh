Survivor(al) Analysis: Impacts of Demographics on Game Show Contestant
Survival
================

## Introduction

### Motivation:

In this report, we utilize survival analysis to explore the implications
of self-identified race, gender, and personality type to game show
survival. In particular, we focus on the American classic TV series
*Survivor*, which is currently on its 43rd season. In this show, each
season 16 to 18 contestants are divided into tribes and navigate
challenges within these social alliances in order to promote their own
survival.[^1] Throughout each season, contestants are progressively
eliminated by vote of their peers until there is a sole survivor. Given
that aspects of identity heavily influence how people are perceived in a
social context, we hypothesize that contestant outcomes may differ on
the measures related to retention or screen time.

### Related Work:

While survival analysis is a statistical methodology typically used in
health fields to understand the time to an event of interest (such as
death, myocardial infarction, or cancer recurrence)[^2], we are able to
utilize the number of days survived on *Survivor* as our main outcome of
interest. Our inspiration for this project came from a small scale paper
studying the effects of demographics in *Masterchef Junior* contestant
survival rates.[^3] This research looked at race and gender to determine
the outcome of percent of season survived, with the additional analysis
to look at the impact of a female judge on these survival rates. While
the TV series *Survivor* and *Masterchef Junior* differ in their
elimination processes, both our studies explore the intricacies of
societal bias and how that plays into game show success.

### Initial Questions:

Our initial goal was to investigate the extent to which gender, race,
and personality have led to differences in days survived on *Survivor*.
Based on cultural norms in the U.S., we hypothesized that contestants
who are white, male, or extroverts would have the longest survival time.
In determining a lack of results on these measures, we decided to
integrate geographic comparisons as well for survival time. More
additional questions arose throughout the course of our research. We
determined that another component of entertainment culture was not only
how long the contestants stayed on the show, but how much individualized
screen time they received while there. Thus, we decided to explore the
frequency of confessionals as supplementary analyses. Finally, in more
recent years (in alignment with the Black Lives Matter movement in the
U.S.), *Survivor* has made the effort to encourage more diversity within
their casts. To this end, we also wanted to visually see if contestants
had representation that evolved over the 42 seasons. In this paper, we
consider all these aspects as part of a comprehensive investigation of
demographics on game show survival.

## Data Sources & Cleaning:

In order to analyze the show *Survivor*, we used data sources from the
`castaway_details` and `castaways` datasets[^4], as well as others, from
the `survivoR` package.[^5] This fan-made package contains data from all
seasons of the U.S. TV show *Survivor*. According to the authors of the
package, “the data was sourced from Wikipedia and the Survivor Wiki.
Other data, such as the tribe colours, was manually recorded and entered
by myself and contributors.” As each dataset contained distinct
information on the contestants for each season, it was necessary to use
joins to combine datasets to produce a final dataset to be analyzed.
This was performed using a full join on the contestants’ full names. It
should be noted that a few contestants appear in multiple seasons,
however we treated them as separate throughout most of our analysis for
the purposes of getting an accurate picture of each season.
Additionally, in order to standardize our results for the survival
analysis and exploratory data analysis, we removed seasons 2, 41, 42,
and 43 as the seasons contained data for a different number of days from
the standard 39 days. As the original data contains information from
several versions around the globe, it was integral to filter and only
analyze data from the U.S. edition. In order to best model our
covariates of interest, we then created a new personality type variable
(extracting whether a person is an introvert or extrovert) and a POC
indicator variable instead of individual races. We also used
contestants’ home states to code contestants into a region based on
census regions and divisions of the United States.[^6] Furthermore, we
determined that missing data was not an issue, as it occurred in low
frequency and was not patterned in nature. The final dataset used in the
analysis contains unique information for each castaway for each season,
including the following key variables:

-   `version_season`: version and season number
-   `full_name`: contestant full name
-   `age_during_show` : age, in years
-   `poc` : POC indicator, if known. Else, marked as White.
-   `gender`: 2 levels: Female, Male.
-   `personality_type_binary` : Extracted from the Myer-Briggs
    personality type of the castaway. 2 levels: Extrovert, Introvert.
-   `days_survived`: Number of days survived in the show until
    elimination
-   `region`: region in the U.S. where the contestant is from. We
    created this variable based on the `state` variable available in the
    dataset. 4 levels: West, Midwest, Northeast, South. Indicator
    variables for each of the 4 regions have also been created for
    analyses.

As a supplemental analysis, we also used the `confessionals` data from
the same `survivoR` package to visualize the number of confessionals
each contestant received. This data looked at all seasons as it was
unrelated to the survival analysis and consistency in the datasets was
not necessary. Nevertheless, this data also only looked at the U.S.
edition of the show.

## Exploratory Analysis:

We performed exploratory data analysis to visualize the distributions of
our variables of interest, including POC, gender, personality type, age,
and geographic location. In order to best depict the true nature of our
data, we used a combination of tables and plots, depending on which
method we believed to be most effective. In our summary demographic
table\*, we decided to only count contestants once, regardless of if
they appeared in multiple seasons (in contrast to the rest of our
analysis).

<div id="rbkzhuhbkt" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rbkzhuhbkt .gt_table {
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

#rbkzhuhbkt .gt_heading {
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

#rbkzhuhbkt .gt_title {
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

#rbkzhuhbkt .gt_subtitle {
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

#rbkzhuhbkt .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rbkzhuhbkt .gt_col_headings {
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

#rbkzhuhbkt .gt_col_heading {
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

#rbkzhuhbkt .gt_column_spanner_outer {
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

#rbkzhuhbkt .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rbkzhuhbkt .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rbkzhuhbkt .gt_column_spanner {
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

#rbkzhuhbkt .gt_group_heading {
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
}

#rbkzhuhbkt .gt_empty_group_heading {
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

#rbkzhuhbkt .gt_from_md > :first-child {
  margin-top: 0;
}

#rbkzhuhbkt .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rbkzhuhbkt .gt_row {
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

#rbkzhuhbkt .gt_stub {
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

#rbkzhuhbkt .gt_stub_row_group {
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

#rbkzhuhbkt .gt_row_group_first td {
  border-top-width: 2px;
}

#rbkzhuhbkt .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbkzhuhbkt .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#rbkzhuhbkt .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#rbkzhuhbkt .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rbkzhuhbkt .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbkzhuhbkt .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rbkzhuhbkt .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rbkzhuhbkt .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rbkzhuhbkt .gt_footnotes {
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

#rbkzhuhbkt .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbkzhuhbkt .gt_sourcenotes {
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

#rbkzhuhbkt .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbkzhuhbkt .gt_left {
  text-align: left;
}

#rbkzhuhbkt .gt_center {
  text-align: center;
}

#rbkzhuhbkt .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rbkzhuhbkt .gt_font_normal {
  font-weight: normal;
}

#rbkzhuhbkt .gt_font_bold {
  font-weight: bold;
}

#rbkzhuhbkt .gt_font_italic {
  font-style: italic;
}

#rbkzhuhbkt .gt_super {
  font-size: 65%;
}

#rbkzhuhbkt .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#rbkzhuhbkt .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#rbkzhuhbkt .gt_indent_1 {
  text-indent: 5px;
}

#rbkzhuhbkt .gt_indent_2 {
  text-indent: 10px;
}

#rbkzhuhbkt .gt_indent_3 {
  text-indent: 15px;
}

#rbkzhuhbkt .gt_indent_4 {
  text-indent: 20px;
}

#rbkzhuhbkt .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col"><strong>N = 728</strong><sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left" style="font-weight: bold;">Gender</td>
<td class="gt_row gt_center"></td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Female</td>
<td class="gt_row gt_center">356 (49%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Male</td>
<td class="gt_row gt_center">368 (51%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Unknown</td>
<td class="gt_row gt_center">4</td></tr>
    <tr><td class="gt_row gt_left" style="font-weight: bold;">Race Identifier</td>
<td class="gt_row gt_center"></td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">POC</td>
<td class="gt_row gt_center">199 (27%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">White</td>
<td class="gt_row gt_center">525 (73%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Unknown</td>
<td class="gt_row gt_center">4</td></tr>
    <tr><td class="gt_row gt_left" style="font-weight: bold;">Personality Type</td>
<td class="gt_row gt_center"></td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Extrovert</td>
<td class="gt_row gt_center">401 (56%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Introvert</td>
<td class="gt_row gt_center">320 (44%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Unknown</td>
<td class="gt_row gt_center">7</td></tr>
    <tr><td class="gt_row gt_left" style="font-weight: bold;">Age During Show (Years)</td>
<td class="gt_row gt_center">33.4 (10.1)</td></tr>
    <tr><td class="gt_row gt_left" style="font-weight: bold;">Survival Time on Show (Days)</td>
<td class="gt_row gt_center">23.9 (12.1)</td></tr>
    <tr><td class="gt_row gt_left" style="font-weight: bold;">Region</td>
<td class="gt_row gt_center"></td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Midwest</td>
<td class="gt_row gt_center">99 (14%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Northeast</td>
<td class="gt_row gt_center">153 (21%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">South</td>
<td class="gt_row gt_center">207 (28%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">West</td>
<td class="gt_row gt_center">269 (37%)</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><sup class="gt_footnote_marks">1</sup> n (%); Mean (SD)</td>
    </tr>
  </tfoot>
</table>
</div>

*Note: N = 728 refers to the total count of records (i.e. contestant
occurrences) in `survivor_data_final`; distinct persons may be listed in
multiple records, across seasons and/or within seasons.*

![](final_project_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

*Note: Since contestants can re-appear across seasons at different ages,
we rely on discrete records from `survivor_data_final` (i.e. contestant
occurrences) as the unit of analysis for this plot in order to ensure
comprehensiveness of age data.*

We also included tables showing the mean days survived based on these
demographic measures of interest.

### Personality Type

<table>
<thead>
<tr>
<th style="text-align:left;">
Personality Type
</th>
<th style="text-align:right;">
Distinct Persons
</th>
<th style="text-align:right;">
Contestant Occurrences
</th>
<th style="text-align:right;">
Mean Days Survived
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Extrovert
</td>
<td style="text-align:right;">
309
</td>
<td style="text-align:right;">
401
</td>
<td style="text-align:right;">
24.0
</td>
</tr>
<tr>
<td style="text-align:left;">
Introvert
</td>
<td style="text-align:right;">
271
</td>
<td style="text-align:right;">
320
</td>
<td style="text-align:right;">
23.6
</td>
</tr>
</tbody>
</table>
<table>
<thead>
<tr>
<th style="text-align:left;">
POC Status
</th>
<th style="text-align:right;">
Distinct Persons
</th>
<th style="text-align:right;">
Contestant Occurrences
</th>
<th style="text-align:right;">
Mean Days Survived
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
POC
</td>
<td style="text-align:right;">
164
</td>
<td style="text-align:right;">
199
</td>
<td style="text-align:right;">
22.6
</td>
</tr>
<tr>
<td style="text-align:left;">
White
</td>
<td style="text-align:right;">
418
</td>
<td style="text-align:right;">
525
</td>
<td style="text-align:right;">
24.3
</td>
</tr>
</tbody>
</table>
<table>
<thead>
<tr>
<th style="text-align:left;">
Gender
</th>
<th style="text-align:right;">
Distinct Persons
</th>
<th style="text-align:right;">
Contestant Occurrences
</th>
<th style="text-align:right;">
Mean Days Survived
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Female
</td>
<td style="text-align:right;">
292
</td>
<td style="text-align:right;">
356
</td>
<td style="text-align:right;">
23.1
</td>
</tr>
<tr>
<td style="text-align:left;">
Male
</td>
<td style="text-align:right;">
290
</td>
<td style="text-align:right;">
368
</td>
<td style="text-align:right;">
24.5
</td>
</tr>
</tbody>
</table>
<table>
<thead>
<tr>
<th style="text-align:left;">
Region
</th>
<th style="text-align:right;">
Distinct Persons
</th>
<th style="text-align:right;">
Contestant Occurrences
</th>
<th style="text-align:right;">
Mean Days Survived
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Midwest
</td>
<td style="text-align:right;">
84
</td>
<td style="text-align:right;">
99
</td>
<td style="text-align:right;">
24.4
</td>
</tr>
<tr>
<td style="text-align:left;">
Northeast
</td>
<td style="text-align:right;">
122
</td>
<td style="text-align:right;">
153
</td>
<td style="text-align:right;">
25.0
</td>
</tr>
<tr>
<td style="text-align:left;">
South
</td>
<td style="text-align:right;">
178
</td>
<td style="text-align:right;">
207
</td>
<td style="text-align:right;">
22.7
</td>
</tr>
<tr>
<td style="text-align:left;">
West
</td>
<td style="text-align:right;">
218
</td>
<td style="text-align:right;">
269
</td>
<td style="text-align:right;">
23.8
</td>
</tr>
</tbody>
</table>

Next, to visualize the geographic origins of *Survivor* contestants, we
created a map to chart the number of contestants coming from each state.
This map indicates that California was the most popular state of origin
for contestants.

![](final_project_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
*Notes:* *i) Seasons 2, 41, 42, and 43 have been removed from the
exploratory analysis due to inconsistent number of days.* *ii) Since
contestants can re-appear across seasons with different states of
residence, we similarly rely on discrete records from
`survivor_data_final` (i.e. contestant occurrences) as the unit of
analysis for this plot in order to ensure comprehensiveness of location
data.*

Additionally, we used a line plot\* to visualize the change in diversity
(looking at both POC status and gender) to view how the proportion of
POC and women has changed over the show’s many seasons.
![](final_project_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

*Note: Distinct person counts by POC status.*

According to the trends of the proportion of POC, the initial seasons
had a very low proportion of POC contestants and the overall data shows
an increasing trend in the proportion of POC. It was interesting to note
that some “early” seasons such as seasons 13 and 14 had very high
proportions of POC (over 0.5).

![](final_project_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

*Note: Distinct person counts by gender.*

The graph for the proportion of women per season shows a relatively
steady trend around 0.5, indicating a generally even distribution of men
and women in the data. There are some seasons with a proportion less
than 0.5 and greater than 0.5, but a majority of seasons had an exact
proportion of 0.5.  
In addition to the aforementioned exploratory data analysis, we were
curious to see which contestants were receiving the most confessionals.
As a result, we created a Shiny app that allows users to select which
season they would like to view. Users can then examine the number of
confessionals each contestant received, as well as the total number of
confessionals they received over the season, and the mean number of
confessionals per episode they received while on the show.

## Survival Analysis:

### Methodology:

For our statistical analysis, we used survival analysis to understand
the time to elimination for *Survivor* contestants. In this method, we
suppose that there is a true survival time, T, as well as a true
censoring time, C. The survival time represents the time at which the
event of interest occurs: in this dataset, the time (in days) at which
participant is voted out. The censoring time is the time at which the
participant drop out of the game show or survived until the last day of
the show.

We observed the Survival Time T and Censoring Time C. Suppose there is a
random variable Y

$$Y = min(T,C)$$ In other words, if the event occurs before the
censoring such that T $<$ C, then we observed the true survival time T.
If censoring occurs before the event such as T $>$ C, then we observe
the censoring time. The status indicator as,

$$\delta = \begin{cases} 
       1 &  T\leq C \\
       0 & T > C
   \end{cases}$$

Thus, $\delta$ = 1 if we observe the true survival time, and $\delta$ =
0 if we observe the censoring.

We use the Cox-propositional hazard model to evaluate the effect of
several factors on survival time in Survivor Show. It allows us to
examine how specified factors influence the rate of the event that we
interested at a particular point in time. This rate is the hazard rate.
Covariates are age, gender, personality type, and region in this model.
The Cox model is expressed by the hazard function denoted by h(t).
Briefly, the hazard function can be interpreted as the risk of voted out
at time t. It can be estimated as follow:
$$h(t) = h_0(t)\exp(x_1\beta_1 + x_2\beta_2 + x_3\beta_3 + x_4\beta_4 + x_4\beta_5)$$
where,  

-   $t$ represents the survival time
-   $h(t)$ is the hazard function determined by a set of participants’
    covariates $(x_1, x_2, x_3, x_4, x_5)$: $x_1$ is gender, $x_2$ is
    POC, $x_3$ is age during the show, $x_4$ is personality type, and
    $x_5$ is region
-   the coefficients $(\beta1, \beta2, \beta3, \beta4, \beta5)$ measures
    the impact of covariates
-   $h_0(t)\geq 0$ is the baseline hazard function. It is the hazard
    function for an individual if all $(x_1, x_2, x_3, x_4, x_5)$ are
    equal to zero.

## Cox Proportional-Hazards Model

To investigate the number of days survived on *Survivor*, we built a Cox
Proportional-Hazards Model adjusting for the variables of age, gender,
personality type (introvert versus extravert) and POC (White vs POC).
The Cox Proportional-Hazards model was chosen since it allows us to
examine multiple factors that could be influencing the rate at which
contestants are eliminated. An assumption of the Cox
Proportional-Hazards model is that each covariate has a multiplicative
effect in the hazards function that is constant over time. After fitting
the Cox model, we tested the assumption and none of the covariates in
our model are in violation.

## Kaplan-Meier Curves

To investigate each of the covariates individually, we created
Kaplan-Meier curves to look at survival time with respect to:

-   **Personality Type** (Introvert vs Extrovert)

``` r
surv_model_per <- survfit(Surv(time, status)~ survivor_data_final$personality_type_binary)

ggsurvplot(
  surv_model_per,
  data = survivor_data_final,
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

![](final_project_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

-   POC (White vs Non-White)

-   Gender (Female vs Male)

-   Region

### Results:

The results of our Cox Proportional-Hazards model are displayed below.

**Table 2: Modeling Survival Time by Age, Gender, POC, Personality Type,
Region**

|        Risk Factor        | Parameter Estimate (Standard Error) | Hazard Ratio (HR) (95% CI) | P-Value |
|:-------------------------:|:-----------------------------------:|:--------------------------:|:-------:|
|  Age during show (years)  |             0.00 (0.00)             |     1.00 (0.99, 1.01)      |  0.998  |
|        **Gender**         |                                     |                            |         |
|          Female           |                 Ref                 |                            |         |
|           Male            |            -0.05 (0.08)             |     0.96 (0.82, 1.12)      | 0.5003  |
| **POC (person of color)** |                                     |                            |         |
|            POC            |                 Ref                 |                            |         |
|           White           |            -0.11 (0.09)             |     0.89 (0.75, 1.06)      | 0.1915  |
|   **Personality Type**    |                                     |                            |         |
|         Extrovert         |                 Ref                 |            Ref             |         |
|         Introvert         |             0.06 (0.08)             |     1.07 (0.91, 1.25)      | 0.4468  |
|        **Region**         |                                     |                            |         |
|          Midwest          |                 Ref                 |                            |         |
|         Northeast         |            -0.01 (0.15)             |     0.99 (0.75, 1.32)      | 0.9530  |
|           South           |             0.26 (0.14)             |     1.29 (0.99, 1.69)      | 0.0582  |
|           West            |             0.16 (0.13)             |     1.18 (0.91, 1.52)      | 0.2165  |

*Notes: N = 721, number of events = 626*

As age increases in years, there is no difference in survival since the
hazard ratio is 1. We are 95% confident that the HR falls between 0.99
to 1.01. However, the HR is not statistically significant.  
- For gender, the HR value of 0.96 suggests that the survival time for
male contestants is longer compared to female contestants (the reference
category). We are 95% confident that the HR falls between 0.82 and 1.12.
However, the HR is not statistically significant.  
- For POC, the HR value of 0.89 would suggest that the survival time for
White contestants is longer compared to POC contestants (the reference
category). We are 95% confident that the HR falls between 0.75 and 1.06.
However, the HR is not statistically significant.  
- For personality type, the HR value of 1.07 would suggest that the
survival time for introvert contestants is shorter compared to extrovert
contestants (the reference category). We are 95% confident that the HR
falls between 0.91 - 1.25. However, the HR is not statistically
significant.  
- For region, Midwest is the reference category. However, all of these
hazard ratios are not statistically significant, p-value \> 0.05.

    * The HR value of 0.99 for Northeast suggests that the survival time for contestants from the NE is longer compared to contestants from the Midwest.  
    * The HR value of 1.29 for the South suggests that the survival time for contestants from the South is shorter compared to contestants from the Midwest.  
    * The HR value of 1.18 for the West suggests that the survival time for contestants from the West is shorter compared to contestants from the Midwest. 

## Discussion:

From conducting survival analyses, we did not observe any statistically
significant covariates. This stands in contrast with our initial
hypotheses that race, gender, and personality type would impact days
survived. The HR values for gender (males surviving longer than female
contestants), POC (White contestants surviving longer than POC),
personality type (extrovert surviving longer than introverts) follow our
general expectations. However, since none of the hazard ratios are
statistically significant, we cannot make any conclusions.

[^1]: <https://www.cbs.com/shows/survivor/about/>

[^2]: <https://sphweb.bumc.bu.edu/otlt/mph-modules/bs/bs704_survival/BS704_Survival_print.html>

[^3]: <https://www.katiejolly.io/pdf/survival_analysis_paper.pdf>

[^4]:  <https://github.com/doehm/survivoR>

[^5]: <https://cran.r-project.org/web//packages/survivoR/survivoR.pdf>

[^6]: <https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf>
