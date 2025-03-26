## preparar_formato 
##
## Generar un formato pdf y xlsx
##

`preparar_formato` <-
    function()
{
tabla<<-data.frame(Fecha=rep("",45),Identidad.sexogenxrica=rep("",45),Adscripcixn=rep("",45),Intervalo.Apellido=rep("",45),Productividad=rep("",45),Formacixn.Recursos=rep("",45),Divulga.Difus=rep("",45),Vinculacixn=rep("",45))
#rownames(tabla)<-paste(rep("Ind",45),1:45,sep="_")
pdf(file="Formato_captura.pdf",width=8.5,height=11)
gridExtra::grid.table(tabla,theme=gridExtra::ttheme_default(base_size=8))
dev.off()
xlsx::write.xlsx(tabla,file="Formato_captura.xlsx",sheetName="Formato_captura",row.names=FALSE)
#rm(tabla)
print(paste("Los archivos fueron generados en",getwd()))
}
