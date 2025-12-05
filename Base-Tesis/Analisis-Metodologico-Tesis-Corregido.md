# Análisis Metodológico de Tesis - Método de los Cuadrados
## Detección de Fraude en Pagos Transaccionales con Machine Learning
### Maestría en Ciencias de la Computación - UAGRM

**Autor**: Ing. Adan Condori Callisaya
**Fecha de análisis**: Diciembre 2025
**Plazo de entrega**: 2 meses

---

## PARTE I: ANÁLISIS AQP (Adónde, Quiénes, Problema)

### A - Adónde (Delimitación Espacial)
**Lugar**: Empresa TechSport
**Descripción**: Plataforma SaaS de gestión de instalaciones deportivas de raqueta (tenis, pádel, pickleball, basketball)
**Sede**: Miami, Florida, Estados Unidos
**Característica**: Opera internacionalmente con múltiples pasarelas de pago (Stripe, CardConnect, Kushki, AzulPay, RazorPay, BAC)

**Verificación de acceso**: ✅ El investigador tiene acceso directo a los datos de la empresa.

---

### Q - Quiénes o Qué (Unidad de Análisis)
**Unidad de análisis**: Transacciones de pago digital
**Cantidad**: 15,671,512 transacciones
**Período**: Gestión 2025 (enero a diciembre)
**x**: Base de datos ClickHouse (esquema `TechSport_db_production.paybycourtDB_payments`)

**Canales de transacción**:
- Web: 64.59%
- App Móvil: 12.83%
- Transferencia bancaria: 12.61%
- POS: 8.44%
- Terminal móvil: 0.87%

**Nota importante**: Las unidades de análisis son TRANSACCIONES, no personas. Esto es correcto para un estudio de Machine Learning.

---

### P - Problema (Variable Madre)

#### INCOHERENCIA DETECTADA #1: Definición de la Variable Madre

**Según el Método AQP**: La variable madre es un sustantivo SIN adjetivos, que nombra el problema. NO debe ser "falta de...", "mala...", "baja..."

**En tu perfil actual dice**:
> "Transacciones fraudulentas y anómalas en pagos digitales"

**CORRECCIÓN NECESARIA**:
La **Variable Madre** correcta es: **FRAUDE TRANSACCIONAL** (o simplemente "Fraude")

**Justificación**:
- ❌ "Transacciones fraudulentas" incluye adjetivo calificativo
- ❌ "Anómalas" es otro adjetivo
- ✅ "Fraude" o "Fraude transaccional" es el sustantivo que nombra el problema

---

## PARTE II: ANÁLISIS CCA (Causas, Consecuencias, Aportes)

### C - Causas del Problema (Identificadas en tu perfil)

1. **Ausencia de arquitectura unificada** para gestión del riesgo transaccional
2. **Falta de automatización** en procesos de evaluación de fraude (dependen de reglas estáticas)
3. **Carencia de gobernanza efectiva** sobre integraciones entre sistemas y APIs
4. **Arquitectura fragmentada** por múltiples pasarelas de pago
5. **Ausencia de modelos predictivos** basados en Machine Learning

### C - Consecuencias del Problema (Si no se soluciona)

1. Incremento progresivo en tasa de **falsos positivos** (rechazos incorrectos)
2. **Detección post-mortem** de fraudes (chargebacks semanas/meses después)
3. Pérdida de **confianza** de usuarios en la plataforma
4. **Pérdidas económicas** directas (fraudes consumados, disputas)
5. **Carga operativa elevada** en equipos de soporte y contabilidad
6. Disminución de **competitividad** frente a plataformas fintech con IA
7. Posible **incumplimiento** de normativas internacionales (PCI DSS, NIST)

### A - Aporte (Lo que se va a hacer)

**Según tu perfil**: Implementar un modelo de Machine Learning supervisado basado en Random Forest para detectar transacciones fraudulentas.

**Tipo de aporte**: EXPERIMENTAL (se va a implementar y evaluar, no solo sugerir)

---

## PARTE III: VARIABLES DE INVESTIGACIÓN

### INCOHERENCIA DETECTADA #2: Identificación de Variables

**Según Sampieri y el Knowledge Base**:
- Para Maestría (post-grado): Se requieren **2 variables**
- La Variable Dependiente viene del **Problema** (Variable Madre)
- La Variable Independiente viene de las **Causas o Aportes** (lo que se propone)

#### Análisis de Variables Actual vs. Correcto:

| Aspecto | En tu Perfil Actual | Corrección Según Sampieri |
|---------|---------------------|---------------------------|
| **VI** | "Modelo de Machine Learning implementado" | ✅ CORRECTO - Viene del Aporte |
| **VD** | "Transacciones fraudulentas y anómalas" | ⚠️ PARCIALMENTE - Debería ser "Detección de fraude" o "Fraude transaccional" |

#### Variables Corregidas:

**Variable Independiente (VI)**: Modelo de Machine Learning (Random Forest)
- **Definición conceptual**: Algoritmo de aprendizaje automático supervisado de tipo ensemble que combina múltiples árboles de decisión para clasificación.
- **Definición operacional**: Modelo Random Forest entrenado con 15.6M+ transacciones etiquetadas, optimizado mediante GridSearch.

**Variable Dependiente (VD)**: Detección de fraude transaccional
- **Definición conceptual**: Capacidad de identificar correctamente transacciones que presentan características asociadas a actividad fraudulenta.
- **Definición operacional**: Clasificación binaria (Fraude=1, No Fraude=0) medida mediante métricas de precisión, recall y F1-Score.

**Variables Intervinientes** (Control): ✅ Correctamente identificadas
- Canal de pago (Web, App, POS)
- Tipo de transacción (Reserva, Membresía, etc.)
- Gateway de pago (Stripe, CardConnect, etc.)

---

## PARTE IV: DISEÑO DE INVESTIGACIÓN - SEGÚN SAMPIERI

### INCOHERENCIA DETECTADA #3: Clasificación del Diseño

**Tu perfil actual dice**: "Cuasiexperimental retrospectivo"

**Análisis según Sampieri (Metodología de la Investigación, 6ta Ed.)**:

#### 1. Enfoque (¿Cómo conozco la realidad?)
**CUANTITATIVO** ✅ CORRECTO
- Se analizan datos numéricos (transacciones)
- Se miden métricas cuantitativas (Precision, Recall, F1-Score)
- Se usan técnicas estadísticas para validar hipótesis

#### 2. Tipo (¿Para qué investigo?)
**APLICADA** ✅ CORRECTO
- Resuelve un problema concreto de la empresa TechSport
- Genera solución práctica implementable

#### 3. Alcance/Nivel (¿Hasta dónde quiero llegar?)

**En tu perfil**: "Descriptivo-correlacional-comparativo"

**CORRECCIÓN NECESARIA**: El alcance correcto es **EXPLICATIVO** (o al menos CORRELACIONAL-CAUSAL)

**Justificación según Sampieri**:
- **Descriptivo**: Solo describe características → NO aplica, tu estudio va más allá
- **Correlacional**: Establece relación entre variables sin causalidad → PARCIAL
- **Explicativo**: Establece relación causa-efecto → ✅ TU ESTUDIO

Tu hipótesis dice: "Si se implementa el modelo Random Forest, ENTONCES se detectará fraude con F1-Score ≥85%"

Esto es una **relación causal**: VI (modelo) → VD (detección de fraude)

**Alcance correcto**: **CORRELACIONAL-EXPLICATIVO**

#### 4. Diseño de Investigación (¿Cómo voy a recolectar los datos?)

**Análisis según las categorías de Sampieri**:

| Categoría | Tu Clasificación | Análisis |
|-----------|-----------------|----------|
| Experimental vs No Experimental | Cuasiexperimental | ⚠️ DEBATIBLE |
| Temporal | Retrospectivo | ✅ CORRECTO |
| Temporalidad de medición | Transversal | ✅ CORRECTO (aunque con división temporal) |

**INCOHERENCIA DETECTADA #4**: ¿Es realmente Cuasiexperimental?

**Según el Knowledge Base y Sampieri**:

Un diseño **Cuasiexperimental** requiere:
1. Manipulación de la Variable Independiente ✅ (entrenas el modelo)
2. Pre-test y Post-test comparables ❌ (no hay "antes" y "después" del mismo grupo)
3. Grupo de control o comparación ❌ (no tienes otro sistema con que comparar directamente)

**Alternativa más precisa**: **NO EXPERIMENTAL - CORRELACIONAL PREDICTIVO**

**Justificación**:
- NO manipulas las transacciones (ya están hechas)
- NO hay grupo de control experimental
- SÍ predices una variable (fraude) a partir de otras (features)
- SÍ validas el modelo con datos históricos

**PROPUESTA DE DISEÑO CORREGIDO**:

> **Diseño**: No experimental, retrospectivo, transversal, correlacional-predictivo

**O si se quiere mantener "experimental"**:

> **Diseño**: Pre-experimental retrospectivo con validación temporal

