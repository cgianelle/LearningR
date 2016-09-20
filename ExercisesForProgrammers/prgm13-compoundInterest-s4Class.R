#!/usr/bin/env Rscript

#Exercises For Programmers
#Exercise 13: Compound Interest Example again, but this time with an S4 class

#Get the user input functions
source('commonFunc.R')

setClass(
  "CompoundInterest",
  representation(principle="numeric", rate="numeric", years="numeric", compounded="numeric"),
  prototype(principle=NA_real_, rate=NA_real_, years=NA_real_, compounded=NA_real_)
)

setGeneric(
  "computeCompondInterest",
  function(object) {
    standardGeneric("computeCompondInterest")
  }  
)

setGeneric(
  "toString",
  function(object) {
    standardGeneric("toString")
  }  
)

setMethod(
  "computeCompondInterest",
  signature("CompoundInterest"),
  function(object) {
    nt <- object@compounded * object@years
    rdc <- (object@rate / 100.0) / object@compounded
    return(round((object@principle * (1 + rdc)^nt),2))
  }
)

setMethod(
  "toString",
  signature("CompoundInterest"),
  function(object) {
    principle <- paste("$", object@principle, sep="")
    rate <- paste(object@rate, "%", sep="")
    amount <- paste("$", computeCompondInterest(object), sep="")
    return(paste(principle, "at", rate, "for", object@years, "years compounded", object@compounded, "times per year is", amount, sep=" "))
  }
)

getInput <- function() {
  p <- as.numeric(getUserInput("What is the principle amount? "))
  r <- as.numeric(getUserInput("What is the annual rate of interest (expressed as a %, i.e 4.3)? "))
  y <- as.numeric(getUserInput("Time invested (years)? "))
  c <- as.numeric(getUserInput("What is the number of times the interest is compounded per year? "))
  
  if (!is.na(p) && !is.na(r) && !is.na(y) && !is.na(c)) {
    return(new("CompoundInterest", principle=p, rate=r, years=y, compounded=c))
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
  ci <- getInput()
  if (!is.null(ci)) {
    write(toString(ci), stdout())
  }
}

main()