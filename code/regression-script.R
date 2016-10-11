args = commandArgs(trailingOnly = TRUE)
ad <- read.csv(file = args[1])
ad <- ad[-1]
attach(ad)
head(ad)

lm.fit <- lm(Sales ~ TV + Radio + Newspaper, data = ad)
summary <- summary(lm.fit)
save(lm.fit, summary, file = 'data/regression.RData')

png('images/scatterplot-tv-sales.png')
plot(TV, Sales, main = 'TV vs. Sales')
dev.off()

png('images/scatterplot-radio-sales.png')
plot(Radio, Sales, main = 'Radio vs. Sales')
dev.off()

png('images/scatterplot-newspaper-sales.png')
plot(Newspaper, Sales, main = 'Newspaper vs. Sales')
dev.off()

png('images/residual-plot.png')
plot(lm.fit, 1)
dev.off()

png('images/normal-qq-plot.png')
plot(lm.fit, 2)
dev.off

png('images/scale-location-plot.png')
plot(lm.fit, 3)
dev.off()

