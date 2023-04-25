years <- 100
A <- numeric(length = years)
r <- 0.01
P <- 1

for (t in 1:years) {
  
  A[t] <- P * (1 + r)^t
  
}

P * (1 + r)^(1:years)

plot(x = 1:years,
     y = A,
     xlim = c(1, years), 
     ylim = c(1, max(A)),
     type = "l", 
     col = "black",
     main = "Compound interests", 
     xlab = "Year", 
     ylab = "Euro")

years <- 100
r <- c(0.01, 0.02, 0.03)
A <- matrix(nrow = years, ncol = length(r), byrow = TRUE)
P <- 1

for (t in 1:years) {
  
  for (s in 1:length(r)) {
    
    A[t,s] <- P * (1 + r[s])^t
    
  }
  
}

plot(NULL, 
     xlim = c(1, nrow(A)), 
     ylim = c(1, max(A)),
     main = "Compound interests", 
     xlab = "Year", 
     ylab = "Euro")

for (l in 1:ncol(A)) {
  
  lines(A[,l], type = "l", col = l)
  
}

my_fun <- function(x) {
  
  square <- x^2
  
  return(square)
  
}        
            
my_fun(x = 5)

my_fun_alternative <- function(x) x^2

my_fun_alternative(x = 5)

my_fun <- function(time, scenarios) {
  
  r <- scenarios
  
  A <- matrix(nrow = time, ncol = length(r), byrow = TRUE)
  
  P <- 1
  
  for (t in 1:time) {
    
    for (s in 1:length(r)) {
      
      A[t,s] <- P * (1 + r[s])^t
      
    }
    
  }
  
  plot(NULL, 
       xlim = c(1, nrow(A)), 
       ylim = c(1, max(A)),
       main = "Compound interests", 
       xlab = "Year", 
       ylab = "Euro")
  
  for (l in 1:ncol(A)) {
    
    lines(A[,l], type = "l", col = l)
    
  }
  
}

my_fun(time = 10, scenarios = 0.01)

my_fun(time = 10, scenarios = seq(0.01, 0.05, 0.01))