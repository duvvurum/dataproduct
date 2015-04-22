library(shiny)
mydata = iris
mydata$Species = as.character(mydata$Species)
shinyUI(fluidPage(
  titlePanel("Descriptive data analysis of iris data set"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Species", "Choose Species:", choices = c("setosa", "versicolor", "virginica"), selected = "setosa", multiple = FALSE),
      radioButtons("Organ1", "Choose Flower organ 1:", choice = sort(colnames(mydata)[1:4]), selected = "Petal.Length"),
      radioButtons("Organ2", "Choose Flower organ 2:", choice = sort(colnames(mydata)[1:4]), selected = "Petal.Width")
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          h4("Documentation"),
          h3("Introduction:"),
          helpText("The Iris flower data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and Iris versicolor). 
to quantify the morphologic variation of Iris flowers of three related species four features were measured from each sample: 
the length and the width of the sepals and petals, in centimetres."),
          h3("Instructions:"),
          helpText("This app will provide you easy access to visualize and find correlation between measurements of any two organs you choose.
                   First select the species  from Choose Species Drop down. By default  Species setaosa. Multiple selctions are not allowed.
                   Then choose organ 1 and organ 2. By default 'Petal.Length' and 'Petal.Width' are selceted respectively as Organ 1 and Organ2.
                   Now the summary of the data available for selected species will be displayed in 'Summary tab'. Histograms depicting the organs chosen will be displayed in 'Frequency plot' tab.
                   The correlation between the organs choosen is displayed in Correlation plot tab. the statistics used are linear models. 
                   Hint: To view perfect correlaiton choose same organ1 and organ2")
          ),  
        
          tabPanel(
            h4("Summary"),
            h3(("Reported measurment summary for selected species")) ,
            tableOutput("summarytable")),
          tabPanel(
            h4(("Frequency plots")),
            plotOutput("myplot")),
          tabPanel(
            h4(("Correlation plot")),
            plotOutput ("myplot1"))
        )
      )
    )
  )
)
