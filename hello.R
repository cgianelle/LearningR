#   to execute, on the R console, 
# > source("/home/gianelc/Personal/Sandbox/LearningR/hello.R")
# > hello("Chris")


hello <- function(name) {
  sprintf("Hello, %s", name)
}