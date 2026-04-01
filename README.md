# Introduction to R

## What is R?

- R is a language and environment for statistical computing and graphics.
- R provides a wide variety of statistical (linear and nonlinear modelling, classical statistical tests, time-series analysis, classification, clustering, …) and graphical techniques, and is highly extensible.
- R is an integrated suite of software facilities for data manipulation, calculation and graphical display.
- One of R’s strengths is the ease with which well-designed publication-quality plots can be produced.

Taken from: [The R Project for Statistical Computing](https://www.r-project.org/)

## R versus Python

Both R and Python are flexible programming languages that can do a lot! As you work on your own research projects, you will likely find situations where one or the other is most helpful. Some of their relative strengths come from the goals behind their creation. Python is a general-purpose programming language that was designed to be more human readable and more fun than other general programming languages. R was designed by statisticians to specifically support data analysis, exploration, and visualization. Other relative strengths come from the history of their usage - in other words, how many people in different fields use those languages. Python tends to be much more widely used in genomics, for example, while R tends to be much more widely used in ecology. As such, scientists in each of those fields have developed extra packages and functionalities that are specific to those languages.

## Downloads

[The R Console](https://mirror.las.iastate.edu/CRAN/)

[The RStudio Integrated Development Environment (IDE)](https://posit.co/download/rstudio-desktop/)

## Additional Resources

[R for Data Science](https://r4ds.hadley.nz/)

[Introduction to R Tutorial](https://cran.r-project.org/doc/manuals/R-intro.pdf)

[Advanced R](https://adv-r.hadley.nz/)

## Syntax Fundamentals

The standard assignment operator in R is an arrow, `<-`

```
a <- 3.0
```

If using the RStudio IDE, variables (and their corresponding values) should appear in the upper right `Environment` panel. To display the values of variables in the console, use the `print()` function

```
print(a)
```

To remove a variable from the `Environment`, use the `rm()` function

```
rm(a)
```

To remove all variables in the environment at the same time, use

```
rm(list=ls())
```

When using the RStudio IDE, code can be saved in scripts. To open a new script, click the icon with the green plus in the upper left corner, then select "R Script". All the code in the script can be executed at once by clicking "Source". Specific lines of code can be executed by selecting them and then clicking "Run".

Within scripts, comments can (and should!) be included by using `#`, as with Python

```
# This is a comment.
```

The fundamental data types in R are very similar to Python: double, integer, logical, character. Both doubles and integers are considered numeric variables.

```
myNum <- 4.5
class(myNum) # numeric
is.double(myNum) # TRUE

myInt <- 8L # The L specifies that the 8 is an integer
class(myInt) # integer
is.integer(myInt) # TRUE

myLogical <- TRUE
class(myLogical) # logical
is.logical(myLogical) # TRUE

myStr <- "exampleString"
class(myStr) # character
is.character(myStr) # TRUE
```

All of the standard mathematical operations are available for numeric variables and values

```
a + 3
a - a
a * 4
12 / 4
```

## Data Structures

### Vectors

R has several data structures for storing sets of variables or values. For an ordered collection of values of the same type, use a vector

```
myVec <- c(1.5, 2.4, 3.4, 9.7, 6.3)
class(myVec) # numeric
```

The `c()` function combines different values into a vector. If you try to combine values or variables of different types, R will conver them all to the most general of those types (often `character`)

```
myOtherVec <- c("a", 7.8, 3L)
```

As with lists and tuples Python, vectors in R can be subset by providing one or more indices in square brackets

```
myVec[2]
myVec[c(2,4)]
```

### Matrices (and Arrays)

Matrices are expansions of vectors in two dimensions. All variables need to be of the same type. They can be created either by providing a vector of values and telling R how many rows and columns the matrix should have, as well as whether the values should be filled in along the rows or along the columns.

```
myMatrix <- matrix(c(1:9),nrow=3,ncol=3,byrow=FALSE)

myMatrix

#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9
```

Matrices can also be created by taking separate vectors and binding them together as either rows or columns.

```
rowOne <- c(1,4,7)
rowTwo <- c(2,5,8)
rowThree <- c(3,6,9)

myMatrix <- rbind(rowOne,rowTwo,rowThree) # rbind() binds as rows
```

Individual values can be extracted from matrices by providing the row number and column number separated by a comma.

```
# The value in row two and column three
myMatrix[2,3]
```

Full rows or columns can be extracted (as vectors) from matrices by providing a single index with nothing on the other side of the comma.

```
rowTwo <- myMatrix[2,]
columnThree <- myMatrix[,3]

is.vector(columnThree) # TRUE
```

Matrices are particularly useful if you need to use any mathematical operations that are specifically defined for matrices (e.g., transpose, matrix products, etc.).

```
t(myMatrix) # transpose of the matrix

myMatrix %*% myMatrix
```

Arrays continue the expansion of vectors and matrices, but now for three or more dimensions.

```
myArray <- array(c(1:8),dim=c(2,2,2)) # two elements (rows, columns, etc.) in each of three dimensions

myArray[,,2]

#      [,1] [,2]
# [1,]    5    7
# [2,]    6    8
```

### Lists

Lists are similar to vectors, but more flexible. Importantly, they allow different data types to be stored together in one structure.

```
myList <- list(3L,"turtle",6.7)

myList

# [[1]]
# [1] 3

# [[2]]
# [1] "turtle"

# [[3]]
# [1] 6.7
```

Unlike vectors, the individual elements of a list are typically accesssed with double square brackets, `[[index]]`.

```
myList[[2]]

# [1] "turtle"
```

The different elements of a list can also be named. Some ways to construct lists will automatically assign names, but they can also be assigned or changed after a list is created.

```
names(myList) <- c("theIntegers","theWords","theDoubles")

myList

# $theIntegers
# [1] 3

# $theWords
# [1] "turtle"

# $theDoubles
# [1] 6.7
```

Once named, the elements of a list can be accessed (subset) using the `$` operator.

```
myList$theWords
```

Lists are particularly useful for storing heterogeneous data sets. Sometimes these consist of single values for each element in the list, but it is also common for the elements of a list to be other lists.

```
myList <- (c(3L,8L,10L,2L),
           c("turtle","chicken","duck"),
           rnorm(8))
```

### Data Frames

Data frames are lists that have particular properties. Roughly speaking, a data frame is a matrix, but with different data types in each column. Importantly, each column (usually a separate vector) must be the same length.

```
myDataFrame <- data.frame(1:4,letters[1:4],rnorm(4))
```

When reading data in from files, the default data structure is often a data frame. As with lists, the individual columns of a data frame are accessed using double bracket notation.

```
myDataFrame[[2]]
```

To access an individual value in a data frame, use double brackets followed by single brackets.

```
myDataFrame[[2]][3]
```

## Useful Functions

To generate a series of integers you can use the `:` notation

```
1:9
```

To generate any other regular series of numbers, you can use the `seq()` function.

```
seq(from=11,to=23,by=1.5)
```

To generate a set of repeating numbers, you can use the `rep()` function.

```
rep(4,times=7)
```

You can also generate more complex repeating series.

```
rep(c(4,5,9),times=4)
```

## Tips and Tricks

- Tab completion
- Scrolling through command history
- Help

## Reading data from a file

As with both bash and Python, we always need to keep track of our working directory in R, when reading from or writing to files. If you're using RStudio, you can use the Files panel in the bottom right to navigate between different directories and files. You can also see your current working directory at any time by looking at the top line of the Console panel in the bottom left. To change working directories from the command line in R, you can use `setwd()`

```
# Changing my working directory
setwd("~/Desktop/Datasets/")
```

To read in data from comma-delimited (`.csv`) data files, use `read.csv()`. If your working directory is set to the same folder where the dataset is located, you can simply provide the name of the file.

```
data <- read.csv("dataFile.csv")
```

If the dataset is located somewhere other than your current working directory, you can provide a full path to the file

```
data <- read.csv("~/Downloads/dataFile.csv")
```

For files with data delimited by whitespace, use `read.table()`

```
data <- read.table("dataFile.txt")
```

## Plotting (base R)

The `plot()` function is the simplest way to generate a standard scatter plot, which is often a good starting point for datasets with multiple numeric values.

```
data("ChickWeight")  # Loading the ChickWeight dataset available with R
attach(ChickWeight)  # Attaching the dataset, so we can use the variable names
plot(Time,weight)    # Generating a scatter plot comparing times (days) and weights
```

In this example, we are specifing that Time should be plotted on the x-axis and weight on the y-axis. However, we can also use R's notation for formulas (`~`).

```
plot(weight ~ Time)  # weight as a function of Time
```

Plots can also be customized in lots of different ways. Here's an example where we change the appearance of the points, the color of the points, and specify a better label for the y-axis.

```
plot(weight ~ Time,
     pch=16,               # pch specifies the type of point
     col=rgb(0,0,0,0.4),   # rgb(R,G,B,alpha) allows us to specify an RGB color (alpha is transparency)
     ylab="Weight")        # changing the y-axis label to "Weight"
```

Conveniently, R has built-in functions to help us generate different sets of colors. One of those functions is called `rainbow()`. By providing the number of colors we want as an argument, we can generate a list of colors across the spectrum of the rainbow to use in our plots.

```
cols <- rainbow(n=50)
```

Here, we'll use those colors to plot lines indicating the weight trajectory of each individual chick.

```
for (i in 1:50){                          # Looping over chick ID numbers
  if (length(weight[Chick == i]) == 12){  # Safety check to make sure the chick has all 12 weight measurements
    lines(x=c(seq(0,20,2),21),            # Manually plotting lines with days as the x coordinates...
          y=weight[Chick == i],           # ...and weights for chick i as the y coordinates.
          col=cols[i])                    # Each chick has a unique color, defined above with rainbow()
  }
}
```

We can also ask R to fit a linear model - `lm()` - to our data and then use the fitted values (slope and intercept) to plot the associated line. 

```
# Fitting and plotting an overall linear model (lm)
wByT <- lm(weight ~ Time)
abline(wByT, lwd=7)       # abline() uses a slope and intercept to plot the line
```

Let's also examine the fitted values from the model.

```
print(wByT)

# Call:
# lm(formula = weight ~ Time)

# Coefficients:
# (Intercept)         Time  
#      27.467        8.803
```

On average, how many grams of weight do chicks gain per day?

While scatterplots are useful, let's say that we instead want to see what the distribution of values looks like for a particular day. A box plot is useful in this case.

```
boxplot(weight[Time == 10])  # Creating a box plot of weights from day 10
```

Next, we might want to compare these distributions across all the days of our experiment. To do this, we can provide a formula to the `boxplot()` function, like we did with the `plot()` function.

```
boxplot(weight ~ Time)
```

For fun, let's make each of these box plots a different color across the rainbow spectrum. Note that the `unique()` function counts how many unique values there are for a factor (categorical variable) like Time.

```
boxplot(weight ~ Time, col=rainbow(n=length(unique(Time))))
```

To get a more precise sense for the distribution of values than we get with a box plot, we can use a histogram.

```
hist(weight[Time == 14])  # Histogram of weights from day 14
```

Here's another version of the histogram with some customized options.

```
hist(weight[Time == 14],
     xlab = "Weights",           # x-axis label
     main = "Day 14 Weights",    # plot title
     breaks = 20,                # number of bins 
     col = rgb(0,0,1,0.5))       # partially transparent blue
```

We might also want to compare distributions of weights for a particular day across diets. In that case, we can plot separate histograms for each diet. However, we'll need to manually specify the limits of the x- and y-axes to make sure the plots are comparable.

```
hist(weight[Time == 14 & Diet == 1],        # selecting only weights for day 14 and diet 1
     xlab = "Weights",                      # x-axis label
     main = "Day 14 Weights by Diet",       # plot title
     xlim = c(min(weight[Time == 14])-25,   # minimum value for the x-axis (25 grams less than the minimum value for that day)
              max(weight[Time == 14])+25),  # maximum value for the x-axis (25 grams more than the maximum value for that day)
     ylim = c(0,6),                         # min of 0 and max of 6 for the counts on the y-axis
     breaks = seq(from = min(weight[Time == 14])-25,  # specifying the position of breaks between 26 bins
                  to = max(weight[Time == 14])+25,
                  by = 25),
     col = rgb(1,0,0,0.3))    # Partially transparent red color

# par() is used for general plotting options.
# In this case, we're telling it plot the next histogram on the same plotting region.

par(new=TRUE)     

hist(weight[Time == 14 & Diet == 2],     # selecting only weights for day 14 and diet 2
     xlab = "",                          # avoiding writing multiple verisons of the labels and axes
     ylab = "",
     xaxt = "n",
     yaxt = "n",
     main = "",
     xlim = c(min(weight[Time == 14])-25,max(weight[Time == 14])+25),
     ylim = c(0,6),
     breaks = seq(from = min(weight[Time == 14])-25,
                  to = max(weight[Time == 14])+25,
                  by = 25),
     col = rgb(0,1,0,0.3))           # partially transparent green
```

We can also compare the distribution of weights across diets for day 14 using box plots, as we did for different days.

```
boxplot(weight[Time == 14] ~ Diet[Time == 14],
        xlab = "Diet",
        ylab = "Weights",
        col = rainbow(n=4))
```

As a statistical computing platform, R also has loads of built-in statistical tests. In this case, let's test whether the mean chick weight for diet 4 is different than the mean chick weight from diet 1 using a t-test.

```
t.test(weight[Time == 14 & Diet == 1],
       weight[Time == 14 & Diet == 4])

# Welch Two Sample t-test

# data:  weight[Time == 14 & Diet == 1] and weight[Time == 14 & Diet == 4]
# t = -3.796, df = 24.805, p-value = 0.0008436
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -59.25973 -17.56249
# sample estimates:
# mean of x mean of y 
#  123.3889  161.8000
```

# Practice Exercises

## Exercise 1 - Learning about BREC Parks

1. Download the BREC parks dataset, "BREC_Park_Amenities_20240409.csv", available in this repository. These data were originally downloaded from [Baton Rouge's Official Open Data Portal](https://data.brla.gov/)
2. Create a new R script to analyze these data.
3. Read the data into R.
4. What type of R object is your dataset when it is first read in?
5. Focusing on the acreage data, count how many parks are at least 5 acres in size.
6. Print out the names of those parks that are at least 5 acres.
7. What is the average acreage of all parks?
8. Which of the parks are classified as golf courses?
9. Which of the golf courses is biggest? Which is smallest?
