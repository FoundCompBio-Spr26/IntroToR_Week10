# Clearing the workspace
rm(list=ls())

# Loading Chick Weight Dataset
data("ChickWeight")

# Attaching dataset to make it easier to reference variables
attach(ChickWeight)

# Checking the overall class of the dataset
class(ChickWeight)

# Checking the class of each element of ChickWeight
class(ChickWeight[,1])
class(ChickWeight[,2])
class(ChickWeight[,3])
class(ChickWeight[,4])

# Plotting chick weight as a function of time (x,y)
plot(Time,weight)

# Plotting chick weight as a function of time (y ~ x)
plot(weight ~ Time)

# Same plot, but customizing plotting options
plot(weight ~ Time,
     pch=16,
     col=rgb(0,0,0,0.4),
     ylab="Weight")

# Setting up a vector of 50 colors
cols <- rainbow(n=50)

# Plotting individual chick trajectories
for (i in 1:50){                          # Looping over chick ID numbers
  if (length(weight[Chick == i]) == 12){  # Safety check for all weights
    lines(x=c(seq(0,20,2),21),            # Manually plotting lines
          y=weight[Chick == i],
          col=cols[i])
  }
}

# Fitting and plotting an overall linear model (lm)
wByT <- lm(weight ~ Time)
abline(wByT,
       lwd=7)

# Plotting a single boxplot of weights for day 10
boxplot(weight[Time == 10])

# Plotting boxplots of weights as a function of day
boxplot(weight ~ Time)

# Same set of boxplots, but colorful!
boxplot(weight ~ Time, col=rainbow(n=length(unique(Time))))

# Histogram of day 14 weights
hist(weight[Time == 14])

# Histogram of day 14 weights, customized
hist(weight[Time == 14],
     xlab = "Weights",
     main = "Day 14 Weights",
     breaks = 20,
     col = rgb(0,0,1,0.5))

# Histograms of day 14 weights, by diet
hist(weight[Time == 14 & Diet == 1],
     xlab="Weights",
     main = "Day 14 Weights by Diet",
     xlim = c(min(weight[Time == 14])-25,max(weight[Time == 14])+25),
     ylim = c(0,6),
     breaks = seq(from = min(weight[Time == 14])-25,
                  to = max(weight[Time == 14])+25,
                  by = 25),
     col = rgb(1,0,0,0.3))

par(new=TRUE)

hist(weight[Time == 14 & Diet == 2],
     xlab = "",
     ylab = "",
     xaxt = "n",
     yaxt = "n",
     main = "",
     xlim = c(min(weight[Time == 14])-25,max(weight[Time == 14])+25),
     ylim = c(0,6),
     breaks = seq(from = min(weight[Time == 14])-25,
                  to = max(weight[Time == 14])+25,
                  by = 25),
     col = rgb(0,1,0,0.3))

par(new=TRUE)

hist(weight[Time == 14 & Diet == 3],
     xlab = "",
     ylab = "",
     xaxt = "n",
     yaxt = "n",
     main = "",
     xlim = c(min(weight[Time == 14])-25,max(weight[Time == 14])+25),
     ylim = c(0,6),
     breaks = seq(from = min(weight[Time == 14])-25,
                  to = max(weight[Time == 14])+25,
                  by = 25),
     col = rgb(0,0,1,0.3))

par(new=TRUE)

hist(weight[Time == 14 & Diet == 4],
     xlab = "",
     ylab = "",
     xaxt = "n",
     yaxt = "n",
     main = "",
     xlim = c(min(weight[Time == 14])-25,max(weight[Time == 14])+25),
     ylim = c(0,6),
     breaks = seq(from = min(weight[Time == 14])-25,
                  to = max(weight[Time == 14])+25,
                  by = 25),
     col = rgb(1,1,1,0.3))

# Boxplot of day 14 weights
boxplot(weight[Time == 14] ~ Diet[Time == 14])

# Comparing means across diets 
t.test(weight[Time == 14 & Diet == 1],
       weight[Time == 14 & Diet == 4])
