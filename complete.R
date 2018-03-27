##part 2

complete <- function(directory, id=1:332){
  filels2 <- list.files(path = directory, pattern= ".csv", full.names = TRUE)
  val2 <- numeric()
  
  for(i in id) {
    data1 <- read.csv(filels2[i])
    val2 <- c(val2, sum(complete.cases(data1)))
  }
  data.frame(id,val2)
}