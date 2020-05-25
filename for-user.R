# author: Marcelo A. Pires (piresma@cbpf.br)


# import main functions
source("library-topographic-entropy.R")

# Generate a simple randomly rough surface
L = 256
heightmatrix = simple_artificial_surfaces(L)

# Compute the topographic entropy 
topentropy = get_H_from_height_matrix(  as.vector(heightmatrix) )

# export result
write.table(topentropy, file="topographicentropy.txt",row.names=F,col.names=F)

