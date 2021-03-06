#### Plasticity
A R function to compute Relative Distances Plasticity Index (RDPI) as defined in Valladares et al. (2006).

#### Description

RDPI is defined as the absolute phenotypic distances between individuals of same genotype and different environments, divided by the sum of the two phenotypic values.
Thus mathematic formulation can be expressed as follows:

<a href="https://www.codecogs.com/eqnedit.php?latex=RDPI&space;=&space;\sum&space;\frac{&space;\left&space;|&space;X_{ij}&space;-&space;X_{i'j}&space;\right&space;|&space;}{&space;(X_{ij}&space;&plus;&space;X_{i'j})&space;}&space;\times&space;\frac{1}{n}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?RDPI&space;=&space;\sum&space;\frac{&space;\left&space;|&space;X_{ij}&space;-&space;X_{i'j}&space;\right&space;|&space;}{&space;(X_{ij}&space;&plus;&space;X_{i'j})&space;}&space;\times&space;\frac{1}{n}" title="RDPI = \sum \frac{ \left | X_{ij} - X_{i'j} \right | }{ (X_{ij} + X_{i'j}) } \times \frac{1}{n}" /></a>

Where i referred to a given level of the environment treatment (i.e. one of the temperature conditions) and i’ another given environment different from i. j referred to a given family (i.e. a tree). Thus Xij is the phenotypic value for a given trait for the family j in the environment i. n is defined as the number of distances calculated (i.e. number of pairwise environments).

### R Function

The function is included in the file RDPI.R.
You can download the function and load it into R with the source function: source("RDPI.R")

The function is called RDPI. It accepts 4 parameters:
* Data: the Dataset
* Trait: Column name of the dataset corresponding to measured trait
* Env : column name of the dataset corresponding to the different levels of environmental conditions
* Indiv : column name of the dataset corresponding to the individuals (or families or species depending of the experimental design) planted replicated over all environments

Thus dataset should contain 3 columns: one for the values of the measured trait, one for the environmental condition, one for the individuals (or families or species depending of the experimental design) hat is planted in each environment.

The function return a two columns data frame:
* First column is called "Indiv" and contained each replicated individual over all environments
* Second colum is called "RDPI" and contained the RDPI values

#### References:

>Valladares F, Sanchez-Gomez D, Zavala M a. (2006) Quantitative estimation of phenotypic plasticity: Bridging the gap between the evolutionary concept and its ecological applications. J Ecol 94:1103–1116 . doi: 10.1111/j.1365-2745.2006.01176.x

>Godoy O, Valladares F, Castro-Díez P (2012) The relative importance for plant invasiveness of trait means, and their plasticity and integration in a multivariate framework. New Phytol 195:912–922 . doi: 10.1111/j.1469-8137.2012.04205.x

#### Publication:

A publication using this code is in prepartation. At this time, if you are using this function please cite :

>https://github.com/xbouteiller/Plasticity

