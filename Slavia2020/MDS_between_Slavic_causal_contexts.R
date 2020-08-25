# take the columns with data to be compared only

row.names(slavic_nominal_causes_2020_01) <- slavic_nominal_causes_2020_01[,1]
slavic_nominal_causes_2020_01 <- slavic_nominal_causes_2020_01[,-1]

# create an empty matrix for writing distances between contexts
distances <- matrix(data = 0, nrow = nrow(slavic_nominal_causes_2020_01), ncol = nrow(slavic_nominal_causes_2020_01))

# code for one pair of contexts
# create a logical vector showing whether two contexts are coded identically
comparison <- slavic_nominal_causes_2020_01[1,] == slavic_nominal_causes_2020_01[3,]
number_mismatches <- length(which(comparison == FALSE))
#determine the number of positions where neither language has "NA"
number_non_missing_observations <- length(which(!is.na(comparison)))
relative_distance_between_contexts <- number_mismatches/number_non_missing_observations

# the same code within a loop that writes relative distances to the matrix
for (i in 1:nrow(slavic_nominal_causes_2020_01)) {
  for (j in i:nrow(slavic_nominal_causes_2020_01)) {
    comparison <- slavic_nominal_causes_2020_01[i,] == slavic_nominal_causes_2020_01[j,]
    number_mismatches <- length(which(comparison == FALSE))
    number_non_missing_observations <- length(which(!is.na(comparison)))
    relative_distance_between_contexts <- number_mismatches/number_non_missing_observations
    distances[i,j] <- relative_distance_between_contexts
    distances[j,i] <- relative_distance_between_contexts
  }
}

#Install another useful package for MDS
install.packages('smacof')
library(smacof)

#The basic function for MDS analysis has a very simple syntax
#It creates sth. that is called "a list"
mds <- mds(distances)
#This object can be plotted in a very simple way
plot(mds)

#Check whether first dimensions represent distances faithfully
d1 <- mds(distances, ndim = 1)$stress
d2 <- mds(distances, ndim = 2)$stress
d3 <- mds(distances, ndim = 3)$stress
d4 <- mds(distances, ndim = 4)$stress
d5 <- mds(distances, ndim = 5)$stress
plot(1:5, c(d1, d2, d3, d4, d5), type = "b", xlab = "n of dimensions", ylab = "Stress")


#Steeper curves correspond to less stress with fewer dimensions

#It is possible to see how real distances are distorted in the visualization
plot(mds, "Shepard")

#The plot can be represented without labels
plot(mds$conf)
# the part after $ ("mds$conf") is the part of the list called mds which contains coordinates resulting from the mds analysis of data; by default, the function mds is configured to have exactly two dimensions

# two separate scenarios for plotting the results
# scenario #1
#To configure the plot, start with an empty plot
plot(mds$conf, type = 'n')

#Add points to already existing plot, based on conditions
points(mds$conf[slavic_nominal_causes_2020_01[,1] == 'от',], bg = 'forestgreen', pch = 21)

# scenario #2
#In order to add noise  points with identical coordinates
plot(jitter(mds$conf), pch = 16)

# as I need to have identical coordinates when visualising results for individual languages, and "jitter" creates jitter randomly, we had to create an object that has the same amount of random noise added to the original mds analysis
mds_coordinates <- jitter(mds$conf)

# it is now this new object that is plotted further
# the first plot with all contexts represented in the two-dimensional space and no other information
plot(mds_coordinates, pch = 16, cex = 0.6, xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))

# a series of similar scenarios in which plots are created that show how contexts with individual high-frequency (f > 9) prepositions are located on the mds-visualisation

# for Russian data

plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,1] == 'от',], pch = 20)
points(mds_coordinates[slavic_nominal_causes_2020_01[,1] == 'из',], pch = 17)
points(mds_coordinates[slavic_nominal_causes_2020_01[,1] == 'из-за',], pch = 24)
points(mds_coordinates[slavic_nominal_causes_2020_01[,1] == 'в_силу',], pch = 8)
points(mds_coordinates[slavic_nominal_causes_2020_01[,1] == 'благодарйа',], pch = 10)

# a subscenario for idenitification of contexts where rare prepositions are used
names_rare_preps_ru <- names(table(slavic_nominal_causes_2020_01$Ru_PP, useNA = 'ifany')[table(slavic_nominal_causes_2020_01$Ru_PP) < 10])
indeces_rare_preps_ru <- which(slavic_nominal_causes_2020_01$Ru_PP %in% names_rare_preps)
points(mds_coordinates[indeces_rare_preps_ru,], pch = 4)

legend(x = 'bottomleft', pch = c(19, 17, 24, 10, 8, 4), legend = c('от', "из", "из-за", "благодаря", "в силу", "other"), bty = 'n', cex = 0.7, pt.cex = 1)

# for Polish data
plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,4] == 'od',], pch = 20)
points(mds_coordinates[slavic_nominal_causes_2020_01[,4] == 'z',], pch = 17)
points(mds_coordinates[slavic_nominal_causes_2020_01[,4] == 'przez',], pch = 25)
points(mds_coordinates[slavic_nominal_causes_2020_01[,4] == 'dzi?ki',], pch = 10)

