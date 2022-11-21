data_wrangling
================
2022-11-21

``` r
## filtering-out non-US seasons, cleaning data

castaway_details_US = castaway_details %>% 
  filter(str_detect(castaway_id, '^US')) %>%
  mutate(
    personality_type_binary = ifelse(
      str_detect(personality_type, '^E'), "Extrovert", "Introvert")) %>%
  select(-c(castaway_id, castaway, personality_type, ethnicity))

castaways_US = castaways %>% filter(version == "US") %>%
  select(-c(version, season_name, season, castaway_id, castaway, jury_status, original_tribe)) %>%
  rename(age_during_show = age, days_survived = day)

survivor_data_final = full_join(castaway_details_US, castaways_US, by = "full_name")

survivor_data_final = survivor_data_final[
  , c("version_season", "full_name", "age_during_show", "race", "poc", "date_of_birth", "date_of_death", "occupation", "personality_type_binary", "episode", "days_survived", "order", "result")] %>% 
  arrange(version_season)
```
