library(shiny);library(ggplot2);library(dplyr)
data(diamonds)
# select columns to be used in the analysis
diam <- diamonds[,c(1:4,7)]
# Define server logic required to draw a plot
shinyServer(function(input, output) {
   Modeldiam <- reactive({
    # select diamonds depending of user input
    diam <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
  })
   ModelPred <- reactive({
     # build linear regression model
     fit <- lm( price~carat, Modeldiam())
     # predicts the price 
     pred <- predict(fit, newdata = data.frame(carat = input$car,cut = input$cut,color = input$col,clarity = input$clar))
  })   
  output$distPlot <- renderPlot({
    # Drow the plot using ggplot
    plot <- ggplot(data=Modeldiam(), aes(x=carat, y = price))+
      geom_point()+
      geom_smooth(method = "lm",formula = y ~ x)+
      geom_vline(xintercept = input$car, color = "green")+
      geom_hline(yintercept = ModelPred(), color = "green")+
      xlim(0, 5)
    plot
  })
  output$result <- renderText({
    # the value of the point on the graph
    res <- paste(round(ModelPred(), digits = 2), "$")
    res
  })
})
