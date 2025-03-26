\name{describe_stats}
\alias{describe_stats}
\title{Esdadística y gráficos descriptivos}
\usage{
describe_stats()
}
\description{
Genera la esdadística básica y gráficos descriptivos de los ingresados de acuerdo con Paper.
}
\value{
La versión 1.1 crea cinco hojas de formato pdf junto con una serie de objetos dentro de las sesión activa.
}
\details{
El comando \code{describe_stats} varios objetos producidos por el análisis:
_Data_I.df_ Los objetos **df** contienen los datos en formato para generar los gráficos.
_Data.aov_ Resultados de la prueba ANOVA almacenda en R
_Data.pca.coords_ Coordenadas de los dos primeros componentes obtendidos del análisis de PCA.
_P*_ Los objetos **P** contienen los gráficos generados.
}

\examples{
##Analizar el objeto "Data_I" previamente creado por simular_datos()
describe_stats()
##
}
