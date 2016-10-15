# function that takes in the the lm object and outputs the residual sum of squares of the fit

residual_sum_squares <- function(object) {
  residuals <- object$residuals
  rss <- sum((residuals)^2)
  return(rss)
}

# function that takes in the lm object and outputs the total sum of squares of the fit
total_sum_squares <- function(object) {
  mean_y <- mean(object$model[,1])
  y <- object$model[,1]
  tss <- sum((y - mean_y)^2)
  return(tss)
}

# functon that takes in the lm object and outputs its residual standard error
# calls the function residual_sum_squares
residual_std_error <- function(object) {
  p <- length(object$coefficients[-1])
  n <- nrow(object$model)
  rss <- residual_sum_squares(object)
  rse <- sqrt(rss/(n-p-1))
  return(rse)
}

# function that takes in the lm object and returns the r_square quality index of the fit
r_squared <- function(object) {
  rss <- residual_sum_squares(object)
  tss <- total_sum_squares(object)
  r_sq <- 1 - (rss/tss)
  return(r_sq)
}

# function that takes in the lm object and returns the f-statistic of the fit
f_statistic <- function(object) {
  p <- length(object$coefficients[-1])
  n <- nrow(object$model)
  rss <- residual_sum_squares(object)
  tss <- total_sum_squares(object)
  f_stat <- ((tss-rss)/p)/(rss/(n-p-1))
  return(f_stat)
}