#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
#
# Anthony Iannolo
# April 15 2019
# Coursera Developing Data Products - Course Project
#
# This shiny application creates two linear models that allow estimation of tree volume.
# The model was developed using data from the R built-in trees dataset.
#
# The server code below generates two linear models.  The first model has volume as the outcome with
# Girth as the predictor.  The second model also has volume as the outcome with height as the
# predictor.
#
# Next user input for the model predictor of Girth and Height are evaluated to provide the volume
# estimates.
# 
# Scatter Plots are then generated for the data used in the model along with the regression line and
# the predicted values based on the user slider input are displayed.


library(shiny)

shinyServer(function(input, output) {

# Generate linear models
  
  model1 <- lm(Volume ~ Girth, data = trees)
  model2 <- lm(Volume ~ Height, data = trees)
  
# Predict the volume based on values entered in the sliders
  
  model1pred <- reactive({
    GirthInput <- input$sliderGirth
    predict(model1, newdata = data.frame(Girth = GirthInput))
  })
  
  model2pred <- reactive({
    HeightInput <- input$sliderHeight
    predict(model2, newdata = data.frame(Height = HeightInput))
  })
  
# Create plots
  
  output$plot1 <- renderPlot({
    GirthInput <- input$sliderGirth
    
    plot(trees$Girth, trees$Volume, xlab = "Tree Girth", 
         ylab = "Tree Volume", bty = "n", pch = 16,
         xlim = c(5, 30), ylim = c(0, 100))
  
      abline(model1, col = "red", lwd = 2)
    
    points(GirthInput, model1pred(), col = "red", pch = 16, cex = 2)
  })
  
  output$plot2 <- renderPlot({
    HeightInput <- input$sliderHeight
    
    plot(trees$Height, trees$Volume, xlab = "Tree Height", 
         ylab = "Tree Volume", bty = "n", pch = 16,
         xlim = c(50, 100), ylim = c(0, 100))
    
    abline(model2, col = "blue", lwd = 2)

    points(HeightInput, model2pred(), col = "blue", pch = 16, cex = 2)
  })
  
# Output the predicted values
  
  output$pred1 <- renderText({
    model1pred()
  })

  output$pred2 <- renderText({
    model2pred()
  })
  
})