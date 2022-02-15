library(readxl)
library(Hmisc)
planilha <- read_excel("c:\\Users\\josej\\OneDrive\\Documentos\\GitHub\\probabilidade_exercicio_2\\ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx", sheet=1, col_names=TRUE)
dados <- as.data.frame(planilha)
nota <- dados$NOTA_ENEN

notas_media <- mean(nota)

