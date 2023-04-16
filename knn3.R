
winedata = read.csv('C:\\winedata.csv', sep=",")
wineclass = winedata[,1]
winevalues = winedata[,-1]

#set up training set
wineclassTrain = wineclass[1:100]
winevaluesTrain = winevalues[1:100,]

#and test this
wineclassTest = wineclass[100:178]
winevaluetest = winevalues[100:178,]



library(class)
knn3pred = knn(winevaluesTrain, winevaluetest, wineclassTrain, k=3)

n = length(wineclassTest)
ncorrect = sum(knn3pred==wineclassTest)
accuracy = ncorrect/n
print(accuracy)