Porque:
- Es "pre-experimental" ya que solo hay un grupo (las transacciones)
- La división temporal (Train/Validation/Test) simula un pre-test/post-test
- No hay grupo de control verdadero

---

## PARTE V: COHERENCIA OBJETIVOS-PROBLEMAS-HIPÓTESIS

### INCOHERENCIA DETECTADA #5: Formulación del Problema

**Según el método**: El Problema General debe ser una pregunta que se responde con la Hipótesis General.

**Tu Problema General**:
> "¿Cómo mejorar la detección de transacciones fraudulentas y anómalas en pagos digitales de la empresa TechSport durante la gestión 2025?"

**Tu Hipótesis General**:
> "La implementación de un modelo de Machine Learning supervisado basado en Random Forest alcanza un F1-Score mínimo del 85%..."

**INCOHERENCIA**: La pregunta dice "¿Cómo mejorar?" y la hipótesis no responde directamente "cómo", sino "qué resultado se logrará".

**CORRECCIÓN PROPUESTA**:

**Problema General Corregido**:
> "¿La implementación de un modelo de Machine Learning supervisado basado en Random Forest permite detectar transacciones fraudulentas con F1-Score ≥85%, Recall ≥90% y Precision ≥80% en los pagos digitales de TechSport durante la gestión 2025?"

**O alternativamente**:
> "¿Qué nivel de precisión en la detección de fraude transaccional se logra mediante la implementación de un modelo de Machine Learning supervisado (Random Forest) en TechSport durante la gestión 2025?"

**Hipótesis General Corregida** (debe responder SÍ/NO con evidencia):
> "La implementación de un modelo de Machine Learning supervisado basado en Random Forest SÍ alcanza un F1-Score ≥85%, Recall ≥90% y Precision ≥80% en la detección de transacciones fraudulentas del dataset de TechSport (gestión 2025), demostrando desempeño comparable a benchmarks de literatura científica."

---

### MATRIZ DE CONSISTENCIA (Verificación de Alineación)

| # | Objetivo Específico | Problema Específico (como pregunta) | Hipótesis Específica | ¿Coherente? |
|---|---------------------|-------------------------------------|----------------------|-------------|
| 1 | Fundamentar teóricamente los modelos de ML... | ¿Cuál es el fundamento teórico que respalda el uso de Random Forest...? | HE1: La revisión de literatura valida que los modelos de ML... | ✅ |
| 2 | Diagnosticar la situación actual del sistema... | ¿Cuáles son las limitaciones del sistema actual de detección...? | HE2: El sistema actual presenta limitaciones operativas... | ✅ |
| 3 | Desarrollar e implementar un modelo de ML... | ¿Es posible desarrollar un modelo de ML que clasifique...? | HE3: Un modelo Random Forest puede clasificar con Recall ≥90%... | ✅ |
| 4 | Evaluar el desempeño del modelo... | ¿Qué nivel de desempeño alcanza el modelo implementado...? | HE4: El modelo alcanza F1-Score 85-90%... | ✅ |

**Resultado**: Los objetivos, problemas e hipótesis específicos SÍ están alineados entre sí.

---

## PARTE VI: POBLACIÓN Y MUESTRA

### INCOHERENCIA DETECTADA #6: Uso del término "Censo"

**Tu perfil dice**: "No aplica técnica de muestreo probabilístico (censo NO probabilístico)"

**CORRECCIÓN según Sampieri**:

Un **censo** significa usar TODA la población. En tu caso:
- Población = 15,671,512 transacciones
- "Muestra" = 15,671,512 transacciones (100%)

**El término correcto es**: **CENSO COMPLETO** (no "censo NO probabilístico")

**Justificación correcta**:
> "Se utilizó la totalidad de la población (censo completo) de 15,671,512 transacciones debido a: (i) disponibilidad computacional de los datos, (ii) necesidad de máximo volumen por desbalance de clases, y (iii) etiquetas ya verificadas disponibles."

### División Temporal del Dataset

**Tu división actual**:
- Train: 50% (Ene-Jun) = 7,835,756
- Validation: 17% (Jul-Ago) = 2,664,157
- Test: 33% (Sep-Dic) = 5,171,599

**Análisis**: ✅ CORRECTO metodológicamente para ML
- La división temporal evita data leakage
- El test set es independiente y representa "futuro"

**Nota importante**: Esta división NO es "muestreo" sino **partición del censo** para validación cruzada temporal.

---

## PARTE VII: TÉCNICAS E INSTRUMENTOS

### INCOHERENCIA DETECTADA #7: Clasificación de Técnicas

