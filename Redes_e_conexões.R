#Vizualização de redes

source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
library("Rgraphviz")
install.packages("bnlearn")
library("bnlearn")

matrix <- read.csv("~/Diego/conexoes.csv", sep=";")
test.matrix <- matrix[,2:104]
rownames(test.matrix) <- matrix[,1]
colnames(test.matrix) <- matrix[,1]
test.matrix <- as.matrix(test.matrix)
test.matrix

am.graph<-new("graphAM", adjMat=test.matrix, edgemode="directed")
am.graph

plot(am.graph, attrs = list(node = list(fillcolor = "lightblue"),
                            edge = list(arrowsize=0.5)),"twopi")
plot(am.graph, attrs = list(node = list(fillcolor = "lightblue"),
                            edge = list(arrowsize=0.5)),"neato")
plot(am.graph, attrs = list(node = list(fillcolor = "lightblue"),
                            edge = list(arrowsize=0.5)),"dot")

g<-am.graph
nAttrs <- list()
eAttrs <- list()
nAttrs$fillcolor <- c(Concorrente1 = "blue", GB = "red", JJ = "orange")
nAttrs$shape <- c(B = "box")
eAttrs$color <- c("D~A" = "green")
plot(g, nodeAttrs = nAttrs, edgeAttrs = eAttrs)


#FILTRANDO SÓ POR EMPRESAS DE INTERESSE
matrix <- read.csv("~/Diego/conexoes3.csv", sep=";")
test.matrix <- matrix[,2:32]
rownames(test.matrix) <- matrix[,1]
colnames(test.matrix) <- matrix[,1]
test.matrix <- as.matrix(test.matrix)
test.matrix

am.graph<-new("graphAM", adjMat=test.matrix, edgemode="directed")
am.graph

plot(am.graph, attrs = list(node = list(fillcolor = "lightblue"),
                            edge = list(arrowsize=0.5)),"twopi")
plot(am.graph, attrs = list(node = list(fillcolor = "lightblue"),
                            edge = list(arrowsize=0.5)),"neato")
plot(am.graph, attrs = list(node = list(fillcolor = "lightblue"),
                            edge = list(arrowsize=0.5)),"dot")

g<-am.graph
nAttrs <- list()
eAttrs <- list()
nAttrs$fillcolor <- c(Concorrente1 = "orange", GB = "yellow", JJ = "orange",
                      Concorrente2 = "orange", Concorrente3 = "orange")
#nAttrs$shape <- c(GB = "box")
eAttrs$color <- c("D~A" = "green")
plot(g, nodeAttrs = nAttrs, edgeAttrs = eAttrs, "neato")

