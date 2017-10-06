**Getting and Cleaning Data course project**

The course project is used for merging of training and test set to a data set
and cleaned and prepare a tidy data set.

The repository contains:

-   CodeBook.md- It contains details of the data set

-   README.md - this file

-   run_analysis.R – R script used to create tidy data set

-   tidydata.txt – contains the tidydata set

**Creating tidy data set**

The R script run_analysis.R used to create data set does the following.

-   Read the data.

-   Merge the training and test sets to create one data set.

-   Extract the measurements on the mean and standard deviation for each
    measurement.

-   Load activity and subject data for each dataset and merge those columns with
    dataset.

-   Label the data set with descriptive activity names.

-   Create tidy data set with the average of each variable foe each activity and
    subject.

-   Write the data set to tidydata.txt file.
