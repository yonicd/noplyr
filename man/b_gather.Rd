% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gather.R
\name{b_gather}
\alias{b_gather}
\title{base gather}
\usage{
b_gather(
  data,
  key = "key",
  value = "value",
  columns = NULL,
  regex = FALSE,
  ...,
  na.rm = FALSE,
  convert = FALSE
)
}
\arguments{
\item{data}{data.frame}

\item{key}{character, name of new key column, Default: 'key'}

\item{value}{character, name of new value column, Default: 'value'}

\item{columns}{column names or indicies or regex of them to gather,
Default: NULL}

\item{regex}{boolean, indicates of columns is to be treated as a
regular expression, Default: FALSE}

\item{\dots}{parameters to pass to grep}

\item{na.rm}{boolean, apply na.omit to value column, Default: FALSE}

\item{convert}{boolean, apply type.convert to key column, Default: FALSE}
}
\value{
data.frame
}
\description{
base gather mimics basic functionality of tidyr::gather
}
\examples{

mini_iris <- iris[c(1, 51, 101), ]

# gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width

b_gather(mini_iris, key = 'flower_att', value = 'measurement',
columns = c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'))

b_gather(mini_iris, key = 'flower_att', value = 'measurement',
columns = 1:4)

b_gather(mini_iris, key = 'flower_att', value = 'measurement',
columns = -5)

b_gather(mini_iris, key = 'flower_att', value = 'measurement',
columns = '^(Sepal|Petal)',regex = TRUE)

}
\seealso{
\code{\link[utils]{type.convert}}
}
\author{
Jonathan Sidi
}
