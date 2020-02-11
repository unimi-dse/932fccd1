\name{FILM}
\alias{FILM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{FILM}
%%  ~~function to do ... ~~
\description{
When selecting a year the function shows a list of movies that came out that year 
}
\usage{
FILM(year)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{year}{
%%     ~~Describe \code{year} here~~
}
}
\details{
It shows the list of movies along with the number of votes assigned, the value of the votes, the director, the title and the principal genre
}
\value{list of movies
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Reference list from IMBD website
}
\author{
Giulia Hdjiandrea
}
\note{
Web scraping, ggplot2 and Data Analysis
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
Web scraping
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (year) 
{
    upUrl = ("https://www.imdb.com/search/title/?title_type=feature&release_date=")
    start = paste(year, "01", "01", sep = "-")
    end = paste(year, "12", "31", sep = "-")
    url = paste(upUrl, start, ",", end, sep = "")
    webpage <- xml2::read_html(url)
    titles <- rvest::html_nodes(webpage, ".lister-item-header>a")
    titles <- rvest::html_text(titles)
    vote_ <- rvest::html_nodes(webpage, ".inline-block.ratings-imdb-rating>strong")
    vote <- rvest::html_text(vote_)
    vote <- as.numeric(vote)
    duration_ <- rvest::html_nodes(webpage, ".text-muted>span.runtime")
    duration <- rvest::html_text(duration_)
    duration <- gsub(" min", "", duration)
    duration <- as.numeric(duration)
    genre_ <- rvest::html_nodes(webpage, ".text-muted>span.genre")
    genre <- rvest::html_text(genre_)
    genre <- gsub("\n", "", genre)
    genre <- gsub(" ", "", genre)
    genre <- as.factor(genre)
    genre <- gsub(",.*", "", genre)
    numVoti_ <- rvest::html_nodes(webpage, ".sort-num_votes-visible>span:nth-child(2)")
    numVoti <- rvest::html_text(numVoti_)
    numVoti <- gsub(",", "", numVoti)
    numVoti <- as.numeric(numVoti)
    director_ <- rvest::html_nodes(webpage, ".text-muted+ p a:nth-child(1)")
    director <- rvest::html_text(director_)
    director <- as.factor(director)
    data <- data.frame(vote, titles, duration, genre, numVoti, 
        director)
    return(data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ dataset } 
