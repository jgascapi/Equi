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

Si logras ver un gráfico, y la versión reportada en la parte de abajo es mayor a 4.2.0 estamos listos para empezar.

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

### Generar archivos de entrada

El primer paso es obtener el formato para captura de datos:

`preparar_formato()`

Desplegará un mensaje con la ubicación de los archivos, por ejemplo:

`
"Los archivos fueron generados en /home/jvalantine/Desktop/Equidad_Umbrxlla/"
`


Se generaron dos archivos:

1. **_Formato_captura.pdf_**, para imprimir y capaturar los datos a mano. 
2. **_Formato_captura.xlsx_**, es una hoja de cálculo en formato _xlsx_ para capturar los datos.

Nota que no es necesario usar alguno de éstos formatos para analizar los datos. Sin embargo, la versión actual de **_Equi_** va esperar un archivo _xlsx_ con por lo menos ocho columnas: 

 - **Columna 1:** _Fecha_, puede ser cualquier clave temporal en cualquier formato.
 - **Columna 2:** _Identidad.sexogenxrica_, identidad sexogenérica del Evaluador; por ejemplo: "Mujer", "Hombre".
 - **Columna 3:** _Adscripcixn_, lugar de trabajo o estudio. De manera automática **_Equi_** va a transformar esta columna a una clave usando las letras mayúsculas seguidas de cuatro letras minúsculas; por ejemplo, "_Instituto de Ciencias, Universidad de Toluca_" será transformado a "_InstCiencUnivToluc_".  
 - **Columna 4:** _Intervalo.Apellido_, La clave del género de acuerdo al nombre de los CV analizados. Esta columna debe estar codificada con la clave usada en **Ciccia et al. 2025**. Los valores esperados son "_A-K_" y "_L-Z_", estos valores serán transformados a "_M_" (Masculino) y "_F_" (Femenino).
- **Columnas 5-8:** Las variables de evaluación por rubro: _Productividad_,	_Formacixn.Recursos_, _Divulga.Difus_ y	_Vinculacixn_. Los valores esperados son:
  - (A) nulo, valor numérico      **1**
  - (B) poco, valor numérico      **2**
  - (C) regular, valor numérico   **3**
  - (D) bueno, valor numérico     **4**
  - (E) muy bueno, valor numérico **5**

Consulta **Ciccia et al. 2025** para los detalles.

### Generar un archivo de datos al azar (opcional)

Esta función va a generar un archivo _xlsx_ con datos al azar. Ejecuta elcomando:  

`simular_datos()`

Desplegará un mensaje con la ubicación del archivo **_Datos.simulados.xlsx_**. 

`El archivo Datos.simulados.xlsx se encuentra en /home/jvalantine/Desktop/Equidad_Umbrxlla/`

Revisa el contenido del archivo, ésta es la estructura y tipo de datos que espera el análisis.

----
### Cargar en R el archivo xlsx con los datos 

Para cargar el archivo dentro de R, es necesario especificar el nombre del archivo xlsx. Para este ejemplo usaremos el archivo **_Datos.simulados.xlsx_** generado en el paso anterior. Si tienes tus propios datos, sustituye el nombre por tu propio archivo.

`preparar_datos(datos="Datos.simulados.xlsx")`

El comando desplegará los siguientes mensajes:

```
[1] "Los datos tienen 50 individuxs con 0 variables numéricas y 8 factor(es)"
|--------|--------|--------|--------|--------|
Los valores de la variable Adscripcixn fueron convertidos a la siguiente clave:
[1] "RaccPD" "Umbr"  
La clave será almacenada en la variable -Ad.key-
|--------|--------|--------|--------|--------|
Los valores de la variable -Intervalo.Apellido- fueron convertidos convertidos a la variable -CV_I.S-
A-K: M
L-Z: F
```

Estos tres primeros mensajes describen los datos ingresados. 
- **Notas:** 
 - El paquete **_Equi_** va a eliminar a los individuos que tengan datos faltantes en cualquiera de las casillas.  
 - Revisa con cuidado que el número de claves generadas correspondan al número de adscripciones.  

El siguiente mensaje describe las variables y el contenido los datos por analizar. Nota que las columnas de la cinco a la diez contienen las evaluaciones transformadas a valores numéricos.

```
Estas son las variables por analizar, revisa con cuidado:
 [1] "Variable en la columna 1 : Fecha"                 
 [2] "Variable en la columna 2 : Identidad.sexogenxrica"
 [3] "Variable en la columna 3 : Adscripcixn"           
 [4] "Variable en la columna 4 : Intervalo.Apellido"    
 [5] "Variable en la columna 5 : Prod"                  
 [6] "Variable en la columna 6 : Fm.Rec"                
 [7] "Variable en la columna 7 : Div.Dif"               
 [8] "Variable en la columna 8 : Vinc"                  
 [9] "Variable en la columna 9 : Ad.key"                
[10] "Variable en la columna 10 : CV_I.S"      
```



Por default el comando va a crear un objeto dentro de R llamado **_`Data_I`_**. Revisa su contenido:

```
Data_I
##Ahora obtengamos un breve resumen del contenido
summary(Data_I)
```

#### Notas: 

* El archivo debe estar localizado en tu directorio de trabajo.
* El nomre de tu archivo debe estar entre comillas **" "** ó **' '**
* La presente versión de **_Equi_** solo acepta archivos en formato **_xlsx_**.

---
