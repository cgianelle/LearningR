#!/usr/bin/env Rscript

# The ubiquitous hello world program 
#   to execute, on the R console, 
# > source("/home/gianelc/Personal/Sandbox/LearningR/hello.R")
# > hello("Chris")
#
# or from the linux command line
# (first chmod +x hello.R)
# ./hello.R

hello <- function(name) {
  sprintf("Hello, %s", name)
}

hello("Chris")