library(shiny)
library(ggplot2)
library(lattice)
library(randomForest)

shinyUI(
  fluidPage(
    # Application title
    titlePanel("Prediction of Iris Species"),
   mainPanel(
    fluidRow(
      column(8,
             "This application aims to predict the species of an Iris flower, based on your measurement of the dimensions of the flowers sepals and petals.",br(), 
             "The Iris flower data set or Fisher's Iris data set by Sir Ronald Fisher (1936) and a random forest machine learning algorithm is used to 
                classify and predict the three Iris species: Iris setosa, Iris virginica and Iris versicolor." ,br(),br(),br()
      ),
      column(8,
             h4('Input Panel'),
             'Please fill in your measurements of the Iris Petal and Sepal sizes. The definitions are shown in the picture. After pressing the "Submit" bottom, your values and the predicted Iris species will be shown below.',br(),br()
      )
    ),
  
    fluidRow(
      column(4,
      numericInput('sl', 'Sepal Length (cm)', 4, min = 0.1, max = 10, step = 0.1),
      numericInput('sw', 'Sepal Width (cm)', 3, min = 0.1, max = 10, step = 0.1),
      numericInput('pl', 'Petal Length (cm)', 4, min = 0.1, max = 10, step = 0.1),
      numericInput('pw', 'Petal Width (cm)', 2, min = 0.1, max = 10, step = 0.1),
      
      submitButton('Submit'),
      br()
      ),
      
      column(4,
             img(src="iris_petal_sepal.png")
             )
    ),
    
    fluidRow(
      
    #mainPanel(
        br(),
      h4('Your entered values are depicted by the two circles in the figures:'),
      #h5('Sepal Length of:'),
      #verbatimTextOutput("inputValue1"),
      #h5('Sepal Width of:'),
      #verbatimTextOutput("inputValue2"),
      #h5('Petal Length of:'),
      #verbatimTextOutput("inputValue3"),
      #h5('Petal Width of:'),
      #verbatimTextOutput("inputValue4"),
      column(6,
      plotOutput(outputId = "main_plot1", height = "300px")
      ),
      column(6,
      plotOutput(outputId = "main_plot2", height = "300px")
      )
    ),
    
    fluidRow(
            h3('Results of prediction'),
        h4('Your Input data yielded the following prediction of Iris species: '),
      verbatimTextOutput("prediction"),br(),
      "Sources: http://en.wikipedia.org/wiki/Iris_flower_data_set",br(),
      "http://archive.ics.uci.edu/ml/datasets/Iris"
      )
  
  ,width=10)#mainPanel
  )   #fluidPage
)#shinyUI
