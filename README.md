# Getting-and-Cleaning-Data-Course-Project

Welcome to the repo Getting and Clening Data Course Project.
Here you will find:
  * **run_analysis.R**: the script that runs the code to create the new dataset
  - **clean_data.txt**: the new dataset after running the script
  - **CodeBook.md**: list of variables with their description if needed

So **run_analysis.R** does the following:
  1. Sets your working directory and reads the appropiate files
  2. Merges Training and Test sets
  3. Extracts the mean and standard deviation realated variables from features
  4. Creates a new variable with the explicit name of the activites (walking, sitting, ... )
  5. Rename the variables with a descriptive label (Ex. tBodyAcc-mean()-X
  6. Creates the average for each Activity and Subject
