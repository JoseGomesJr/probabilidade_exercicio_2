library(readxl)

planilha <- read_excel("ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx")

dados <- as.data.frame(planilha)

dadoscolegio <- subset(dados, CO_ESCOLA == "27047970")

shapiro.test(dadoscolegio$NU_NOTA_CN)
shapiro.test(dadoscolegio$NU_NOTA_CH)
shapiro.test(dadoscolegio$NU_NOTA_LC)
shapiro.test(dadoscolegio$NU_NOTA_MT)
shapiro.test(dadoscolegio$NU_NOTA_REDACAO)
