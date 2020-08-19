library(rjags)
library(BEST)
library(tidyverse)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

data <- read_csv('Assignment1PropertyPrices.csv')

y <- data[[1]]

best_mcmc <- BEST::BESTmcmc(y)

summary(best_mcmc)

plot(best_mcmc)
