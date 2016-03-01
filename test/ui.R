library(shiny)
shinyUI(fluidPage(
  titlePanel("Tool"),
  sidebarLayout(
    sidebarPanel(
      textInput("Item","Enter Item Name"),
      div(class='row-fluid',
          div(class='span6', numericInput("sales1","Enter Sales",value=0),numericInput("sales2","Enter Sales",value=0)),
          div(class='span6', numericInput("prices1","Enter price",value=0),numericInput("prices2","Enter price",value=0))
      )),
    mainPanel(
      dataTableOutput("table")
    )
  )
))


