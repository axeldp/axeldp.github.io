#lectura datos
df <- read.csv("2020_12.csv")
#eliminar columnas no deseadas
col_df <- subset(df, select = -c(CODI_PROVINCIA, PROVINCIA, CODI_MUNICIPI, MUNICIPI, 
                                 ESTACIO, ANY, MES, DIA, V01, V02, V03, V04, V05, V06,
                                 V07, V08, V09, V10, V11, V12, V13, V14, V15, V16, V17,
                                 V18, V19, V20, V21, V22, V23, V24))
#seleccionar solo los 3 contaminantes
final_df <- col_df[col_df$CODI_CONTAMINANT %in% c("10"), ]

#separar valores por contaminantes y eliminar columan codi_contaminant
pm10_df <- final_df[final_df$CODI_CONTAMINANT %in% c("10"),]

pm10 <- subset(pm10_df, select = -c(CODI_CONTAMINANT))

#calcular medias pm10
pm10_means_24h <- data.frame(ceiling(rowMeans(pm10, na.rm = TRUE)))
names(pm10_means_24h)[1] <- "pm10"
pm10_means_24h$month <- c("dec_19")

#length(which(df$pm10 >= 50))
mean(pm10_means_24h$pm10, na.rm = TRUE)

#write.csv(pm10_means_24h, "/Volumes/AD BANK/EAE/thesis/r/bcn_pollution/2019_export/dec_19_probe.csv", row.names = FALSE)



#sum(is.na.data.frame(pm10))
#mean(pm10_means_24h$pm10[sapply(pm10, is.numeric)], na.rm = TRUE)
#length(which(pm10_means_24h$pm10 >= 50))

#summary(pm10)

#write.csv(pm10_means_24h, "/Volumes/AD BANK/EAE/thesis/r/bcn_pollution/2021_export/apr_21.csv", row.names = FALSE)







#no2_means <- data.frame(colMeans(no2_df[sapply(no2_df, is.numeric)], na.rm = TRUE))
#no2_mean <- no2_means[-c(1),]
#o3_means <- data.frame(colMeans(o3_df[sapply(o3_df, is.numeric)], na.rm = TRUE))
#o3_mean <- o3_means[-c(1),]
#pm10_means <- data.frame(colMeans(pm10_df[sapply(pm10_df, is.numeric)], na.rm = TRUE))
#pm10_mean <- pm10_means[-c(1),]

#mean(o3_mean)
#mean(no2_mean)
#mean(pm10_mean)
#max(o3_df, na.rm = TRUE)
#max(no2_df, na.rm = TRUE)
#max(pm10_df, na.rm = TRUE)