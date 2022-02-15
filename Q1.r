library(readxl)
planilha <- read_excel("ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx", col_names = TRUE)
dados <- as.data.frame(planilha)
nota <- dados$NOTA_ENEN

t.test(nota, conf = 0.95)

t.test(nota, conf = 0.99)
