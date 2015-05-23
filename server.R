library(shiny)
library(ggplot2)
library(caret)

data(iris)
inTrain<-createDataPartition(y=iris$Species,p=0.9,list=FALSE)
training<-iris[inTrain,]
testing<-iris[-inTrain,]
#modFit<-train(Species~.,data=training, method='rf',prox=TRUE)
modFit<-randomForest(Species ~. , data=training)
#qplot(Petal.Width,Petal.Length,col=Species, data=iris)
#qplot(Sepal.Width,Sepal.Length,col=Species, data=iris)

#colnames(newValues)<-c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')

 



shinyServer(
  function(input, output) {
  
    irisSpecies <- function(sl,sw,pl,pw){
      newValues<-data.frame(sl,sw,pl,pw)
      colnames(newValues)<-c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
      return(predict(modFit,newValues))

    }
    
    output$main_plot1 <- renderPlot({
      p<-qplot(Petal.Width,Petal.Length,col=Species, data=iris, main="Iris Petal Sizes", xlab="Petal Width (cm)", ylab="Petal Length (cm)")
      q<-geom_point(aes(x=input$pw, y=input$pl),color="black",size=7,shape=1)
      p+q
    })
    
    output$main_plot2 <- renderPlot({
      p<-qplot(Sepal.Width,Sepal.Length,col=Species, data=iris, main="Iris Sepal Sizes", xlab="Sepal Width (cm)",ylab="Sepal Length (cm)")
      q<-geom_point(aes(x=input$sw, y=input$sl),color="black",size=7,shape=1)
      p+q
    })
    
    output$inputValue1 <- renderPrint({input$sl})
    output$inputValue2 <- renderPrint({input$sw})
    output$inputValue3 <- renderPrint({input$pl})
    output$inputValue4 <- renderPrint({input$pw})

    output$prediction <- renderPrint({irisSpecies(input$sl,input$sw,input$pl,input$pw)})
    #output$prediction <- renderPrint({newValues})
  }
)