**Según el Knowledge Base**:
- Estudio Descriptivo → Técnica: Encuesta/Entrevista
- Estudio Experimental → Técnica: Experimento

**Tu estudio es híbrido**: Usa datos históricos (retrospectivo) pero aplica un modelo predictivo (experimental computacional)

**CORRECCIÓN de Técnicas**:

| Técnica | Descripción | Instrumento |
|---------|-------------|-------------|
| Extracción de datos | Obtención de datos de BD ClickHouse | Scripts SQL/Python |
| Análisis Exploratorio de Datos (EDA) | Caracterización del dataset | Jupyter Notebooks, Pandas, Matplotlib |
| Modelado Predictivo | Entrenamiento y evaluación del modelo | Scikit-learn, Random Forest |
| Análisis Documental | Revisión de literatura científica | Fichas bibliográficas, IEEE/ACM |

---

## PARTE VIII: PLANTILLA MÉTODO DE LOS CUADRADOS COMPLETA

### AQP

**A – Adónde?**
Empresa TechSport, plataforma SaaS de gestión de instalaciones deportivas, Miami, Florida, EE.UU. Operación internacional con múltiples pasarelas de pago.

**Q – Quiénes?**
15,671,512 transacciones de pago digital procesadas durante gestión 2025, a través de canales Web (64.59%), App Móvil (12.83%), Transferencia (12.61%), POS (8.44%) y Terminal móvil (0.87%).

**P – Qué problema?**
Fraude transaccional (detección ineficiente de transacciones fraudulentas por ausencia de sistemas inteligentes basados en Machine Learning)

---

### CCA

#### Causas
1. Ausencia de arquitectura unificada para gestión de riesgo transaccional
2. Dependencia de reglas estáticas sin capacidad de aprendizaje automático
3. Carencia de gobernanza efectiva sobre integraciones de APIs
4. Arquitectura fragmentada por múltiples gateways de pago
5. Falta de correlación cruzada entre comportamientos de diferentes canales

#### Consecuencias
1. Incremento de falsos positivos (rechazos incorrectos de pagos legítimos)
2. Detección post-mortem de fraudes (chargebacks 0-5 meses después)
3. Pérdidas económicas directas por fraudes consumados
4. Carga operativa elevada en equipos de soporte/contabilidad
5. Deterioro de confianza de usuarios y competitividad
6. Riesgo de incumplimiento de normativas PCI DSS/NIST

#### Aportes
Implementación de un modelo de Machine Learning supervisado (Random Forest) para detección automatizada de fraude con:
- F1-Score ≥ 85%
- Recall ≥ 90% (detectar fraudes reales)
- Precision ≥ 80% (minimizar falsos positivos)
- Tiempo de inferencia < 200ms por transacción

---

### Variables

#### Variable Madre (VD)
**Fraude transaccional** (o "Detección de fraude transaccional")

Definición operacional: Clasificación binaria de transacciones como fraudulentas (is_fraud=1) o legítimas (is_fraud=0), medida mediante:
- Tasa de fraude detectado (%)
- Precision de clasificación (%)
- Recall/Sensibilidad (%)
- F1-Score
- AUC-ROC
- Tasa de falsos positivos (%)

#### Segunda Variable (VI)
**Modelo de Machine Learning** (Random Forest)

Definición operacional: Algoritmo de clasificación supervisada tipo ensemble, entrenado con 15.6M+ transacciones, configurado con:
- Hiperparámetros optimizados (max_depth, n_estimators, class_weight)
- Feature engineering de 15+ características comportamentales
- Balanceo de clases (SMOTE o class_weight)
- Validación temporal (Train/Validation/Test)

---

### Investigación Científica - según Sampieri

#### 1. Enfoque (Paradigma): ¿Cómo conozco la realidad?
**CUANTITATIVO** ✅
- Análisis numérico de datos transaccionales
- Medición objetiva mediante métricas estandarizadas
- Validación estadística con intervalos de confianza

#### 2. Tipo (Propósito): ¿Para qué investigo?
**APLICADA** ✅
- Resuelve problema concreto de TechSport
- Genera solución práctica implementable
- Resultados transferibles a contextos similares

#### 3. Alcance (Nivel): ¿Hasta dónde quiero llegar?
**CORRELACIONAL-EXPLICATIVO** (Corregido)
- Correlacional: Establece relación VI → VD
- Explicativo: La VI (modelo) CAUSA mejora en VD (detección)
- NO es solo descriptivo porque hay predicción y causalidad

#### 4. Diseño de Investigación: ¿Cómo voy a recolectar los datos?

