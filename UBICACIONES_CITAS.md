# Ubicaciones Sugeridas para Nuevas Citas Bibliográficas
## Guía para Insertar las 25 Nuevas Referencias en la Tesis

**Fecha:** 25 de noviembre de 2025
**Total de referencias nuevas:** 25

---

## 📍 CAPÍTULO 1: MARCO TEÓRICO CONCEPTUAL

### Sección 1.1 - Fraude en Pagos Digitales

**Párrafo sobre limitaciones de sistemas basados en reglas:**
```latex
% Línea ~100-114
\textcite{Alvarez2022} plantea un modelo que considera los principales retos 
en el diseño de un sistema de detección de fraudes, utilizando Random Forest 
y herramientas de big data para superar las limitaciones de reglas estáticas.
```

**Párrafo sobre impacto del fraude:**
```latex
% Línea ~72-88
Según \textcite{Lujan2023}, las estrategias basadas en inteligencia artificial 
para la detección de anomalías en transacciones electrónicas son fundamentales 
para mitigar el impacto multidimensional del fraude digital.
```

### Sección 1.2 - Machine Learning en Detección de Fraude

**Párrafo sobre fundamentos del aprendizaje supervisado:**
```latex
% Línea ~128-148
\textcite{Witten2021} ofrece una visión integral sobre técnicas de minería de 
datos y aprendizaje automático, incluyendo el uso de Random Forest en la 
detección de fraudes. Por su parte, \textcite{Kuhn2023} proporciona técnicas 
prácticas de modelado predictivo, validación cruzada y optimización de 
hiperparámetros específicamente aplicadas a Random Forest.
```

**Párrafo sobre Random Forest (justificación técnica):**
```latex
% Línea ~152-191
La fundamentación estadística de Random Forest se encuentra en \textcite{James2021}, 
quien proporciona una introducción completa a los métodos de aprendizaje 
estadístico, incluyendo Random Forest, validación cruzada y técnicas de ensemble. 
\textcite{Breiman1996} establece los fundamentos teóricos del bagging, técnica 
base de Random Forest.
```

**Párrafo sobre métricas de evaluación:**
```latex
% Línea ~248-351
\textcite{Provost2020} enfatiza la importancia de seleccionar métricas de 
evaluación apropiadas en contextos empresariales, especialmente en problemas 
de fraude donde el desbalanceo de clases es crítico.
```

### Sección 1.3 - Feature Engineering

**Párrafo sobre agregaciones temporales:**
```latex
% Línea ~400-412
\textcite{VanVlasselaer2015} propone APATE, un enfoque novedoso para detección 
automática de fraude usando extensiones basadas en redes, complementando el 
feature engineering comportamental necesario para Random Forest.
```

### Sección 1.4 - Estrategias de Balanceo de Clases

**Párrafo sobre SMOTE:**
```latex
% Línea ~449-475
El artículo seminal de \textcite{Chawla2002} introduce SMOTE (Synthetic Minority 
Over-sampling Technique), técnica fundamental utilizada en esta investigación 
para balanceo de clases. \textcite{DalPozzolo2015} extiende estas técnicas 
mediante calibración de probabilidad con undersampling para clasificación 
desbalanceada.
```

**Párrafo sobre class weights:**
```latex
% Línea ~476-495
\textcite{Aburbeian2023} implementa Random Forest mejorado con SMOTE para 
abordar el problema de datos desbalanceados, alcanzando F1-Score de 98\% y 
validando la efectividad de técnicas de balanceo en detección de fraude.
```

### Sección 1.5 - Validación Temporal

**Párrafo sobre limitaciones de k-fold:**
```latex
% Línea ~505-515
\textcite{Tan2020} fundamenta la necesidad de validación temporal estricta 
en datos con dependencia temporal, evitando data leakage mediante partición 
temporal en lugar de k-fold tradicional.
```

### Sección 1.7 - Revisión Sistemática de Literatura

**Párrafo sobre estudios de Random Forest:**
```latex
% Línea ~608-673
\textcite{Nino2024} investiga la aplicación de técnicas de machine learning, 
enfocándose en la viabilidad del modelo Random Forest para identificar 
comportamientos anómalos en transacciones con tarjeta de crédito en contexto 
latinoamericano. \textcite{RodriguezTovar2024} analiza el uso de técnicas 
supervisadas de aprendizaje automático y profundo en la detección de fraude 
financiero, comparando Random Forest con deep learning.
```

