library(readxl)

planilha <- read_excel("Documentos/probabilidade_exercicio_2/ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx")

dados <- as.data.frame(planilha)

dadoscolegio <- subset(dados, CO_ESCOLA == "27047970")

dadoscolegio_homens <- subset(dadoscolegio, TP_SEXO == "Masculino")

dadoscolegio_mulheres <- subset(dadoscolegio, TP_SEXO == "Feminino")

boxplot(dadoscolegio_homens$NU_NOTA_CN, dadoscolegio_mulheres$NU_NOTA_CN, main = "Compara entre as notas de Ciencias Naturais",
        at = c(1,2),
        names = c("Masculino", "Feminino"),
        las = 2,
        col = c("blue","pink"),
        border = "brown")
boxplot(dadoscolegio_homens$NU_NOTA_CH, dadoscolegio_mulheres$NU_NOTA_CH,main = "Compara entre as notas de Ciencias Humanas",
        at = c(1,2),
        names = c("Masculino", "Feminino"),
        las = 2,
        col = c("blue","pink"),
        border = "brown")
boxplot(dadoscolegio_homens$NU_NOTA_MT, dadoscolegio_mulheres$NU_NOTA_MT,main = "Compara entre as notas de Matematica",
       at = c(1,2),
        names = c("Masculino", "Feminino"),
        las = 2,
        col = c("blue","pink"),
        border = "brown")
