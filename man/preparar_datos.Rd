\name{preparar_datos}
\alias{preparar_datos}
\title{Carga un archivo xlxs en el formato generado por preparar_formato()}
\usage{
preparar_datos(datos)
}
\arguments{
\item{datos}{Una hoja de cálculo en formato xlxs con cuatro variables numéricas y dos variables categóricas creado por \code{preparar_formato}.}
}
\description{
Carga una hoja de cálculo en formato xlsx. El archivo debe contener cuatro variables numéricas y dos varaibles categóricas.
}
\value{
Crea Un objeto llamado "Data_I" en la sesión activa
}
\examples{
##Crear una archivo simulado
simular_datos()
##Carga el archivo generado en el directorio de trabajo
preparar_datos(datos="Datos.simulados.xlsx")
##Revisa el contenido del objeto
Data_I
summary(Data_I)
}
