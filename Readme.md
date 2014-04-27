This script works by the following steps:

1. Load all of the test and train data (subject IDs, labels, and measurement data)
2. Create a vector of indexes that only include those measurements with mean or std in their name, then create a subset of the data with only those columns (and the IDs and activites)
3. (and 4.) Create and assign factor labels for the activity column
5. Create and fill the "tidy" dataset using the aggregate function in a loop. This takes the mean of each SubjectID-Activity_Label combination and adds it to the "tidy" dataset. Finally, it is exported to a .txt file.