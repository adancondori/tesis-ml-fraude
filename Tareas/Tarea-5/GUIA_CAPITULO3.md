# GUÍA PARA COMPLETAR EL CAPÍTULO 3: PROPUESTA Y VALIDACIÓN

**Archivo:** `capitulo3_propuesta_validacion_PLANTILLA.tex`
**Fecha de creación:** Diciembre 2025
**Basado en:** Enunciado Tarea 5 + Metodología Sampieri + AQP Corregido

---

## 📋 ESTRUCTURA GENERAL DEL CAPÍTULO 3

El Capítulo 3 se divide en 3 secciones principales:

### **3.1. Esquema General de la Propuesta**
- ¿Qué se propone?
- ¿Por qué se propone así? (Justificación de Random Forest)
- Arquitectura conceptual (diagrama del pipeline)

### **3.2. Desarrollo de la Propuesta** (Cumple OE3)
- Fase 1: Preprocesamiento
- Fase 2: Feature Engineering (15+ features)
- Fase 3: Balanceo de clases (SMOTE)
- Fase 4: División temporal train/test
- Fase 5: Entrenamiento Random Forest
- Fase 6: Optimización de hiperparámetros (GridSearch)
- Fase 7: Feature Importance

### **3.3. Validación de la Propuesta** (Cumple OE4)
- Validación metodológica (coherencia con Sampieri 2014)
- Validación técnica (métricas en test set)
- Comparación con benchmarks de literatura
- Validación económica (ROI, ahorro estimado)

---

## 🔍 SECCIONES MARCADAS COMO "[CONTENIDO A DESARROLLAR]"

Todas las secciones con este marcador requieren que completes con tus **RESULTADOS REALES** de la implementación. A continuación, te guío paso a paso:

---

## 📖 SECCIÓN 3.1: ESQUEMA GENERAL DE LA PROPUESTA

### **Ubicación:** Líneas 125-300 (aprox.)

### **Qué completar:**

#### **1. Resumen del Capítulo (líneas 90-100)**

**Instrucciones:**
- Escribe un resumen de 200-300 palabras del capítulo completo
- Incluye:
  - Problema que resuelve (delay de 47 días)
  - Solución propuesta (Random Forest)
  - Principales resultados (F1, Recall, Precision, AUC-ROC)
  - Conclusión (cumplimiento de objetivos)

**Ejemplo de estructura:**
```
Este capítulo presenta la propuesta de solución... [explicar problema]
La propuesta consiste en... [explicar solución]
Los resultados obtenidos fueron... [mencionar métricas]
Se validó que... [conclusión]
```

#### **2. Justificación de Random Forest (líneas 230-280)**

**Instrucciones:**
- Completa la tabla de **"Ventajas de Random Forest"** (líneas 240-280)
- Busca en **5-10 papers** de literatura (2020-2025) que usen Random Forest para detección de fraude
- Para cada ventaja, agrega la **referencia bibliográfica** específica
- Si encuentras papers con F1-Scores reportados, agrégalos a la justificación

**Papers recomendados para revisar:**
- Hafez et al. (2025) - Random Forest for Credit Card Fraud Detection
- Baesens et al. (2015) - Fraud Analytics
- Carcillo et al. (2018) - SCARFF framework
- Hernández Aros et al. (2024) - Revisión de ML en fraude

#### **3. Tabla Comparativa RF vs XGBoost vs SVM vs DL (líneas 290-320)**

**Instrucciones:**
- Revisa literatura para completar la columna de **"Desempeño (F1)"**
- Confirma tiempos de entrenamiento (basado en experiencia o literatura)
- Justifica por qué Random Forest es la mejor opción para **2 meses de desarrollo**

---

## 📖 SECCIÓN 3.2: DESARROLLO DE LA PROPUESTA

### **Ubicación:** Líneas 350-750 (aprox.)

### **Qué completar (FASE POR FASE):**

---

### **FASE 1: Preprocesamiento (líneas 360-420)**

**Instrucciones:**

