# load the requisite libraries
library(hash)

# set up constants from file data
df <- read.csv("CodesAndLabels.csv", header=TRUE)
codes <- df$Codes[1:length(df$Codes)-1]
labels <- df$Labels[1:length(df$Codes)-1]
NFR <- df$Labels[length(df$Codes)]

# construct hash
h <- hash() 
# set values
for(i in seq_along(codes)){
  h[[codes[i]]] <- labels[i]
}

multiScheme <- function(scheme){
  scheme <- toupper(scheme)
  # convert string to a vector
  string1 <- sapply(strsplit(scheme, "-"), "[", 2)
  t <- strsplit(string1, "")[[1]]
  #pull out dictionary values
  X <- values(h, keys=t)
  
  # concatenate the strings in the correct format
  result1 = paste(X[1:length(X)-1], collapse=", ")
  result2 = paste("and", X[length(X)])
  destList <- paste(result1, result2, sep = {", "})
  return(paste(destList, NFR))
}

printNetFlownRevenue <- function(globalID, entity, programType){
  
  df <- Agency_Term[which(Agency_Term$GLOBAL_SLS_ACCT_ID == globalID &
                            Agency_Term$SLS_ENTITY_CD == entity &
                            toupper(Agency_Term$AGY_INCNTV_PGM_NM) == toupper(programType)),]
  
  scheme <- unique(df$PROGRAM_SCH)
  
 if (length(scheme)>3){
    output <- multiScheme(scheme)
  } 
  
  else {
    output <- NFR
  }
  
  return(output)
}
