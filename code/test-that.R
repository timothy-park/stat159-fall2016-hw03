source('code/functions/regression-functions.R')

context('Testing for regression statistics on mtcars dataset')
test_that('Regression outputs work as expected', {
  reg <- lm(mpg ~ disp + hp, data = mtcars)
  regsum <- summary(reg)
  expect_equal(residual_sum_squares(reg), reg$residuals^2)
  expect_equal(total_sum_squares(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_equal(residual_std_error(reg), regsum$sigma)
  expect_equal(r_squared(reg), regsum$r.squared)
  expect_equal(f_statistic(reg), regsum$fstatistic[1])
})