.PHONY: data tests eda regression report clean all

data:
	curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

#tests

eda:
	Rscript code/eda-script.R data/Advertising.csv

regression:
	Rscript code/regression-script.R data/Advertising.csv

# report

clean:
	rm report/report.pdf

all:  eda regression report