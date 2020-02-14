# Best 50 released per year

Movies is a package of list of movies from 1930 to 2019, taken from IMDb website "https://www.imdb.com/search/title/?title_type=feature&release_date=", used to check all the titles of the 50 best movies realeased in a chosen year (parameter "year" goes from 1930 to 2019). Variables for each movie are titles, duration, genre, number of votes, vote and director. The package is also used to plot which genre has the highest vote in the selected year and to show a summary statistics including skewness and kurtosis of duration from package moments.

## Installation
```bash
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/932fccd1')
```
## Usage
```R
# load the package
library(Movies)
```
## Function
#### Function to see the list of movies per year
```
FILM(year)
```
 <details>
  <summary>Click to copy example </summary>
 FILM(1985)
</details> 


## Packages Imported
rvest, xml2, ggplot2, moments, roxygen2, devtools

## License
``GPL-3``
**Author**: Giulia Hadjiandrea

**Date**: February 2020
