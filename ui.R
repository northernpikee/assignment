library(shiny)
library(ggplot2)
library(readr)
library(dplyr)
library(tidyr)


TPMs_table_100genes <- read_csv("TPMs_table_100genes.csv")  # Rloading data


ui <- fluidPage(
  titlePanel("Gene Expression"),
  sidebarLayout(
    sidebarPanel(
      selectInput("gene_id",
                  "Select Gene:",
                  choices = unique(TPMs_table_100genes$GeneID))  # selecting GeneID as gene_id of choice
    ),
    mainPanel(
      plotOutput("plot1")
    )
  )
)