names_rare_preps_pl <- names(table(slavic_nominal_causes_2020_01$Pl_PP)[table(slavic_nominal_causes_2020_01$Pl_PP) < 10])
indeces_rare_preps_pl <- which(slavic_nominal_causes_2020_01$Pl_PP %in% names_rare_preps_pl)

points(mds_coordinates[indeces_rare_preps_pl,], pch = 4)

legend(x = 'bottomleft', pch = c(19, 17, 25, 10, 4), legend = c('od', "z", "przez", "dzieki", "other"), bty = 'n', cex = 0.7, pt.cex = 1)

# for Czech data
plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,5] == 'INS',], pch = 1)
points(mds_coordinates[slavic_nominal_causes_2020_01[,5] == 'z',], pch = 17)
points(mds_coordinates[slavic_nominal_causes_2020_01[,5] == 'pro',], pch = 15)
points(mds_coordinates[slavic_nominal_causes_2020_01[,5] == 'kv?li',], pch = 11)
points(mds_coordinates[slavic_nominal_causes_2020_01[,5] == 'd?ky',], pch = 10)

names_rare_preps_cz <- names(table(slavic_nominal_causes_2020_01$Cz_PP)[table(slavic_nominal_causes_2020_01$Cz_PP) < 10])
indeces_rare_preps_cz <- which(slavic_nominal_causes_2020_01$Cz_PP %in% names_rare_preps_cz)

points(mds_coordinates[indeces_rare_preps_cz,], pch = 4)

legend(x = 'bottomleft', pch = c(1, 17, 15, 11, 10, 4), legend = c('INS', "z", "pro", "kvuli", "diky", "other"), bty = 'n', cex = 0.7, pt.cex = 1)

# for Slovenian data
plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,7] == 'od',], pch = 20)
points(mds_coordinates[slavic_nominal_causes_2020_01[,7] == 'iz',], pch = 17)
points(mds_coordinates[slavic_nominal_causes_2020_01[,7] == 'zaradi',], pch = 3)

names_rare_preps_sl <- names(table(slavic_nominal_causes_2020_01$Sl_PP)[table(slavic_nominal_causes_2020_01$Sl_PP) < 10])
indeces_rare_preps_sl <- which(slavic_nominal_causes_2020_01$Sl_PP %in% names_rare_preps_sl)

points(mds_coordinates[indeces_rare_preps_sl,], pch = 4)

legend(x = 'bottomleft', pch = c(19, 17, 3, 4), legend = c('od', "iz", "zaradi", "other"), bty = 'n', cex = 0.7, pt.cex = 1)

# for Bulgarian data
plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,11] == 'от',], pch = 20)
points(mds_coordinates[slavic_nominal_causes_2020_01[,11] == 'благодарение_на',], pch = 10)
points(mds_coordinates[slavic_nominal_causes_2020_01[,11] == 'заради',], pch = 3)
points(mds_coordinates[slavic_nominal_causes_2020_01[,11] == 'поради',], pch = 8)

names_rare_preps_bg <- names(table(slavic_nominal_causes_2020_01$Bg_PP)[table(slavic_nominal_causes_2020_01$Bg_PP) < 10])
indeces_rare_preps_bg <- which(slavic_nominal_causes_2020_01$Bg_PP %in% names_rare_preps_bg)

points(mds_coordinates[indeces_rare_preps_bg,], pch = 4)

legend(x = 'bottomleft', pch = c(19, 8, 3, 10, 4), legend = c('от', "поради", "заради", "благодарение", "other"), bty = 'n', cex = 0.7, pt.cex = 1)

# for Ukrainian data
plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,3] == 'від',], pch = 20)
points(mds_coordinates[slavic_nominal_causes_2020_01[,3] == 'з',], pch = 17)
points(mds_coordinates[slavic_nominal_causes_2020_01[,3] == 'завдйаки',], pch = 10)
points(mds_coordinates[slavic_nominal_causes_2020_01[,3] == 'через',], pch = 25)

names_rare_preps_uk <- names(table(slavic_nominal_causes_2020_01$Uk_PP)[table(slavic_nominal_causes_2020_01$Uk_PP) < 10])
indeces_rare_preps_uk <- which(slavic_nominal_causes_2020_01$Uk_PP %in% names_rare_preps_uk)

points(mds_coordinates[indeces_rare_preps_uk,], pch = 4)

# for Serbian data
plot(mds_coordinates, type = 'n', xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2))
points(mds_coordinates[slavic_nominal_causes_2020_01[,9] == 'od',], pch = 20)
points(mds_coordinates[slavic_nominal_causes_2020_01[,9] == 'iz',], pch = 17)
points(mds_coordinates[slavic_nominal_causes_2020_01[,9] == 'zahvaljuju?i',], pch = 10)
points(mds_coordinates[slavic_nominal_causes_2020_01[,9] == 'zbog',], pch = 24)

names_rare_preps_sr <- names(table(slavic_nominal_causes_2020_01$Sr_PP)[table(slavic_nominal_causes_2020_01$Sr_PP) < 10])
indeces_rare_preps_sr <- which(slavic_nominal_causes_2020_01$Sr_PP %in% names_rare_preps_sr)

points(mds_coordinates[indeces_rare_preps_sr,], pch = 4)

legend(x = 'bottomleft', pch = c(19, 17, 24, 10, 4), legend = c('od', "iz", "zbog", "zahvaljujuci", "other"), bty = 'n', cex = 0.7, pt.cex = 1)