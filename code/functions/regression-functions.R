residual_sum_squares <- function(object) {
  rss <- sum((object$residuals)^2)
  return(rss)
}

total_sum_squares <- function(object) {
  sum <- summary(object)
  tss <- (sum((sum$residuals)^2))/(1-sum$r.squared)
  return(tss)
}

r_squared <- function(object) {
  sum <- summary(object)
  r_s <- sum$r.squared
  return(r_s)
}

f_statistic <- function(object) {
  sum <- summary(object)
  f_stat <- sum$fstatistic
  return(f_stat[1])
}

residual_std_error <- function(object) {
  sum <- summary(object)
  rse <- sum$sigma
  return(rse)
}