library(readxl)
planilha <- read_excel("c:\\Users\\josej\\OneDrive\\Documentos\\GitHub\\probabilidade_exercicio_2\\ENEM_AL_EXCEL_AJUS_OKSNZ.xlsx", sheet=1, col_names=TRUE)
dados <- as.data.frame(planilha)
nota <- dados$NOTA_ENEN

t.test(nota, conf=0.95)

t.test(nota, conf=0.99)
