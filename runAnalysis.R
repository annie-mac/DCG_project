
## 1) Download the dataset and unzip folder

## Check if directory already exists
if(!file.exists("./DCG_project")){
        dir.create("./DCG_project")
}
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Check if zip has already been downloaded in DCG_project directory
if(!file.exists("./DCG_project/project_Dataset.zip")){
        download.file(Url,destfile="./DCG_project/project_Dataset.zip",mode = "wb")
}
## Check if zip has already been unzipped
if(!file.exists("./DCG_project/UCI HAR Dataset")){
        unzip(zipfile="./DCG_project/project_Dataset.zip",exdir="./projectData")
}
## Set up the file path & list all the files in the UCI HAR Dataset folder
path <- file.path("./DCG_project" , "UCI HAR Dataset")
files<-list.files(path, recursive=TRUE)
## The files that will be used to load data are:
# test/subject_test.txt
# test/X_test.txt
# test/y_test.txt
# train/subject_train.txt
# train/X_train.txt
# train/y_train.txt

## Load activity, subject and feature data 
## Read data from the files into the variables

ActivityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
SubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
FeaturesTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)

##Merge the training and the test sets to create a single set.

## Concatenate each data table by rows using rbind
dataSubject <- rbind(SubjectTrain, SubjectTest)
dataActivity<- rbind(ActivityTrain, ActivityTest)
dataFeatures<- rbind(FeaturesTrain, FeaturesTest)

## Set names to variables, creating new variable names for subject & activity and using the features.txt file to assign provided 
## data features names
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

## Merge columns to get a single data frame of all data
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

## Step 2: Subset only the mean and standard deviation measurements using grep over "mean()" and "std()". Subset for mean, std, subject 
## & activity.
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

## Step 3) Use descriptive activity names to name the activities in the data set
## Read descriptive activity names from "activity_labels.txt"
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
## Factorise the variable activity in the data frame Data using descriptive activity names in col 2.
Data$activity<-factor(Data$activity,labels=activityLabels[,2])

## Step 4) Appropriately label the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

## Step 5) Create an independent tidy data set and write to new file

tidyData<-aggregate(. ~subject + activity, Data, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE,quote = FALSE, sep = '\t')