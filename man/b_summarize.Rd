% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize.R
\name{b_summarize}
\alias{b_summarize}
\alias{b_summarize.default}
\alias{b_summarize.split_df}
\title{Reduces multiple values down to a single value}
\usage{
b_summarize(.data, ...)

\method{b_summarize}{default}(.data, ...)

\method{b_summarize}{split_df}(.data, ...)
}
\arguments{
\item{.data}{data.frame}

\item{...}{Name-value pairs of summary functions}
}
\value{
data.frame
}
\description{
Mimics dplyr::summarize using base R and rlang
}
\examples{
airquality\%>\%
  bplyr::b_group_by(Month)\%>\%
  bplyr::b_summarize(m = mean(Temp),m1 = max(Temp))

airquality\%>\%
  bplyr::b_group_by(Month,Day)\%>\%
  bplyr::b_summarize(m = mean(Temp),m1 = max(Temp))

airquality\%>\%
  bplyr::b_mutate(Month = factor(Month))\%>\%
  bplyr::b_group_by(Month)\%>\%
  bplyr::b_summarize(m = mean(Temp),m1 = max(Temp))
}
\seealso{
\code{\link[rlang]{quotation}}
}
\author{
Jonathan Sidi
}
