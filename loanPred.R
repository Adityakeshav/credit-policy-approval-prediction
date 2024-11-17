install.packages("randomForest","caTools","tidyverse","caret","caTools")

library(tidyverse)
library(caret)
library(caTools)
library(randomForest)

loan_data <- read.csv("loan_data.csv")
str(loan_data)
summary(loan_data)
head(loan_data)

loan_data$purpose<-as.factor(loan_data$purpose)
loan_data$credit.policy<-as.factor(loan_data$credit.policy)

loan_data<-loan_data%>%drop_na()

set.seed(123)
split <- sample.split(loan_data$credit.policy, SplitRatio = 0.7)
train_data <- subset(loan_data, split == TRUE)
test_data <- subset(loan_data, split == FALSE)

# Check distribution of credit policies
ggplot(train_data, aes(x = credit.policy, fill = credit.policy)) +geom_bar() +labs(title = "Distribution of Credit Policy Approval")

# Relationship between FICO score and credit policy
ggplot(train_data, aes(x = fico, fill = credit.policy)) +geom_histogram(bins = 30, position = "dodge") +labs(title = "FICO Score by Credit Policy")

# Interest rate vs. credit policy
ggplot(train_data, aes(x = int.rate, fill = credit.policy)) +geom_density(alpha = 0.5) +labs(title = "Interest Rate by Credit Policy")


set.seed(123)
rf_model=randomForest(credit.policy ~.,data=train_data,ntree=100,importance=TRUE)
rf_predictions=predict(rf_model,newdata=test_data)
cf=confusionMatrix(rf_predictions,test_data$credit.policy)
print(cf)

confusion_matrix=table(rf_predictions,test_data$credit.policy)
print(confusion_matrix)
accuracy=mean(rf_predictions==test_data$credit.policy)
print(accuracy)


dt_model <- rpart(credit.policy ~ ., data = train_data, method = "class")
dt_predictions <- predict(dt_model, newdata = test_data, type = "class")
cf_dt <- confusionMatrix(dt_predictions, test_data$credit.policy)
print(cf_dt)

confusion_matrix_dt <- table(dt_predictions, test_data$credit.policy)
print(confusion_matrix_dt)
accuracy_dt <- mean(dt_predictions == test_data$credit.policy)
print(accuracy_dt)