**Opción A (Recomendada)**:
> No experimental, retrospectivo, transversal, correlacional-predictivo

**Opción B (Si se quiere mantener experimental)**:
> Pre-experimental retrospectivo con validación temporal

**Justificación**:
- **NO experimental** porque no se manipulan las transacciones (ya ocurrieron)
- **Retrospectivo** porque usa datos históricos de gestión 2025
- **Transversal** porque la medición es en un solo período (aunque con partición temporal)
- **Correlacional-predictivo** porque predice VD a partir de VI
- **NO es cuasiexperimental puro** porque no hay grupo de control ni pre-test/post-test tradicional

---

## PARTE IX: RESUMEN DE CORRECCIONES NECESARIAS

### Correcciones Críticas (Deben hacerse)

| # | Elemento | Actual | Corregido |
|---|----------|--------|-----------|
| 1 | Variable Madre | "Transacciones fraudulentas y anómalas" | "Fraude transaccional" o "Detección de fraude" |
| 2 | Alcance | "Descriptivo-correlacional-comparativo" | "Correlacional-explicativo" |
| 3 | Diseño | "Cuasiexperimental retrospectivo" | "No experimental, retrospectivo, correlacional-predictivo" |
| 4 | Problema General | "¿Cómo mejorar...?" | "¿Qué nivel de precisión se logra...?" o "¿La implementación permite detectar con F1≥85%...?" |
| 5 | Población/Muestra | "Censo NO probabilístico" | "Censo completo" |

### Correcciones Menores (Recomendadas)

| # | Elemento | Sugerencia |
|---|----------|------------|
| 6 | Variable Dependiente | Renombrar a "Detección de fraude transaccional" para consistencia |
| 7 | Hipótesis General | Reformular para que responda directamente al problema |
| 8 | Técnicas | Especificar "Modelado predictivo" como técnica principal |

---

## PARTE X: CRONOGRAMA SUGERIDO (2 MESES)

Dado el plazo de 2 meses, aquí está una distribución realista:

### Semana 1-2: Correcciones Metodológicas y Marco Teórico
- [ ] Corregir el Perfil con las observaciones de este documento
- [ ] Actualizar variables, diseño y alcance
- [ ] Completar revisión de literatura (OE1, HE1)

### Semana 3-4: Diagnóstico y EDA
- [ ] Análisis exploratorio completo del dataset
- [ ] Documentar patrones de fraude identificados (OE2, HE2)
- [ ] Generar visualizaciones y estadísticas descriptivas

### Semana 5-6: Desarrollo del Modelo
- [ ] Feature engineering (15+ características)
- [ ] Entrenamiento y optimización de Random Forest
- [ ] Validación con conjunto de validación (OE3, HE3)

### Semana 7: Evaluación y Resultados
- [ ] Evaluación en test set temporal
- [ ] Cálculo de métricas (F1, Recall, Precision, AUC-ROC)
- [ ] Bootstrap para intervalos de confianza (OE4, HE4)

### Semana 8: Conclusiones y Revisión Final
- [ ] Redacción de conclusiones
- [ ] Verificación de coherencia metodológica
- [ ] Revisión final del documento

---

## PARTE XI: NOTAS FINALES

### Puntos Fuertes de tu Tesis ✅
1. **Dataset real y grande**: 15.6M+ transacciones es excelente para ML
2. **Objetivos bien estructurados**: Los 4 OE cubren teoría, diagnóstico, desarrollo y evaluación
3. **Métricas claras**: F1≥85%, Recall≥90%, Precision≥80% son medibles
4. **Justificación completa**: Teórica, práctica, económica y metodológica
5. **División temporal correcta**: Evita data leakage
6. **Hipótesis verificables**: Con umbrales numéricos específicos

### Puntos a Mejorar ⚠️
1. **Nomenclatura de variables**: Alinear con terminología de Sampieri
2. **Diseño de investigación**: Clasificar correctamente según Sampieri
3. **Problema general**: Debe ser pregunta que la hipótesis responda directamente
4. **Alcance**: Reconocer componente explicativo/causal

### Coherencia Final
Una vez aplicadas las correcciones, tu tesis tendrá:
- ✅ Alineación Problema → Objetivo → Hipótesis
- ✅ Variables correctamente definidas (VI, VD)
- ✅ Diseño coherente con el tipo de estudio
- ✅ Metodología fundamentada en Sampieri
- ✅ Resultados medibles y verificables

---

**Documento generado**: Diciembre 2025
**Basado en**: Metodología de la Investigación (Sampieri, 6ta Ed.) y Método AQP/CCA (Dra. Rosario Martínez)
