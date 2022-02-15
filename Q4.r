library(readxl)
library(corrplot)

planilha <- read_excel("ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx")

dados <- as.data.frame(planilha)

notas_medias <- as.data.frame(aggregate(cbind(
    dados$NU_NOTA_CN, dados$NU_NOTA_CH,
    dados$NU_NOTA_LC, dados$NU_NOTA_MT, dados$NU_NOTA_REDACAO
),
list(dados$NO_MUNICIPIO_PROVA),
FUN = mean
))

rownames(notas_medias) <- notas_medias[, 1]
notas_medias <- notas_medias[, -1]

colnames(notas_medias) <- c("CN", "CH", "LC", "MT", "RED")

matriz_corr <- cor(notas_medias)

regressao <- lm(
    formula = notas_medias$LC ~ notas_medias$CN,
    data = notas_medias
)

print(notas_medias)

summary(notas_medias)

print(matriz_corr)

corrplot(matriz_corr, method = "pie")

summary(regressao)


plot(notas_medias$LC ~ notas_medias$CN,
    data = notas_medias,
    main = "Correlacao - Linguagens e Codigos e Ciencias da Natureza"
)
abline(regressao)
