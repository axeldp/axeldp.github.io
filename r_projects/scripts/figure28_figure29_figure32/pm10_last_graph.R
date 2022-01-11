df <- read.csv("pm10_bcn.csv")

df <- df[df$pm10 <200, ]
t <- list(family = "Arial", size = 12, color = 'black')

fig_pm10 <- plot_ly(df, x = ~month, y = ~pm10, type = 'scatter', mode = 'lines', line = list(width = 0.25))
fig_pm10 <- fig_pm10 %>% layout(font= t, yaxis = list(title = "µg/m³"), xaxis = list(title = "Date"))
fig_pm10

length(which(df$pm10 >= 50)) 