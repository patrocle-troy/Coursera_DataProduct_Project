---
title: "Coursera DataProduct Project"
output: html_document
---
### Content of the project
This is a Coursera project for the course Developing Data Products.
The project is a shiny application that is deployed on the [shinyApps server](https://patrocle-troy.shinyapps.io/project/)

The project contains

* README.md: the current file

* UI.R: the shiny file used for the HTML generation.

* server.R: the shiny file used for performing the R computations

* script.R: an ancillary snippet that was used to generate the application


### Description of the project

The applications uses the standard R-datasets `iris` to estimate the petal length of an iris depending on its species and its petal width.
We use a simple linear regression for each of the species.

The user inputs the species through a radio button and the petal width through a slider. 

The application computes the estimated length of the petal for the iris input by the user. It also plots the population of the iris in a width / length plot together with the new iris.
