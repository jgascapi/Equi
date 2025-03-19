# Equi
Paquete en R para analizar los datos publicados en Ciccia et al. 2025

**_Equi_**, prefijo de raíz latina que indica igualdad y equivalencia.

## Introducción 

**_Equi_** es un paquete escrito en **R** para el análisis descriptivo de datos generados de acuerdo con **Ciccia et al. 2025** ( [Ciccia et al. 2025](../home/Paper) ). Provee de gráficos y pruebas esdatdísticas básicas para interpretar los resultados de los _Curriculum Vitae_ presentados en **Ciccia et al. 2025**.

Requiere una instalación reciente de R (R > 4.2, https://cran.r-project.org/ ) y cualquier programa compatible con hojas de cálculo **_xlsx_**. Nota que, al menos para el primer uso, es necesario contar con una conexión a internet para la instalación de las dependencias del programa.

El uso de _Equi_ consta de dos etapas:

1. La generación de los formatos acpetados por **_Equi_** y cargar los datos capturados para su análisis. Adicionalmente, implementa una función para simular un set de datos al azar que puede usarse como templado.
2. El análisis estadístico de de los datos capturados. Los análisis y gráficos son los mismos presentados en **Ciccia et al. 2025**. Consulta el mismo para la interpretación de los resultados.
