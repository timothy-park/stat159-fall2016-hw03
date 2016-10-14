.PHONY: data tests eda regression report clean all

data:
	curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests:
	Rscript code/test-that.R 

eda:
	Rscript code/scripts/eda-script.R data/Advertising.csv

regression:
	Rscript code/scripts/regression-script.R data/Advertising.csv

report:
	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

session:
	Rscript code/scripts/session-info-script.R

clean:
	rm report/report.pdf

all:  eda regression report