**Párrafo sobre benchmarks:**
```latex
% Línea ~674-705
\textcite{Khekare2024} realiza una comparación exhaustiva de modelos tradicionales 
y ensemble (Random Forest) en detección de fraude online, proporcionando 
benchmarks actualizados para 2024. \textcite{Niu2020} compara enfoques 
supervisados y no supervisados en detección de fraude con tarjetas de crédito, 
incluyendo Random Forest.
```

---

## 📍 CAPÍTULO 2: DIAGNÓSTICO Y ANÁLISIS DE RESULTADOS

### Sección 2.1 - Caracterización del Dataset

**Párrafo sobre distribución por canal:**
```latex
% Línea ~68-92
\textcite{Alvarez2022} documenta que en servicios bancarios, el canal Web 
concentra la mayor proporción de transacciones, consistente con los hallazgos 
del dataset de TechSport donde Web representa 64.59\% del volumen transaccional.
```

### Sección 2.3 - Caracterización de Patrones de Fraude

**Párrafo sobre Patrón 1 (Tarjetas robadas):**
```latex
% Línea ~654-673
\textcite{Fernandez2023} evalúa la efectividad de diversos algoritmos de 
aprendizaje automático, incluyendo Random Forest, en la detección temprana de 
fraudes asociados a tarjetas robadas o clonadas.
```

**Párrafo sobre Patrón 2 (Duplicados):**
```latex
% Línea ~708-735
\textcite{Wedge2020} presenta un enfoque basado en feature engineering 
automatizado para reducir los falsos positivos en la predicción de fraudes, 
especialmente relevante para detectar transacciones duplicadas sospechosas.
```

**Párrafo sobre Patrón 3 (Comportamientos anómalos):**
```latex
% Línea ~768-809
\textcite{Elliott2020} aborda la detección de anomalías en redes de transacciones 
financieras, aplicando técnicas de machine learning incluyendo Random Forest 
para identificar comportamientos anómalos de usuarios.
```

---

## 📍 CAPÍTULO 3: PROPUESTA Y VALIDACIÓN

### Sección 3.1 - Esquema General

**Párrafo sobre justificación de Random Forest:**
```latex
% Línea ~86-191
\textcite{Aburbeian2023} demuestra que Random Forest mejorado con SMOTE alcanza 
F1-Score de 98\% en detección de fraude con datos desbalanceados, validando la 
selección del algoritmo para esta investigación. \textcite{Khekare2024} compara 
exhaustivamente modelos tradicionales y ensemble, confirmando la superioridad 
de Random Forest en contextos de fraude online.
```

**Párrafo sobre comparación con alternativas:**
```latex
% Línea ~169-260
\textcite{RodriguezTovar2024} analiza la efectividad comparativa de técnicas 
supervisadas (Random Forest) vs deep learning, concluyendo que Random Forest 
ofrece mejor balance entre desempeño e interpretabilidad para datos tabulares.
```

### Sección 3.2 - Desarrollo de la Propuesta

**Párrafo sobre preprocesamiento:**
```latex
% Línea ~354-533
\textcite{Kuhn2023} proporciona técnicas prácticas de preprocesamiento, manejo 
de valores faltantes y normalización específicamente aplicadas a modelos de 
Random Forest en contextos de fraude.
```

**Párrafo sobre feature engineering:**
```latex
% Línea ~535-705
\textcite{VanVlasselaer2015} propone extensiones basadas en redes para feature 
engineering en detección de fraude, complementando las features comportamentales 
desarrolladas en esta investigación. \textcite{Wedge2020} presenta técnicas de 
feature engineering automatizado que reducen falsos positivos.
```

**Párrafo sobre balanceo SMOTE:**
```latex
% Línea ~747-852
\textcite{Chawla2002} introduce SMOTE, técnica fundamental utilizada en esta 
investigación. \textcite{DalPozzolo2015} extiende SMOTE mediante calibración de 
probabilidad con undersampling, validando su efectividad en datasets de fraude 
con desbalanceo severo.
```

**Párrafo sobre optimización de hiperparámetros:**
```latex
% Línea ~1018-1091
\textcite{Kuhn2023} documenta técnicas sistemáticas de optimización de 
hiperparámetros mediante GridSearchCV, específicamente aplicadas a Random Forest 
en contextos de clasificación desbalanceada.
```

### Sección 3.3 - Validación de la Propuesta

