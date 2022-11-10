Final Project Proposal
================
Emily Potts (enp2116), Yi Huang (yh3554), Shodai Inose (si2426), Farizah
Rob (fir2103), John Cheng (jc5635)
2022-11-12

### The tentative project title:

Survivor(al) Analysis: Impacts of Demographics on Game Show Contestant
Survival

### The motivation for this project:

We are curious about the implications of self-identified race and
personality type to game show survival, as entertainment culture is
deeply intertwined with societal biases. We are specifically looking at
the show Survivor. We were inspired by a similar project of a smaller
scale studying the effects of race and gender in Masterchef Junior
survival rates
(<https://www.causeweb.org/usproc/sites/default/files/usresp/2018-2/Whip%20It%20Like%20a%20WoMan%20Survival%20Analysis%20of%20Minority%20Contestants%20on%20MasterChef%20Junior.pdf>
).

### The intended final products:

-   Several interactive dashboards to visualize castaway characteristic
    distributions
-   Survival analysis (Kaplan-Meier curves) studying the effects of
    race, gender, age and personality type on length of stay

### Data sources:

Our anticipated data sources are the `castaway_details` and `castaways`
datasets from the `survivoR` package, which has data from all seasons of
the U.S. T.V. show Survivor. (<https://github.com/doehm/survivoR>)
(<https://cran.r-project.org/web//packages/survivoR/survivoR.pdf>)

### The planned analyses / visualizations / coding challenges:

In order to gather sufficient data, we plan to combine several data sets
(including `castaway_details` and `castaways`) and tidy them if
necessary. Some of our variables of interest have many categories, which
could lead to loss of generality. To combat this, we may categorize our
variables of interest differently, such as extracting whether a person
is an introvert or extrovert from their personality type, or using a POC
indicator variable instead of individual races. We will also need to
figure out how to standardize between seasons as the seasons have
varying numbers of contestants. We plan to perform EDA to visualize the
distributions of our variables of interest, including POC, race,
ethnicity, gender, personality type, and age. As our main analysis, we
plan on doing survival analysis by demographic groups, using the length
of stay of the contestants on the show as our outcome of interest.

### The planned timeline:

-   Week of November 13: Merge datasets, clean and tidy the data, create
    any new variables that might be needed for analysis. Start EDA -
    create visualizations for the distributions and frequencies of
    variables of interest.
-   Week of November 21: Continue working on EDA, improve
    visualizations, create interactive plots and possibly a flex
    dashboard. Start working on survival analysis code.
-   Week of November 28: Work on writing up the report together and
    create the website
-   Week of December 4: Finalize the report, create a screencast, and
    include any additional analyses.
