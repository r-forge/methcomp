\name{perm.repl}
\alias{perm.repl}
\alias{make.repl}
\alias{has.repl}
\title{Manipulate the replicate numbering within (item,method)}
\description{
  Replicate numbers are generated within (item,method) in a dataframe
  representing a method comparison study. The function assumes that
  observations are in the correct order within each (item,method), i.e. if
  replicate observations are non-exchangeable within method, linked
  observations are assumed to be in the same order within each (item,method).
  }
\usage{
  make.repl( data )
   has.repl( data )
  perm.repl( data )
  }
\arguments{
  \item{data}{A \code{\link{Meth}} object or a data frame with columns
    \code{meth}, \code{item} and \code{y}.}
  }
\value{
  \code{make.repl} returns a dataframe with a column, \code{repl} added or
  replaced, whereas \code{has.repl} returns a logical indicating wheter a
  combination of (\code{meth},\code{item}) wioth more that one valid \eqn{y}-
  value.

  \code{perm.repl} returns a dataframe of class \code{\link{Meth}} where the
  rows (i.e. replicates) are randomly permuted within
  (\code{meth},\code{item}), and subsequently ordered by
  (\code{meth},\code{item},\code{repl}).
  }
\details{
  \code{make.repl} just adds replicate numbers in the order of the data.frame
  rows.
  \code{perm.repl} is designed to explore the effect of permuting the replicates
  within (item,method). If replicates are truly exchangeable within methods,
  the inference should be independent of this permutation.
  }
\author{
  Bendix Carstensen, Steno Diabetes Center,
  \url{http://www.biostat.ku.dk/~bxc}
  }
\examples{
  data(ox)
  xx <- subset( ox, item<4 )[,-3]
  cbind( xx, make.repl(xx) )
  cbind( make.repl(xx), perm.repl(xx) )
  data( ox )
  xx <- subset( ox, item<4 )
  cbind( xx, perm.repl(xx) )
  # Replicates are linked in the oximetry dataset, so randomly permuting
  # them clearly inflates the limits of agreement:
  par( mfrow=c(1,2), mar=c(4,4,1,4) )
  BA.plot(           ox , ymax=30, digits=1 )
  BA.plot( perm.repl(ox), ymax=30, digits=1 )

  }
\seealso{
  \code{\link{perm.repl}}
  }
\keyword{manip}
\keyword{datagen}
\keyword{design}