1. **Análisis de valores faltantes (código líneas 380-395):**
   - Ejecuta el código Python proporcionado en tu dataset real
   - Reemplaza los valores simulados con tus resultados reales:
     ```python
     # gateway (90.9% faltantes): REEMPLAZAR con tu %
     # card_brand (73.9% faltantes): REEMPLAZAR con tu %
     # is_fraud (1.3% faltantes): REEMPLAZAR con tu %
     ```
   - Si tus porcentajes son diferentes, ajusta la estrategia (imputación vs. eliminación)

2. **Detección de outliers (código líneas 400-415):**
   - Ejecuta el análisis de z-score en tu dataset
   - Reemplaza:
     - `Outliers detectados: X%` con tu resultado
     - `Tasa de fraude en outliers: X%` con tu resultado
   - Confirma que NO eliminas outliers (son features predictivas)

3. **Encoding de categóricas (tabla líneas 420-450):**
   - Verifica qué variables categóricas tiene tu dataset
   - Completa la tabla con tus variables específicas
   - Si tienes variables diferentes a las listadas, agrégalas

**Resultado esperado de esta fase:**
- Dataset limpio con X transacciones (especificar número exacto)
- % de pérdida de datos (debe ser < 5%)
- Variables codificadas correctamente

---

### **FASE 2: Feature Engineering (líneas 460-550)**

**CRITICAL - ESTA ES LA FASE MÁS IMPORTANTE**

**Instrucciones:**

1. **Catálogo de features (tabla líneas 480-530):**
   - Revisa la tabla de 18 features propuestas
   - **CONFIRMA o MODIFICA** cada feature según tu dataset:
     - ¿Tienes la columna `user_id` para calcular `tx_frequency_24h`?
     - ¿Tienes timestamps para calcular `time_since_last_tx`?
     - ¿Tienes `gateway` para calcular `gateway_fraud_rate`?
   - Si NO tienes alguna columna, **elimina esa feature** de la tabla
   - Si tienes columnas adicionales, **agrega nuevas features**

2. **Prevención de data leakage (líneas 540-560):**
   - Ejecuta el código de validación temporal
   - Confirma que:
     ```python
     assert df['created_at'].is_monotonic_increasing  # Dataset ordenado
     assert train_max_date < test_min_date            # No solapamiento
     ```
   - Reporta el **gap temporal** entre train y test (debe ser > 0 días)

**Resultado esperado:**
- Tabla con 15-20 features documentadas
- Código Python ejecutado exitosamente
- Validación de no data leakage CONFIRMADA

---

### **FASE 3: Balanceo de Clases (líneas 560-600)**

**Instrucciones:**

1. **Decisión SMOTE vs class_weight (tabla líneas 570-590):**
   - Calcula el ratio de desbalanceo en tu dataset:
     ```python
     ratio = (df['is_fraud'] == 0).sum() / (df['is_fraud'] == 1).sum()
     print(f"Ratio desbalanceo: {ratio:.1f}:1")
     ```
   - Si ratio < 10:1 → Usa **class_weight='balanced'**
   - Si ratio 10:1 a 20:1 → Usa **SMOTE** (recomendado según plantilla)
   - Si ratio > 20:1 → Combina **SMOTE + class_weight**

2. **Implementación de SMOTE (código líneas 595-610):**
   - Ejecuta el código proporcionado
   - Reemplaza:
     ```python
     # Antes SMOTE: [tu resultado]
     # Después SMOTE: [tu resultado]
     ```
   - Confirma que el ratio final es ~2:1 (50% fraude en train set balanceado)

**Resultado esperado:**
- Train set balanceado con ratio 2:1 o 3:1
- Incremento sintético de X millones de transacciones fraudulentas

---

### **FASE 4: División Temporal (líneas 610-650)**

**Instrucciones:**

1. **Tabla de división (líneas 620-640):**
   - Ejecuta el código de división temporal
   - Reemplaza los valores simulados con tus resultados reales:
     - Train: `X transacciones (Y%)`
     - Validation: `X transacciones (Y%)`
     - Test: `X transacciones (Y%)`
   - Confirma que la tasa de fraude es homogénea entre conjuntos (±1%)

2. **Código de validación (líneas 645-660):**
   - Ejecuta el assert de no solapamiento
   - Reporta el gap temporal entre train y test

