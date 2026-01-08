* Importar datos del Banco Mundial para el GDP per capita (dólares constantes de 2015) para América Latina (2000-2022)
import delimited "C:\Users\julla\Downloads\gdp_per_capita_latam_2000_2022.csv", clear

* Generar un resumen estadístico descriptivo para cada país
summarize

* Calcular estadísticas descriptivas por país
bysort economy: summarize

* Generar un resumen estadístico descriptivo agrupado por país
bysort economy: summarize

list economy yr2000 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010

* Calcular estadísticos adicionales como la mediana y el rango intercuartil
bysort economy: summarize, detail

* Generar un gráfico de caja (boxplot) para visualizar la dispersión del GDP per capita por país
graph box yr2000-yr2022, over(economy) title("Dispersión del GDP per capita por país (2000-2022)")

* Generar una tabla de estadísticas descriptivas agrupadas por año
table yr2000 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010 yr2011 yr2012 yr2013 yr2014 yr2015 yr2016 yr2017 yr2018 yr2019 yr2020 yr2021 yr2022, statistic(mean) by(economy) ///
title("Estadísticas descriptivas del GDP per capita por país y año (2000-2022)")

twoway (line yr year if economy == "ARG", lcolor(blue)) ///
       (line yr year if economy == "BRA", lcolor(red)) ///
       (line yr year if economy == "CHL", lcolor(green)) ///
       (line yr year if economy == "COL", lcolor(orange)) ///
       (line yr year if economy == "MEX", lcolor(purple)) ///
       (line yr year if economy == "URY", lcolor(black)), ///
       legend(order(1 "Argentina" 2 "Brasil" 3 "Chile" 4 "Colombia" 5 "México" 6 "Uruguay")) ///
       title("PIB per cápita 2000-2022") ///
       xtitle("Año") ytitle("PIB per cápita (USD 2015)") ///
       xlabel(2000(2)2022)

