#!/usr/bin/env Rscript

#Exercises For Programmers
#Exercise 2: Counting characters

#Get the user input functions
source('commonFunc.R')

concatMsg <- function(name, charCnt) {
  return(paste(name, "has", charCnt, "characters.", sep=" "))
}

displayOutput <- function(msg) {
  write(msg, stdout())
}

main <- function() {
  user_input <- getUserInput("What is the input string? ")
  if (nchar(user_input) > 0) {
    displayOutput(concatMsg(user_input,nchar(user_input)))
  } else {
    print("User Input Required.")
  }
}

main()