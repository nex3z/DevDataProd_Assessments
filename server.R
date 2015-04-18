library(shiny)
library(caret)

load("model1.rda")

getMidParehtHeight <- function(fatherHeight, motherHeight) {
  return ((fatherHeight + 1.08 * motherHeight) / 2)
}

predictChildHeight <- function(midParentHeight) {
  height <- predict(modelFit, newdata=data.frame(parent= midParentHeight))
  return (height)
}

shinyServer(
  function(input, output) {
    output$inputFatherHeight <- renderPrint({input$fatherHeight})
    output$inputMotherHeight <- renderPrint({input$motherHeight})
    
    output$midparentHeight <- renderPrint({
      getMidParehtHeight(input$fatherHeight, input$motherHeight)})
    
    output$prediction <- renderPrint({predictChildHeight(getMidParehtHeight(
      input$fatherHeight, input$motherHeight))})
  }
)