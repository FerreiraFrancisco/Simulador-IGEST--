
######################################
source("G:\\24. IGest Nacional\\Simulador R\\Simulador\\Nacionais - Dados iniciais.R")

ui <- shinyUI(fluidPage(theme = shinytheme("flatly"),
                       titlePanel(h1("Simulador IGEST - Nacional", align = 'center')),
                       navbarPage("",
                                  tabPanel(icon("robot"),
                                           fluidRow(
                                             column(3,style = "height: 90vh; overflow-y: auto;", 
                                                    p(strong("PARTE 1: Selecione no filtro abaixo o tribunal que deseja comparar os dados com as varas do TRT 10ª 
                                                             na tabela ao lado. Por padrão, temos a visualização dos dados em âmbito nacional.", style = "color:#444444")),
                                                    pickerInput("tribunal", choices = escolha_tribunal, multiple = FALSE),
                                                    #
                                                    # Desativado - p(strong("Selecione a(s) vara(s) para comparação", style = "color:#444444")),
                                                    # Desativado - pickerInput("tribunal_varas", choices = escolha_vt01,multiple = T),
                                                    #
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    p(strong("PARTE 2: Selecione agora a vara específica do TRT 10ª para alterar as variáveis Vxx(V01, V02,..., V17).
                                                             No primeiro campo estão os valores que pode ser alterados de acordo com a sua escolha, e abaixo dele
                                                             está armazenado o valor real da variável.", style = "color:#444444")),
                                                    pickerInput("varas1", choices = escolha_vt,multiple = FALSE),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v01", "V01 - Idade Média do Pendente de Julgamento (-)", round(trt10$`V01 - Idade Média do Pendente de Julgamento`[1],4),min = 0),
                                                    textInput("texto_01", "", round(trt10$`V01 - Idade Média do Pendente de Julgamento`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v02", "V02 - Pendentes de Baixa na Fase de Conhecimento (-)", round(trt10$`V02 - Pendentes de Baixa na Fase de Conhecimento`[1],4), min = 0, max = 1588),
                                                    textInput("texto_02", "", round(trt10$`V02 - Pendentes de Baixa na Fase de Conhecimento`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v03", "V03 - Liquidações Pendentes (-)", round(trt10$`V03 - Liquidações Pendentes`[1],4), min = 0, max = 722),
                                                    textInput("texto_03", "", round(trt10$`V03 - Liquidações Pendentes`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v04", "V04 - Pendentes de Baixa na Fase de Execução (-)", round(trt10$`V04 - Pendentes de Baixa na Fase de Execução`[1],4), min = 0, max = 3950),
                                                    textInput("texto_04", "", round(trt10$`V04 - Pendentes de Baixa na Fase de Execução`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v05", "V05 - Prazo na Fase de Conhecimento (-)", round(trt10$`V05 - Prazo na Fase de Conhecimento`[1],4), min = 0, max = 10000),
                                                    textInput("texto_05", "", round(trt10$`V05 - Prazo na Fase de Conhecimento`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v06", "V06 - Prazo na Fase de Liquidação (-)", round(trt10$`V06 - Prazo na Fase de Liquidação`[1],4), min = 0, max = 10000),
                                                    textInput("texto_06", "", round(trt10$`V06 - Prazo na Fase de Liquidação`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v07", "V07 - Prazo na Fase de Execução (-)", round(trt10$`V07 - Prazo na Fase de Execução`[1],4), min = 0, max = 10000),
                                                    textInput("texto_07", "", round(trt10$`V07 - Prazo na Fase de Execução`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v08", "V08 - Conciliações (+)", round(trt10$`V08 - Conciliações`[1],4), min = 0, max = 10000),
                                                    textInput("texto_08", "", round(trt10$`V08 - Conciliações`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v09", "V09 - Solucionados (+)", round(trt10$`V09 - Solucionados`[1],4), min = 0, max = 10000),
                                                    textInput("texto_09", "", round(trt10$`V09 - Solucionados`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v10", "V10 - Recebidos (+)", round(trt10$`V10 - Recebidos`[1],4), min = 0, max = 10000),
                                                    textInput("texto_10", "", round(trt10$`V10 - Recebidos`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v11", "V11 - Pendentes de Julgamento conclusos com prazo vencido (-)", round(trt10$`V11 - Pendentes de Julgamento conclusos com prazo vencido`[1],4), min = 0, max = 100),
                                                    textInput("texto_11", "", round(trt10$`V11 - Pendentes de Julgamento conclusos com prazo vencido`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v12", "V12 - Total de processos Conclusos aguardando prolação da sentença (+)", round(trt10$`V12 - Total de Processos Conclusos aguardando prolação da sentença`[1],4), min = 0, max = 10000),
                                                    textInput("texto_12", "", round(trt10$`V12 - Total de Processos Conclusos aguardando prolação da sentença`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v13", "V13 - Baixados na Fase de Conhecimento (+)", round(trt10$`V13 - Baixados na Fase de Conhecimento`[1],4), min = 0, max = 10000),
                                                    textInput("texto_13", "", round(trt10$`V13 - Baixados na Fase de Conhecimento`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v14", "V14 - Baixados na Fase de Execução (+)", round(trt10$`V14 - Baixados na Fase de Execução`[1],4), min = 0, max = 10000),
                                                    textInput("texto_14", "", round(trt10$`V14 - Baixados na Fase de Execução`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v15", "V15 - Servidores Ativos (+)", round(trt10$`V15 - Servidores Ativos`[1],4), min = 0, max = 50),
                                                    textInput("texto_15", "", round(trt10$`V15 - Servidores Ativos`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v16", "V16 - Execuções Iniciadas (+)", round(trt10$`V16 - Execuções Iniciadas`[1],4), min = 0, max = 10000),
                                                    textInput("texto_16", "", round(trt10$`V16 - Execuções Iniciadas`[1],4)),
                                                    tags$hr(style="border-color: black;"),
                                                    #
                                                    numericInput("v17", "V17 - Execuções Encerradas (+)", round(trt10$`V17 - Execuções Encerradas`[1],4), min = 0, max = 10000),
                                                    textInput("texto_17", "", round(trt10$`V17 - Execuções Encerradas`[1],4)),
                                                    tags$hr(style="border-color: black;")
                                                    
                                                    
                                                    
                                             ),
                                             mainPanel(
                                               tabsetPanel(
                                                 tabPanel(strong("Mesoindicadores - Valor parametrizado"), br(),
                                                          fluidRow(column(DT::dataTableOutput("valor01_fixo"),
                                                                          width = 12)
                                                                   ),
                                                          tags$hr(style="border-color: black;"),
                                                          p(strong("Valores para as demais varas de acordo com o primeiro filtro: ")),
                                                          fluidRow(column(DT::dataTableOutput("valor01"),
                                                                          width = 12))
                                                          ),
                                                 tabPanel(strong("Mesoindicadores - Valor posição"),br(),
                                                          fluidRow(column(DT::dataTableOutput("valor02_fixo"),
                                                                          width = 12)
                                                                   ),
                                                          tags$hr(style="border-color: black;"),
                                                          p(strong("Valores para as demais varas de acordo com o primeiro filtro: ")),
                                                          fluidRow(column(DT::dataTableOutput("valor02"),
                                                                          width = 12))
                                                          ),
                                                 tabPanel(strong("Indicadores - Parametrizados"),br(),
                                                          fluidRow(column(DT::dataTableOutput("indicadores_parametrizados0"),
                                                                          width = 12)
                                                                   ),
                                                          tags$hr(style="border-color: black;"),
                                                          p(strong("Valores para as demais varas de acordo com o primeiro filtro: ")),
                                                          fluidRow(column(DT::dataTableOutput("indicadores_parametrizados1"),
                                                                          width = 12))
                                                          ),
                                                 tabPanel(strong("Indicadores - Brutos"),br(),
                                                          fluidRow(column(DT::dataTableOutput("indicadores_brutos0"),
                                                                          width = 12)
                                                                   ),
                                                          tags$hr(style="border-color: black;"),
                                                          p(strong("Valores para as demais varas de acordo com o primeiro filtro: ")),
                                                          fluidRow(column(DT::dataTableOutput("indicadores_brutos1"),
                                                                          width = 12)
                                                                   )
                                                          )
                                                 )
                                               )
                                             )
                                           ))))






#################

#################
server <- shinyServer(function(input, output, session){
  
  
  # ObserveEvent - retorna um objeto de acordo com as escolhas do usuário, neste caso, "vara do TRT10 e Tribunal escolhido pelo usuário"
  observeEvent({
    req(input$varas1)
    req(input$tribunal)
    # Desativado - req(input$tribunal_varas) 
    },
    {
      # Chamo de 'trt' a escolha do tribunal, logo após atribuo(if) um banco de dados ao objeto dados
      trt <- input$tribunal
      if(trt == "GERAL"){dados <- geral}
      if(trt == "TRT01-RJ"){dados <- trt1}
      if(trt == "TRT02-SP"){dados <- trt2}
      if(trt == "TRT03-MG"){dados <- trt3}
      if(trt == "TRT04-RS"){dados <- trt4}
      if(trt == "TRT05-BA"){dados <- trt5}
      if(trt == "TRT06-PE"){dados <- trt6}
      if(trt == "TRT07-CE"){dados <- trt7}
      if(trt == "TRT08-PA/AP"){dados <- trt8}
      if(trt == "TRT09-PR"){dados <- trt9}
      if(trt == "TRT10-DF/TO"){dados <- trt10}
      if(trt == "TRT11-AM/RR"){dados <- trt11}
      if(trt == "TRT12-SC"){dados <- trt12}
      if(trt == "TRT13-PB"){dados <- trt13}
      if(trt == "TRT14-RO/AC"){dados <- trt14}
      if(trt == "TRT15-Campinas"){dados <- trt15}
      if(trt == "TRT16-MA"){dados <- trt16}
      if(trt == "TRT17-ES"){dados <- trt17}
      if(trt == "TRT18-GO"){dados <- trt18}
      if(trt == "TRT19-AL"){dados <- trt19}
      if(trt == "TRT20-SE"){dados <- trt20}
      if(trt == "TRT21-RN"){dados <- trt21}
      if(trt == "TRT22-PI"){dados <- trt22}
      if(trt == "TRT23-MT"){dados <- trt23}
      if(trt == "TRT24-MS"){dados <- trt24}
      
 
      # colnames aparece muito nesse código. As vezes o r não grava ou atribui nomes diferentes as colunas de um data.frame
      # o códio é mais pela precaução
      colnames(dados) <- c("Vara do Trabalho","V01 - Idade Média do Pendente de Julgamento","V02 - Pendentes de Baixa na Fase de Conhecimento","V03 - Liquidações Pendentes","V04 - Pendentes de Baixa na Fase de Execução",
                           "V05 - Prazo na Fase de Conhecimento","V06 - Prazo na Fase de Liquidação","V07 - Prazo na Fase de Execução","V08 - Conciliações","V09 - Solucionados",
                           "V10 - Recebidos","V11 - Pendentes de Julgamento conclusos com prazo vencido","V12 - Total de Processos Conclusos aguardando prolação da sentença",
                           "V13 - Baixados na Fase de Conhecimento","V14 - Baixados na Fase de Execução","V15 - Servidores Ativos","V16 - Execuções Iniciadas","V17 - Execuções Encerradas")
      
      
      ## Desativado - updatePickerInput(session, "tribunal_varas", choices = dados$`Vara do Trabalho`)
      ## Desativado - varas_escolha <- input$tribunal_varas
      
      # Objeto 'vara' ira guardar a escolha do usuário quanto a vara escolhida para o TRT10
      vara <- input$varas1
      
      # Retiro de dados a vara escolhida, uma vez que, se considerarmos os dados gerais e os dados do TRT10, uma mesma vara apareceria 2 vezes.
      dados <- dados[!grepl(vara, dados$`Vara do Trabalho`),]
      
      # filtro para atualizar os valores V01, V02, ..., V17
      filtro <- trt10 %>%
        filter(str_detect(trt10$`Vara do Trabalho`,vara))
      
      updateNumericInput(session, "v01", value = round(filtro$`V01 - Idade Média do Pendente de Julgamento`[1],4), min = 0, step = 0.1)
      updateNumericInput(session, "v02", value = round(filtro$`V02 - Pendentes de Baixa na Fase de Conhecimento`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v03", value = round(filtro$`V03 - Liquidações Pendentes`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v04", value = round(filtro$`V04 - Pendentes de Baixa na Fase de Execução`[1],4), min = 0, step = 25)
      updateNumericInput(session, "v05", value = round(filtro$`V05 - Prazo na Fase de Conhecimento`[1],4), min = 0, step = 25)
      updateNumericInput(session, "v06", value = round(filtro$`V06 - Prazo na Fase de Liquidação`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v07", value = round(filtro$`V07 - Prazo na Fase de Execução`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v08", value = round(filtro$`V08 - Conciliações`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v09", value = round(filtro$`V09 - Solucionados`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v10", value = round(filtro$`V10 - Recebidos`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v11", value = round(filtro$`V11 - Pendentes de Julgamento conclusos com prazo vencido`[1],4), min = 0, step = 1)
      updateNumericInput(session, "v12", value = round(filtro$`V12 - Total de Processos Conclusos aguardando prolação da sentença`[1],4), min = 0, step = 1)
      updateNumericInput(session, "v13", value = round(filtro$`V13 - Baixados na Fase de Conhecimento`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v14", value = round(filtro$`V14 - Baixados na Fase de Execução`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v15", value = round(filtro$`V15 - Servidores Ativos`[1],4), min = 0, step = 1)
      updateNumericInput(session, "v16", value = round(filtro$`V16 - Execuções Iniciadas`[1],4), min = 0, step = 10)
      updateNumericInput(session, "v17", value = round(filtro$`V17 - Execuções Encerradas`[1],4), min = 0, step = 10)
      
      # CRiação do texto que guarda a informação do valor de cada variável para cada vara do trabalho (TRT10ª)
      # valor_xx <- 0 
      valor_01 <- 0
      valor_02 <- 0
      valor_03 <- 0
      valor_04 <- 0
      valor_05 <- 0
      valor_06 <- 0
      valor_07 <- 0
      valor_08 <- 0
      valor_09 <- 0
      valor_10 <- 0
      valor_11 <- 0
      valor_12 <- 0
      valor_13 <- 0
      valor_14 <- 0
      valor_15 <- 0
      valor_16 <- 0
      valor_17 <- 0
      
      # valores_iniciaisXX[x] -  Valores criados para preencher os "Botões"
      # 
      if(vara == "Araguaína  - 01a Vara"){
        valor_01 <- valores_iniciais1[1]
        valor_02 <- valores_iniciais2[1]
        valor_03 <- valores_iniciais3[1]
        valor_04 <- valores_iniciais4[1]
        valor_05 <- valores_iniciais5[1]
        valor_06 <- valores_iniciais6[1]
        valor_07 <- valores_iniciais7[1]
        valor_08 <- valores_iniciais8[1]
        valor_09 <- valores_iniciais9[1]
        valor_10 <- valores_iniciais10[1]
        valor_11 <- valores_iniciais11[1]
        valor_12 <- valores_iniciais12[1]
        valor_13 <- valores_iniciais13[1]
        valor_14 <- valores_iniciais14[1]
        valor_15 <- valores_iniciais15[1]
        valor_16 <- valores_iniciais16[1]
        valor_17 <- valores_iniciais17[1]}
      if(vara == "Araguaína  - 02a Vara"){
        valor_01 <- valores_iniciais1[2]
        valor_02 <- valores_iniciais2[2]
        valor_03 <- valores_iniciais3[2]
        valor_04 <- valores_iniciais4[2]
        valor_05 <- valores_iniciais5[2]
        valor_06 <- valores_iniciais6[2]
        valor_07 <- valores_iniciais7[2]
        valor_08 <- valores_iniciais8[2]
        valor_09 <- valores_iniciais9[2]
        valor_10 <- valores_iniciais10[2]
        valor_11 <- valores_iniciais11[2]
        valor_12 <- valores_iniciais12[2]
        valor_13 <- valores_iniciais13[2]
        valor_14 <- valores_iniciais14[2]
        valor_15 <- valores_iniciais15[2]
        valor_16 <- valores_iniciais16[2]
        valor_17 <- valores_iniciais17[2]}
      if(vara == "Brasília  - 01a Vara"){
        valor_01 <- valores_iniciais1[3]
        valor_02 <- valores_iniciais2[3]
        valor_03 <- valores_iniciais3[3]
        valor_04 <- valores_iniciais4[3]
        valor_05 <- valores_iniciais5[3]
        valor_06 <- valores_iniciais6[3]
        valor_07 <- valores_iniciais7[3]
        valor_08 <- valores_iniciais8[3]
        valor_09 <- valores_iniciais9[3]
        valor_10 <- valores_iniciais10[3]
        valor_11 <- valores_iniciais11[3]
        valor_12 <- valores_iniciais12[3]
        valor_13 <- valores_iniciais13[3]
        valor_14 <- valores_iniciais14[3]
        valor_15 <- valores_iniciais15[3]
        valor_16 <- valores_iniciais16[3]
        valor_17 <- valores_iniciais17[3]}
      if(vara == "Brasília  - 02a Vara"){
        valor_01 <- valores_iniciais1[4]
        valor_02 <- valores_iniciais2[4]
        valor_03 <- valores_iniciais3[4]
        valor_04 <- valores_iniciais4[4]
        valor_05 <- valores_iniciais5[4]
        valor_06 <- valores_iniciais6[4]
        valor_07 <- valores_iniciais7[4]
        valor_08 <- valores_iniciais8[4]
        valor_09 <- valores_iniciais9[4]
        valor_10 <- valores_iniciais10[4]
        valor_11 <- valores_iniciais11[4]
        valor_12 <- valores_iniciais12[4]
        valor_13 <- valores_iniciais13[4]
        valor_14 <- valores_iniciais14[4]
        valor_15 <- valores_iniciais15[4]
        valor_16 <- valores_iniciais16[4]
        valor_17 <- valores_iniciais17[4]}
      if(vara == "Brasília  - 03a Vara"){
        valor_01 <- valores_iniciais1[5]
        valor_02 <- valores_iniciais2[5]
        valor_03 <- valores_iniciais3[5]
        valor_04 <- valores_iniciais4[5]
        valor_05 <- valores_iniciais5[5]
        valor_06 <- valores_iniciais6[5]
        valor_07 <- valores_iniciais7[5]
        valor_08 <- valores_iniciais8[5]
        valor_09 <- valores_iniciais9[5]
        valor_10 <- valores_iniciais10[5]
        valor_11 <- valores_iniciais11[5]
        valor_12 <- valores_iniciais12[5]
        valor_13 <- valores_iniciais13[5]
        valor_14 <- valores_iniciais14[5]
        valor_15 <- valores_iniciais15[5]
        valor_16 <- valores_iniciais16[5]
        valor_17 <- valores_iniciais17[5]}
      if(vara == "Brasília  - 04a Vara"){
        valor_01 <- valores_iniciais1[6]
        valor_02 <- valores_iniciais2[6]
        valor_03 <- valores_iniciais3[6]
        valor_04 <- valores_iniciais4[6]
        valor_05 <- valores_iniciais5[6]
        valor_06 <- valores_iniciais6[6]
        valor_07 <- valores_iniciais7[6]
        valor_08 <- valores_iniciais8[6]
        valor_09 <- valores_iniciais9[6]
        valor_10 <- valores_iniciais10[6]
        valor_11 <- valores_iniciais11[6]
        valor_12 <- valores_iniciais12[6]
        valor_13 <- valores_iniciais13[6]
        valor_14 <- valores_iniciais14[6]
        valor_15 <- valores_iniciais15[6]
        valor_16 <- valores_iniciais16[6]
        valor_17 <- valores_iniciais17[6]}
      if(vara == "Brasília  - 05a Vara"){
        valor_01 <- valores_iniciais1[7]
        valor_02 <- valores_iniciais2[7]
        valor_03 <- valores_iniciais3[7]
        valor_04 <- valores_iniciais4[7]
        valor_05 <- valores_iniciais5[7]
        valor_06 <- valores_iniciais6[7]
        valor_07 <- valores_iniciais7[7]
        valor_08 <- valores_iniciais8[7]
        valor_09 <- valores_iniciais9[7]
        valor_10 <- valores_iniciais10[7]
        valor_11 <- valores_iniciais11[7]
        valor_12 <- valores_iniciais12[7]
        valor_13 <- valores_iniciais13[7]
        valor_14 <- valores_iniciais14[7]
        valor_15 <- valores_iniciais15[7]
        valor_16 <- valores_iniciais16[7]
        valor_17 <- valores_iniciais17[7]}
      if(vara == "Brasília  - 06a Vara"){
        valor_01 <- valores_iniciais1[8]
        valor_02 <- valores_iniciais2[8]
        valor_03 <- valores_iniciais3[8]
        valor_04 <- valores_iniciais4[8]
        valor_05 <- valores_iniciais5[8]
        valor_06 <- valores_iniciais6[8]
        valor_07 <- valores_iniciais7[8]
        valor_08 <- valores_iniciais8[8]
        valor_09 <- valores_iniciais9[8]
        valor_10 <- valores_iniciais10[8]
        valor_11 <- valores_iniciais11[8]
        valor_12 <- valores_iniciais12[8]
        valor_13 <- valores_iniciais13[8]
        valor_14 <- valores_iniciais14[8]
        valor_15 <- valores_iniciais15[8]
        valor_16 <- valores_iniciais16[8]
        valor_17 <- valores_iniciais17[8]}
      if(vara == "Brasília  - 07a Vara"){
        valor_01 <- valores_iniciais1[9]
        valor_02 <- valores_iniciais2[9]
        valor_03 <- valores_iniciais3[9]
        valor_04 <- valores_iniciais4[9]
        valor_05 <- valores_iniciais5[9]
        valor_06 <- valores_iniciais6[9]
        valor_07 <- valores_iniciais7[9]
        valor_08 <- valores_iniciais8[9]
        valor_09 <- valores_iniciais9[9]
        valor_10 <- valores_iniciais10[9]
        valor_11 <- valores_iniciais11[9]
        valor_12 <- valores_iniciais12[9]
        valor_13 <- valores_iniciais13[9]
        valor_14 <- valores_iniciais14[9]
        valor_15 <- valores_iniciais15[9]
        valor_16 <- valores_iniciais16[9]
        valor_17 <- valores_iniciais17[9]}
      if(vara == "Brasília  - 08a Vara"){
        valor_01 <- valores_iniciais1[10]
        valor_02 <- valores_iniciais2[10]
        valor_03 <- valores_iniciais3[10]
        valor_04 <- valores_iniciais4[10]
        valor_05 <- valores_iniciais5[10]
        valor_06 <- valores_iniciais6[10]
        valor_07 <- valores_iniciais7[10]
        valor_08 <- valores_iniciais8[10]
        valor_09 <- valores_iniciais9[10]
        valor_10 <- valores_iniciais10[10]
        valor_11 <- valores_iniciais11[10]
        valor_12 <- valores_iniciais12[10]
        valor_13 <- valores_iniciais13[10]
        valor_14 <- valores_iniciais14[10]
        valor_15 <- valores_iniciais15[10]
        valor_16 <- valores_iniciais16[10]
        valor_17 <- valores_iniciais17[10]}
      if(vara == "Brasília  - 09a Vara"){
        valor_01 <- valores_iniciais1[11]
        valor_02 <- valores_iniciais2[11]
        valor_03 <- valores_iniciais3[11]
        valor_04 <- valores_iniciais4[11]
        valor_05 <- valores_iniciais5[11]
        valor_06 <- valores_iniciais6[11]
        valor_07 <- valores_iniciais7[11]
        valor_08 <- valores_iniciais8[11]
        valor_09 <- valores_iniciais9[11]
        valor_10 <- valores_iniciais10[11]
        valor_11 <- valores_iniciais11[11]
        valor_12 <- valores_iniciais12[11]
        valor_13 <- valores_iniciais13[11]
        valor_14 <- valores_iniciais14[11]
        valor_15 <- valores_iniciais15[11]
        valor_16 <- valores_iniciais16[11]
        valor_17 <- valores_iniciais17[11]}
      if(vara == "Brasília  - 10a Vara"){
        valor_01 <- valores_iniciais1[12]
        valor_02 <- valores_iniciais2[12]
        valor_03 <- valores_iniciais3[12]
        valor_04 <- valores_iniciais4[12]
        valor_05 <- valores_iniciais5[12]
        valor_06 <- valores_iniciais6[12]
        valor_07 <- valores_iniciais7[12]
        valor_08 <- valores_iniciais8[12]
        valor_09 <- valores_iniciais9[12]
        valor_10 <- valores_iniciais10[12]
        valor_11 <- valores_iniciais11[12]
        valor_12 <- valores_iniciais12[12]
        valor_13 <- valores_iniciais13[12]
        valor_14 <- valores_iniciais14[12]
        valor_15 <- valores_iniciais15[12]
        valor_16 <- valores_iniciais16[12]
        valor_17 <- valores_iniciais17[12]}
      if(vara == "Brasília  - 11a Vara"){
        valor_01 <- valores_iniciais1[13]
        valor_02 <- valores_iniciais2[13]
        valor_03 <- valores_iniciais3[13]
        valor_04 <- valores_iniciais4[13]
        valor_05 <- valores_iniciais5[13]
        valor_06 <- valores_iniciais6[13]
        valor_07 <- valores_iniciais7[13]
        valor_08 <- valores_iniciais8[13]
        valor_09 <- valores_iniciais9[13]
        valor_10 <- valores_iniciais10[13]
        valor_11 <- valores_iniciais11[13]
        valor_12 <- valores_iniciais12[13]
        valor_13 <- valores_iniciais13[13]
        valor_14 <- valores_iniciais14[13]
        valor_15 <- valores_iniciais15[13]
        valor_16 <- valores_iniciais16[13]
        valor_17 <- valores_iniciais17[13]}
      if(vara == "Brasília  - 12a Vara"){
        valor_01 <- valores_iniciais1[14]
        valor_02 <- valores_iniciais2[14]
        valor_03 <- valores_iniciais3[14]
        valor_04 <- valores_iniciais4[14]
        valor_05 <- valores_iniciais5[14]
        valor_06 <- valores_iniciais6[14]
        valor_07 <- valores_iniciais7[14]
        valor_08 <- valores_iniciais8[14]
        valor_09 <- valores_iniciais9[14]
        valor_10 <- valores_iniciais10[14]
        valor_11 <- valores_iniciais11[14]
        valor_12 <- valores_iniciais12[14]
        valor_13 <- valores_iniciais13[14]
        valor_14 <- valores_iniciais14[14]
        valor_15 <- valores_iniciais15[14]
        valor_16 <- valores_iniciais16[14]
        valor_17 <- valores_iniciais17[14]}
      if(vara == "Brasília  - 13a Vara"){
        valor_01 <- valores_iniciais1[15]
        valor_02 <- valores_iniciais2[15]
        valor_03 <- valores_iniciais3[15]
        valor_04 <- valores_iniciais4[15]
        valor_05 <- valores_iniciais5[15]
        valor_06 <- valores_iniciais6[15]
        valor_07 <- valores_iniciais7[15]
        valor_08 <- valores_iniciais8[15]
        valor_09 <- valores_iniciais9[15]
        valor_10 <- valores_iniciais10[15]
        valor_11 <- valores_iniciais11[15]
        valor_12 <- valores_iniciais12[15]
        valor_13 <- valores_iniciais13[15]
        valor_14 <- valores_iniciais14[15]
        valor_15 <- valores_iniciais15[15]
        valor_16 <- valores_iniciais16[15]
        valor_17 <- valores_iniciais17[15]}
      if(vara == "Brasília  - 14a Vara"){
        valor_01 <- valores_iniciais1[16]
        valor_02 <- valores_iniciais2[16]
        valor_03 <- valores_iniciais3[16]
        valor_04 <- valores_iniciais4[16]
        valor_05 <- valores_iniciais5[16]
        valor_06 <- valores_iniciais6[16]
        valor_07 <- valores_iniciais7[16]
        valor_08 <- valores_iniciais8[16]
        valor_09 <- valores_iniciais9[16]
        valor_10 <- valores_iniciais10[16]
        valor_11 <- valores_iniciais11[16]
        valor_12 <- valores_iniciais12[16]
        valor_13 <- valores_iniciais13[16]
        valor_14 <- valores_iniciais14[16]
        valor_15 <- valores_iniciais15[16]
        valor_16 <- valores_iniciais16[16]
        valor_17 <- valores_iniciais17[16]}
      if(vara == "Brasília  - 15a Vara"){
        valor_01 <- valores_iniciais1[17]
        valor_02 <- valores_iniciais2[17]
        valor_03 <- valores_iniciais3[17]
        valor_04 <- valores_iniciais4[17]
        valor_05 <- valores_iniciais5[17]
        valor_06 <- valores_iniciais6[17]
        valor_07 <- valores_iniciais7[17]
        valor_08 <- valores_iniciais8[17]
        valor_09 <- valores_iniciais9[17]
        valor_10 <- valores_iniciais10[17]
        valor_11 <- valores_iniciais11[17]
        valor_12 <- valores_iniciais12[17]
        valor_13 <- valores_iniciais13[17]
        valor_14 <- valores_iniciais14[17]
        valor_15 <- valores_iniciais15[17]
        valor_16 <- valores_iniciais16[17]
        valor_17 <- valores_iniciais17[17]}
      if(vara == "Brasília  - 16a Vara"){
        valor_01 <- valores_iniciais1[18]
        valor_02 <- valores_iniciais2[18]
        valor_03 <- valores_iniciais3[18]
        valor_04 <- valores_iniciais4[18]
        valor_05 <- valores_iniciais5[18]
        valor_06 <- valores_iniciais6[18]
        valor_07 <- valores_iniciais7[18]
        valor_08 <- valores_iniciais8[18]
        valor_09 <- valores_iniciais9[18]
        valor_10 <- valores_iniciais10[18]
        valor_11 <- valores_iniciais11[18]
        valor_12 <- valores_iniciais12[18]
        valor_13 <- valores_iniciais13[18]
        valor_14 <- valores_iniciais14[18]
        valor_15 <- valores_iniciais15[18]
        valor_16 <- valores_iniciais16[18]
        valor_17 <- valores_iniciais17[18]}
      if(vara == "Brasília  - 17a Vara"){
        valor_01 <- valores_iniciais1[19]
        valor_02 <- valores_iniciais2[19]
        valor_03 <- valores_iniciais3[19]
        valor_04 <- valores_iniciais4[19]
        valor_05 <- valores_iniciais5[19]
        valor_06 <- valores_iniciais6[19]
        valor_07 <- valores_iniciais7[19]
        valor_08 <- valores_iniciais8[19]
        valor_09 <- valores_iniciais9[19]
        valor_10 <- valores_iniciais10[19]
        valor_11 <- valores_iniciais11[19]
        valor_12 <- valores_iniciais12[19]
        valor_13 <- valores_iniciais13[19]
        valor_14 <- valores_iniciais14[19]
        valor_15 <- valores_iniciais15[19]
        valor_16 <- valores_iniciais16[19]
        valor_17 <- valores_iniciais17[19]}
      if(vara == "Brasília  - 18a Vara"){
        valor_01 <- valores_iniciais1[20]
        valor_02 <- valores_iniciais2[20]
        valor_03 <- valores_iniciais3[20]
        valor_04 <- valores_iniciais4[20]
        valor_05 <- valores_iniciais5[20]
        valor_06 <- valores_iniciais6[20]
        valor_07 <- valores_iniciais7[20]
        valor_08 <- valores_iniciais8[20]
        valor_09 <- valores_iniciais9[20]
        valor_10 <- valores_iniciais10[20]
        valor_11 <- valores_iniciais11[20]
        valor_12 <- valores_iniciais12[20]
        valor_13 <- valores_iniciais13[20]
        valor_14 <- valores_iniciais14[20]
        valor_15 <- valores_iniciais15[20]
        valor_16 <- valores_iniciais16[20]
        valor_17 <- valores_iniciais17[20]}
      if(vara == "Brasília  - 19a Vara"){
        valor_01 <- valores_iniciais1[21]
        valor_02 <- valores_iniciais2[21]
        valor_03 <- valores_iniciais3[21]
        valor_04 <- valores_iniciais4[21]
        valor_05 <- valores_iniciais5[21]
        valor_06 <- valores_iniciais6[21]
        valor_07 <- valores_iniciais7[21]
        valor_08 <- valores_iniciais8[21]
        valor_09 <- valores_iniciais9[21]
        valor_10 <- valores_iniciais10[21]
        valor_11 <- valores_iniciais11[21]
        valor_12 <- valores_iniciais12[21]
        valor_13 <- valores_iniciais13[21]
        valor_14 <- valores_iniciais14[21]
        valor_15 <- valores_iniciais15[21]
        valor_16 <- valores_iniciais16[21]
        valor_17 <- valores_iniciais17[21]}
      if(vara == "Brasília  - 20a Vara"){
        valor_01 <- valores_iniciais1[22]
        valor_02 <- valores_iniciais2[22]
        valor_03 <- valores_iniciais3[22]
        valor_04 <- valores_iniciais4[22]
        valor_05 <- valores_iniciais5[22]
        valor_06 <- valores_iniciais6[22]
        valor_07 <- valores_iniciais7[22]
        valor_08 <- valores_iniciais8[22]
        valor_09 <- valores_iniciais9[22]
        valor_10 <- valores_iniciais10[22]
        valor_11 <- valores_iniciais11[22]
        valor_12 <- valores_iniciais12[22]
        valor_13 <- valores_iniciais13[22]
        valor_14 <- valores_iniciais14[22]
        valor_15 <- valores_iniciais15[22]
        valor_16 <- valores_iniciais16[22]
        valor_17 <- valores_iniciais17[22]}
      if(vara == "Brasília  - 21a Vara"){
        valor_01 <- valores_iniciais1[23]
        valor_02 <- valores_iniciais2[23]
        valor_03 <- valores_iniciais3[23]
        valor_04 <- valores_iniciais4[23]
        valor_05 <- valores_iniciais5[23]
        valor_06 <- valores_iniciais6[23]
        valor_07 <- valores_iniciais7[23]
        valor_08 <- valores_iniciais8[23]
        valor_09 <- valores_iniciais9[23]
        valor_10 <- valores_iniciais10[23]
        valor_11 <- valores_iniciais11[23]
        valor_12 <- valores_iniciais12[23]
        valor_13 <- valores_iniciais13[23]
        valor_14 <- valores_iniciais14[23]
        valor_15 <- valores_iniciais15[23]
        valor_16 <- valores_iniciais16[23]
        valor_17 <- valores_iniciais17[23]}
      if(vara == "Brasília  - 22a Vara"){
        valor_01 <- valores_iniciais1[24]
        valor_02 <- valores_iniciais2[24]
        valor_03 <- valores_iniciais3[24]
        valor_04 <- valores_iniciais4[24]
        valor_05 <- valores_iniciais5[24]
        valor_06 <- valores_iniciais6[24]
        valor_07 <- valores_iniciais7[24]
        valor_08 <- valores_iniciais8[24]
        valor_09 <- valores_iniciais9[24]
        valor_10 <- valores_iniciais10[24]
        valor_11 <- valores_iniciais11[24]
        valor_12 <- valores_iniciais12[24]
        valor_13 <- valores_iniciais13[24]
        valor_14 <- valores_iniciais14[24]
        valor_15 <- valores_iniciais15[24]
        valor_16 <- valores_iniciais16[24]
        valor_17 <- valores_iniciais17[24]}
      if(vara == "Dianópolis  - 01a Vara"){
        valor_01 <- valores_iniciais1[25]
        valor_02 <- valores_iniciais2[25]
        valor_03 <- valores_iniciais3[25]
        valor_04 <- valores_iniciais4[25]
        valor_05 <- valores_iniciais5[25]
        valor_06 <- valores_iniciais6[25]
        valor_07 <- valores_iniciais7[25]
        valor_08 <- valores_iniciais8[25]
        valor_09 <- valores_iniciais9[25]
        valor_10 <- valores_iniciais10[25]
        valor_11 <- valores_iniciais11[25]
        valor_12 <- valores_iniciais12[25]
        valor_13 <- valores_iniciais13[25]
        valor_14 <- valores_iniciais14[25]
        valor_15 <- valores_iniciais15[25]
        valor_16 <- valores_iniciais16[25]
        valor_17 <- valores_iniciais17[25]}
      if(vara == "Gama  - 01a Vara"){
        valor_01 <- valores_iniciais1[26]
        valor_02 <- valores_iniciais2[26]
        valor_03 <- valores_iniciais3[26]
        valor_04 <- valores_iniciais4[26]
        valor_05 <- valores_iniciais5[26]
        valor_06 <- valores_iniciais6[26]
        valor_07 <- valores_iniciais7[26]
        valor_08 <- valores_iniciais8[26]
        valor_09 <- valores_iniciais9[26]
        valor_10 <- valores_iniciais10[26]
        valor_11 <- valores_iniciais11[26]
        valor_12 <- valores_iniciais12[26]
        valor_13 <- valores_iniciais13[26]
        valor_14 <- valores_iniciais14[26]
        valor_15 <- valores_iniciais15[26]
        valor_16 <- valores_iniciais16[26]
        valor_17 <- valores_iniciais17[26]}
      if(vara == "Guaraí  - 01a Vara"){
        valor_01 <- valores_iniciais1[27]
        valor_02 <- valores_iniciais2[27]
        valor_03 <- valores_iniciais3[27]
        valor_04 <- valores_iniciais4[27]
        valor_05 <- valores_iniciais5[27]
        valor_06 <- valores_iniciais6[27]
        valor_07 <- valores_iniciais7[27]
        valor_08 <- valores_iniciais8[27]
        valor_09 <- valores_iniciais9[27]
        valor_10 <- valores_iniciais10[27]
        valor_11 <- valores_iniciais11[27]
        valor_12 <- valores_iniciais12[27]
        valor_13 <- valores_iniciais13[27]
        valor_14 <- valores_iniciais14[27]
        valor_15 <- valores_iniciais15[27]
        valor_16 <- valores_iniciais16[27]
        valor_17 <- valores_iniciais17[27]}
      if(vara == "Gurupi  - 01a Vara"){
        valor_01 <- valores_iniciais1[28]
        valor_02 <- valores_iniciais2[28]
        valor_03 <- valores_iniciais3[28]
        valor_04 <- valores_iniciais4[28]
        valor_05 <- valores_iniciais5[28]
        valor_06 <- valores_iniciais6[28]
        valor_07 <- valores_iniciais7[28]
        valor_08 <- valores_iniciais8[28]
        valor_09 <- valores_iniciais9[28]
        valor_10 <- valores_iniciais10[28]
        valor_11 <- valores_iniciais11[28]
        valor_12 <- valores_iniciais12[28]
        valor_13 <- valores_iniciais13[28]
        valor_14 <- valores_iniciais14[28]
        valor_15 <- valores_iniciais15[28]
        valor_16 <- valores_iniciais16[28]
        valor_17 <- valores_iniciais17[28]}
      if(vara == "Palmas  - 01a Vara"){
        valor_01 <- valores_iniciais1[29]
        valor_02 <- valores_iniciais2[29]
        valor_03 <- valores_iniciais3[29]
        valor_04 <- valores_iniciais4[29]
        valor_05 <- valores_iniciais5[29]
        valor_06 <- valores_iniciais6[29]
        valor_07 <- valores_iniciais7[29]
        valor_08 <- valores_iniciais8[29]
        valor_09 <- valores_iniciais9[29]
        valor_10 <- valores_iniciais10[29]
        valor_11 <- valores_iniciais11[29]
        valor_12 <- valores_iniciais12[29]
        valor_13 <- valores_iniciais13[29]
        valor_14 <- valores_iniciais14[29]
        valor_15 <- valores_iniciais15[29]
        valor_16 <- valores_iniciais16[29]
        valor_17 <- valores_iniciais17[29]}
      if(vara == "Palmas  - 02a Vara"){
        valor_01 <- valores_iniciais1[30]
        valor_02 <- valores_iniciais2[30]
        valor_03 <- valores_iniciais3[30]
        valor_04 <- valores_iniciais4[30]
        valor_05 <- valores_iniciais5[30]
        valor_06 <- valores_iniciais6[30]
        valor_07 <- valores_iniciais7[30]
        valor_08 <- valores_iniciais8[30]
        valor_09 <- valores_iniciais9[30]
        valor_10 <- valores_iniciais10[30]
        valor_11 <- valores_iniciais11[30]
        valor_12 <- valores_iniciais12[30]
        valor_13 <- valores_iniciais13[30]
        valor_14 <- valores_iniciais14[30]
        valor_15 <- valores_iniciais15[30]
        valor_16 <- valores_iniciais16[30]
        valor_17 <- valores_iniciais17[30]}
      if(vara == "Taguatinga  - 01a Vara"){
        valor_01 <- valores_iniciais1[31]
        valor_02 <- valores_iniciais2[31]
        valor_03 <- valores_iniciais3[31]
        valor_04 <- valores_iniciais4[31]
        valor_05 <- valores_iniciais5[31]
        valor_06 <- valores_iniciais6[31]
        valor_07 <- valores_iniciais7[31]
        valor_08 <- valores_iniciais8[31]
        valor_09 <- valores_iniciais9[31]
        valor_10 <- valores_iniciais10[31]
        valor_11 <- valores_iniciais11[31]
        valor_12 <- valores_iniciais12[31]
        valor_13 <- valores_iniciais13[31]
        valor_14 <- valores_iniciais14[31]
        valor_15 <- valores_iniciais15[31]
        valor_16 <- valores_iniciais16[31]
        valor_17 <- valores_iniciais17[31]}
      if(vara == "Taguatinga  - 02a Vara"){
        valor_01 <- valores_iniciais1[32]
        valor_02 <- valores_iniciais2[32]
        valor_03 <- valores_iniciais3[32]
        valor_04 <- valores_iniciais4[32]
        valor_05 <- valores_iniciais5[32]
        valor_06 <- valores_iniciais6[32]
        valor_07 <- valores_iniciais7[32]
        valor_08 <- valores_iniciais8[32]
        valor_09 <- valores_iniciais9[32]
        valor_10 <- valores_iniciais10[32]
        valor_11 <- valores_iniciais11[32]
        valor_12 <- valores_iniciais12[32]
        valor_13 <- valores_iniciais13[32]
        valor_14 <- valores_iniciais14[32]
        valor_15 <- valores_iniciais15[32]
        valor_16 <- valores_iniciais16[32]
        valor_17 <- valores_iniciais17[32]}
      if(vara == "Taguatinga  - 03a Vara"){
        valor_01 <- valores_iniciais1[33]
        valor_02 <- valores_iniciais2[33]
        valor_03 <- valores_iniciais3[33]
        valor_04 <- valores_iniciais4[33]
        valor_05 <- valores_iniciais5[33]
        valor_06 <- valores_iniciais6[33]
        valor_07 <- valores_iniciais7[33]
        valor_08 <- valores_iniciais8[33]
        valor_09 <- valores_iniciais9[33]
        valor_10 <- valores_iniciais10[33]
        valor_11 <- valores_iniciais11[33]
        valor_12 <- valores_iniciais12[33]
        valor_13 <- valores_iniciais13[33]
        valor_14 <- valores_iniciais14[33]
        valor_15 <- valores_iniciais15[33]
        valor_16 <- valores_iniciais16[33]
        valor_17 <- valores_iniciais17[33]}
      if(vara == "Taguatinga  - 04a Vara"){
        valor_01 <- valores_iniciais1[34]
        valor_02 <- valores_iniciais2[34]
        valor_03 <- valores_iniciais3[34]
        valor_04 <- valores_iniciais4[34]
        valor_05 <- valores_iniciais5[34]
        valor_06 <- valores_iniciais6[34]
        valor_07 <- valores_iniciais7[34]
        valor_08 <- valores_iniciais8[34]
        valor_09 <- valores_iniciais9[34]
        valor_10 <- valores_iniciais10[34]
        valor_11 <- valores_iniciais11[34]
        valor_12 <- valores_iniciais12[34]
        valor_13 <- valores_iniciais13[34]
        valor_14 <- valores_iniciais14[34]
        valor_15 <- valores_iniciais15[34]
        valor_16 <- valores_iniciais16[34]
        valor_17 <- valores_iniciais17[34]}
      if(vara == "Taguatinga  - 05a Vara"){
        valor_01 <- valores_iniciais1[35]
        valor_02 <- valores_iniciais2[35]
        valor_03 <- valores_iniciais3[35]
        valor_04 <- valores_iniciais4[35]
        valor_05 <- valores_iniciais5[35]
        valor_06 <- valores_iniciais6[35]
        valor_07 <- valores_iniciais7[35]
        valor_08 <- valores_iniciais8[35]
        valor_09 <- valores_iniciais9[35]
        valor_10 <- valores_iniciais10[35]
        valor_11 <- valores_iniciais11[35]
        valor_12 <- valores_iniciais12[35]
        valor_13 <- valores_iniciais13[35]
        valor_14 <- valores_iniciais14[35]
        valor_15 <- valores_iniciais15[35]
        valor_16 <- valores_iniciais16[35]
        valor_17 <- valores_iniciais17[35]}
      
      # Atualizar os textos de acordo com a vara escolhida pelo usuário
      updateTextInput(session, "texto_01", value = paste("Valor Inicial de V01 = ", valor_01))
      updateTextInput(session, "texto_02", value = paste("Valor Inicial de V02 = ", valor_02))
      updateTextInput(session, "texto_03", value = paste("Valor Inicial de V03 = ", valor_03))
      updateTextInput(session, "texto_04", value = paste("Valor Inicial de V04 = ", valor_04))
      updateTextInput(session, "texto_05", value = paste("Valor Inicial de V05 = ", valor_05))
      updateTextInput(session, "texto_06", value = paste("Valor Inicial de V06 = ", valor_06))
      updateTextInput(session, "texto_07", value = paste("Valor Inicial de V07 = ", valor_07))
      updateTextInput(session, "texto_08", value = paste("Valor Inicial de V08 = ", valor_08))
      updateTextInput(session, "texto_09", value = paste("Valor Inicial de V09 = ", valor_09))
      updateTextInput(session, "texto_10", value = paste("Valor Inicial de V10 = ", valor_10))
      updateTextInput(session, "texto_11", value = paste("Valor Inicial de V11 = ", valor_11))
      updateTextInput(session, "texto_12", value = paste("Valor Inicial de V12 = ", valor_12))
      updateTextInput(session, "texto_13", value = paste("Valor Inicial de V13 = ", valor_13))
      updateTextInput(session, "texto_14", value = paste("Valor Inicial de V14 = ", valor_14))
      updateTextInput(session, "texto_15", value = paste("Valor Inicial de V15 = ", valor_15))
      updateTextInput(session, "texto_16", value = paste("Valor Inicial de V16 = ", valor_16))
      updateTextInput(session, "texto_17", value = paste("Valor Inicial de V17 = ", valor_17))
de        = 
      ## Desativado - varascomp <- as.data.frame(input$tribunal_varas)
      ## Desativado - colnames(varascomp) <- "Vara de Trabalho"
      
      # Agora todos os inputs das variáveis são os objetos interativos
      observeEvent({
        req(input$v01)
        req(input$v02)
        req(input$v03)
        req(input$v04)
        req(input$v05)
        req(input$v06)
        req(input$v07)
        req(input$v08)
        req(input$v09)
        req(input$v10)
        req(input$v11)
        req(input$v12)
        req(input$v13)
        req(input$v14)
        req(input$v15)
        req(input$v16)
        req(input$v17)
      },{
        
        ## A escolha do usuário consiste em: Vara, v01, ..., v17
        escolha_user <- data.frame(rbind(c(vara,input$v01,input$v02,input$v03,input$v04,input$v05
                                           ,input$v06,input$v07,input$v08,input$v09,input$v10
                                           ,input$v11,input$v12,input$v13,input$v14,input$v15
                                           ,input$v16,input$v17)))
        
        colnames(escolha_user) <- c("Vara do Trabalho","V01 - Idade Média do Pendente de Julgamento","V02 - Pendentes de Baixa na Fase de Conhecimento","V03 - Liquidações Pendentes","V04 - Pendentes de Baixa na Fase de Execução",
                                    "V05 - Prazo na Fase de Conhecimento","V06 - Prazo na Fase de Liquidação","V07 - Prazo na Fase de Execução","V08 - Conciliações","V09 - Solucionados",
                                    "V10 - Recebidos","V11 - Pendentes de Julgamento conclusos com prazo vencido","V12 - Total de Processos Conclusos aguardando prolação da sentença",
                                    "V13 - Baixados na Fase de Conhecimento","V14 - Baixados na Fase de Execução","V15 - Servidores Ativos","V16 - Execuções Iniciadas","V17 - Execuções Encerradas")
        
        ## Apenas segurança, para transformar todas as variáveis em numéricas
        escolha_user[, 2:18] <- sapply(escolha_user[, 2:18], as.numeric)
        dados <- rbind(escolha_user,dados)
        dados[,2:18] <- sapply(dados[,2:18],as.numeric) # Talvez seja redundante.
        
        ## Número de linhas em dados, necessário para calcular os valores parametrizados a partir do boxplot
        n <- nrow(dados)
        
        ## Calculo dos indicadores
        I01 <- dados$`V01 - Idade Média do Pendente de Julgamento`
        I01[is.na(I01)] <- 0
        I02 <- 
          dados$`V02 - Pendentes de Baixa na Fase de Conhecimento` +
          dados$`V03 - Liquidações Pendentes`+
          dados$`V04 - Pendentes de Baixa na Fase de Execução`
        I02[is.na(I02)] <- 0
        I03 <- 
          (dados$`V11 - Pendentes de Julgamento conclusos com prazo vencido`/
             dados$`V12 - Total de Processos Conclusos aguardando prolação da sentença`)*100
        I03[is.na(I03)] <- 0
        I04 <- dados$`V05 - Prazo na Fase de Conhecimento`
        I04[is.na(I04)] <- 0
        I05 <- dados$`V06 - Prazo na Fase de Liquidação`
        I05[is.na(I05)] <- 0
        I06 <- dados$`V07 - Prazo na Fase de Execução`
        I06[is.na(I06)] <- 0
        I07 <- (dados$`V08 - Conciliações`/
                  dados$`V09 - Solucionados`)*100
        I07[is.na(I07)] <- 0
        I08 <- (dados$`V09 - Solucionados`/
                  dados$`V10 - Recebidos`)*100
        I08[is.na(I08)] <- 0
        I09 <- 100*(dados$`V02 - Pendentes de Baixa na Fase de Conhecimento`/
                      (dados$`V13 - Baixados na Fase de Conhecimento`+dados$`V02 - Pendentes de Baixa na Fase de Conhecimento`))
        I09[is.na(I09)] <- 0
        I10 <- 100*(dados$`V04 - Pendentes de Baixa na Fase de Execução`/
                      (dados$`V14 - Baixados na Fase de Execução`+dados$`V04 - Pendentes de Baixa na Fase de Execução`))
        I10[is.na(I10)] <- 0
        I11 <- (dados$`V13 - Baixados na Fase de Conhecimento`+dados$`V14 - Baixados na Fase de Execução`)/
          dados$`V15 - Servidores Ativos`
        I11[is.na(I11)] <- 0
        I12 <- (dados$`V02 - Pendentes de Baixa na Fase de Conhecimento`+dados$`V04 - Pendentes de Baixa na Fase de Execução`)/
          dados$`V15 - Servidores Ativos`
        I12[is.na(I12)] <- 0
        I13 <- (dados$`V17 - Execuções Encerradas`/
                  dados$`V16 - Execuções Iniciadas`)*100
        I13[is.na(I13)] <- 0
        
        ## Limites de cada indicador
        LI01 <- as.numeric(quantile(I01, probs = .25) - 1.5*(IQR(I01)))
        if(LI01 < 0){LI01 = 0}
        LS01 <- as.numeric(quantile(I01, probs = .75) + 1.5*(IQR(I01)))
        
        LI02 <- as.numeric(quantile(I02, probs = .25) - 1.5*(IQR(I02)))
        if(LI02 < 0){LI02 = 0}
        LS02 <- as.numeric(quantile(I02, probs = .75) + 1.5*(IQR(I02)))
        
        LI03 <- as.numeric(quantile(I03, probs = .25) - 1.5*(IQR(I03)))
        if(LI03 < 0){LI03 = 0}
        LS03 <- as.numeric(quantile(I03, probs = .75) + 1.5*(IQR(I03)))
        
        LI04 <- as.numeric(quantile(I04, probs = .25) - 1.5*(IQR(I04)))
        if(LI04 < 0){LI04 = 0}
        LS04 <- as.numeric(quantile(I04, probs = .75) + 1.5*(IQR(I04)))
        
        LI05 <- as.numeric(quantile(I05, probs = .25) - 1.5*(IQR(I05)))
        if(LI05 < 0){LI05 = 0}
        LS05 <- as.numeric(quantile(I05, probs = .75) + 1.5*(IQR(I05)))
        
        LI06 <- as.numeric(quantile(I06, probs = .25) - 1.5*(IQR(I06)))
        if(LI06 < 0){LI06 = 0}
        LS06 <- as.numeric(quantile(I06, probs = .75) + 1.5*(IQR(I06)))
        
        LI07 <- as.numeric(quantile(I07, probs = .25) - 1.5*(IQR(I07)))
        if(LI07 < 0){LI07 = 0}
        LS07 <- as.numeric(quantile(I07, probs = .75) + 1.5*(IQR(I07)))
        
        LI08 <- as.numeric(quantile(I08, probs = .25) - 1.5*(IQR(I08)))
        if(LI08 < 0){LI08 = 0}
        LS08 <- as.numeric(quantile(I08, probs = .75) + 1.5*(IQR(I08)))
        
        LI09 <- as.numeric(quantile(I09, probs = .25) - 1.5*(IQR(I09)))
        if(LI09 < 0){LI09 = 0}
        LS09 <- as.numeric(quantile(I09, probs = .75) + 1.5*(IQR(I09)))
        
        LI10 <- as.numeric(quantile(I10, probs = .25) - 1.5*(IQR(I10)))
        if(LI10 < 0){LI10 = 0}
        LS10 <- as.numeric(quantile(I10, probs = .75) + 1.5*(IQR(I10)))
        
        LI11 <- as.numeric(quantile(I11, probs = .25) - 1.5*(IQR(I11)))
        if(LI11 < 0){LI11 = 0}
        LS11 <- as.numeric(quantile(I11, probs = .75) + 1.5*(IQR(I11)))
        
        LI12 <- as.numeric(quantile(I12, probs = .25) - 1.5*(IQR(I12)))
        if(LI12 < 0){LI12 = 0}
        LS12 <- as.numeric(quantile(I12, probs = .75) + 1.5*(IQR(I12)))
        
        LI13 <- as.numeric(quantile(I13, probs = .25) - 1.5*(IQR(I13)))
        if(LI13 < 0){LI13 = 0}
        LS13 <- as.numeric(quantile(I13, probs = .75) + 1.5*(IQR(I13)))
        
        meso_bruto <- data.frame(dados$`Vara do Trabalho`,I01,I02,I03,I04,I05,I06,I07,
                                 I08,I09,I10,I11,I12,I13)
        colnames(meso_bruto) <- c("Vara do Trabalho", "I01","I02","I03","I04","I05","I06",
                                      "I07","I08","I09","I10","I11","I12","I13")
        
        linha_1_vb <- meso_bruto[1,]
        restante_vb <- meso_bruto[-1,]
        linha_1_vb <- linha_1_vb %>% mutate_if(is.numeric, round, digits = 4)
        restante_vb <- restante_vb %>% mutate_if(is.numeric, round, digits = 4)
        
        output$indicadores_brutos0 <- DT::renderDataTable(
          DT::datatable({                     
            linha_1_vb
          },options = list(dom = 't', pageLength=1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Vara selecionada", "I01","I02","I03","I04","I05","I06",
                       "I07","I08","I09","I10","I11","I12","I13")))
        
        output$indicadores_brutos1 <- DT::renderDataTable(
          DT::datatable({                     
            restante_vb 
          },options = list(pageLength=n-1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          filter = "top",
          selection = "multiple",
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Demais varas", "I01","I02","I03","I04","I05","I06",
                       "I07","I08","I09","I10","I11","I12","I13")))
        
        
        ## Data.frame vazio, nele serão colocados, para cada  vara em dados, o respectivo
        ## valor do indicador parametrizado.
        meso_calculado <- data.frame(matrix(NA,nrow = n, ncol = 14, byrow = F))
        meso_calculado[,1] <- dados$`Vara do Trabalho`
        
        ## I01
        for(i in 1:n){
          if(I01[i] < LI01){meso_calculado[i,2] <- 0}
          if(I01[i] > LS01){meso_calculado[i,2] <- 1}
          if(I01[i] >= LI01 & I01[i] <= LS01){meso_calculado[i,2] <- (I01[i]-LI01)/(LS01-LI01)}
        }
        ## I02
        for(i in 1:n){
          if(I02[i] < LI02){meso_calculado[i,3] <- 0}
          if(I02[i] > LS02){meso_calculado[i,3] <- 1}
          if(I02[i] >= LI02 & I02[i] <= LS02){meso_calculado[i,3] <- (I02[i]-LI02)/(LS02-LI02)} 
        }
        ## I03
        for(i in 1:n){
          if(I03[i] < LI03){meso_calculado[i,4] <- 0}
          if(I03[i] > LS03){meso_calculado[i,4] <- 1}
          if(I03[i] >= LI03 & I03[i] <= LS03){meso_calculado[i,4] <- (I03[i]-LI03)/(LS03-LI03)}
        }
        ## I04
        for(i in 1:n){
          if(I04[i] < LI04){meso_calculado[i,5] <- 0}
          if(I04[i] > LS04){meso_calculado[i,5] <- 1}
          if(I04[i] >= LI04 & I04[i] <= LS04){meso_calculado[i,5] <- (I04[i]-LI04)/(LS04-LI04)}
        }
        ## I05
        for(i in 1:n){
          if(I05[i] < LI05){meso_calculado[i,6] <- 0}
          if(I05[i] > LS05){meso_calculado[i,6] <- 1}
          if(I05[i] >= LI05 & I05[i] <= LS05){meso_calculado[i,6] <- (I05[i]-LI05)/(LS05-LI05)}
        }
        ## I06
        for(i in 1:n){
          if(I06[i] < LI06){meso_calculado[i,7] <- 0}
          if(I06[i] > LS06){meso_calculado[i,7] <- 1}
          if(I06[i] >= LI06 & I06[i] <= LS06){meso_calculado[i,7] <- (I06[i]-LI06)/(LS06-LI06)}
        }
        ## I07
        for(i in 1:n){
          if(I07[i] < LI07){meso_calculado[i,8] <- 1}
          if(I07[i] > LS07){meso_calculado[i,8] <- 0}
          if(I07[i] >= LI07 & I07[i] <= LS07){meso_calculado[i,8] <- 1-(I07[i]-LI07)/(LS07-LI07)}
        }
        ## I08
        for(i in 1:n){
          if(I08[i] < LI08){meso_calculado[i,9] <- 1}
          if(I08[i] > LS08){meso_calculado[i,9] <- 0}
          if(I08[i] >= LI08 & I08[i] <= LS08){meso_calculado[i,9] <- 1-(I08[i]-LI08)/(LS08-LI08)}
        }
        ## I13
        for(i in 1:n){
          if(I13[i] < LI13){meso_calculado[i,14] <- 1}
          if(I13[i] > LS13){meso_calculado[i,14] <- 0}
          if(I13[i] >= LI13 & I13[i] <= LS13){meso_calculado[i,14] <- 1-(I13[i]-LI13)/(LS13-LI13)}
        }
        ## I09
        for(i in 1:n){
          if(I09[i] < LI09){meso_calculado[i,10] <- 0}
          if(I09[i] > LS09){meso_calculado[i,10] <- 1}
          if(I09[i] >= LI09 & I09[i] <= LS09){meso_calculado[i,10] <- (I09[i]-LI09)/(LS09-LI09)}
        }
        ## I10
        for(i in 1:n){
          if(I10[i] < LI10){meso_calculado[i,11] <- 0}
          if(I10[i] > LS10){meso_calculado[i,11] <- 1}
          if(I10[i] >= LI10 & I10[i] <= LS10){meso_calculado[i,11] <- (I10[i]-LI10)/(LS10-LI10)}
        }
        ## I11
        for(i in 1:n){
          if(I11[i] < LI11){meso_calculado[i,12] <- 1}
          if(I11[i] > LS11){meso_calculado[i,12] <- 0}
          if(I11[i] >= LI11 & I11[i] <= LS11){meso_calculado[i,12] <- 1-(I11[i]-LI11)/(LS11-LI11)}
        }
        ## I12
        for(i in 1:n){
          if(I12[i] < LI12){meso_calculado[i,13] <- 0}
          if(I12[i] > LS12){meso_calculado[i,13] <- 1}
          if(I12[i] >= LI12 & I12[i] <= LS12){meso_calculado[i,13] <- (I12[i]-LI12)/(LS12-LI12)}
        }
        
        ### ATENÇÃO, é neceário retirar os NA's do dataframe.
        ### alguns indicadores tiveram o mesmo valor para limite inferior e superior
        meso_calculado <- meso_calculado %>% replace(is.na(.), 0)
        
        colnames(meso_calculado) <- c("Vara do Trabalho", "I01","I02","I03","I04","I05","I06",
                                      "I07","I08","I09","I10","I11","I12","I13")
        
        linha_1_valorbruto <- meso_calculado[1,]
        restante_valorbruto <- meso_calculado[-1,]
        linha_1_valorbruto <- linha_1_valorbruto %>% mutate_if(is.numeric, round, digits = 4)
        restante_valorbruto <- restante_valorbruto %>% mutate_if(is.numeric, round, digits = 4)
        
        output$indicadores_parametrizados0 <- DT::renderDataTable(
          DT::datatable({                     
            linha_1_valorbruto
          },options = list(dom = 't', pageLength=1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Vara selecionada", "I01","I02","I03","I04","I05","I06",
                       "I07","I08","I09","I10","I11","I12","I13")))
        
        output$indicadores_parametrizados1 <- DT::renderDataTable(
          DT::datatable({                     
            restante_valorbruto
          },options = list(pageLength=n-1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          filter = "top",
          selection = "multiple",
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Demais varas", "I01","I02","I03","I04","I05","I06",
                       "I07","I08","I09","I10","I11","I12","I13")))
        
        ## Dataframe vazio para armazenar, para cada vara, o mesoindicador calculado
        ranking_igest <- data.frame(matrix(NA,nrow = n, ncol = 7, byrow = F))
        ranking_igest[,1] <- dados$`Vara do Trabalho` # nomeando a coluna 1 com as varas selecionadas
        
        ## Calculo dos mesoindicadores por valor
        ranking_igest[,2] <- 0.3*meso_calculado$I01+0.4*meso_calculado$I02+0.3*meso_calculado$I03
        ranking_igest[,3] <- 0.6*meso_calculado$I04+0.1*meso_calculado$I05+0.3*meso_calculado$I06
        ranking_igest[,4] <- 0.3*meso_calculado$I07+0.4*meso_calculado$I08+0.3*meso_calculado$I13
        ranking_igest[,5] <- 0.5*meso_calculado$I09+0.5*meso_calculado$I10
        ranking_igest[,6] <- 0.5*meso_calculado$I11+0.5*meso_calculado$I12
        ranking_igest[,7] <- 0.2*ranking_igest[,2]+0.2*ranking_igest[,3]+0.2*ranking_igest[,4]+
          0.2*ranking_igest[,5]+0.2*ranking_igest[,6]
        
        ranking_igest <- ranking_igest %>%
          mutate_if(is.numeric, round, digits = 4)
        
        colnames(ranking_igest) <- c("Vara do Trabalho", "Acervo","Celeridade","Produtividade","Tx Congestionamento","Força de trabalho","IGEST")
        
        ######DESATIVADO#########
        #linha_1 <- ranking_igest[1,]
        #data <- ranking_igest %>%
        #  filter(str_detect(ranking_igest$`Vara do Trabalho`, str_c(input$tribunal_varas, collapse = "|")))
        #colnames(linha_1) <- c("Vara do Trabalho", "Acervo","Celeridade","Produtividade","Tx Congestionamento","Força de trabalho","IGEST")
        #colnames(data) <- c("Vara do Trabalho", "Acervo","Celeridade","Produtividade","Tx Congestionamento","Força de trabalho","IGEST")
        
        #ranking_igest <- rbind(linha_1, data)
        #colnames(ranking_igest) <- c("Vara do Trabalho", "Acervo","Celeridade","Produtividade","Tx Congestionamento","Força de trabalho","IGEST")
        ######DESATIVADO#########
        
        ## Mesoindicadores por posição
        ranking <- data.frame(ranking_igest$`Vara do Trabalho`, rank(ranking_igest$`Acervo`, ties.method = "first"), rank(ranking_igest$`Celeridade`, ties.method = "first"), 
                              rank(ranking_igest$`Produtividade`, ties.method = "first"), rank(ranking_igest$`Tx Congestionamento`, ties.method = "first"), 
                              rank(ranking_igest$`Força de trabalho`, ties.method = "first"), rank(ranking_igest$`IGEST`, ties.method = "first"))
        
        colnames(ranking) <- c("Vara do Trabalho", "Acervo","Celeridade","Produtividade","Tx Congestionamento","Força de trabalho","IGEST")
        
        
        
        ## Separando a vara do filtro TRT10 com o restante do banco de dados
        ## Para termos sempre em destaque a vara selecioanda.
        linha_1_valor <- ranking_igest[1,]
        ranking_igest <- ranking_igest[-1,]
        linha_1_pos <- ranking[1,]
        ranking <- ranking[-1,]
        
        ##
        ranking_igest <- ranking_igest[order(ranking_igest$`IGEST`),]
        ranking <- ranking[order(ranking$`IGEST`),]
        
        
        output$valor01_fixo <- DT::renderDataTable(
          DT::datatable({                     
            linha_1_valor
          },options = list(dom = 't', pageLength=1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Vara selecionada", "Acervo","Celeridade","Produtividade","Tx de Congestionamento","Força de trabalho","IGEST")))
          
        output$valor01 <- DT::renderDataTable(
          DT::datatable({                     
            ranking_igest
          },options = list(pageLength=n-1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          filter = "top",
          selection = "multiple",
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Demais varas", "Acervo","Celeridade","Produtividade","Tx de Congestionamento","Força de trabalho","IGEST")))
        
        output$valor02_fixo <- DT::renderDataTable(
          DT::datatable({                     
            linha_1_pos
          },options = list(dom = 't', pageLength=1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Vara selecionada", "Acervo","Celeridade","Produtividade","Tx de Congestionamento","Força de trabalho","IGEST")))
       
        output$valor02 <- DT::renderDataTable(
          DT::datatable({                     
            ranking
          },options = list(pageLength=n-1,
                           initComplete = JS(
                             "function(settings, json) {",
                             "$(this.api().table().header()).css({'background-color': '#bed9f2', 'color': '#1c1b1b'});",
                             "}"),
                           columnDefs=list(list(className='dt-center',targets="_all"))),
          filter = "top",
          selection = "multiple",
          style = "bootstrap",
          class = "cell-border stripe",
          rownames = FALSE,
          colnames = c("Demais varas", "Acervo","Celeridade","Produtividade","Tx de Congestionamento","Força de trabalho","IGEST")))
     
     })
    })
})

if(interactive()){
  shinyApp(ui = ui, server = server)  
}

