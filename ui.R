## ui.R ##
library(shiny)
library(shinydashboard); library(DT)

dashboardPage(
  
  dashboardHeader(title = "TEST reactive DT"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("See data", tabName = "db")
    ),
    radioButtons("rb1", label = "Select data", 
                 choices = list("IRIS" = "iris", "CARS" = "cars"),
                 selected = "iris")
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "db",
              h4("Show selected dataset"),
              fluidRow(DT::dataTableOutput('tbl2'))
      )
    )
  )
)  