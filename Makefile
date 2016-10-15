url = 'http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv'

# runs the phony targets eda, regression, and report.
all:  eda regression report

# declaring all the phony targets
.PHONY: data tests eda regression report clean all

# returns the pdf output of the rmd report
report:
	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

# downloads the Advertising data set
data:
	curl -o data/Advertising.csv $(url)
# tests the correctness of the regression functions
tests:
	Rscript code/test-that.R 

# runs the eda script that provides information about the data set
eda: data/Advertising.csv
	Rscript code/scripts/eda-script.R $(<)

# runs the regression script that performs the regression analysis and outputs .RData files
regression: data/Advertising.csv
	Rscript code/scripts/regression-script.R $(<)

# created the session-info-script text file containing user information about the libraries used and the operating system
session:
	Rscript code/scripts/session-info-script.R

# cleans the pdf report.
clean:
	rm report/report.pdf