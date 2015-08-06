## server.R ##
library(shiny)
library(shinydashboard)
library(DT)

server <- function(input, output, session) {
  
  output$value <- renderPrint({ input$rb1 })
  
  data <- reactive({
    switch(input$rb1,
           "iris" = iris,
           cars)
  })
  
  action <- dataTableAjax(session, cars)
  widget <- datatable(cars, 
                      class = 'display cell-border compact',
                      filter = 'top',
                      #server = TRUE,
                      options = list(ajax = list(url = action))
  )
  
  output$tbl2 <- DT::renderDataTable({
    DT::datatable(data())
  })
}