compute_local_RMS = function(z_mat){

 vlRMS    = c(NULL)

 for(i in 2:(nrow(z_mat)-1) ){
  for(j in 2:(ncol(z_mat)-1) ){
  
   mat=matrix(NA,nrow=9,ncol=2)   ;    k=1
   for( ix in c(i-1,i,i+1) ){
    for( jy in c(j-1,j,j+1) ){
       mat[k,]=c(ix,jy)           ;    k=k+1
    }
   }
   colnames(mat) = c('x','y') 
   x     =  z_mat[mat]
   inside =  x^2/(length(x)) 
   vlRMS = c(vlRMS,  sqrt( sum(inside) )  )

  }
 }
 
 return(vlRMS)
}


