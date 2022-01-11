#A. Lectura del fichero y eliminar columnas EJ
df <- read.csv("figure1_2.csv")
df <- subset(df, select = -c(Coal..EJ. , Gas..EJ.))

#font
t <- list(family = "Arial",
          size = 12,
          color = 'black')

#gráficas
fig_world <- plot_ly(df, x = ~df[1:20 , 2], y = ~df[1:20 , 3], type = 'scatter', mode = 'lines',
                     line = list(color = 'rgb(131, 156, 94)', width = 1), showlegend=FALSE)
fig_world <- fig_world %>% add_trace(y = ~df[1:20 , 4], line = list(color = 'rgb(93, 130, 155)', width = 1))
fig_world <- fig_world %>% add_trace(y = ~df[1:20 , 5], line = list(color = 'rgb(156, 94, 131)', width = 1))
fig_world <- fig_world %>% layout(title = "World (MT)", font= t,yaxis = list(title = ""), xaxis = list(title = ""))
fig_world <- fig_world %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_world

fig_europe <- plot_ly(df, x = ~df[21:40 , 2], y = ~df[21:40 , 3], type = 'scatter', mode = 'lines',
                      line = list(color = 'rgb(131, 156, 94)', width = 1), showlegend=FALSE)
fig_europe <- fig_europe %>% add_trace(y = ~df[21:40 , 4], line = list(color = 'rgb(93, 130, 155)', width = 1))
fig_europe <- fig_europe %>% add_trace(y = ~df[21:40 , 5], line = list(color = 'rgb(156, 94, 131)', width = 1))
fig_europe <- fig_europe %>% layout(title = "Europe (MT)", font= t,yaxis = list(title = ""), xaxis = list(title = ""))
fig_europe <- fig_europe %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_europe

fig_spain <- plot_ly(df, x = ~df[41:60 , 2], y = ~df[41:60 , 3], type = 'scatter', mode = 'lines',
                      line = list(color = 'rgb(131, 156, 94)', width = 1), showlegend=FALSE)
fig_spain <- fig_spain %>% add_trace(y = ~df[41:60 , 4], line = list(color = 'rgb(93, 130, 155)', width = 1))
fig_spain <- fig_spain %>% add_trace(y = ~df[41:60 , 5], line = list(color = 'rgb(156, 94, 131)', width = 1))
fig_spain <- fig_spain %>% layout(title = "Spain (MT)", font= t,yaxis = list(title = ""), xaxis = list(title = ""))
fig_spain <- fig_spain %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_spain

fig_barcelona <- plot_ly(df, x = ~df[61:80 , 2], y = ~df[61:80 , 3], type = 'scatter', mode = 'lines',
                     line = list(color = 'rgb(131, 156, 94)', width = 1), showlegend=FALSE)
fig_barcelona <- fig_barcelona %>% add_trace(y = ~df[61:80 , 4], line = list(color = 'rgb(93, 130, 155)', width = 1))
fig_barcelona <- fig_barcelona %>% add_trace(y = ~df[61:80 , 5], line = list(color = 'rgb(156, 94, 131)', width = 1))
fig_barcelona <- fig_barcelona %>% layout(title = "Barcelona (T)", font= t,yaxis = list(title = ""), xaxis = list(title = ""))
fig_barcelona <- fig_barcelona %>% layout(xaxis = list(tickfont = list(size = 14)), yaxis = list(tickfont = list(size = 14)))
fig_barcelona