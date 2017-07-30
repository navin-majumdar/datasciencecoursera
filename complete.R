complete <- function (directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ##list all the .csv files for directory argument
  files_full <- list.files (directory, full.names = TRUE)
  
  
  ##data_subset <- rbind(data_subset, na.omit(completedataset[which(completedataset[, "ID"] == i), ]))
  
  column1 <- id
  column2 <- c()
  
  for (i in id) {
    
    good_data <- complete.cases(read.csv(files_full[i]))
    
    column2 <- append(column2, sum(good_data))
    
  }
  
  data.frame(id = column1, nobs = column2)
  
  
}