**Resultado esperado:**
- División 70/15/15 (aproximadamente)
- Tasas de fraude homogéneas (7.1-7.4% según plantilla)
- Validación temporal exitosa

---

### **FASE 5: Entrenamiento Random Forest (líneas 660-700)**

**Instrucciones:**

1. **Código de entrenamiento (líneas 670-690):**
   - Ejecuta el código proporcionado
   - Reemplaza:
     ```python
     # Tiempo de entrenamiento: X minutos
     ```
   - Si el entrenamiento toma > 4 horas, considera reducir n_estimators a 100-150

2. **Evaluación en validation set (líneas 695-715):**
   - Ejecuta el código de evaluación
   - Reporta las 4 métricas:
     - F1-Score: `X (objetivo: >= 0.85)`
     - Recall: `X (objetivo: >= 0.90)`
     - Precision: `X (objetivo: >= 0.80)`
     - AUC-ROC: `X (objetivo: >= 0.92)`

**Resultado esperado:**
- Modelo inicial entrenado en 2-4 horas
- Métricas cercanas a objetivos (pueden estar 5-10% por debajo antes de optimización)

---

### **FASE 6: Optimización de Hiperparámetros (líneas 710-750)**

**ADVERTENCIA: ESTA FASE PUEDE TOMAR 4-8 HORAS**

**Instrucciones:**

1. **GridSearchCV (código líneas 720-745):**
   - Ejecuta el GridSearch con la grilla de parámetros proporcionada
   - Si toma > 8 horas, reduce la grilla:
     ```python
     param_grid = {
         'n_estimators': [150, 200],        # Reducir de 3 a 2 valores
         'max_depth': [15, 20],             # Reducir de 3 a 2 valores
         'min_samples_split': [10],         # Fijar en 1 valor
         'min_samples_leaf': [5],           # Fijar en 1 valor
         'max_features': ['sqrt']           # Fijar en 1 valor
     }
     ```
   - Reporta los **mejores hiperparámetros** encontrados
   - Reporta el **mejor F1-Score (CV)**

2. **Modelo final (líneas 750-765):**
   - Entrena el modelo final con los hiperparámetros optimizados
   - Serializa el modelo (.pkl)
   - Confirma que el archivo `.pkl` se guardó correctamente

**Resultado esperado:**
- Hiperparámetros óptimos documentados
- Modelo final serializado (archivo .pkl de ~50-500 MB)
- F1-Score mejorado (esperado: +2-5% respecto a modelo inicial)

---

### **FASE 7: Feature Importance (líneas 770-800)**

**Instrucciones:**

1. **Análisis de importancia (código líneas 780-795):**
   - Ejecuta el código de extracción de feature importance
   - Genera el gráfico de barras (Top 10 features)
   - Guarda el gráfico como `feature_importance.png`

2. **Tabla Top 10 (líneas 800-820):**
   - Reemplaza los valores simulados con tus resultados reales:
     - `amount_z_score_user: X%` → tu valor
     - `tx_frequency_24h: X%` → tu valor
     - etc.
   - Ordena de mayor a menor importancia

3. **Interpretación (líneas 825-835):**
   - Analiza qué features son más importantes
   - Relaciona con los hallazgos del Capítulo 2 (EDA)
   - Confirma que las top 3 features tienen sentido de negocio

**Resultado esperado:**
- Gráfico de feature importance generado
- Tabla Top 10 con valores reales
- Interpretación de 3-5 líneas por feature importante

---

## 📖 SECCIÓN 3.3: VALIDACIÓN DE LA PROPUESTA

### **Ubicación:** Líneas 850-1100 (aprox.)

### **Qué completar:**

---

### **Validación Metodológica (líneas 860-900)**

**Instrucciones:**

1. **Checklist de Sampieri (tabla líneas 870-895):**
   - Revisa cada uno de los 8 criterios
   - Confirma que tu investigación cumple TODOS
   - Si algún criterio NO se cumple, documenta por qué y cómo lo mitigaste
   - La columna "Evidencia" debe apuntar a secciones específicas de tu tesis

