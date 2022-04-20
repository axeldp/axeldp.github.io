#!/usr/bin/env python
# coding: utf-8

# # Interactive Choropleth Worldmap showing Followers Distribution

# Let's import all necessary **libraries**!

# In[1]:


import pandas as pd
import plotly.graph_objs as go
import plotly.express as px
import dash
import dash_core_components as dcc
import dash_html_components as html


# Reading and loading **data**.

# In[2]:


df = pd.read_csv('countries-of-followers-general.csv')
df


# ## Code for deploying Dash App as an Interactive Map

# In[3]:


df=pd.read_csv('countries-of-followers-general.csv')
df = df.rename(columns=dict(value_agency='Salvadoragency',
                            value_models='Salvadormodels',
                            value_kids='Salvadorkids',
                            value_blare= 'Blare'))
cols_dd = ['Salvadoragency', 'Salvadormodels', 'Salvadorkids', 'Blare']


external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash.Dash(external_stylesheets=external_stylesheets)

app.layout = html.Div(style={'backgroundColor': 'rgb(50, 48, 49)', "height": "100vh"}, children=[
    html.H1(
        children='Salvador Agency IG followers map',
        style={
            'textAlign': 'center',
            'color': 'white'
        }
    ),
    
    dcc.Dropdown(
        id='demo-dropdown',
        options=[{'label': k, 'value': k} for k in cols_dd],
        value=cols_dd[0],
        placeholder = 'Selecciona una cuenta',
        style={'backgroundColor': 'rgb(50, 48, 49)',
            'color': 'black'}
        
       
    ),

    html.Hr(),
    dcc.Graph(id='display-selected-values')
    
])



@app.callback(
    dash.dependencies.Output('display-selected-values', 'figure'),
    [dash.dependencies.Input('demo-dropdown', 'value')])
def update_output(value):
    fig = go.Figure()
    fig.add_trace(go.Choropleth(
       locations=df['iso_num'], # Spatial coordinates
        z=df[value].astype(float), # Data to be color-coded
        colorbar_title=value,
        colorscale='Inferno'
    ))
    fig.update_layout(geo=dict(bgcolor= '#000000', lakecolor='#000000'), paper_bgcolor='rgb(50, 48, 49)', plot_bgcolor='rgb(50, 48, 49)')
    fig.update_layout(margin={'r':0, 't':50, 'l':0, 'b':0, 'pad':0})
    #fig.update_layout(title=f"<b>{value}</b>", title_x=0.5, font=dict(size=18, color='white'))
    return fig

if __name__ == '__main__':
    app.run_server()

