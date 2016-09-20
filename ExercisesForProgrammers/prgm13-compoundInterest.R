#!/usr/bin/env Rscript

#Exercises For Programmers
#Exercise 13: Compound Interest

#Get the user input functions
source('commonFunc.R')

getPrinciple <- function(params) {
  return(params[["principle"]])
}

getRate <- function(params) {
  return(params[["rate"]])
}

getYears <- function(params) {
  return(params[["years"]])
}

getCompounded <- function(params) {
  return(params[["compounded"]])
}

computeInterest <- function(params) {
  nt <- getCompounded(params) * getYears(params)
  rdc <- (getRate(params) / 100.0) / getCompounded(params)
  return(round((getPrinciple(params) * (1 + rdc)^nt),2))
}

getInput <- function() {
  p <- as.numeric(getUserInput("What is the principle amount? "))
  r <- as.numeric(getUserInput("What is the annual rate of interest (expressed as a %, i.e 4.3)? "))
  y <- as.numeric(getUserInput("Time invested (years)? "))
  c <- as.numeric(getUserInput("What is the number of times the interest is compounded per year? "))
  
  if (!is.na(p) && !is.na(r) && !is.na(y) && !is.na(c)) {
    return (c(principle=p, rate=r, years=y, compounded=c))
  } else {
    print("One or more input items were left blank or were invalid")
    return(NULL)
  }
}

formatOutput <- function(input, amount) {
  principle <- paste("$", getPrinciple(input), sep="")
  rate <- paste(getRate(input), "%", sep="")
  amount <- paste("$", amount, sep="")
  return(paste(principle, "at", rate, "for", getYears(input), "years compounded", getCompounded(input), "times per year is", amount, sep=" "))
}
main <- function() {
  input <- getInput()
  if (!is.null(input)) {
    write(formatOutput(input, computeInterest(input)), stdout())
  }
}

main()