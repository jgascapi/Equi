## simular_datos
##
## Simula un ejemplo de archivo con entradas al azar
##

`simular_datos` <- 
    function()
{
Data.sim<<-data.frame(Fecha=rep("24/jul/1998",50),Identidad.sexogenxrica=sample(x=c("Hombre","Mujer"),size=50,replace=T),Adscripcixn=sample(x=c("Umbrxlla","RaccxnPD"),size=50,replace=T),Intervalo.Apellido=sample(x=c("A-K","L-Z"),size=50,replace=T),Productividad=sample(x=c("(A) nulo","(B) poco","(C) regular","(D) bueno","(E) muy bueno"), size=50,replace=T),Formacixn.Recursos=sample(x=c("(A) nulo","(B) poco","(C) regular","(D) bueno","(E) muy bueno"),size=50,replace=T),Divul.Difus=sample(x=c("(A) nulo","(B) poco","(C) regular","(D) bueno","(E) muy bueno"),size=50,replace=T),Vinculacixn=sample(x=c("(A) nulo","(B) poco","(C) regular","(D) bueno","(E) muy bueno"),size=50,replace=T))
#rownames(Data.sim)<-paste(rep("Ind",25),1:25,sep="_")
xlsx::write.xlsx(Data.sim,file="Datos.simulados.xlsx",row.names=FALSE)
print(paste("El archivo Datos.simulados.xlsx se encuentra en",getwd()))
}
