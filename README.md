# Samantha Hassal - American Airlines Performance Task 
## Task 1: Simplifying Complex Code

The R function _printNetFlownRevenue_ is used to generate specific text depending on the ‘scheme’. This part of the performance task consisted of taking the original code and rewriting it to avoid a multi-branch if statement. I broke the decision tree in the original if statement into two separate functions called in a smaller if statement within  _printNetFlownRevenue_. 

We assumed that all schemes generated began with "P-" and only contained the characters "P", "O", "L", "A", and "D" (where A = Atlantic, D = Domestic US, L = Latin, O = South Pacific, P = Pacific). We also assumed that any schemes not in the form of "P-WXYZ" had been removed from the file during processing.

The first function, _singleChar\_scheme_, is only called in instances where the scheme follows the form "P-*" (where * represents any character "P", "O", "L", "A", and "D"). It spits out the same output regardless of the last character in the scheme.

The second function, _multiScheme_, is called when the scheme is in the form "P-WXYZ". This function uses a hash to map each of the letter codes above to their respective labels. When the scheme goes into the function, the "P-" part is removed and the remaining string gets decomposed into a vector. The vector is then fed into the hash to get a new vector containing the corresponding labels. The function then concatenates the strings in the vector in the correct format and spits out the formatted string.

## Task 2: Loading Constants From An External File

The goal of this task was to load the constants into the program from an outside file. Doing this comes in handy if you have a lot of long, complicated constants that do not need to be modified. The program reads the constants from a file called CodesAndLabels.csv. The file contains the one-letter codes used in the schemes as well as the string "Net Flown Revenue". 

After we loaded the constants into the program, we stored them outside the functions (unlike the previous iteration of the _printNetFlownRevenue_). Besides reading the constants from a CSV, we've also streamlined the program further.

## Task 3: Development and Problem Solving - AAdvantage Status 

We created a data file that an external program can access to display a passenger's status (Gold, Platinum, Platinum Pro, etc) at any point in time. We opted to do this because of its simplicity, versatility (doesn't matter what programming language the lookup code uses to access the data), and practicality.  

The AAdvantage Passenger Status Table is a two-sheet Excel (.xlsx) file. Sheet 1 contains the flight log. Sheet 2 contains a timeline showing status change (e.g.,  promotion from "Gold" status to "Platinum" status) and the expiry date of that status. Any code that needs to access the system to pull up a customer's status information will need to access both the flight log and the status timeline. 