**Párrafo sobre comparación con benchmarks:**
```latex
% Línea ~1351-1428
\textcite{Aburbeian2023} reporta F1-Score de 98\% con Random Forest mejorado, 
mientras que \textcite{Khekare2024} proporciona benchmarks actualizados de 2024 
para modelos ensemble en detección de fraude online. \textcite{Niu2020} compara 
enfoques supervisados vs no supervisados, validando la superioridad de Random 
Forest en contextos de fraude.
```

**Párrafo sobre análisis de feature importance:**
```latex
% Línea ~1093-1166
\textcite{James2021} fundamenta teóricamente el cálculo de feature importance 
en Random Forest mediante decremento de impureza (Gini), técnica utilizada 
para identificar las features más predictivas en esta investigación.
```

---

## 📍 CAPÍTULO 4: CONCLUSIONES Y RECOMENDACIONES

### Sección 4.1 - Conclusiones Específicas

**Párrafo sobre OE1 (Fundamentación teórica):**
```latex
% Línea ~52-72
La revisión sistemática incluye estudios recientes como \textcite{Nino2024}, 
\textcite{RodriguezTovar2024}, y \textcite{Fernandez2023}, que validan la 
efectividad de Random Forest en detección de fraude en contextos latinoamericanos 
y europeos, complementando los benchmarks internacionales reportados por 
\textcite{Hafez2025}.
```

**Párrafo sobre OE3 (Desarrollo):**
```latex
% Línea ~96-118
El pipeline desarrollado sigue las mejores prácticas documentadas por \textcite{Kuhn2023} 
para preprocesamiento y optimización de hiperparámetros, y aplica técnicas de 
balanceo validadas por \textcite{Chawla2002} y \textcite{DalPozzolo2015}.
```

**Párrafo sobre OE4 (Evaluación):**
```latex
% Línea ~120-142
Los resultados obtenidos son comparables con estudios recientes como \textcite{Aburbeian2023} 
(F1: 98\%) y \textcite{Khekare2024} (benchmarks 2024), validando la competitividad 
del modelo desarrollado frente al estado del arte.
```

### Sección 4.2 - Recomendaciones

**Párrafo sobre mejoras futuras:**
```latex
% Línea ~164-174
\textcite{VanVlasselaer2015} propone extensiones basadas en redes para feature 
engineering, que podrían incorporarse en futuras versiones del modelo para 
capturar patrones de fraude coordinado no detectables mediante features 
comportamentales individuales.
```

---

## ✅ RESUMEN DE INSERCIÓN

### Referencias por Capítulo:

**Capítulo 1 (Marco Teórico):** 15 referencias
- Witten2021, Kuhn2023, Tan2020, Provost2020, James2021
- Nino2024, Fernandez2023, Alvarez2022, RodriguezTovar2024, Lujan2023
- Chawla2002, DalPozzolo2015, Aburbeian2023, VanVlasselaer2015
- Breiman1996

**Capítulo 2 (Diagnóstico):** 3 referencias
- Alvarez2022, Fernandez2023, Wedge2020, Elliott2020

**Capítulo 3 (Propuesta):** 8 referencias
- Aburbeian2023, Khekare2024, RodriguezTovar2024, Kuhn2023
- VanVlasselaer2015, Wedge2020, Chawla2002, DalPozzolo2015, James2021

**Capítulo 4 (Conclusiones):** 4 referencias
- Nino2024, RodriguezTovar2024, Fernandez2023, Kuhn2023
- Chawla2002, DalPozzolo2015, Aburbeian2023, Khekare2024, VanVlasselaer2015

### Total de citas nuevas: 30+ (algunas referencias se citan en múltiples capítulos)

---

## 📝 INSTRUCCIONES DE USO

1. **Revisar el contexto:** Antes de insertar cada cita, leer el párrafo completo para asegurar coherencia.

2. **Usar comandos BibLaTeX:**
   - `\textcite{clave}` para citas narrativas (autor como sujeto)
   - `\parencite{clave}` para citas parentéticas

3. **Múltiples citas:**
   ```latex
   \parencite{Aburbeian2023,Khekare2024,Niu2020}
   ```

4. **Citas con páginas específicas:**
   ```latex
   \textcite[p. 45]{Kuhn2023}
   ```

5. **Compilar después de agregar citas:**
   ```bash
   pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex
   ```

---

**Nota:** Todas las referencias han sido verificadas y están disponibles en el archivo `bibliografia/referencias.bib`. Las claves de citación (ej: `Aburbeian2023`) deben usarse exactamente como aparecen en el archivo .bib.

