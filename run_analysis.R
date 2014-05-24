## General comments

## TODO
# Check for files and download if necessary

featureNames <- read.table("UCI HAR Dataset\\features.txt") #Read the feature names
activityNames <- read.table("UCI HAR Dataset\\activity_labels.txt") #Read the Activity names

testData <- read.table("UCI HAR Dataset\\test\\X_test.txt") #Read the test data
testSubject <- read.table("UCI HAR Dataset\\test\\subject_test.txt") #Read subject id for test data
testY <- read.table("UCI HAR Dataset\\test\\y_test.txt") #Read activity id for test data

trainData <- read.table("UCI HAR Dataset\\train\\X_train.txt") #Read the train data
trainSubject <- read.table("UCI HAR Dataset\\train\\subject_train.txt") #Read subject id for train data
trainY <- read.table("UCI HAR Dataset\\train\\y_train.txt") #Read activity id for train data

mergedData <- rbind(trainData, testData) #Merge test and train data
colnames(mergedData) <- featureNames[,2] #Name columns by feature names

mergedData$subjectID <- c(trainSubject[[1]], testSubject[[1]]) #Add column for subject id
mergedData$activityName <- factor( c(trainY[[1]], testY[[1]]), 
                                    levels=activityNames[,1], 
                                    labels=activityNames[,2]) #Add column for target Y(activity)

meanColNames <- grep("mean", colnames(mergedData), value=TRUE) #Column names with mean in it
stdColNames <- grep("std", colnames(mergedData), value=TRUE) #Column names with std in it
subMergedData <- mergedData[, c(meanColNames,stdColNames, "subjectID", "activityName")] #Subset of mergedData with only 
                                                                                  #mean, std, subject id & Activityid
#Rename all columns to remove "-", "(", ")"
names(subMergedData) <- gsub("+[-()]", "", names(subMergedData)) 

write.csv(subMergedData, file="subMergedData.txt", row.names=FALSE) #Write subMergedData data to new file

selIDX = !(names(subMergedData) %in% c("subjectID","activityName")) #Logical vector selecting all col. except subjectID, 
                                                                  #activityName
summData <- sapply( split(subMergedData, 
                          interaction( subMergedData$subjectID, subMergedData$activityName),
                          drop=TRUE), #Splits the df on sublevels of subjectID, activityName
                    function(elm){
                      apply(elm[,selIDX], 2, mean) #Takes the mean of each col. in selIDX for each subjectID, activityName
                    } )
summData <- t(summData)
summData <- data.frame(subjectID=sub(".[A-Z _]+", "", rownames(summData)),
                       summData,
                       activityName=factor(sub("[0-9]+.", "", rownames(summData)))
                       ) #Seperate Subject ID and activity

write.csv(summData, file="summaryData.txt", row.names=FALSE) #Write summary data to new file
