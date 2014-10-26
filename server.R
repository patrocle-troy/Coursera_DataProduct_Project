library(shiny)
library(UsingR)
library(ggplot2)
library(shinyapps)
data(iris)


predictLength<-function(species,width)
{
  inSpec<-species;
  inSpecFact<-switch(inSpec,'1'='setosa','2'='versicolor','3'='virginica');
  inWidth<-width;
  
  df = iris[,c('Petal.Length','Petal.Width','Species')];
  colnames(df)<-c('length','width','species')
  lmselect<-lm(length~width,data=df[df$species==inSpecFact,])
  outLength<-predict(lmselect,data.frame(width=inWidth))
  dpredict <- data.frame(width=inWidth,length=outLength,species=inSpecFact)
}


shinyServer(
  function(input,output){
    output$species<-renderPrint(
      {
        switch(input$species,'1'='setosa','2'='versicolor','3'='virginica')});
        output$width<-renderPrint(input$width);
        output$length<-renderPrint({
          predict<-predictLength(input$species,input$width)
          round(predict$length[1], 2)
        });
    output$plot<-renderPlot(
      {
        df = iris[,c('Petal.Length','Petal.Width','Species')];
        colnames(df)<-c('length','width','species')
        dpredict<-predictLength(input$species,input$width)
        dplot<-rbind(dpredict,df)
        p<-qplot(width,length,data=dplot, col=species, main='Iris petals')+geom_point(aes(colour=dpredict$species), size=5,data = dpredict);
        print(p)
      }
      )
    })
