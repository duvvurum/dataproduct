library(shiny)
library(reshape2)
library(ggplot2)
mydata = iris
mydata$Species = as.character(mydata$Species)
shinyServer(
  function(input,output){
  datasetInput = reactive({
    Species <<- input$Species
    Organ1 <<- input$Organ1
    Organ2 <<- input$Organ2
   })
  output$Species = renderText({
    input$Species
  })

  output$summarytable = renderTable({
    x = mydata
    y = subset (x, x$Species == input$Species)
    summary(y)
  })
  
  output$myplot = renderPlot({
    x = melt(mydata)
    y = subset(x, x$Species == input$Species)
    z = subset(y, y$variable == input$Organ1)
    a = subset(y, y$variable == input$Organ2)
    par(mfrow = c(1, 2))
    hist(z$value, xlab = input$Organ1, main = "Frequency plots of flower Organ 1 measurments", col = 'orange', border = "white")
    hist(a$value, xlab = input$Organ2, main = "Frequency plots of flower Organ 2 measurments", col = 'purple', border = "white")
    
  })
  output$myplot1 = renderPlot({
    x = melt(mydata)
    y = subset(x, x$Species == input$Species)
    z = subset(y, y$variable == input$Organ1)
    a = subset(y, y$variable == input$Organ2)
    qplot(z$value, a$value, geom = c("point", "smooth"), method = "lm", main = 'Correlation between the two organ sizes', xlab = input$Organ1, ylab = input$Organ2)
  })
  
})