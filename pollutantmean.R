pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant 
  ## for which we will calculate the mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ##list all the .csv files for directory argument
  files_full <- list.files (directory, full.names = TRUE)
  
  ##creates an empty data frame
  dat <- data.frame()
 
  ##read all the csv files and store them in vector dat
  for (i in seq_along(files_full)) {
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  
  ##create a subset containing the rows that match the ID argument
  data_subset = data.frame()
  for (i in id)
    data_subset <- rbind(data_subset, dat[which(dat[, "ID"] == i), ])
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  mean(data_subset[, pollutant], na.rm = TRUE)  
}
