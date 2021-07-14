#load the requisite libraries
library(hash)

#function that handles a multiple character scheme (eg, input like "P-ALO", etc)
multiScheme <- function(scheme){
  scheme <- toupper(scheme)
  #make dictionary
  h <- hash() 
  codes <- c("A", "D", "L", "O", "P")
  labels <- c("Atlantic", "Domestic US", "Latin", "South Pacific", "Pacific")
  # set values
  for(i in seq_along(codes)){
    h[[codes[i]]] <- labels[i]
  }
  #convert string to a vector
  string1 <- sapply(strsplit(scheme, "-"), "[", 2)
  t <- strsplit(string1, "")[[1]]
  #pull out dictionary values
  X <- values(h, keys=t)
  
  # concatenate the strings in the correct format
  result1 = paste(X[1:length(X)-1], collapse=", ")
  result2 = paste("and", X[length(X)])
  destList <- paste(result1, result2, sep = {", "})
  return(paste(destList, 'Net Flown Revenue'))
}

#function that handles a single character scheme (eg, input like "P-A", "P-O", etc)
singleChar_scheme <- function(scheme){
  #array of codes
  codes <- c("A", "D", "L", "O", "P")
  scheme <- toupper(scheme)
  #inspect the string for the characters
  if (substr(scheme, 3, 3) %in% codes){
    return('Net Flown Revenue')   
  }
  
}

printNetFlownRevenue <- function(globalID, entity, programType){
  
  df <- Agency_Term[which(Agency_Term$GLOBAL_SLS_ACCT_ID == globalID &
                            Agency_Term$SLS_ENTITY_CD == entity &
                            toupper(Agency_Term$AGY_INCNTV_PGM_NM) == toupper(programType)),]
  
  scheme <- unique(df$PROGRAM_SCH)
  
  if (length(scheme)==3){
    output <- singleChar_scheme(scheme)
  }
  
  
  else if (length(scheme)>3){
    output <- multiScheme(scheme)
  } 
  
  else {
    output <- 'Net Flown Revenue'
  }
  
  return(output)
}