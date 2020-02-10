\name{FILM}
\alias{FILM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
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
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
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
    webpage <- read_html(url)
    titles <- html_nodes(webpage, ".lister-item-header>a")
    titles <- html_text(titles)
    vote_ <- html_nodes(webpage, ".inline-block.ratings-imdb-rating>strong")
    vote <- html_text(vote_)
    vote <- as.numeric(vote)
    duration_ <- html_nodes(webpage, ".text-muted>span.runtime")
    duration <- html_text(duration_)
    duration <- gsub(" min", "", duration)
    duration <- as.numeric(duration)
    genre_ <- html_nodes(webpage, ".text-muted>span.genre")
    genre <- html_text(genre_)
    genre <- gsub("\n", "", genre)
    genre <- gsub(" ", "", genre)
    genre <- as.factor(genre)
    genre <- gsub(",.*", "", genre)
    numVoti_ <- html_nodes(webpage, ".sort-num_votes-visible>span:nth-child(2)")
    numVoti <- html_text(numVoti_)
    numVoti <- gsub(",", "", numVoti)
    numVoti <- as.numeric(numVoti)
    director_ <- html_nodes(webpage, ".text-muted+ p a:nth-child(1)")
    director <- html_text(director_)
    director <- as.factor(director)
    data <- data.frame(vote, titles, duration, genre, numVoti, 
        director)
    return(data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
