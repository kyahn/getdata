# Getting and Cleaning Data Course Project Code Book

## Assignment Background
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the initial data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Assignment Output
The testing and trial components of the original data set were merged into a single source, and reduced to contain just those elements related to the mean and standard deviation of the collected inputs. These outputs were grouped by individual study participant, and broken out by type of activity (e.g. walking, climbing stairs, etc). The final output is a tidy data table with a single record per member, per activity type.

Code used to retreive and process source data is located at:

and a summary of variables in the data is located at:




