#A. Lectura del fichero
df <- read.csv("figure1_7.csv")

#font
t <- list(family = "Arial",
          size = 12,
          color = 'black')

#gráficas
fig_world <- plot_ly(df, x = ~df[1:31 , 2], y = ~df[1:31 , 3], type = 'scatter', mode = 'lines',
                     line = list(color = 'rgb(217, 71, 66)', width = 1), showlegend = FALSE)
fig_world <- fig_world %>% add_trace(y = ~df[1:31 , 4], line = list(color = 'rgb(0, 51, 153)'
                                      , width = 1, dash = 'dot'))
fig_world <- fig_world %>% layout(title = "World", font= t, yaxis = list(title = ""), xaxis = list(title = ""))
fig_world <- fig_world %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_world

fig_eu <- plot_ly(df, x = ~df[1:31 , 2], y = ~df[32:62 , 3], type = 'scatter', mode = 'lines',
                     line = list(color = 'rgb(217, 71, 66)', width = 1), showlegend = FALSE)
fig_eu <- fig_eu %>% add_trace(y = ~df[32:62 , 4], line = list(color = 'rgb(0, 51, 153)'
                                                                    , width = 1, dash = 'dot'))
fig_eu <- fig_eu %>% layout(title = "Europe", font= t, yaxis = list(title = ""), xaxis = list(title = ""))
fig_eu <- fig_eu %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_eu

fig_spn <- plot_ly(df, x = ~df[1:31 , 2], y = ~df[63:93 , 3], type = 'scatter', mode = 'lines',
                     line = list(color = 'rgb(217, 71, 66)', width = 1), showlegend = FALSE)
fig_spn <- fig_spn %>% add_trace(y = ~df[63:93 , 4], line = list(color = 'rgb(0, 51, 153)'
                                                                    , width = 1, dash = 'dot'))
fig_spn <- fig_spn %>% layout(title = "Spain", font= t, yaxis = list(title = ""), xaxis = list(title = ""))
fig_spn <- fig_spn %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_spn

fig_cat <- plot_ly(df, x = ~df[1:31 , 2], y = ~df[94:124 , 3], type = 'scatter', mode = 'lines',
                   line = list(color = 'rgb(217, 71, 66)', width = 1), showlegend = FALSE)
fig_cat <- fig_cat %>% add_trace(y = ~df[94:124 , 4], line = list(color = 'rgb(0, 51, 153)'
                                                                    , width = 1, dash = 'dot'))
fig_cat <- fig_cat %>% layout(title = "Catalonia", font= t, yaxis = list(title = ""), xaxis = list(title = ""))
fig_cat <- fig_cat %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_cat