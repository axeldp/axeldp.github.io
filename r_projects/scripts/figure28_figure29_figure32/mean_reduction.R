#lectura datos
df <- read.csv("2019_08.csv")
#eliminar columnas no deseadas y filtrar contaminantes
col_df <- subset(df, select = -c(CODI_PROVINCIA, PROVINCIA, CODI_MUNICIPI, MUNICIPI, 
                                 ESTACIO, ANY, MES, DIA, V01, V02, V03, V04, V05, V06,
                                 V07, V08, V09, V10, V11, V12, V13, V14, V15, V16, V17,
                                 V18, V19, V20, V21, V22, V23, V24))
final_df <- col_df[col_df$CODI_CONTAMINANT %in% c("10"), ]
pm10 <- subset(final_df, select = -c(CODI_CONTAMINANT))

#cáclulo Flux
Vd_pm10 <- 0.239
f_pm10 <- pm10*Vd_pm10*10^-8
#cálculo Q(kg)
l <- 6673920
t <- 3600
q_pm10 <- f_pm10*l*t*0.001

#restar df
rm_pm10 <- pm10-q_pm10

#media 24h
rm_pm10_means_24h <- data.frame(floor(rowMeans(rm_pm10, na.rm = TRUE)))
names(rm_pm10_means_24h)[1] <- "pm10"
rm_pm10_means_24h$month <- c("x")

#exportar meses
write.csv(rm_pm10_means_24h, "2019_08_rm.csv", row.names = FALSE)
