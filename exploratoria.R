# Exploratória das Séries 

# Plot Temperatura Média (T2M)
plot_serie <- dados_trimestrais_ts %>% 
  autoplot(Temperatura_Media)+
  labs(title = "Temperatura Média: 2 metros da superficie")

##serie Precipitação (PRECTOTCORR)
plot_serie_02 = dados_trimestrais_ts %>%
  autoplot(Chuva_total_trimestre) +
  labs(title="Precipitação Total Corrigida (mm/dia)",
       y="")
plot_serie_02

##serie WS2M
plot_serie_03 = dados_trimestrais_ts %>%
  autoplot(Vento_medio) +
  labs(title="Velocidade Média do Vento",
       y="")
plot_serie_03

##serie RH2M
plot_serie_04 = dados_trimestrais_ts %>%
  autoplot(Umidade_media) +
  labs(title="Umidade Relativa",
       y="")
plot_serie_04

### Plot das Séries juntas
plot_series <- dados_trimestrais_ts %>%
  pivot_longer(-c(Data,municipio)) %>%
  ggplot(aes(x = Data, y = value, colour = name)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y")
plot_series


### Plot das Séries MENSAIS
plot_serie_mes_01 <- df_final %>% 
  pivot_longer(-c(Data,municipio)) %>%
  ggplot(aes(x = Data, y = value, colour = name)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y")
plot_serie_mes_01

### Plot das Séries TRIMESTRAIS
plot_serie_trimestre_01 <- dados_trimestrais %>% 
  pivot_longer(-c(Data,municipio)) %>%
  ggplot(aes(x = Data, y = value, colour = name)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y")
plot_serie_trimestre_01

################################################################################
################################################################################
### Estudo da Sazonalidade
sazonalidade_Temperatura <- dados_trimestrais_ts %>%
  gg_season(Temperatura_Media, labels = "both") +
  labs(y = "Temperatura média a 2m (°C)",
       title = "Sazonalidade: Temperatuda Média (Diaria)")

sazonalidade_Precipitacao <- dados_trimestrais_ts %>%
  gg_season(Chuva_total_trimestre, labels = "both") +
  labs(y = "Temperatura média a 2m (°C)",
       title = "Sazonalidade: Precipitação Total Corrigida")

sazonalidade_Velocidade <- dados_trimestrais_ts %>%
  gg_season(Vento_medio, labels = "both") +
  labs(y = "Temperatura média a 2m (°C)",
       title = "Sazonalidade: Velocidade do Vento")

sazonalidade_Umiade <- dados_trimestrais_ts %>%
  gg_season(Umidade_media, labels = "both") +
  labs(y = "Temperatura média a 2m (°C)",
       title = "Sazonalidade: Umidade Relativa")

Sazonalidade_total <- gridExtra::grid.arrange(
  sazonalidade_Precipitacao, sazonalidade_Temperatura, 
  sazonalidade_Velocidade, sazonalidade_Umiade,
  layout_matrix = rbind(c(1,2),
                        c(3,4))
)

"analisar como será executado o estudo da sazonalidade (por cidade?)"


