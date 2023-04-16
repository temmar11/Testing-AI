winedata = read.csv('C:\\winedata3.csv', sep=",")
wineclass = winedata[,1]
winevalues = winedata[,-1]

#set up training set
wineclassTrain = wineclass[1:100]
winevaluesTrain = winevalues[1:100,]

#and test this
wineclassTest = wineclass[100:178]
winevaluetest = winevalues[100:178,]


#ainstall.packages("rpart")
library(rpart)
fit = rpart(wineclassTrain~., method="class", data=winevaluesTrain)

plot(fit, uniform=TRUE, main="Decision Tree for WineData3")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

treepred = predict(fit, winevaluetest, type = 'class')

n = length(wineclassTest) # this is the number of test cases
ncorrect = sum(treepred==wineclassTest) #the number of correctly predicted 
accuracy = ncorrect/n
print(accuracy)

table_mat = table(wineclassTest, treepred)
print(table_mat)

pfit = prune(fit, cp=0.1)
plot(pfit, uniform=TRUE, main="pruned Decision Tree for WineData3")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)












