# CodeBook CourseProject Getting and Cleaning Data 
## *Cristóbal Montt*

## Data

The data used in this project corresponds to the 'Human Activity Recognition
Using Smartphones Data Set' available from [UCL Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
As it is informed in the previous webpage, the data corresponds to different
measurements of different activities of 30 volunteers between the ages 19-48 years old.
The measurements correspond to 561 variables (or features, as they are called in machine learning
language). 

The data used for this project was stored in six different .txt files, three datasets
for each data, the train and test data.
The id of the test and train subjects was available in the subject_test.txt and subject_train.txt files
respectively.
The activity id was available in the y_test.txt and y_train.txt files respectively.
And the measurement data was available in the X_test.txt and X_train.txt files respectively.

## Data Transformations

I read each .txt file into R, then I cbinded the measurement data with the subject id and activity id 
for the test and train dataset separately. Afterwards, I rbinded the data from the test and train datasets. Hence,
I assumed that the rows of each .txt file were in the same order.

By extracting only the measurements corresponding to means and stds, I ended with 68 features:

 [1] "id"                       "activity"                 "tBodyAccmeanX"           
 [4] "tBodyAccmeanY"            "tBodyAccmeanZ"            "tBodyAccstdX"            
 [7] "tBodyAccstdY"             "tBodyAccstdZ"             "tGravityAccmeanX"        
[10] "tGravityAccmeanY"         "tGravityAccmeanZ"         "tGravityAccstdX"         
[13] "tGravityAccstdY"          "tGravityAccstdZ"          "tBodyAccJerkmeanX"       
[16] "tBodyAccJerkmeanY"        "tBodyAccJerkmeanZ"        "tBodyAccJerkstdX"        
[19] "tBodyAccJerkstdY"         "tBodyAccJerkstdZ"         "tBodyGyromeanX"          
[22] "tBodyGyromeanY"           "tBodyGyromeanZ"           "tBodyGyrostdX"           
[25] "tBodyGyrostdY"            "tBodyGyrostdZ"            "tBodyGyroJerkmeanX"      
[28] "tBodyGyroJerkmeanY"       "tBodyGyroJerkmeanZ"       "tBodyGyroJerkstdX"       
[31] "tBodyGyroJerkstdY"        "tBodyGyroJerkstdZ"        "tBodyAccMagmean"         
[34] "tBodyAccMagstd"           "tGravityAccMagmean"       "tGravityAccMagstd"       
[37] "tBodyAccJerkMagmean"      "tBodyAccJerkMagstd"       "tBodyGyroMagmean"        
[40] "tBodyGyroMagstd"          "tBodyGyroJerkMagmean"     "tBodyGyroJerkMagstd"     
[43] "fBodyAccmeanX"            "fBodyAccmeanY"            "fBodyAccmeanZ"           
[46] "fBodyAccstdX"             "fBodyAccstdY"             "fBodyAccstdZ"            
[49] "fBodyAccJerkmeanX"        "fBodyAccJerkmeanY"        "fBodyAccJerkmeanZ"       
[52] "fBodyAccJerkstdX"         "fBodyAccJerkstdY"         "fBodyAccJerkstdZ"        
[55] "fBodyGyromeanX"           "fBodyGyromeanY"           "fBodyGyromeanZ"          
[58] "fBodyGyrostdX"            "fBodyGyrostdY"            "fBodyGyrostdZ"           
[61] "fBodyAccMagmean"          "fBodyAccMagstd"           "fBodyBodyAccJerkMagmean" 
[64] "fBodyBodyAccJerkMagstd"   "fBodyBodyGyroMagmean"     "fBodyBodyGyroMagstd"     
[67] "fBodyBodyGyroJerkMagmean" "fBodyBodyGyroJerkMagstd" 

"id" corresponds to the subject id, it ranges from 1 to 30.
"activity" correspond to the activity label performed by the subject. It has six levels,

1. "walking" 
2. "walking_upstairs" 
3. "walking_downstairs"
4. "sitting"  
5. "standing"   
6. "laying"  

The rest of the varaibles correspond to the different measurements that were performed on the
subjects and activities. These measurements came normalized and bounded within [-1,1] from the original
text files.

Finally, I cleaned up a little bit the name of the features by extracting the - and () from their
names.

