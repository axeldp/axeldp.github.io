price <- c(199393,136767,171180,163318,121169,70874,132956,147541,313279,136027)
g_area <- c(390,583,221,502,118,191,71,1950,406,1085)

price_per_sqm<- price/g_area
media <- mean(price_per_sqm)

ranking <- c("1º","2º","3º","4º","5º","6º","7º","8º","9º","10º")

df <- data.frame(price_per_sqm, ranking)
df$ranking <- factor(df$ranking, levels = c("1º","2º","3º","4º","5º","6º","7º","8º","9º","10º"))
t <- list(family = "Arial", size = 12, color = 'black')


fig <- plot_ly(data= df, y= ~price_per_sqm, x= ~ranking, type= 'bar', showlegend = FALSE)
fig <- fig %>% add_trace(y = ~media, type = 'scatter', mode = 'lines', line = list(color = 'rgb(43, 45, 47)', width = 0.5))
fig <- fig %>% layout(font= t, yaxis = list(title = "€ /m²"), xaxis = list(title = "1st Competition Projects Ranking"))
fig

