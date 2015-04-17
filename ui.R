library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Child's Height Prediction"),
    
    sidebarPanel(
      numericInput("fatherHeight", "Father's height (cm): ", 160, min = 0, 
                   max = 300, step = 1),
      numericInput("motherHeight", "Mother's height (cm): ", 160, min = 0, 
                   max = 300, step = 1),
      submitButton("Predict")
    ),
    
    mainPanel(
      h3("Results of prediction"),
      
#       h4("Father's height (cm): "),
#       verbatimTextOutput("inputFatherHeight"),
#       
#       h4("Mother's height (cm): "),
#       verbatimTextOutput("inputMotherHeight"),
      
      h4("Midparent height (cm): "),
      verbatimTextOutput("midparentHeight"),
      
      h4("The prediction of your child's height (cm): "),
      verbatimTextOutput("prediction")
    )
  )
)