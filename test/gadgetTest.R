library(shiny)
library(miniUI)
library(addinexamples)

# names(which(sapply(.GlobalEnv, is.data.frame)))  # select dataframe to rename
# Have gadget/addin rename and overwrite dataframe AND spit out list of rename commands to be added into script. 

myGadgetFunc <- function(inputValue1, inputValue2) {
  
  ui <- miniPage(
    gadgetTitleBar("Rename Columns"),
    mainPanel(
      tableOutput('table')
    )
  )
  
  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.
    
    output$table <- renderTable({
      head(data)
    })
    
    # When the Done button is clicked, return a value
    observeEvent(input$done, {
      returnValue <- ...
      stopApp(returnValue)
    })
    
    
  }
  
  runGadget(ui, server)
}
