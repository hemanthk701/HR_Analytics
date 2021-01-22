#model
#fitting random forest model to hr dataset
#install.packages("randomForest")
library("randomForest")

hrd <- read.csv("https://raw.githubusercontent.com/hemanthk701/HR_Analytics/main/train.csv")
h_test <- read.csv("https://raw.githubusercontent.com/hemanthk701/HR_Analytics/main/test.csv")

hrd <- hrd[,-1]

names(hrd)
names(h_test)

unique(hrd$department)

sapply(hrd,class)
sapply(h_test, class)

str(hrd)
str(h_test)

hrd$KPI <- as.factor(hrd$KPI)
h_test$KPI <- as.factor(h_test$KPI)
hrd$previous_year_rating <- as.factor(hrd$previous_year_rating)
h_test$previous_year_rating <- as.factor(h_test$previous_year_rating)

hrd <- hrd[,-1]
head(hrd)

rf <- randomForest(is_promoted~.,ntree= 50 ,data = hrd)
plot(rf)
d<- hrd[10,]
d
a <- hrd[12,]
b <- h_test[12,]
b
b = b[-1,]
b[1,] <- c(42639,"Sales & Marketing","region_17","Master's & above","Male","Sourcing",1,40,3,10,0,"No award",46)
b
c <- hrd[2,-13]
c <- c[-1,]
c[1,] <- c("Sales & Marketing","region_17","Master's & above","Male","Sourcing",1,40,3,10,0,"No award",46)
c
res <- as.character(predict(rf,newdata = c))
predict(rf,newdata=hrd[14,-14])

c <- rbind(a[,-14],b)
c[1,]
predict(rf,newdata = a[,-14])

h_test$Promoted <- predict(rf,newdata = h_test)
write.csv(h_test$Promoted,file="promoted.csv")

#validation
set.seed(123)
sample <- sample.int(n = nrow(hrd), size = floor(.75*nrow(hrd)), replace = F)
train <- hrd[sample, ]
test  <- hrd[-sample, ]


#rds
saveRDS(rf, "./rf.rds")
randfor <- readRDS("./rf.rds")
print(randfor)
predict(randfor,newdata = a[,-14])

y <- y[-1,]
y
saveRDS(y,"./data.rds")
print(y)
data <- readRDS("./data.rds")