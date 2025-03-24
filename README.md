# Equi
Paquete en R para analizar los datos publicados en Ciccia et al. 2025

**_Equi_**, prefijo de raíz latina que indica igualdad y equivalencia.

## Introducción 

**_Equi_** es un paquete escrito en **R** para el análisis descriptivo de datos generados de acuerdo con **Ciccia et al. 2025** ( [Ciccia et al. 2025](../home/Paper) ). Provee de gráficos y pruebas esdatdísticas básicas para interpretar los resultados de los _Curriculum Vitae_ presentados en **Ciccia et al. 2025**.

Requiere una instalación reciente de R (R > 4.2, https://cran.r-project.org/ ) y cualquier programa compatible con hojas de cálculo **_xlsx_**. Nota que, al menos para el primer uso, es necesario contar con una conexión a internet para la instalación de las dependencias del programa.

El uso de _Equi_ consta de dos etapas:

1. La generación de los formatos acpetados por **_Equi_** y cargar los datos capturados para su análisis. Adicionalmente, implementa una función para simular un set de datos al azar que puede usarse como templado.
2. El análisis estadístico de de los datos capturados. Los análisis y gráficos son los mismos presentados en **Ciccia et al. 2025**. Consulta el mismo para la interpretación de los resultados.

#### Convenciones para esta guía:

Todo lo que está escrito con el siguiente font:

`print("Esto es un ejemplo de un comando de R")`

* Es código para usarse en **R**, siempre asegúrate de copiar la línea completa y pegarla en la consola. 
* Todo lo que empieza con **##** son comentarios para explicar la función o efecto del comando, puedes copiarlo completo y no tendrá efecto. 

---

## Instalación y dependencias

**_Equi_** está programado bajo el lenguaje R. Funciona usando la sintáxis basica de R. Para usuarios casuales puede resultar más amigable usar una interfase como [Rstudio](https://posit.co/download/rstudio-desktop/).

Primero, asegúrate de tener una versión compatible, abre una consola de R, copia y pega:

```
plot(x=seq(1:100),y=(y=log10(seq(101:200))),col=rainbow(100)) 
mtext(R.version.string, side = 1, line = 4, adj = 1)
```

Si logras ver un gráfico, y la versión reportada en la parte de abajo es mayor a 4.2 estamos listos para empezar.

### Dependencias

**_Equi_** está escrito para ser instalado junto con todas las dependencias que necesita para funcionar. Sin embargo, al estar en contínuo desarrollo, recomendamos (para esta versión) instalar manualmente las dependencias necesarias. **_Este paso sólo lo tienes que realizar una vez_**.

```R
install.packages(c("ggplot2","ggpubr","gridExtra","reshape2","xlsx","report","devtools","ggfortify"),dependecies=TRUE)
```

Si tu instalación es nueva probablemente salga el siguiente mensaje:

`--- Please select a CRAN mirror for use in this session ---`

Seleccióna la locación más cercana a tu ciudad y continúa. Dependiendo de la velocidad de la red y la computadora esto puede tardar algunos minutos.

### Instalación del paquete

Descarga el paquete desde https://github.com/jgascapi/Equi . Crea un directorio en una ubicación sencilla (por ejemplo: `Escritorio/Equi`). Descomprímelo y abre tu sesión de **R**. _Nota:_ Evita nombrar tu directorio de trabajo con acentos, caracteres especiales y/o espacios.

Establece tu directorio de trabajo:

```
##Para identificar tu directorio de trabajo
getwd()
```
Establece el directorio de tabajo donde descargaste y descomprimiste el paquete:

```
#por ejemplo en windows
setwd("Escritorio/Equi/")
#por ejemplo en Mac
setwd("~/Escritorio/Equi/")
```
Ahora carga el paquete:

`devtools::load_all("Equ")`

Debe salir el siguiente mensaje:

`ℹ Loading Equ`

Ahora, comprueba la instalación con el comando `help()`.  Éste va a desplegar la documentación del comando, por ejemplo:

`help(preparar_datos)`

Revisa la documentación y ciérrala con con la **tecla q**. 

---

## Implemetación

Recomendamos correr todos los pasos de este manual antes de usar tus propios datos.

#### Generar archivos de entrada

El primer paso es obtener el formato para captura de datos:

`preparar_formato()`

Desplegará un mensaje con la ubicación de los archivos.

Se generaron dos archivos:

1. **_Formato_captura.pdf_**, para imprimir y capaturar los datos a mano. 
2. **_Formato_captura.xlsx_**, es una hoja de cálculo en formato _xlsx_ para capturar los datos.

Nota que no es necesario usar alguno de éstos formatos para analizar los datos. Sin embargo, la versión actual de **_Equi_** va esperar un archivo _xlsx_ con por lo menos ocho columnas: 

La primera columna corresponde al número o clave de individuo, las siguientes cuatro columnas contienen las variables numéricas y las dos restantes variables categóricas.

