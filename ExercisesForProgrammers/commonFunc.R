#!/usr/bin/env Rscript

#Exercises For Programmers
#Common functions

getUserInput <- function(message) {
  if(interactive()) {
    return(readline(prompt=message))
  } else {
    f <- file("stdin")
    write(message, stdout())
    open(f)
    if(nchar(line <- readLines(f,n=1)) > 0) {
      return(line) 
    } else {
      return("")
    }
  }
}
