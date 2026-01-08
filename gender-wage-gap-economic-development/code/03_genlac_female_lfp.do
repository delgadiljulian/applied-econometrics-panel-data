// *********************************************
// Nombre: Julián Alberto Delgadillo Marín
// Programa: Maestría en Economía Aplicada
// Asignatura: Econometría Aplicada
// Taller: 2do Taller de Econometría Aplicada (Base de Datos de Participación Laboral)
// Fecha: Segundo Cuatrimestre 2024
// *********************************************

// *********************************************
// Cargar el conjunto de datos (Participación Laboral)
// *********************************************
clear
cls
use "C:\Users\julla\Downloads\1.1.1_participacion_2023-12.dta", clear

// Variable: pais                // Etiqueta: País
// Variable: encuesta            // Etiqueta: Encuesta
// Variable: anio                // Etiqueta: Año

// Variable: flag                // Etiqueta: Indicador de flag (variable descriptiva adicional)

// Variable: total               // Etiqueta: Tasa de participación laboral total
// Variable: mujeres             // Etiqueta: Tasa de participación laboral de mujeres
// Variable: hombres             // Etiqueta: Tasa de participación laboral de hombres
// Variable: brecha              // Etiqueta: Brecha de participación laboral mujeres-hombres
// Variable: error_std           // Etiqueta: Error estándar de la brecha mujeres-hombres

// Variable: mujeres_sinhijos    // Etiqueta: Tasa de participación laboral de mujeres sin hijos
// Variable: mujeres_hijos_05    // Etiqueta: Tasa de participación laboral de mujeres con hijos de 0 a 5 años
// Variable: mujeres_hijos_6mas  // Etiqueta: Tasa de participación laboral de mujeres con hijos de 6 años o más
// Variable: hombres_sinhijos    // Etiqueta: Tasa de participación laboral de hombres sin hijos
// Variable: hombres_hijos_05    // Etiqueta: Tasa de participación laboral de hombres con hijos de 0 a 5 años
// Variable: hombres_hijos_6mas  // Etiqueta: Tasa de participación laboral de hombres con hijos de 6 años o más

// Variable: mujeres_solteras    // Etiqueta: Tasa de participación laboral de mujeres solteras
// Variable: mujeres_enpareja    // Etiqueta: Tasa de participación laboral de mujeres en pareja
// Variable: hombres_solteros    // Etiqueta: Tasa de participación laboral de hombres solteros
// Variable: hombres_enpareja    // Etiqueta: Tasa de participación laboral de hombres en pareja

// Variable: mujeres_bajacalif   // Etiqueta: Tasa de participación laboral de mujeres con baja calificación
// Variable: mujeres_mediacalif  // Etiqueta: Tasa de participación laboral de mujeres con media calificación
// Variable: mujeres_altacalif   // Etiqueta: Tasa de participación laboral de mujeres con alta calificación
// Variable: hombres_bajacalif   // Etiqueta: Tasa de participación laboral de hombres con baja calificación
// Variable: hombres_mediacalif  // Etiqueta: Tasa de participación laboral de hombres con media calificación
// Variable: hombres_altacalif   // Etiqueta: Tasa de participación laboral de hombres con alta calificación

// Variable: descripcion_flag    // Etiqueta: Descripción del flag

// *********************************************
// Exploración Inicial de los Datos
// *********************************************

* Visualizar la estructura y los nombres de las variables
describe, fullnames

* Listar las primeras 10 observaciones para verificar los datos
list in 1/10

* Obtener un resumen estadístico detallado de todas las variables numéricas
summarize, detail

* Verificar las primeras 10 observaciones de las variables clave
list pais anio total mujeres hombres brecha error_std in 1/10

* Revisar si hay valores faltantes en las variables clave
misstable summarize total mujeres hombres brecha error_std

* Generar una tabla de frecuencias para las variables categóricas
tabulate pais encuesta

// *********************************************
// Estadísticas Descriptivas por País y Categorías
// *********************************************

* Estadistica descriptiva
summarize total mujeres hombres brecha error_std ///
          mujeres_sinhijos mujeres_hijos_05 mujeres_hijos_6mas ///
          hombres_sinhijos hombres_hijos_05 hombres_hijos_6mas ///
          mujeres_solteras mujeres_enpareja hombres_solteros hombres_enpareja ///
          mujeres_bajacalif mujeres_mediacalif mujeres_altacalif ///
          hombres_bajacalif hombres_mediacalif hombres_altacalif

* Resumir la participación laboral total, de mujeres y hombres por país
bysort pais: summarize total mujeres hombres

* Resumir la participación laboral de mujeres y hombres según la presencia de hijos
bysort pais: summarize mujeres_sinhijos mujeres_hijos_05 mujeres_hijos_6mas
bysort pais: summarize hombres_sinhijos hombres_hijos_05 hombres_hijos_6mas

* Resumir la participación laboral de mujeres y hombres según estado civil
bysort pais: summarize mujeres_solteras mujeres_enpareja
bysort pais: summarize hombres_solteros hombres_enpareja

* Resumir la participación laboral de mujeres y hombres según nivel de calificación
bysort pais: summarize mujeres_bajacalif mujeres_mediacalif mujeres_altacalif
bysort pais: summarize hombres_bajacalif hombres_mediacalif hombres_altacalif

// *********************************************
// Generar Tablas Resumidas por País y Categorías
// *********************************************

// Crear una variable numérica para el país
encode pais, gen(pais_num)

// Crear una tabla resumen de la participación laboral total por país usando tabstat
tabstat total mujeres hombres, by(pais_num) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la participación laboral de mujeres y hombres según la presencia de hijos usando tabstat
tabstat mujeres_sinhijos mujeres_hijos_05 mujeres_hijos_6mas hombres_sinhijos hombres_hijos_05 hombres_hijos_6mas, by(pais_num) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la participación laboral por estado civil usando tabstat
tabstat mujeres_solteras mujeres_enpareja hombres_solteros hombres_enpareja, by(pais_num) statistics(mean) format(%9.2f)

// Crear una tabla resumen de la participación laboral por nivel de calificación usando tabstat
tabstat mujeres_bajacalif mujeres_mediacalif mujeres_altacalif hombres_bajacalif hombres_mediacalif hombres_altacalif, by(pais_num) statistics(mean) format(%9.2f)

// *********************************************
// Análisis Gráfico Inicial (Participación Laboral)
// *********************************************

* Generar un histograma para visualizar la distribución de la variable 'brecha'
histogram brecha, frequency title("Distribución de la Brecha Mujeres-Hombres")

* Generar un gráfico de líneas para visualizar la evolución de la tasa de participación laboral de mujeres a lo largo de los años
twoway (line mujeres anio), by(pais) title("Evolución de la Tasa de Participación Laboral de Mujeres (por país)")

// *********************************************
// Resumen y Conclusiones Iniciales
// *********************************************

* Escribir algunas observaciones basadas en la exploración inicial de los datos
* Aquí podrías agregar comentarios manuales después de ejecutar el script para documentar tus hallazgos iniciales

* Fin del archivo .do
