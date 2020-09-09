# Course-Project-from-Getting-Cleaning-Data-Coursera-
This is the final project for the "Getting and Cleaning Data" Johns Hopkins University course on Coursera. This repo includes the following files:

1) **"run_analysis.R"**: the R script.
2) **"tidy_dataset.txt"**: the tidy data set as an output of "run_analysis.R" (if you run this code you will get this tidy data set as well).
3) This **"README.md"** describing in general terms how the script works,
4) **"CodeBook.md"**: the code book describing the variables, the data, and detailed steps about the transformations applied to get the two data sets: "final_dataset" and "grouped_dataset" (the latter being the "tidy_dataset.txt" you see uplodaded in this GitHub repo). In PDF format, it has a length of 4 pages in total.

The "run_analysis.R" script includes all the relevant code to get "tidy_dataset.txt". Apart from the code book where you will find detailed steps and explanations, the R script already has some comments dividing up the code into the 5 steps that are included in the Coursera instructions on how to do the work.

"run_analysis.R" only outputs "tidy_dataset.txt" with the use of the ```write.table()``` function. The other data set, "final_dataset" which has the ungrouped data, is not outputted, but there's the possibility to do this with ```write.table()``` as well.

**If you have any doubts regarding the "run_analysis.R" or if you don't quite understand it, please, refer to the code book: "CodeBook.md" which has all the explanation behind the R script.**
