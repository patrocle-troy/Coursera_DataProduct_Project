library(ggplot2)
data('iris')


predictConsole<-function(){
df = iris[,c('Petal.Length','Petal.Width','Species')];
colnames(df)<-c('length','width','species')

lmset<-lm(length~width,data=df[iris$Species=='setosa',])
lmver<-lm(length~width,data=df[iris$Species=='versicolor',])
lmvir<-lm(length~width,data=df[iris$Species=='virginica',])

## input
cat('Select species [1. Setosa, 2. Versicolor, 3. Virginica]\n')
inSpec<-scan()
inSpecFact<-switch(inSpec,'1'='setosa','2'='versicolor','3'='virginica')
cat("What's the petal's width:\n")
inWidth<-scan()
## end input

lmselect<-switch(inSpec,'1'=lmset,'2'=lmver,'3'=lmvir)
lmpredict<-predict(lmselect,data.frame(width=inWidth))
outLength<-lmpredict
dpredict <- data.frame(width=inWidth,length=outLength,species=inSpecFact)


## output
cat("The expected petal's length is:\n", outLength)

p<-qplot(width,length,data=rbind(dpredict,df), col=species, main='Iris petals 2')+geom_point(aes(colour=inSpecFact), size=5,data = dpredict) 
print(p)
## end output
}


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
  dplot<-rbind(dpredict,df)
  # p<-plot(dplot$width,dplot$length)
  p<-qplot(width,length,data=dplot, col=species, main='Iris petals 2')+geom_point(aes(colour=dpredict$species), size=5,data = dpredict)
  print(p)
  dpredict
}
