# author: Marcelo A. Pires (piresma@cbpf.br)

# Function to compute the topographic entropy H
# input: array with all the values present in the height matrix
# output: float number corresponding to H
get_H_from_height_matrix=function(x){  
  
  #Compute the Quartiles
  q=quantile(x, c(0.25,0.5, 0.75) ) 
  
  #Interquartile range (IQR).
  DEQ=q[3]-q[1]  
  
  #Total number of data points
  numTot=length(x)  
  
  #Extremes in the boxplot
  Q1til=q[1]-1.5*DEQ
  Q3til=q[3]+1.5*DEQ

  # compute the proportions
  w=0*x   
  w[x>=Q1til & x<=Q3til]=1 
  prob=w/sum(w) 
  
  #entropy
  p=prob[prob!=0]  
  H=-sum(p*log(p)) 
  
  #Normalize and centralize
  Hmax =log(numTot)
  Hmin =log(numTot - numTot/2 )
  Hnorm=(H-Hmin)/(Hmax-Hmin) 
  
  return(Hnorm)
}


# Generate a simple artificial randomly rough surface
# input: size of the surface
# output: height matrix
simple_artificial_surfaces=function(L){
 vecheight = rnorm(L^2,mean=1,sd=0)
 surface   = matrix(vecheight,nrow=L,ncol=L)
 return(surface)
}

