###################
library(pacman)
p_load(shiny,shinydashboard,shinydashboardPlus,shinyjs,
       readxl,shinythemes,DT,tidyverse,shinyWidgets,
       stringr, plotly)

# Últimos dados do igest
geral <- read_xlsx('G:\\24. IGest Nacional\\Simulador R\\geral.xlsx')
geral <- geral[,-c(1,3)]
colnames(geral) <- c("Vara do Trabalho","V01 - Idade Média do Pendente de Julgamento","V02 - Pendentes de Baixa na Fase de Conhecimento","V03 - Liquidações Pendentes","V04 - Pendentes de Baixa na Fase de Execução",
                     "V05 - Prazo na Fase de Conhecimento","V06 - Prazo na Fase de Liquidação","V07 - Prazo na Fase de Execução","V08 - Conciliações","V09 - Solucionados",
                     "V10 - Recebidos","V11 - Pendentes de Julgamento conclusos com prazo vencido","V12 - Total de Processos Conclusos aguardando prolação da sentença",
                     "V13 - Baixados na Fase de Conhecimento","V14 - Baixados na Fase de Execução","V15 - Servidores Ativos","V16 - Execuções Iniciadas","V17 - Execuções Encerradas")


## Fazendo por TRT
trt1 <- geral[c(1:146),]
trt2 <- geral[c(147:363),]
trt3 <- geral[c(364:521),]
trt4 <- geral[c(522:653),]
trt5 <- geral[c(654:741),]
trt6 <- geral[c(742:808),]
trt7 <- geral[c(809:845),]
trt8 <- geral[c(846:901),]
trt9 <- geral[c(902:997),]
trt10 <- geral[c(998:1032),] 
trt11 <- geral[c(1033:1064),]
trt12 <- geral[c(1065:1124),]
trt13 <- geral[c(1125:1151),]
trt14 <- geral[c(1152:1183),]
trt15 <- geral[c(1184:1336),]
trt16 <- geral[c(1337:1359),]
trt17 <- geral[c(1360:1383),]
trt18 <- geral[c(1384:1431),]
trt18 <- geral[c(1384:1431),]
trt19 <- geral[c(1432:1453),]
trt20 <- geral[c(1454:1468),]
trt21 <- geral[c(1469:1491),]
trt22 <- geral[c(1492:1505),]
trt23 <- geral[c(1506:1543),]
trt24 <- geral[c(1544:1569),]
geral <- geral[-1570,] # A última linha é NA

##

# Valores para o filtro de tribunais; e para o TRT 10ª
escolha_tribunal <- c("GERAL","TRT01-RJ","TRT02-SP","TRT03-MG","TRT04-RS","TRT05-BA","TRT06-PE","TRT07-CE","TRT08-PA/AP",
                      "TRT09-PR","TRT10-DF/TO","TRT11-AM/RR","TRT12-SC","TRT13-PB","TRT14-RO/AC","TRT15-Campinas","TRT16-MA",
                      "TRT17-ES","TRT18-GO","TRT19-AL","TRT20-SE","TRT21-RN","TRT22-PI","TRT23-MT","TRT24-MS")




escolha_vt <- trt10$`Vara do Trabalho`

## Desativado - escolha_vt01 <- trt1$`Vara do Trabalho`

## Valores iniciais para cada variável, por vara.
valores_iniciais1 <- round(c(trt10$`V01 - Idade Média do Pendente de Julgamento`),4)
valores_iniciais2 <- round(c(trt10$`V02 - Pendentes de Baixa na Fase de Conhecimento`),4)
valores_iniciais3 <- round(c(trt10$`V03 - Liquidações Pendentes`),4)
valores_iniciais4 <- round(c(trt10$`V04 - Pendentes de Baixa na Fase de Execução`),4)
valores_iniciais5 <- round(c(trt10$`V05 - Prazo na Fase de Conhecimento`),4)
valores_iniciais6 <- round(c(trt10$`V06 - Prazo na Fase de Liquidação`),4)
valores_iniciais7 <- round(c(trt10$`V07 - Prazo na Fase de Execução`),4)
valores_iniciais8 <- round(c(trt10$`V08 - Conciliações`),4)
valores_iniciais9 <- round(c(trt10$`V09 - Solucionados`),4)
valores_iniciais10 <- round(c(trt10$`V10 - Recebidos`),4)
valores_iniciais11 <- round(c(trt10$`V11 - Pendentes de Julgamento conclusos com prazo vencido`),4)
valores_iniciais12 <- round(c(trt10$`V12 - Total de Processos Conclusos aguardando prolação da sentença`),4)
valores_iniciais13 <- round(c(trt10$`V13 - Baixados na Fase de Conhecimento`),4)
valores_iniciais14 <- round(c(trt10$`V14 - Baixados na Fase de Execução`),4)
valores_iniciais15 <- round(c(trt10$`V15 - Servidores Ativos`),4)
valores_iniciais16 <- round(c(trt10$`V16 - Execuções Iniciadas`),4)
valores_iniciais17 <- round(c(trt10$`V17 - Execuções Encerradas`),4)




