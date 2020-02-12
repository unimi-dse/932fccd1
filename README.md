# List of movies released per year

FilmList is a package of list of movies from 1930 to 2019, taken from IMDb website "https://www.imdb.com/search/title/?title_type=feature&release_date=", used to check all the titles of the moveis realeased in a chosen year. Variables for each movie are titles, duration, genre, number of votes, votes and director. The package is also used to plot which genre has the longest duration in a certain year and which genre has the highest vote in the selected year. 

## Installation
```bash
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/932fccd1')
```
## Usage
```R
# load the package
library(FilmList)
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

#### Function to plot duration for each genre
```
PLOT(year)
```
 <details>
  <summary>Click to copy example </summary>
 PLOT(1990)
</details> 

#### Function to plot vote score for each genre
```
QPLOT(year)
```
 <details>
  <summary>Click to copy example </summary>
QPLOT(1995)
</details> 

## Packages Imported
rvest, xml2, ggplot2, roxygen2


**Author**: Giulia Hadjiandrea

**Date**: February 2020
