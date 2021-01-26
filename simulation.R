#' Load needed packages
library(tidyverse);
library(rio);
library(synthpop);

#' ## Acquire Data

#' Read the data, from a file path or URL
dat0 <- import('https://raw.githubusercontent.com/tslumley/survival-workshop/master/pbcseq.csv');

#' ## Explore Data

#' How many rows does the data have? How many columns?
nrow(dat0);
ncol(dat0);

#' Both at the same time
dim(dat0);

#' What type of object is `dat0`?
class(dat0);

#' What type of object is the column named `edema` _within_ dat0? All the below 
#' expressions mean exactly the same thing. Sometimes it's more convenient to 
#' use one notation, sometimes another. 

class(dat0$edema);
class(dat0[['edema']]);
class(dat0[["edema"]]);
class(dat0[,'edema']);
class(dat0[,"edema"]);

#' Summarize every column in `dat0` at the same time. `summary()` is a very 
#' useful command  for getting information about almost any object in R, not 
#' only data.frames.
summary(dat0);

#' What folder are you in? (`getwd` means "get working directory")
getwd();

#' In RStudio there is also a `View()` command that lets you interactively view 
#' your data
View(dat0);

#' ## Clean up data
#' 
#' If have a column you don't need and you wish to delete it below is a quick 
#' way to do that. Let's assume that column is named "FOO". All below 
#' expressions mean exactly the same thing:
dat0$FOO <- NULL; 
dat0[['FOO']] <- NULL;
dat0[["FOO"]] <- NULL;
dat0[,'FOO'] <- NULL;
dat0[,"FOO"] <- NULL;


#' ## Create simulated dataset 
#' 
#' First, generate a codebook that characterizes your data.
dat0cb <- codebook.syn(dat0);

#' The `tab` object inside the codebook is a data.frame that describes your data
View(dat0cb$tab);

#' Next, create your simulation
sim0 <- syn(dat0);

#' Finally, check to insure no real values persist in the simulated data
replicated.uniques(sim0,dat0)$no.replications;

