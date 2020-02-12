\name{QPLOT}
\alias{QPLOT}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{QPLOT}
%%  ~~function to do ... ~~
\description{
When selecting a year the function plots which genre had the longest duration
}
\usage{
QPLOT(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
}
}
\details{It shows the list of movies along with the number of votes assigned, the value of the votes, the director, the title and the principal genre
}
\value{Film List
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{Reference list from IMDb website
}
\author{Giulia Hadjiandrea
%%  ~~who you are~~
}
\note{ggplot from ggplot2 package
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{Web scraping, ggplot2
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data) 
{
    url = ("https://www.imdb.com/search/title/?title_type=feature&release_date=")
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
    titles[1:42]
    director[1:42]
    duration[1:42]
    genre[1:42]
    titles = titles[1:42]
    duration = duration[1:42]
    genre = genre[1:42]
    director = director[1:42]
    data <- data.frame(vote, titles, duration, genre, numVoti, 
        director)
    grid::current.viewport()
    qplot(data = data, duration, fill = genre, bins = 30)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ dataset }% use one of  RShowDoc("KEYWORDS")