**Resultado esperado:**
- 8/8 criterios cumplidos ✅
- Evidencias documentadas (ej: "Sección 2.2.2 del Capítulo 2")

---

### **Validación Técnica (líneas 900-1000)**

**ESTA ES LA SECCIÓN MÁS CRÍTICA - AQUÍ REPORTAS TUS RESULTADOS FINALES**

**Instrucciones:**

#### **1. Evaluación en test set (código líneas 910-940):**

Ejecuta el código Python proporcionado y reemplaza los valores simulados:

```python
# REEMPLAZAR ESTOS VALORES CON TUS RESULTADOS REALES:
# F1-Score:   0.XXXX (Objetivo: >= 0.85)
# Recall:     0.XXXX (Objetivo: >= 0.90)
# Precision:  0.XXXX (Objetivo: >= 0.80)
# AUC-ROC:    0.XXXX (Objetivo: >= 0.92)
```

#### **2. Tabla de resultados (líneas 945-960):**

Reemplaza la tabla completa:

```latex
\begin{tabular}{|l|r|r|r|}
F1-Score & 0.XXXX & >= 0.85 & [✅/❌] CUMPLE/NO CUMPLE \\
Recall & 0.XXXX & >= 0.90 & [✅/❌] CUMPLE/NO CUMPLE \\
Precision & 0.XXXX & >= 0.80 & [✅/❌] CUMPLE/NO CUMPLE \\
AUC-ROC & 0.XXXX & >= 0.92 & [✅/❌] CUMPLE/NO CUMPLE \\
\end{tabular}
```

**IMPORTANTE:**
- Si NO cumples algún objetivo, **NO lo marques como ✅**
- En las conclusiones, explica por qué no se cumplió y qué se puede hacer

#### **3. Matriz de confusión (tabla líneas 970-985):**

Calcula y reemplaza:

```latex
\begin{tabular}{cc|c|c|}
 & No Fraude & XXXX (TN) & XXXX (FP) \\
 & Fraude & XXXX (FN) & XXXX (TP) \\
\end{tabular}
```

Donde:
- **TP (True Positives):** Fraudes correctamente detectados
- **TN (True Negatives):** No fraudes correctamente clasificados
- **FP (False Positives):** Transacciones legítimas bloqueadas (¡ERROR COSTOSO!)
- **FN (False Negatives):** Fraudes NO detectados (¡PÉRDIDA ECONÓMICA!)

#### **4. Interpretación (líneas 990-1005):**

Analiza tu matriz de confusión:
- ¿Qué % de fraudes detectaste? (TP / (TP + FN))
- ¿Qué % de transacciones legítimas bloqueaste incorrectamente? (FP / (FP + TN))
- ¿Cuál es el riesgo residual? (FN = fraudes no detectados)

---

### **Comparación con Literatura (líneas 1010-1050)**

**Instrucciones:**

1. **Tabla comparativa (líneas 1020-1040):**
   - La tabla ya incluye 4 estudios de referencia (Hafez 2025, Hernández Aros 2024, etc.)
   - Agrega tu fila con tus resultados reales:
     ```latex
     \rowcolor{lightgreen}
     \textbf{ESTE ESTUDIO (TechSport 2025)} &
     \textbf{0.XXXX} &  % TU F1-Score
     \textbf{0.XXXX} &  % TU Recall
     \textbf{0.XXXX} &  % TU Precision
     \textbf{0.XXXX} \\  % TU AUC-ROC
     ```

2. **Interpretación (líneas 1045-1065):**
   - Compara tus resultados con cada estudio
   - Identifica:
     - ¿En qué métricas eres MEJOR que la literatura?
     - ¿En qué métricas eres PEOR?
     - ¿Por qué crees que hay diferencias? (dataset diferente, features diferentes, etc.)

**Resultado esperado:**
- Tabla completa con tu fila agregada
- Interpretación de 5-8 líneas comparando con literatura
- Conclusión: "Desempeño comparable/superior/inferior a benchmarks"

---

### **Intervalos de Confianza (líneas 1070-1100)**

**Instrucciones:**

1. **Código bootstrap (líneas 1080-1095):**
   - Ejecuta el código proporcionado (toma ~5-10 minutos)
   - Reporta los intervalos de confianza del 95% para cada métrica

