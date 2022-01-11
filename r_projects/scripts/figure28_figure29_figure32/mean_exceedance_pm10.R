#lectura datos
df <- read.csv("dec_20.csv")

exc <- df[df$pm10 >= 50,]
mean_exc <- mean(exc$pm10, na.rm = TRUE)
mean_exc