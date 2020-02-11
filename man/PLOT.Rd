\name{PLOT}
\alias{PLOT}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{PLOT}
%%  ~~function to do ... ~~
\description{plot of film data
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
PLOT(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
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

\seealso{Web scraping
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data) 
{
    graph = ggplot2::ggplot(data,ggplot2::aes(x = "duration", y = "vote")) + 
        ggplot2::geom_point(ggplot2::aes(size = "numVoti", col = "genre"))
    return(graph)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ dataset } 

