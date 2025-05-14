#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)
library(readr)
library(dplyr)
library(tidyr)


function(input, output) {
  

  
  output$plot1<- renderPlot({ 
    
    gene_data <- TPMs_table_100genes %>%
      filter(GeneID == input$gene_id) %>%  # selecting gene from input
      select(-GeneID) %>%  
      pivot_longer(cols = everything(), #modifying the table to longer form
                   names_to = "Measurement", 
                   values_to = "Value")
    
    # Creating the plot plot
    ggplot(gene_data, aes(x = Measurement, y = Value, fill = Measurement)) +
      geom_col() + 
      labs(
           x = "Measurement",
           y = "Value") +
      theme_minimal() 
  })
}