2. **Tabla de IC (líneas 1100-1110):**
   - Reemplaza:
     ```latex
     F1-Score & 0.XXXX & 0.XXXX & 0.XXXX \\  % Media, IC inferior, IC superior
     Recall & 0.XXXX & 0.XXXX & 0.XXXX \\
     Precision & 0.XXXX & 0.XXXX & 0.XXXX \\
     AUC-ROC & 0.XXXX & 0.XXXX & 0.XXXX \\
     ```

3. **Interpretación (líneas 1115-1125):**
   - Verifica: ¿El límite inferior del IC cumple con el objetivo?
   - Ejemplo: Si IC de F1 es [0.8645, 0.8798] y objetivo es 0.85 → ✅ CUMPLE
   - Si el límite inferior NO cumple, explica qué significa

**Resultado esperado:**
- 4 intervalos de confianza calculados
- Interpretación de estabilidad del modelo
- Confirmación de que los objetivos se cumplen con 95% de confianza

---

### **Tiempo de Inferencia (líneas 1130-1160)**

**Instrucciones:**

1. **Medición de tiempo (código líneas 1140-1155):**
   - Ejecuta el código proporcionado
   - Reporta:
     ```python
     # Tiempo promedio por transacción: X.XXXX ms
     # Transacciones por segundo: XXXXX tx/s
     ```

2. **Comparación con objetivo (líneas 1160-1170):**
   - Objetivo: < 200ms
   - Calcula: `200ms / tu_tiempo_promedio` = Factor de mejora
   - Ejemplo: Si tu tiempo es 0.034ms → Factor = 5,882x más rápido

**Resultado esperado:**
- Tiempo de inferencia medido
- Comparación con objetivo (debe ser MUCHO más rápido que 200ms)
- Justificación de viabilidad para tiempo real

---

### **Validación Económica (líneas 1170-1220)**

**OPCIONAL - Pero muy valorado por el jurado**

**Instrucciones:**

1. **Cálculo de pérdidas evitadas (líneas 1180-1205):**
   - Reemplaza:
     ```latex
     Fraudes bloqueados proactivamente: 1.13M × TU_RECALL = X tx
     Pérdidas evitadas: X × $252 = $XXM/año
     ```
   - Si tienes datos reales de pérdidas de TechSport, úsalos en lugar de \$252 promedio

2. **Tabla de impacto económico (líneas 1210-1225):**
   - Calcula:
     - Pérdidas sin ML: Total fraudes × monto promedio
     - Pérdidas con ML: Fraudes NO detectados (FN) × monto promedio
     - Ahorro = Diferencia

3. **ROI (líneas 1230-1240):**
   - Costo de desarrollo: \$50K (2 meses de trabajo)
   - Ahorro anual: \$XXM
   - ROI = (Ahorro - Costo) / Costo × 100%

**Resultado esperado:**
- Estimación conservadora de ahorro económico
- ROI > 1000% (esperado)
- Justificación de inversión

---

## 📖 CONCLUSIONES DEL CAPÍTULO 3

### **Ubicación:** Líneas 1250-1280

**Instrucciones:**

1. **Resumen de hallazgos (líneas 1260-1290):**
   - Resume en 7-10 puntos numerados:
     1. Modelo implementado (Random Forest con X árboles)
     2. Objetivos cumplidos (F1, Recall, Precision, AUC-ROC)
     3. Comparación con literatura
     4. Features más importantes
     5. Viabilidad operacional (tiempo de inferencia)
     6. Impacto económico
     7. Validación metodológica

2. **Conexión con siguiente capítulo (líneas 1295-1300):**
   - Menciona que el Capítulo 4 discutirá:
     - Limitaciones del estudio
     - Trabajo futuro (XGBoost, Deep Learning, tiempo real)
     - Recomendaciones para TechSport

---

## 🎯 CHECKLIST FINAL ANTES DE ENVIAR

