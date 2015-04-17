library(UsingR)
library(caret)

data(galton)
inTrain <- createDataPartition(y = galton$child, p=0.5, list=FALSE)
training <- galton[inTrain, ]
testing <- galton[-inTrain, ]

set.seed(32343)
modelFit <- train(child ~., data=galton, method="glm")
modelFit$finalModel
predictions <- predict(modelFit, newdata=testing)

sqrt(sum((predict(modelFit, newdata=training) - training$child)^2))
sqrt(sum((predictions - testing$child)^2))
