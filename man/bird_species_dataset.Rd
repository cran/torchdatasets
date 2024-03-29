% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bird-species.R
\name{bird_species_dataset}
\alias{bird_species_dataset}
\title{Bird species dataset}
\usage{
bird_species_dataset(root, split = "train", download = FALSE, ...)
}
\arguments{
\item{root}{path to the data location}

\item{split}{train, test or valid}

\item{download}{wether to download or not}

\item{...}{other arguments passed to \code{\link[torchvision:image_folder_dataset]{torchvision::image_folder_dataset()}}.}
}
\value{
A \code{\link[torch:dataset]{torch::dataset()}} ready to be used with dataloaders.
}
\description{
Downloads and prepares the 450 bird species dataset found on Kaggle.
The dataset description, license, etc can be found \href{https://www.kaggle.com/datasets/gpiosenka/100-bird-species}{here}.
}
\examples{
if (torch::torch_is_installed() && FALSE) {
birds <- bird_species_dataset("./data", token = "path/to/kaggle.json",
                              download = TRUE)
length(birds)
}
}
