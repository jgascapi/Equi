## preparar_datos
##
## Carga un archivo xlxs en el formato generado por preparar_formato()
##

`preparar_datos` <-
    function(datos)
{
message(paste("Estoy buscando el archivo de entrada en",getwd()))
Sys.sleep(1)
##Cargar el archivo
Data<<-suppressWarnings(xlsx::read.xlsx(datos,sheetIndex=1))
if(!exists("Data")){
print("Error, no encuentro el archivo, revisa el nombre o ubicación")}
Sys.sleep(1)
##Recorrer las celdas vacías
message("Procesando los datos")
pb <- txtProgressBar(min = 1, max = 100, style = 3)
for(i in 1:500){
        # Sleep for 0.1 seconds
        Sys.sleep(0.01)
        # Print progress
        setTxtProgressBar(pb, i)
}
close(pb)
df2<<-as.data.frame(t(apply(Data,1, function(x) { return(c(x[!is.na(x)],x[is.na(x)]) )} )))
#Se ajustan los nombres de acuerdoa Paper
colnames(df2)[1:8]<-c("Fecha","Identidad.sexogenxrica","Adscripcixn","Intervalo.Apellido","Prod","Fm.Rec","Div.Dif","Vinc")
Data<<-df2[!colSums(apply(X=df2,MARGIN=2,FUN=is.na))==nrow(df2)]
if(exists("Data")){
if(sum(is.na(Data))>0){print(paste("Hay",sum(is.na(Data)),"registros con datos faltantes, removiendo"))}
Data_I<<-Data[!rowSums(is.na(Data))>0,]
Sys.sleep(1)
##Describe los datos
print(paste("Los datos tienen",dim(Data_I)[1],"individuxs","con",sum(unlist(lapply(Data_I,is.numeric))),"variables numéricas","y",sum(unlist(lapply(Data_I,is.character)))
,"factor(es)"))
message("|--------|--------|--------|--------|--------|")
Sys.sleep(1)
Data_I$Ad.key<<-gsub("([a-z]{3})[^A-Z]+","\\1",x=Data_I$Adscripcixn,perl=T)
message("Los valores de la variable Adscripcixn fueron convertidos a la siguiente clave:")
Sys.sleep(1)
print(levels(as.factor(Data_I$Ad.key)))
Sys.sleep(0.5)
message("La clave será almacenada en la variable -Ad.key-")
Sys.sleep(0.5)
message("|--------|--------|--------|--------|--------|")
Intervalo.Apellido<-gsub(pattern=" ",replacement="",Data_I$Intervalo.Apellido)
Data_I$CV_I.S <<- gsub(pattern="A-K",replacement="M", gsub(pattern="L-Z",replacement="F",Intervalo.Apellido))
message("Los valores de la variable -Intervalo.Apellido- fueron convertidos convertidos a la variable -CV_I.S-")
message("A-K: M")
message("L-Z: F")
Sys.sleep(2)
message("|--------|--------|--------|--------|--------|")
message("Estas son las variables por analizar, revisa con cuidado:")
Sys.sleep(0.5)
print(paste("Variable en la columna",seq(1:ncol(Data_I)),":",colnames(Data_I)))
}
}

