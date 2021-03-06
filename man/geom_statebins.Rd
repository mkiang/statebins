% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom-statebins.r
\docType{data}
\name{geom_statebins}
\alias{geom_statebins}
\alias{GeomStatebins}
\title{A statebins Geom}
\format{An object of class \code{GeomStatebins} (inherits from \code{Geom}, \code{ggproto}) of length 7.}
\usage{
geom_statebins(mapping = NULL, data = NULL, border_col = "white",
  border_size = 2, lbl_size = 3, dark_lbl = "black",
  light_lbl = "white", na_lbl = "white", radius = grid::unit(6, "pt"),
  ..., na.rm = FALSE, show.legend = NA, inherit.aes = TRUE)

GeomStatebins
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{aes()} or
\code{aes_()}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{ggplot()}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{fortify()} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame.}, and
will be used as the layer data.}

\item{border_col}{border color of the state squares, default "\code{white}"}

\item{border_size}{thickness of the square state borders}

\item{lbl_size}{font size (relative) of the label text}

\item{dark_lbl, light_lbl, na_lbl}{colors to be uses when the label should be dark, light, or NA.
The function automagically computes when this should be.}

\item{radius}{the corner radius}

\item{...}{other arguments passed on to \code{layer()}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{color = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{borders()}.}
}
\description{
Pass in a data frame of states and values and let this do the work. It enables
easy faceting and makes it simpler to have a uniform legend across all the
plots.\cr
\cr
There are two special/critical \code{aes()} mappings:\cr
\cr
\itemize{
\item \code{state} (so the geom knows which column to map the state names/abbrevs to)
\item \code{fill} (which column you're mapping the filling for the squares with)
}
}
\examples{
\dontrun{
library(statebins)
library(cdcfluview)
library(hrbrthemes)
library(tidyverse)

flu <- ili_weekly_activity_indicators(2017)

ggplot(flu, aes(state=statename, fill=activity_level)) +
  geom_statebins() +
  coord_equal() +
  viridis::scale_fill_viridis(
    name = "ILI Activity Level  ", limits=c(0,10), breaks=0:10, option = "magma", direction = -1
  ) +
  facet_wrap(~weekend) +
  labs(title="2017-18 Flu Season ILI Activity Level") +
  theme_statebins(base_family = font_ps) +
  theme(plot.title=element_text(size=16, hjust=0)) +
  theme(plot.margin = margin(30,30,30,30))
}
}
\keyword{datasets}
