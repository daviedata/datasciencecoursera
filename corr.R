##part 3

corr <- function(directory, threshold = 0){
  source('C:/Users/c403113/Workplace/specdata/complete.R')
  completecases <- complete(directory)
  casethreshold <- completecases[completecases$val2 > threshold,1]
  files3 <- list.files(path=directory, full.names = TRUE)
  correlations <-rep(NA, length(casethreshold))
  
  for (i in casethreshold) {
    filed <- (read.csv(files3[i]))
    completecases <- complete.cases(filed)
    Suldata <- filed[completecases,2]
    nitdata <- filed[completecases,3]
    correlations[i] <- cor(x=Suldata, y=nitdata)
    
  }
  correlations <- correlations[complete.cases(correlations)]
}
