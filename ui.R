library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(
    h2("Iris petal length predictor")
  ),
  sidebarPanel(
    h4("Select your iris"),
    radioButtons("species",label = "Iris' species",choices = c("Setosa" = "1","Versicolor" = "2","Virginica" = "3")),
    sliderInput('width', "Select the petal's width (cm)", value = 2.5, min = 0, max = 5.0,step=0.01)
  ),
  mainPanel(
    h3('How to use?'),
    p('The Iris petal length predictor is THE
    web application that predicts the petal length of the iris you 
    hold in your hand. You will need to give us the species and the petal width.') ,
    p("Too often measurements are flawed and you can't only rely on an imperfect ruler to assess the length of the petal."),
    p("You can use our calculator free of charge for the first month."),
    p("Please enter the specification of your iris on the left panel"),
    h3('Watch your iris'),
    p('The big dot is your iris.'),
    plotOutput('plot'),
    h3('Detailed speficiations of your iris'),
    p('Current species'),
    verbatimTextOutput("species"),
    p("Current petal's width (cm)"),
    verbatimTextOutput("width"),
    p("Estimated petal's length (cm)"),
    verbatimTextOutput("length")
  ) 
  )
)
