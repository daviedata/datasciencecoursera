library("data.tables")
pollutantmean <- function(directory, pollutant, id = 1:332){
       filels <- list.files(path=directory, pattern = ".csv", full.names = TRUE)
      val <- numeric()
       for (i in id) {
             data <- read.csv(filels[i])
             val <-c(val, data[[pollutant]])
         }
       mean(val,na.rm = TRUE)
   }
pollutantmean("specdata", "sulfate", 1:10)
