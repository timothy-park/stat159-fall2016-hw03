residual_sum_squares <- function(object) {
  rss <- sum(object$residuals)
  return(rss)
}

total_sum_squares <- function(object) {
  sum <- summary(object)
  tss <- sum(sum$residuals)/(1-sum$r.squared)
}

r_squared <- function(object) {
  sum <- summary(object)
  r_s <- sum$r.squared
}

f_statistic <- function(object) {
  sum <- summary(object)
  f_stat <- sum$fstatistic
  return(f_stat)
}

residual_std_error <- function(objects) {
  sum <- summary(object)
  rse <- sqrt(sum$sigma)
  return(rse)
}