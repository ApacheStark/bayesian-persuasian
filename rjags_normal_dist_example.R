# Set working dir as R file location
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load packages
library(rjags)

# Mock some serious data
N <- 1000
x <- rnorm(N, 0, 5)

# Burn in model
jags <- jags.model('model_norm_mu_tau.bug',
                   data = list('x' = x,
                               'N' = N),
                   n.chains = 4,
                   n.adapt = 100)

# Update model
update(jags, 1000)

# Summary model
jags.samples(jags,
             c('mu', 'tau'),
             1000)

