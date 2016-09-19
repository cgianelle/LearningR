#!/usr/bin/env Rscript

#Exercises For Programmers
#Exercise 5: Simple Math

#Get the user input functions
source('commonFunc.R')

displayOutput <- function(msg) {
  write(msg, stdout())
}

addNumbers <- function(num1, num2) {
  return(paste(num1, "+", num2, "=", (num1+num2), sep=" "))
}

subtractNumbers <- function(num1, num2) {
  return(paste(num1, "-", num2, "=", (num1-num2), sep=" "))
}

multiplyNumbers <- function(num1, num2) {
  return(paste(num1, "*", num2, "=", (num1*num2), sep=" "))
}

divideNumbers <- function(num1, num2) {
  return(paste(num1, "/", num2, "=", (num1/num2), sep=" "))
}

operations <- list(addNumbers, subtractNumbers, multiplyNumbers, divideNumbers)

runOperations <- function(opList, num1, num2) {
  resultsList = list()
  for (op in opList) {
    resultsList = c(resultsList, op(num1,num2))
  }
  return (resultsList)
}

main <- function() {
  firstNum <- getUserInput("What is the first number? ")
  secondNum <- getUserInput("What is the second number? ")
  if (nchar(firstNum) > 0 && nchar(secondNum) > 0) {
    #convert strings to numbers
    num1 = strtoi(firstNum, base=10)
    num2 = strtoi(secondNum, base=10)
    if (!is.na(num1) && !is.na(num2)) {
      # displayOutput(addNumbers(num1, num2))
      # displayOutput(subtractNumbers(num1, num2))
      # displayOutput(multiplyNumbers(num1, num2))
      # displayOutput(divideNumbers(num1, num2))
      results = runOperations(operations,num1, num2)
      lapply(results, displayOutput)
      # for (i in operations) {
      #   displayOutput(i(num1,num2))
      # }
    } else {
      print("Input was invalid; Expecting integers.")
    }
  } else {
    print("Missing Input")
  }
}

main()