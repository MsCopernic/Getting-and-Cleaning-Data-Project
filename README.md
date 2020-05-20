### Getting and Cleaning Data Course Project

# Note: 

English is not my native language, so my apologies for the sintaxis and/or ortography errors. I will try to make my best

# Prepare a GitHub Repository

This is not the main assignment, but it must be done in some moment, so I start with it. Go to your GitHub account, and create a new repository, you may want to activate the *initialize this repository with a README*. Once created, copy the URL and go to the next step.

# Create a new RStudio project

Create a new **Vesion Control** project, use the URL from the GitHub repository, once created, you will find in the folder the README.md file (this one).

# Download the project package:

You may download the project folder in zip format, using the following URL

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unpack the files and place the content if possible under the new project folder. In the root folder, you wil find four files, you should read README.txt and features_info.txt. The other two contain data that you will use for the project. You will also find two folders (test & train), that contain the rest of the data files that you will be using.

# run_analysis.R

From R studio, create a new file with this name, if you want to chek my code, it's available in this repository, you may read the comments in the different sections.

Maybe the only code comment I will like to add at this point is the use of the **dataMaid** library and the **makeCodeBook** function, with it I created the Week4Codebook.pdf, that is available in this repository.
