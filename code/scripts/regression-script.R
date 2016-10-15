args = commandArgs(trailingOnly = TRUE)
ad <- read.csv(file = args[1])
ad <- ad[-1]
attach(ad)
head(ad)

tv.fit = lm(Sales ~ TV, data = ad)
png('images/scatterplot-tv-sales.png')
plot(TV, Sales, main = 'Sales vs. TV')
dev.off()

radio.fit <- lm(Sales ~ Radio, data = ad)
png('images/scatterplot-radio-sales.png')
plot(Radio, Sales, main = 'Sales vs. Radio')
dev.off()

news.fit <- lm(Sales ~ Newspaper, data = ad)
png('images/scatterplot-newspaper-sales.png')
plot(Newspaper, Sales, main = 'Sales vs. Newspaper')
dev.off()

lm.fit <- lm(Sales ~ TV + Radio + Newspaper, data = ad)
summary <- summary(lm.fit)
save(lm.fit, tv.fit, radio.fit, news.fit, summary, file = 'data/regression.RData')


png('images/residual-plot.png')
plot(lm.fit, 1)
dev.off()

png('images/normal-qq-plot.png')
plot(lm.fit, 2)
dev.off()

png('images/scale-location-plot.png')
plot(lm.fit, 3)
dev.off()

