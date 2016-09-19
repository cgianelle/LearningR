#!/usr/bin/env Rscript

#Exercises For Programmers
#Exercise 1: Saying Hello

concatMsg <- function(name) {
  return(paste("Hello", name, "nice to meet you!", sep=", "))
}

displayOutput <- function(msg) {
  write(msg, stdout())
}

mainInteractive <- function() {
  name <- readline(prompt="What is your name? ")
  if(nchar(name) > 0) {
    displayOutput(concatMsg(name))
  }
}

mainNonInteractive <- function() {
  f <- file("stdin")
  write("What is your name?", stdout())
  open(f)
  if(nchar(line <- readLines(f,n=1)) > 0) {
    displayOutput(concatMsg(line))  
  }
}

if(interactive()) {
  #This is what gets called in RStudio
  mainInteractive()
} else {
  #This is what gets called in Linux/bash
  mainNonInteractive()
}