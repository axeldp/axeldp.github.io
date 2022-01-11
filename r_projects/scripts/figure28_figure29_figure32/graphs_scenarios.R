pollutants <- c("NO₂","PM₁₀")
current <- c(462,202)
fortyp <- c(81469,35587)
sixtyp <- c(122203,53380)

df <- data.frame(pollutants,current,fortyp,sixtyp)

t <- list(family = "Arial", size = 12, color = 'black')

fig <- plot_ly(df, x = ~pollutants, y = ~current, type = 'bar', name = 'Current Scenario')
fig <- fig %>% add_trace(y = ~fortyp, name = '40% scenario', marker = list(color = '#76c893'))
fig <- fig %>% add_trace(y = ~sixtyp, name = '60% scenario', marker = list(color = '#34a0a4'))
fig <- fig %>% layout(font = t, yaxis = list(title = 'Annual Pollutant Removal (kg)'), 
                      xaxis = list(title = ''), barmode = 'group')
fig

