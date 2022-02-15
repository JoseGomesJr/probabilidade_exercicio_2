library(readxl)
library(Hmisc)
library(dplyr)
planilha <- read_excel("ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx")
dados <- as.data.frame(planilha)

municipios <- unique(dados$NO_MUNICIPIO_PROVA)



# ------------- AGRESTE ----------------------------


dados_palmeira <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[9])

media_Palmeira <- mean(dados_palmeira$NOTA_ENEN)


dados_arapiraca <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[10])

media_Arapiraca <- mean(dados_arapiraca$NOTA_ENEN)


dados_traipu <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[11])

media_Traipu <- mean(dados_traipu$NOTA_ENEN)


dados_igaci <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[13])

media_Igaci <- mean(dados_igaci$NOTA_ENEN)


dados_girau <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[25])

media_Girau <- mean(dados_girau$NOTA_ENEN)

agreste <- c(media_Palmeira, media_Arapiraca, media_Traipu, media_Igaci, media_Girau)

muni_agrste <- c(municipios[9], municipios[10], municipios[11], municipios[13], municipios[25])

dados_agreste <- data.frame(Nome = muni_agrste, Media = agreste, Região = "Agreste")

# ----------------------- SERTÃO --------------------------


dados_aguaBranca <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[12])

media_AguaBranca <- mean(dados_aguaBranca$NOTA_ENEN)



dados_batalha <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[14])

media_Batalha <- mean(dados_batalha$NOTA_ENEN)


dados_delmiroGouveia <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[20])

media_DelmiroGouveia <- mean(dados_delmiroGouveia$NOTA_ENEN)


dados_SaoJosetapera <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[4])

media_SaoJosetapera <- mean(dados_SaoJosetapera$NOTA_ENEN)


dados_santana <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[7])

media_Santana <- mean(dados_santana$NOTA_ENEN)


dados_olhoDagua <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[16])

media_OlhoDagua <- mean(dados_olhoDagua$NOTA_ENEN)

sertao <- c(media_AguaBranca, media_Batalha, media_DelmiroGouveia, media_SaoJosetapera, media_Santana, media_OlhoDagua)

muni_sertao <- c(municipios[12], municipios[14], municipios[20], municipios[4], municipios[7], municipios[16])



dados_sertao <- data.frame(Nome = muni_sertao, Media = sertao, Região = "Sertão")
# ----------------------- LESTE -----------------------


dados_rioLargo <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[1])

media_RioLargo <- mean(dados_rioLargo$NOTA_ENEN)


dados_maceio <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[2])

media_Maceio <- mean(dados_maceio$NOTA_ENEN)


dados_porto <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[3])

media_Porto <- mean(dados_porto$NOTA_ENEN)


dados_saoMiguel <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[5])

media_SaoMiguel <- mean(dados_saoMiguel$NOTA_ENEN)


dados_vilela <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[6])

media_Vilela <- mean(dados_vilela$NOTA_ENEN)


dados_campoAlegre <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[7])

media_CampoAlegre <- mean(dados_campoAlegre$NOTA_ENEN)


dados_vicosa <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[15])

media_Vicosa <- mean(dados_vicosa$NOTA_ENEN)


dados_saoLuis <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[17])

media_SaoLuis <- mean(dados_saoLuis$NOTA_ENEN)


dados_uniao <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[18])

media_Uniao <- mean(dados_uniao$NOTA_ENEN)


dados_atalaia <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[19])

media_Atalaia <- mean(dados_atalaia$NOTA_ENEN)


dados_penedo <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[21])

media_Penedo <- mean(dados_penedo$NOTA_ENEN)


dados_pilar <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[22])

media_Pilar <- mean(dados_pilar$NOTA_ENEN)


dados_boca <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[23])

media_Boca <- mean(dados_boca$NOTA_ENEN)


dados_marechal <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[24])

media_Marechal <- mean(dados_marechal$NOTA_ENEN)


dados_coruripe <- subset(dados, dados$NO_MUNICIPIO_PROVA == municipios[26])

media_Coruripe <- mean(dados_coruripe$NOTA_ENEN)



leste <- c(media_RioLargo, media_Maceio, media_Porto, media_SaoMiguel, media_Vilela, media_CampoAlegre, media_Vicosa, media_SaoLuis, media_Uniao, media_Atalaia, media_Penedo, media_Pilar, media_Boca, media_Marechal, media_Coruripe)


muni_leste <- c(municipios[1], municipios[2], municipios[3], municipios[5], municipios[6], municipios[7], municipios[15], municipios[17], municipios[18], municipios[19], municipios[21], municipios[22], municipios[23], municipios[24], municipios[26])


dados_leste <- data.frame(Nome = muni_leste, Media = leste, Região = "Leste")

Media_Reg <- bind_rows(dados_agreste, dados_sertao, dados_leste)

shapiro.test(Media_Reg$Media)

media_anova <- aov(Media_Reg$Media ~ factor(Media_Reg$Região))
anova(media_anova)

TukeyHSD(media_anova)
