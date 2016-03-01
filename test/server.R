library(shiny)
library(dplyr)
shinyServer(function(input, output) {
  prices<-reactive({
    c(input$prices1,input$prices2)
  })
  sales<-reactive({
    c(input$sales1,input$sales2)
  })
  combined<-reactive({
    data.frame(prices(),sales())
  })
  combined_final<-reactive({
    mutate(combined(),Rev=prices()*sales())
  })
  namerev<-reactive({
    as.character(paste("Rev",input$Item,sep="_"))
  })
  combined_final_rename<-reactive({
    d <- combined_final()
    colnames(d)[colnames(d)=='Rev'] <- namerev()
    d
  })
  output$table<-renderDataTable({
    combined_final_rename()
  })
})