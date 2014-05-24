## Codebook.md
=============================

### Variable Manifest
#### Numbers refer to the column index/position
1 - Subject_ID: the unique subject id/key

2 - Activity_Label: The name of the activity type 

3 through 48 - the averaged mean sensor readings (across each subject's repeated observations), grouped by axis of motion

48 through 81 - the averaged standard deviation of the sensor readings (across each subject's repeated observations), grouped by axis of motion

### Output description
When the 'run_analysis.R' file is executed with the UCI HAR Dataset in the same working directory, the R file will process and output the 'tidy.txt' file. Note this file is a comma-separated value (csv) plaintext file. 
This 'tidy' file contains a summarized version of the original data. (See the readme.md file for the transformation steps, and the run_analysis.R file for more detailed comments.)
In particular, the data in the tidy set is the union of the test and training sets, aggregated within unique subjects by averaging those measurements which were themselves means and standard devations of the original measurements.
Further details on the original data specifications can be found here: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
