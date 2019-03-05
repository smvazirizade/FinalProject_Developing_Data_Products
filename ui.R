#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Price Prediction of Diamond"),
  # Chosing Sidbar for layout
  sidebarLayout(
    #items in the sidebar panel
    sidebarPanel(
      h3("The aim is to calculuate price of diamond based on the RVs."),
      h3("Select:"),
      sliderInput("car",             #the name of the var
                  h4("Carats"),      #the name it shows
                  min = 0.20,max = 5,value = 2.5),
      selectInput("clar", label = h4("Clarity"), 
                choices = list("Unspecified" = "*", "I1" = "I1", "SI2" = "SI2","SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1","VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
      selectInput("cut", label = h4("Cut"), 
                  choices = list("Unspecified" = "*", "Fair" = "Fair", "Good" = "^Good","Very Good" = "Very Good", "Premium" = "Premium","Ideal" = "Ideal")),
      selectInput("col", label = h4("Color"), 
                  choices = list("Unspecified" = "*", "D" = "D", "E" = "E","F" = "F", "G" ="G","H" = "H", "I" = "I","J" = "J"))
    ),
    #items in the main panel
    mainPanel(
      h3("Plotting the Regression Model"),
      plotOutput("distPlot"),
      h4("Predicted value of this diamond is:"),
      textOutput("result")
    )
  )
))