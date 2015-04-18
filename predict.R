library(UsingR)
library(caret)

data(galton)
# Transform inch to cm
galton = galton * 2.54

inTrain <- createDataPartition(y = galton$child, p=0.5, list=FALSE)
training <- galton[inTrain, ]
testing <- galton[-inTrain, ]

set.seed(32343)
modelFit <- train(child ~., data=galton, method="glm")
modelFit$finalModel
predictions <- predict(modelFit, newdata=testing)

sqrt(sum((predict(modelFit, newdata=training) - training$child)^2))
sqrt(sum((predictions - testing$child)^2))

save(modelFit, file = "model1.rda")