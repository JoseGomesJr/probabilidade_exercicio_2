library(readxl)

planilha <- read_excel("ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx")

dados <- as.data.frame(planilha)

dadoscolegio <- subset(dados, CO_ESCOLA == "27047970")

shapiro.test(sqrt(dadoscolegio$NU_NOTA_LC))
shapiro.test(sqrt(dadoscolegio$NU_NOTA_REDACAO))