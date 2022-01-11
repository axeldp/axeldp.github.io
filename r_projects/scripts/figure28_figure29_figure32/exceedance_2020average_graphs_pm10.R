t <- list(family = "Arial", size = 12, color = 'black')

nr_exc <- c(31,26,24)
scenarios <- c("x","y", "z")
eu_limit <- c(35,35,35)
df_exc <- data.frame(nr_exc,scenarios,eu_limit)
df_exc$scenarios <- factor(df_exc$scenarios, levels = c("x","y", "z"))


year_means <- c(20.67,18.24,17.89)
scenarios <- c("Current Scenario","40% Scenario", "60% Scenario")
who_limit <- c(20,20,20)
df_ymeans <- data.frame(scenarios,year_means,eu_limit,who_limit)
#df_ymeans$year_means <- factor(df_ymeans$year_means, levels = c(20.67,18.24,17.89))


fig_exc <- plot_ly(df_exc, x = ~scenarios, y = ~nr_exc, type = 'bar', showlegend = FALSE)
fig_exc <- fig_exc %>% layout(font = t, yaxis = list(title = 'Nr. of Exceedances in 2020'), 
                      xaxis = list(title = ''), barmode = 'group')
fig_exc


xform <- list(categoryorder = "array", categoryarray = df_ymeans$scenarios)
fig_ymeans <- plot_ly(df_ymeans, x = ~scenarios, y = ~year_means, type = 'scatter', mode = 'markers + lines', showlegend = FALSE)
#fig_ymeans <- fig_ymeans %>% add_trace(y = ~who_limit, type = 'scatter', mode = 'lines')
fig_ymeans <- fig_ymeans %>% layout(font = t, yaxis = list(title = '2020 PM₁₀ Concentration Average [µg/m³]'), 
                              xaxis = xform)
fig_ymeans <- fig_ymeans %>% layout(xaxis = list(title = ''))
fig_ymeans