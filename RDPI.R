###########################################################################################################
#FUNCTION RDPI
#compute Relative Distances of Plasticity Index (RDPI) as defined in Valladares et al. (2006)
#PARAM
#Data = Data set
#Trait: Column name of the dataset corresponding to measured trait
#Env : column name of the dataset corresponding to the different levels of environmental conditions
#Indiv : column name of the dataset corresponding to the individuals (or families or species depending of the experimental design) planted in each environment

#require the tidyverse library 

#Thus dataset should contain 3 columns: one for the values of the measured trait, one for the environmental conditions, one for the individuals (or families or species depending of the #experimental design) hat is planted in each environment.

#Return a two columns data frame
#first column is called "Indiv" and contained each replicated individual over all environments
#second colum is called "RDPI" and contained the RDPI value

#Reference
#Valladares F, Sanchez-Gomez D, Zavala M a. (2006) Quantitative estimation of phenotypic plasticity: Bridging the gap between the evolutionary concept and its ecological applications. J #Ecol 94:1103–1116 . doi: 10.1111/j.1365-2745.2006.01176.x

#Citation
#https://github.com/xbouteiller/Plasticity

###############################################################################################################



RDPIInfo = "RDPI \n A R function to compute Relative Distances Plasticity Index (RDPI) \n Reference: Valladares et al. (2006) \n https://github.com/xbouteiller/Plasticity \n \n require the tidyverse library \n \n Input data: a 3 columns data frame: \n (1) the values of the measured trait \n (2) the environmental conditions \n (3) the replicated individuals \n \n return a two columns data frame with: \n (1) labels of replicated individuals \n (2) RDPI values"
bannerBreak = "\n*********************************************************************\n"
cat(paste0(bannerBreak,RDPIInfo,bannerBreak,"\n"))



RDPI <- function( Data, Trait, Env, Indiv) {
	
	require(tidyverse)
	
	Data <- as.data.frame(Data)
	
	#Define Name of variable
	Env <- deparse(substitute(Env))
	Trait <- deparse(substitute(Trait))
	Indiv <- deparse(substitute(Indiv))
	
	
	# Define variable
	Data[,Env] <- as.factor(as.character(Data[,Env]))
	Data[,Trait] <- as.numeric(Data[,Trait])
	Data[,Indiv] <- as.factor(as.character(Data[,Indiv]))
	

	#Number of Env
	NENV <- nlevels(Data[,Env])
		
	#Number of pair of environmental combination (number of distances n in Valladares)
	ndist <- ncol(combn(NENV, 2))
	
	
	
	#Prepare table for computation : spread environments over columns for each individual
	Data2 <- data.frame(Trait= Data[,Trait] , Indiv = Data[,Indiv] , Env = Data[,Env])
	Data3 <- Data2  %>% spread(Env, Trait)# %>% print()
	VecIndiv <- Data3 %>% select(Indiv)
	Data3 <- Data3 %>% select(-Indiv)
	
	
	
	#computation
	
		
	#step1 : pairwise environments relative distances of plascity (RDPIs in Valladares et al. (2006))
	
	RDPIs<- matrix(data =NA, nrow = nrow(VecIndiv), ncol = ndist)
	
	
	Ini = 1
	Increment = 0 
	for(i in 1:(ndist-1)){
	
		if(Ini < ndist) {Ini = Ini +1}
		
		
		for(j in Ini:ndist){
		Increment = Increment +1 
				
		RDPItemp<-abs(Data3[,j] - Data3[,i])/ apply( Data3[,c(i,j)], M =1, max)
		
		RDPIs[,Increment]<-RDPItemp
		
		
		}
		
	}
	
	#if you are intested by the RDPIs, uncomment the following lines:
	#RDPIs = data.frame(Indiv = VecIndiv, RDPIs = RDPIs)
	#cat(paste0("RDPIs",bannerBreak,"\n"))
	#print(RDPIs)
	#cat("\n")
	#return(RDPIs)


	#step 2: sum and division by the number of distances

	if(is.numeric(RDPIs[,1])){
	RDPI = data.frame(Indiv = VecIndiv, RDPI = rowSums(RDPIs)/ndist)
	cat(paste0("RDPI",bannerBreak,"\n"))
	}else{
	RDPI = data.frame(Indiv = VecIndiv, RDPI = rowSums(RDPIs[,-1])/ndist)
	cat(paste0("RDPI",bannerBreak,"\n"))
	}
	
	return(RDPI)
	


}
