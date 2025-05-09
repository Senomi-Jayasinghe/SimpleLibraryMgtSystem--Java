data <- read.csv("Medical_Dataset_with_Disease_Types.csv")

data1 <- data[, 1:10]
head(data1)

install.packages("factoextra")
library(factoextra)

pca <- prcomp(data1, center = TRUE, scale. = TRUE)
head(pca)

#SCREE PLOT
fviz_eig(pca, addlabels = TRUE, ylim = c(0,60))

fviz_pca_biplot(pca,
                repel = TRUE,
                col.var = "blue",
                col.ind = "gray40")

pca_scores <- as.data.frame(pca$x)

#let's use first 4 pc for clustering
pc_data <- pca_scores[, 1:4]
head(pc_data)

#K means library
library(dplyr)

set.seed(125)
kmeans_result <- kmeans(pc_data, centers = 3, nstart = 25)

#add cluster result to pca data
pc_data$Cluster <- as.factor(kmeans_result$cluster)
pc_data$True_label <- data$Disease_Type

#performance
table(Cluster = pc_data$Cluster,Actual_Disease = pc_data$True_label)

