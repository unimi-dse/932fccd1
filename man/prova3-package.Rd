\name{prova3-package}
\alias{prova3-package}
\alias{prova3}
\docType{package}
\title{
\packageTitle{prova3}
}
\description{
\packageDescription{prova3}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{prova3}
\packageIndices{prova3}
~~ An overview of how to use the package, including the most important ~~
~~ functions ~~
}
\author{
\packageAuthor{prova3}

Maintainer: \packageMaintainer{prova3}
}
\references{
~~ Literature or other references for background information ~~
}
\keyword{ package }
\seealso{
~~ Optional links to other man pages, e.g. ~~
}

\examples{
vote=c(2,5,7)
duration=c(20,35,80)
numVoti=c(20,40,89)
L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
(ciao <- data.frame(x = 1, y = 1:10, fac = fac))

PLOT(ciao)
}
