library(readxl)

planilha <- read_excel("Documentos/probabilidade_exercicio_2/ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx")

dados <- as.data.frame(planilha)

dadoscolegio <- subset(dados, CO_ESCOLA == "27047970")

dadoscolegio_homens <- subset(dadoscolegio, TP_SEXO == "Masculino")

dadoscolegio_mulheres <- subset(dadoscolegio, TP_SEXO == "Feminino")

t.test(dadoscolegio_homens$NU_NOTA_CN, dadoscolegio_mulheres$NU_NOTA_CN)
t.test(dadoscolegio_homens$NU_NOTA_CH, dadoscolegio_mulheres$NU_NOTA_CH)
t.test(dadoscolegio_homens$NU_NOTA_MT, dadoscolegio_mulheres$NU_NOTA_MT)

