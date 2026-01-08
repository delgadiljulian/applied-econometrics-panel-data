// *********************************************
// Nombre: Julián Alberto Delgadillo Marín
// Programa: Maestría en Economía Aplicada
// Asignatura: Econometría Aplicada
// Taller: 2do Taller de Econometría Aplicada (Base de Datos de Brecha Salarial)
// Fecha: Segundo Cuatrimestre 2024
// *********************************************

// *********************************************
// Cargar el conjunto de datos (Participación Laboral)
// *********************************************
clear
cls
use "C:\Users\julla\Downloads\1.2.3_brecha_salarial_genero_2023-12.dta", clear

// Variable: pais                // Etiqueta: País
// Variable: encuesta            // Etiqueta: Encuesta
// Variable: anio                // Etiqueta: Año
// Variable: flag                // Etiqueta: Flag
// Variable: coef_mco            // Etiqueta: Coeficiente (MCO)
// Variable: error_std_mco       // Etiqueta: Error estándar (MCO)
// Variable: descripcion_flag    // Etiqueta: Descripción del flag
// Variable: pais_num            // Etiqueta: País (numérico)
// Variable: encuesta_num        // Etiqueta: Encuesta (numérico)


// *********************************************
// Exploración Inicial de los Datos
// *********************************************

* Visualizar la estructura y los nombres de las variables
describe, fullnames

* Listar las primeras 10 observaciones para verificar los datos
list in 1/10

* Obtener un resumen estadístico detallado de todas las variables numéricas
summarize, detail

* Verificar si hay valores faltantes en las variables clave
misstable summarize

// *********************************************
// Estadísticas Descriptivas por País y Categorías
// *********************************************
	
// Resumir las variables numéricas: Coeficiente (MCO), Error estándar (MCO), Año
summarize coef_mco error_std_mco anio

* Resumir la brecha salarial (coef_mco) y el error estándar (error_std_mco) por país
bysort pais: summarize coef_mco error_std_mco

* Resumir la brecha salarial por encuesta y año
bysort encuesta anio: summarize coef_mco error_std_mco

* Resumir la brecha salarial por país y año
bysort pais anio: summarize coef_mco error_std_mco

* Resumir la brecha salarial por país y encuesta
bysort pais encuesta: summarize coef_mco error_std_mco

// Resumir las variables categóricas: País, Encuesta, Flag
tabulate pais, missing
tabulate encuesta, missing
tabulate flag, missing

// *********************************************
// Generar Tablas Resumidas por País y Categorías
// *********************************************

// Crear una tabla resumen de la brecha salarial total por país usando tabstat
encode pais, gen(pais_num)
encode encuesta, gen(encuesta_num)


tabstat coef_mco error_std_mco, by(pais_num) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial por año usando tabstat
tabstat coef_mco error_std_mco, by(anio) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial por encuesta usando tabstat
tabstat coef_mco error_std_mco, by(encuesta) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial para cada país por año usando tabstat
bysort pais_num: tabstat coef_mco error_std_mco, by(anio) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial para cada encuesta por país usando tabstat
bysort pais_num: tabstat coef_mco error_std_mco, by(encuesta) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial para cada país por encuesta usando tabstat
bysort encuesta: tabstat coef_mco error_std_mco, by(pais_num) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial por país y flag usando tabstat
bysort pais_num: tabstat coef_mco error_std_mco, by(flag) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la brecha salarial por flag usando tabstat
tabstat coef_mco error_std_mco, by(flag) statistics(mean) format(%9.2f)

// Crear una tabla combinada que muestra las estadísticas por país y por encuesta
table pais_num encuesta_num, ///
    statistic(mean coef_mco) statistic(mean error_std_mco) ///
    nformat(%9.2f)

// *********************************************
// Análisis Gráfico Inicial (Brecha Salarial)
// *********************************************

* Generar un histograma para visualizar la distribución de la brecha salarial (coef_mco)
histogram coef_mco, frequency title("Distribución de la Brecha Salarial de Género (coef_mco)")

* Generar un gráfico de líneas para visualizar la evolución de la brecha salarial a lo largo de los años
twoway (line coef_mco anio), by(pais) title("Evolución de la Brecha Salarial de Género (por país)")

// *********************************************
// Resumen y Conclusiones Iniciales
// *********************************************

* Escribir algunas observaciones basadas en la exploración inicial de los datos
* Aquí podrías agregar comentarios manuales después de ejecutar el script para documentar tus hallazgos iniciales

* Fin del archivo .do
* Resumir los hallazgos clave y preparar el reporte