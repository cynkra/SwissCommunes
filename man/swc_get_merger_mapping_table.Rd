% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_merger_mapping_table.R
\name{swc_get_merger_mapping_table}
\alias{swc_get_merger_mapping_table}
\title{Create mapping table for a certain time interval}
\usage{
swc_get_merger_mapping_table(
  start_year,
  end_year,
  canton = NULL,
  type = "flat"
)
}
\arguments{
\item{start_year}{First year of time interval (integer)}

\item{end_year}{Last year of time interval (integer)}

\item{canton}{Canton abbreviation as character (e.g. "GE", "ZH", "TI", etc.) to focus on.
If left `NULL` (default) all cantons are considered.}

\item{type}{Two options:

    - "flat" (default) returns the table with one row per year per mapping

    - "compact" returns a more compact table with one row per mapping,
  containing the time interval it is valid for}
}
\value{
Mapping table for the given time interval in the specified canton
}
\description{
Produces a mapping table that can be joined to your data.
Municipalities that were merged to another municipality during the given time period
are mapped to that municipality.
Filtering by canton is supported.
}
\examples{
swc_get_merger_mapping_table(2005, 2010)
swc_get_merger_mapping_table(2015, 2019, canton = "ZH", type = "compact")
}
