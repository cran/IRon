% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/phi.R
\name{phi.control}
\alias{phi.control}
\title{Generation of relevance function}
\usage{
phi.control(
  y,
  phi.parms,
  method = phiMethods,
  extr.type = NULL,
  control.pts = NULL,
  asym = TRUE,
  ...
)
}
\arguments{
\item{y}{The target variable of a given data set}

\item{phi.parms}{The relevance function providing the data points where the pairs of values-relevance are known}

\item{method}{The method used to generate the relevance function (extremes or range)}

\item{extr.type}{Type of extremes to be considered: low, high or both (default)}

\item{control.pts}{Parameter required when using 'range' method, representing a 3-column matrix of y-value, corresponding relevance value (between 0 and 1), and the derivative of such relevance value}

\item{asym}{Boolean for assymetric interpolation. Default TRUE, uses adjusted boxplot. When FALSE, uses standard boxplot.}

\item{...}{Misc data to be added to the relevance function}
}
\value{
A list with three slots with information concerning the relevance function
\item{method}{The method used to generate the relevance function (extremes or range)}
\item{npts}{?}
\item{control.pts}{Three sets of values identifying the target value-relevance-derivate for the first low extreme value, the median, and first high extreme value}
}
\description{
This procedure enables the generation of a relevance function that performs a mapping between the values in a given target variable and a relevance value that is bounded by 0 (minimum relevance) and 1 (maximum relevance). This may be obtained automatically (based on the distribution of the target variable) or by the user defining the relevance values of a given set of target values - the remaining values will be interpolated.
}
\examples{
library(IRon)

data(accel)

ind <- sample(1:nrow(accel),0.75*nrow(accel))

train <- accel[ind,]
test <- accel[-ind,]

ph <- phi.control(train$acceleration); phiPlot(test$acceleration, ph)
ph <- phi.control(train$acceleration, extr.type="high"); phiPlot(test$acceleration, ph)
ph <- phi.control(train$acceleration, method="range",
  control.pts=matrix(c(10,0,0,15,1,0),byrow=TRUE,ncol=3)); phiPlot(test$acceleration, ph)

}