- [ ] **Resumen del capítulo** completo (200-300 palabras)
- [ ] **Justificación de Random Forest** con 5+ referencias bibliográficas
- [ ] **Tabla comparativa** RF vs XGBoost vs SVM vs DL completa
- [ ] **Código Python** de preprocesamiento ejecutado y resultados reportados
- [ ] **18 features** documentadas en tabla (o 15+ si modificaste)
- [ ] **Validación de no data leakage** confirmada (código ejecutado)
- [ ] **SMOTE** aplicado y resultados reportados (ratio antes/después)
- [ ] **División temporal** validada (train/val/test)
- [ ] **Modelo Random Forest** entrenado (tiempo reportado)
- [ ] **GridSearchCV** ejecutado (mejores hiperparámetros reportados)
- [ ] **Feature importance** analizado (gráfico + tabla Top 10)
- [ ] **Evaluación en test set** ejecutada (**4 métricas reportadas**)
- [ ] **Matriz de confusión** calculada (TP, TN, FP, FN)
- [ ] **Comparación con literatura** completa (tabla + interpretación)
- [ ] **Intervalos de confianza** calculados (bootstrap)
- [ ] **Tiempo de inferencia** medido y comparado con objetivo
- [ ] **Validación económica** calculada (ROI, ahorro)
- [ ] **Conclusiones del capítulo** redactadas (7-10 puntos)
- [ ] **Todas las secciones "[CONTENIDO A DESARROLLAR]"** completadas
- [ ] **Compilación LaTeX** exitosa (sin errores)

---

## 🚨 ERRORES COMUNES A EVITAR

### **1. Reportar métricas sin ejecutar código**
❌ **MAL:** Copiar los valores simulados de la plantilla
✅ **BIEN:** Ejecutar el código Python y reportar TUS resultados reales

### **2. No validar data leakage**
❌ **MAL:** Asumir que no hay data leakage sin verificar
✅ **BIEN:** Ejecutar el código de validación temporal y confirmar que `train_max_date < test_min_date`

### **3. Ignorar features faltantes**
❌ **MAL:** Usar features que no existen en tu dataset
✅ **BIEN:** Adaptar la tabla de features a TU dataset específico

### **4. No interpretar resultados**
❌ **MAL:** Reportar solo números sin explicación
✅ **BIEN:** Analizar QUÉ significan los números (ej: "El 23.4% de outliers son fraudes, confirmando que...")

### **5. Objetivos no cumplidos sin explicación**
❌ **MAL:** Marcar como ✅ CUMPLE cuando F1 = 0.82 (objetivo: 0.85)
✅ **BIEN:** Marcar como ❌ NO CUMPLE y explicar en conclusiones por qué

---

## 📞 SOPORTE ADICIONAL

Si tienes dudas sobre cómo completar alguna sección específica:

1. **Revisa el Capítulo 2** (capitulo2_diagnostico_MEJORADO.tex) como ejemplo de estructura
2. **Consulta el documento AQP_CORREGIDO_FINAL.md** para alinear con objetivos
3. **Lee Sampieri (2014, Capítulo 10)** sobre análisis cuantitativo de datos
4. **Revisa papers de referencia** (Hafez 2025, Carcillo 2018) para ver cómo reportan resultados

---

## ✅ RESUMEN EJECUTIVO

**Este capítulo demuestra que:**

1. ✅ Se implementó un modelo de Machine Learning supervisado basado en Random Forest
2. ✅ Se cumplieron los objetivos cuantificables (F1 ≥ 85%, Recall ≥ 90%, etc.)
3. ✅ El desempeño es comparable a benchmarks de literatura científica
4. ✅ El modelo es operacionalmente viable (tiempo de inferencia < 200ms)
5. ✅ La metodología es rigurosa y replicable (Sampieri 2014)

**Tiempo estimado para completar:**
- Ejecución de código Python: 8-12 horas (incluyendo GridSearch)
- Redacción de interpretaciones: 4-6 horas
- Revisión y correcciones: 2-3 horas
- **Total: 14-21 horas**

---

**¡Éxito con tu implementación!** 🚀

---

**Autor de esta guía:** Claude (Anthropic)
**Basado en:** Metodología Sampieri + Método AQP/CCA + Tarea 5 UAGRM
**Fecha:** Diciembre 2025
