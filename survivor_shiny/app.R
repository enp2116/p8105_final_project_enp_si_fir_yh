#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(survivoR)
library(tidyverse)
library(plotly)


confessionals_df = confessionals %>% 
  filter(version == "US") %>%
  dplyr::select(-c(version, version_season, season_name))

seasons = list()
for(i in 1:43)
{
  seasons[[i]] = confessionals_df %>%
    filter(season == i) %>% 
    group_by(castaway)
}

plots = list()
for(i in 1:43)
{
  plots[[i]] = ggplotly(ggplot(data = seasons[[i]], aes(x = episode, y = confessional_count, color = castaway)) +
    geom_line() +
    geom_point() +
    ggtitle(paste0("Confessionals per Episode in Season ", i)) +
    xlab("Episode") + ylab("Number of Confessionals"))
}


ui <- fluidPage(
  selectInput("plot", "Choose plot:", choices = 1:43),
            hr(),
            mainPanel(plotlyOutput("myplot"))
)

server = function(input, output){
  output$myplot = renderPlotly({
    
    i = as.integer(input$plot)
    
    subplot(plots[[i]])
    
  })
}

shinyApp(ui = ui, server = server)
