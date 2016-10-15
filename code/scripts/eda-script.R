args = commandArgs(trailingOnly = TRUE)
ad <- read.csv(file = args[1])
ad <- ad[-1]
head(ad)

for (variable in names(ad)) {
  summary(ad[,variable])
  png(paste0('images/histogram-', tolower(variable), '.png'))
  hist(ad[,variable], main = paste('Histogram of', as.character(variable)), xlab = as.character(variable))
  dev.off()
}

png('images/scatterplot-matrix.png')
plot(ad, main = 'Scatterplot Matrix of Advertising')
dev.off()

corr_mat <- cor(ad)
save(corr_mat, file = 'data/correlation-matrix.RData')
summary(corr_mat)

sink(file = 'data/eda-output.txt')
print('Summary Statistics of Advertising Variables')
summary(ad)
print('Correlation Matrix')
cor(ad)
sink()
