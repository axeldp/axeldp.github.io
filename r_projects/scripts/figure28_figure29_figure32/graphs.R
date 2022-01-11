df <- read.csv("average_bcn_pollution.csv")

t <- list(family = "Arial", size = 12, color = 'black')


fig_o3 <- plot_ly(df, x = ~df$year_month, y = ~df$o3, type = 'bar', showlegend = FALSE)
fig_o3 <- fig_o3 %>% add_trace(y = ~df$max_o3, marker = list(color = '#8ecae6'))
fig_o3 <- fig_o3 %>% add_trace(y = ~df$o3_limit, type = 'scatter', mode = 'lines',
                               line = list(color = 'rgb(43, 45, 47)', dash = 'dot'))
fig_o3 <- fig_o3 %>% layout(font= t, yaxis = list(title = "O₃ µg/m³"), xaxis = list(title = ""),
                            barmode = 'stack')
fig_o3

fig_no2 <- plot_ly(df, x = ~df$year_month, y = ~df$no2, type = 'bar', showlegend = FALSE)
fig_no2 <- fig_no2 %>% add_trace(y = ~df$max_no2, marker = list(color = '#ddb892'))
fig_no2 <- fig_no2 %>% add_trace(y = ~df$no2_limit, type = 'scatter', mode = 'lines',
                               line = list(color = 'rgb(43, 45, 47)', dash = 'dot'))
fig_no2 <- fig_no2 %>% layout(font= t, yaxis = list(title = "NO₂ µg/m³"), xaxis = list(title = ""),
                            barmode = 'stack')
fig_no2

fig_pm10 <- plot_ly(df, x = ~df$year_month, y = ~df$pm10, type = 'bar', showlegend = FALSE)
fig_pm10 <- fig_pm10 %>% add_trace(y = ~df$max_pm10, marker = list(color = '#4d908e'))
fig_pm10 <- fig_pm10 %>% add_trace(y = ~df$pm10_limit, type = 'scatter', mode = 'lines',
                                 line = list(color = 'rgb(43, 45, 47)', dash = 'dot'))
fig_pm10 <- fig_pm10 %>% layout(font= t, yaxis = list(title = "PM₁₀ µg/m³"), xaxis = list(title = ""),
                              barmode = 'stack')
fig_pm10
