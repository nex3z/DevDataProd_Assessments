library(shiny)

diabetesRisk <- function(fatherHeight) fatherHeight / 200

getMidParehtHeight <- function(fatherHeight, motherHeight) {
  return ((fatherHeight + 1.08 * motherHeight) / 2)
}

shinyServer(
  function(input, output) {
    output$inputFatherHeight <- renderPrint({input$fatherHeight})
    output$inputMotherHeight <- renderPrint({input$motherHeight})
    
    output$midparentHeight <- renderPrint({
      getMidParehtHeight(input$fatherHeight, input$motherHeight)})
    
    output$prediction <- renderPrint({diabetesRisk(input$fatherHeight)})
  }
)