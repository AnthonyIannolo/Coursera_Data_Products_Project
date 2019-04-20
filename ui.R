#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Anthony Iannolo
# April 15 2019
# Coursera Developing Data Products - Course Project
#
# This shiny application creates two linear models that allow estimation of tree volume.
# The model was developed using data from the R built-in trees dataset.
#
# The user component below provides two sliders for input to estiamte tree volume.  The first slider
# requests tree Girth and Model 1 tab will show the volume estimate based on tree Girth.  
# The second slider requests tree height and Model 2 tab will show the tree volume estiamte based 
# on tree height.
#

library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Tree Volume from Girth (Model 1) or Height (Model 2) "),
  sidebarLayout(
    sidebarPanel(
      h4("This application provides two linear models to estimate the volume of a tree."),
      h3(" "),
      h5(" The first slider provides for input to select the tree Girth for the volume estimate."),
      h3(" "),
      sliderInput("sliderGirth", "What is the Girth of the Tree?", 7, 27, value = 15),
      h3(" "),
      h5(" The second slider provides for input to select the tree Height for the volume estimate."),
      h3(" "),
      sliderInput("sliderHeight", "What is the Height of the Tree?", 50, 100, value = 70),
      h3(" "),
      h5("Select the tab of the model you would like to view.")
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Model 1", br(),             
                  plotOutput("plot1"),
                  h3("Predicted Tree Volume from Girth:"),
                  textOutput("pred1")
                          ),
                  
                  tabPanel("Model 2", br(),   
                  plotOutput("plot2"),
                  h3("Predicted Tree Volume from Height:"),
                  textOutput("pred2")
                          )
                  )
               )
            )
       )
   )
