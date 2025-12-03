# BASE METODOLÓGICA DE TESIS
## Método de los Cuadrados según Sampieri (2018)

**Título de la Investigación**: Modelo de Machine Learning para la Detección de Fraude en Pagos Transaccionales de la Empresa TechSport, Gestión 2025

**Programa**: Maestría en Ciencias de la Computación
**Universidad**: Universidad Autónoma Gabriel René Moreno (UAGRM)
**Autor**: Ing. Adan Condori Callisaya
**Gestión**: 2025

---

# SECCIÓN I: MÉTODO AQP

## A – Adónde (Delimitación Espacial)

### Lugar de Investigación
**Empresa**: TechSport Inc.
**Tipo de organización**: Plataforma SaaS (Software as a Service)
**Rubro**: Gestión integral de instalaciones deportivas de raqueta (tenis, pádel, pickleball, basketball)
**Sede principal**: Miami, Florida, Estados Unidos
**Alcance operacional**: Internacional (múltiples países de América y Europa)

### Características del Entorno
- Arquitectura tecnológica multicanal (Web, App Móvil, POS)
- Integración con 10+ pasarelas de pago internacionales:
  - Stripe (principal)
  - CardConnect
  - Kushki (Latinoamérica)
  - AzulPay (República Dominicana)
  - RazorPay (India)
  - BAC (Centroamérica)
  - Otros gateways regionales
- Base de datos: ClickHouse (esquema `TechSport_db_production`)
- Volumen: Más de 15 millones de transacciones anuales

### Verificación de Acceso
El investigador es colaborador activo de TechSport con acceso autorizado a:
- Datos transaccionales históricos (anonimizados)
- Documentación técnica interna
- Reportes de chargebacks y disputas
- Infraestructura de desarrollo y pruebas

---

## Q – Quiénes (Unidad de Análisis)

### Definición de la Unidad de Análisis

Según Sampieri (2018, p. 174): *"Las unidades de análisis son los elementos sobre los cuales se recolectarán los datos"*.

**Unidad de análisis**: Transacción de pago digital

**Definición operacional de transacción**: Evento único de pago procesado a través de cualquier pasarela de pago integrada en TechSport, que contiene:
- Identificador único (transaction_id)
- Monto y moneda
- Timestamp (fecha y hora)
- Canal de origen (Web, App, POS)
- Gateway utilizado
- Usuario asociado (user_id)
- Resultado (aprobada, rechazada, fraudulenta)
- Etiqueta de fraude (is_fraud: 0 o 1)

### Población de Estudio

**Población**: Totalidad de transacciones de pago procesadas por TechSport durante la gestión 2025.

| Parámetro | Valor |
|-----------|-------|
| **Total de transacciones** | 15,671,512 |
| **Período** | Enero - Diciembre 2025 |
| **Fuente** | ClickHouse: `paybycourtDB_payments` |
| **Variable target** | `is_fraud` (binaria) |

### Distribución por Canal

| Canal | Porcentaje | Transacciones Aprox. |
|-------|------------|---------------------|
| Web | 64.59% | 10,122,305 |
| App Móvil | 12.83% | 2,010,635 |
| Transferencia bancaria | 12.61% | 1,976,198 |
| POS (Punto de venta) | 8.44% | 1,322,656 |
| Terminal móvil | 0.87% | 136,340 |
| Otros | 0.66% | 103,378 |

### Justificación del Censo Completo

Según Sampieri (2018, p. 196): *"Cuando la población es accesible en su totalidad y el procesamiento es viable, se recomienda el censo"*.

Se utiliza **censo completo** (no muestreo) porque:
1. **Disponibilidad técnica**: Los datos ya están almacenados y son accesibles
2. **Capacidad computacional**: La infraestructura permite procesar 15.6M+ registros
3. **Desbalance de clases**: El fraude representa <1% de transacciones; se requiere máximo volumen para entrenar modelos robustos
4. **Etiquetas verificadas**: La variable `is_fraud` está validada por el equipo de contabilidad

---

## P – Problema (Variable Madre)

### Identificación del Problema

Según el método AQP, la Variable Madre es el **sustantivo que nombra el problema**, sin adjetivos calificativos.

**Variable Madre**: **FRAUDE TRANSACCIONAL**

> **Nota metodológica**: NO es "transacciones fraudulentas" (adjetivo) ni "falta de detección" (negación). El problema es el **fraude** como fenómeno.

### Descripción del Problema

La empresa TechSport enfrenta un problema de **fraude transaccional** en sus pagos digitales, caracterizado por:

1. **Detección tardía**: Los fraudes se identifican post-mortem mediante chargebacks (0-5 meses después de la transacción)
2. **Sistema reactivo**: Dependencia de reglas estáticas sin capacidad de aprendizaje automático
3. **Alta tasa de falsos positivos**: Rechazos incorrectos de pagos legítimos que afectan la experiencia del usuario
4. **Arquitectura fragmentada**: Múltiples gateways sin correlación cruzada de comportamientos
5. **Ausencia de predicción**: No existe modelo predictivo que alerte sobre transacciones sospechosas antes de su aprobación

### Formulación del Problema

#### Problema General

> **¿En qué medida un modelo de Machine Learning supervisado basado en Random Forest permite mejorar la detección de fraude transaccional en los pagos digitales de TechSport durante la gestión 2025?**

#### Problemas Específicos

**PE1** (Fundamentación teórica):
> ¿Cuál es el fundamento teórico-técnico que respalda el uso de modelos de Machine Learning supervisados, particularmente Random Forest, para la detección de fraude en pagos digitales según la literatura científica 2020-2025?

**PE2** (Diagnóstico):
> ¿Cuáles son las limitaciones del sistema actual de detección de fraude de TechSport y qué patrones de fraude se identifican en el dataset histórico de gestión 2025?

**PE3** (Desarrollo):
> ¿Cómo desarrollar e implementar un modelo de Machine Learning supervisado basado en Random Forest que clasifique transacciones fraudulentas con Recall ≥90% y Precision ≥80%?

**PE4** (Evaluación):
> ¿Qué nivel de desempeño (F1-Score, Recall, Precision, AUC-ROC) alcanza el modelo implementado en el test set temporal independiente, y cómo se compara con benchmarks de literatura científica?

---

# SECCIÓN II: MÉTODO CCA

## C – Causas del Problema

Las causas del fraude transaccional en TechSport se organizan en tres niveles según su naturaleza:

### Causas Técnicas
1. **Ausencia de arquitectura unificada** para gestión de riesgo transaccional
   - No existe correlación entre comportamientos de diferentes gateways
   - Cada pasarela opera de forma aislada

2. **Dependencia de reglas estáticas** sin aprendizaje automático
   - Las reglas requieren actualización manual constante
   - No se adaptan a nuevos patrones de fraude

3. **Carencia de gobernanza sobre integraciones API**
   - Dificulta trazabilidad y análisis contextual
   - Inconsistencias en formatos de datos entre gateways

### Causas Operativas
4. **Proceso de etiquetado post-mortem**
   - Fraudes identificados 0-5 meses después por chargebacks
   - Imposibilidad de prevención en tiempo real

5. **Fragmentación del ecosistema de pagos**
   - 10+ pasarelas con lógicas diferentes
   - Múltiples monedas y regulaciones

### Causas Organizacionales
6. **Ausencia de equipo especializado en fraud analytics**
   - No hay científicos de datos dedicados a fraude
   - El equipo de contabilidad gestiona manualmente

---

## C – Consecuencias del Problema

Si el problema de fraude transaccional persiste sin solución:

### Consecuencias Económicas
1. **Pérdidas financieras directas** por fraudes consumados
2. **Costos de chargebacks** y disputas con bancos emisores
3. **Multas regulatorias** por incumplimiento de PCI DSS / NIST
4. **Incremento de primas** en seguros de procesamiento

### Consecuencias Operativas
5. **Alta tasa de falsos positivos** que rechaza pagos legítimos
6. **Carga operativa excesiva** en equipos de soporte y contabilidad
7. **Incapacidad de escalar** el sistema de detección

### Consecuencias Estratégicas
8. **Deterioro de la confianza** de usuarios institucionales (clubes deportivos)
9. **Pérdida de competitividad** frente a plataformas con IA
10. **Riesgo reputacional** por brechas de seguridad

---

## A – Aporte de la Investigación

### Tipo de Aporte
Según el método CCA, cuando el aporte se **implementa y evalúa** (no solo se sugiere), el estudio tiene componente experimental.

**Aporte**: Implementación de un modelo de Machine Learning supervisado (Random Forest) para detección de fraude transaccional.

### Descripción del Aporte

El modelo propuesto incluye:

1. **Pipeline de preprocesamiento**
   - Manejo de valores faltantes y outliers
   - Normalización de variables numéricas
   - Codificación de variables categóricas

2. **Feature Engineering** (mínimo 15 características)
   - Monto normalizado
   - Frecuencia transaccional del usuario (histórica)
   - Velocidad transaccional (tiempo entre transacciones)
   - Hora del día y día de la semana
   - Ratio monto/promedio histórico del usuario
   - Historial de chargebacks previos
   - Canal y gateway utilizados
   - Geolocalización IP (país/región)

3. **Estrategia de balanceo de clases**
   - SMOTE (Synthetic Minority Over-sampling Technique)
   - O class_weight='balanced' en Random Forest

4. **Validación temporal estricta**
   - Train: Ene-Jun 2025 (50%)
   - Validation: Jul-Ago 2025 (17%)
   - Test: Sep-Dic 2025 (33%)

5. **Métricas objetivo**
   - F1-Score ≥ 85%
   - Recall ≥ 90% (detectar fraudes reales)
   - Precision ≥ 80% (minimizar falsos positivos)
   - AUC-ROC ≥ 0.92
   - Tiempo de inferencia < 200ms

---

# SECCIÓN III: VARIABLES DE INVESTIGACIÓN

## Según Sampieri (2018)

Sampieri (2018, p. 138) define: *"Una variable es una propiedad que puede fluctuar y cuya variación es susceptible de medirse u observarse"*.

Para estudios de posgrado (Maestría), se requieren **dos variables** relacionadas.

---

## Variable Dependiente (VD) – Variable Madre

### Nombre
**Detección de fraude transaccional**

### Definición Conceptual
Capacidad de un sistema para identificar correctamente transacciones de pago que presentan características, patrones o comportamientos asociados a actividad fraudulenta, distinguiéndolas de transacciones legítimas.

Según Hafez et al. (2025): *"La detección de fraude en tarjetas de crédito mediante Machine Learning consiste en clasificar transacciones como fraudulentas o legítimas basándose en patrones aprendidos de datos históricos etiquetados"*.

### Definición Operacional
Clasificación binaria de transacciones donde:
- **Fraude (is_fraud = 1)**: Transacción identificada como fraudulenta mediante chargebacks confirmados, disputas resueltas como fraude, o reportes de usuarios verificados
- **No Fraude (is_fraud = 0)**: Transacción legítima sin incidentes reportados

La detección se mide mediante la capacidad del modelo de clasificar correctamente ambas clases.

### Dimensiones e Indicadores

| Dimensión | Indicador | Fórmula/Medición | Meta |
|-----------|-----------|------------------|------|
| **Sensibilidad** | Recall (Tasa de Verdaderos Positivos) | TP / (TP + FN) | ≥ 90% |
| **Exactitud** | Precision (Valor Predictivo Positivo) | TP / (TP + FP) | ≥ 80% |
| **Balance** | F1-Score | 2 × (Precision × Recall) / (Precision + Recall) | ≥ 85% |
| **Discriminación** | AUC-ROC | Área bajo curva ROC | ≥ 0.92 |
| **Errores** | Tasa de Falsos Positivos | FP / (FP + TN) | < 5% |
| **Eficiencia** | Tiempo de inferencia | Milisegundos por transacción | < 200ms |

### Escala de Medición
- **Tipo**: Nominal dicotómica (Fraude/No Fraude)
- **Métricas**: Razón (porcentajes 0-100%)

---

## Variable Independiente (VI) – Segunda Variable

### Nombre
**Modelo de Machine Learning (Random Forest)**

### Definición Conceptual
Algoritmo de aprendizaje automático supervisado de tipo ensemble que combina múltiples árboles de decisión entrenados con subconjuntos aleatorios de datos y características, generando predicciones por votación mayoritaria (clasificación) o promedio (regresión).

Según Breiman (2001): *"Random Forest es un clasificador que consiste en una colección de clasificadores estructurados como árboles, donde cada árbol emite un voto unitario para la clase más popular dado un vector de entrada"*.

### Definición Operacional
Modelo de clasificación binaria implementado con la biblioteca scikit-learn de Python, entrenado con el dataset de TechSport (15,671,512 transacciones de gestión 2025), que recibe como entrada un vector de características transaccionales y produce como salida:
1. Probabilidad de fraude (score entre 0 y 1)
2. Clasificación final (0 o 1) basada en umbral optimizado

### Dimensiones e Indicadores

| Dimensión | Indicador | Valores/Rango |
|-----------|-----------|---------------|
| **Arquitectura** | Algoritmo base | Random Forest (ensemble de árboles) |
| **Complejidad** | n_estimators | 100 - 500 árboles |
| **Profundidad** | max_depth | 10 - 20 niveles |
| **Regularización** | min_samples_split | 2 - 10 muestras |
| **Balanceo** | class_weight | 'balanced' o SMOTE |
| **Características** | Número de features | ≥ 15 variables |
| **Entrenamiento** | Tiempo de training | Medido en minutos |
| **Eficiencia** | Tiempo de inferencia | < 200 ms/transacción |
| **Tamaño** | Modelo serializado | Medido en MB |

### Escala de Medición
- **Hiperparámetros**: Razón (valores numéricos)
- **Configuración**: Nominal (opciones categóricas)

---

## Variables Intervinientes (Control)

Variables que podrían afectar la relación VI → VD y deben controlarse:

| Variable | Tipo | Categorías/Valores |
|----------|------|-------------------|
| Canal de pago | Nominal | Web, App Móvil, POS, Transferencia, Terminal |
| Gateway de pago | Nominal | Stripe, CardConnect, Kushki, AzulPay, RazorPay, BAC, Otros |
| Tipo de transacción | Nominal | Reserva, Membresía, Clínica, Cargo recurrente, One-time |
| País/Región | Nominal | USA, Latam, Europa, Otros |
| Moneda | Nominal | USD, EUR, MXN, COP, otros |

---

## Operacionalización de Variables (Tabla Resumen)

### Variable Dependiente: Detección de Fraude Transaccional

| Variable | Definición Conceptual | Definición Operacional | Dimensiones | Indicadores | Escala |
|----------|----------------------|------------------------|-------------|-------------|--------|
| Detección de fraude transaccional | Capacidad de identificar transacciones con características asociadas a actividad fraudulenta | Clasificación binaria (is_fraud: 0/1) medida por métricas de ML | Sensibilidad, Exactitud, Balance, Discriminación, Eficiencia | Recall, Precision, F1-Score, AUC-ROC, FPR, Tiempo inferencia | Nominal (clasificación), Razón (métricas) |

### Variable Independiente: Modelo de Machine Learning

| Variable | Definición Conceptual | Definición Operacional | Dimensiones | Indicadores | Escala |
|----------|----------------------|------------------------|-------------|-------------|--------|
| Modelo de Machine Learning (Random Forest) | Algoritmo ensemble de árboles de decisión para clasificación supervisada | Modelo scikit-learn entrenado con 15.6M transacciones, optimizado con GridSearch | Arquitectura, Complejidad, Regularización, Balanceo | n_estimators, max_depth, class_weight, num_features | Razón (numéricos), Nominal (categóricos) |

---

# SECCIÓN IV: CLASIFICACIÓN DE LA INVESTIGACIÓN SEGÚN SAMPIERI (2018)

## 1. Enfoque de Investigación
**Pregunta clave**: ¿Cómo conozco la realidad?

### Clasificación: **CUANTITATIVO**

**Justificación según Sampieri (2018, p. 4)**:
> *"El enfoque cuantitativo utiliza la recolección de datos para probar hipótesis con base en la medición numérica y el análisis estadístico, con el fin de establecer pautas de comportamiento y probar teorías"*.

**Evidencias en esta investigación**:
- Se analizan **datos numéricos** (15.6M+ transacciones)
- Se utilizan **métricas cuantitativas** (Precision, Recall, F1-Score, AUC-ROC)
- Se aplican **técnicas estadísticas** (intervalos de confianza, bootstrap)
- Se **prueban hipótesis** con umbrales específicos (F1 ≥ 85%)
- Los resultados son **replicables y verificables**

---

## 2. Tipo de Investigación
**Pregunta clave**: ¿Para qué investigo?

### Clasificación: **APLICADA**

**Justificación según Sampieri (2018, p. 29)**:
> *"La investigación aplicada tiene como propósito resolver problemas prácticos. El énfasis está en la solución de problemas específicos en contextos determinados"*.

**Evidencias en esta investigación**:
- Resuelve un **problema concreto** de la empresa TechSport
- Genera una **solución implementable** (modelo de ML)
- Los resultados tienen **utilidad práctica inmediata**
- El modelo puede **transferirse** a organizaciones similares

**Contraste con investigación básica**:
- NO busca generar teoría nueva sobre Machine Learning
- NO es exploración abstracta del fenómeno de fraude
- SÍ aplica conocimiento existente para resolver un problema específico

---

## 3. Alcance de Investigación
**Pregunta clave**: ¿Hasta dónde quiero llegar?

### Clasificación: **CORRELACIONAL-EXPLICATIVO**

**Justificación según Sampieri (2018, pp. 93-95)**:

#### Componente Correlacional
> *"Los estudios correlacionales tienen como finalidad conocer la relación o grado de asociación que exista entre dos o más conceptos, categorías o variables en una muestra o contexto particular"*.

**Evidencia**: Se establece la **relación entre**:
- VI (Modelo Random Forest) ↔ VD (Detección de fraude)
- Features transaccionales ↔ Probabilidad de fraude

#### Componente Explicativo
> *"Los estudios explicativos van más allá de la descripción de conceptos o fenómenos o del establecimiento de relaciones entre conceptos; es decir, están dirigidos a responder por las causas de los eventos y fenómenos"*.

**Evidencia**: La hipótesis establece **relación causal**:
- "SI se implementa el modelo Random Forest, ENTONCES se detectará fraude con F1 ≥ 85%"
- La VI (modelo) **causa** cambio en VD (capacidad de detección)

**Por qué NO es solo descriptivo**:
- NO solo describe características del fraude
- SÍ predice y explica relaciones causa-efecto

**Por qué NO es solo correlacional**:
- NO solo mide asociación entre variables
- SÍ establece que la implementación del modelo PRODUCE mejora en detección

---

## 4. Diseño de Investigación
**Pregunta clave**: ¿Cómo voy a recolectar los datos?

### Análisis según las Categorías de Sampieri

#### 4.1 Experimental vs. No Experimental

**Clasificación**: **NO EXPERIMENTAL**

**Justificación según Sampieri (2018, p. 152)**:
> *"En un estudio no experimental no se genera ninguna situación, sino que se observan situaciones ya existentes, no provocadas intencionalmente en la investigación por quien la realiza"*.

**Análisis para esta investigación**:

| Criterio Experimental | ¿Cumple? | Justificación |
|----------------------|----------|---------------|
| Manipulación de VI en tiempo real | ❌ NO | Las transacciones ya ocurrieron (datos históricos) |
| Asignación aleatoria a grupos | ❌ NO | No hay grupo experimental vs. control |
| Control de variables extrañas | Parcial | Se controlan en el modelado, no en la generación |

**Por qué NO es cuasiexperimental**:
- No hay intervención sobre sujetos/objetos en tiempo real
- No hay pre-test → tratamiento → post-test sobre el mismo grupo
- Los datos son **observacionales retrospectivos**

**Nota importante**: Aunque se "entrena" un modelo (aparente manipulación), esto ocurre sobre datos históricos, no sobre el fenómeno en tiempo real. El modelo no altera las transacciones; las clasifica post-hoc.

#### 4.2 Temporalidad de Recolección

**Clasificación**: **TRANSVERSAL**

**Justificación según Sampieri (2018, p. 154)**:
> *"Los diseños transversales recolectan datos en un solo momento, en un tiempo único"*.

**Análisis**:
- Los datos se extraen **una sola vez** (snapshot de gestión 2025)
- No hay mediciones repetidas sobre los mismos sujetos en diferentes momentos
- La división Train/Validation/Test es **partición del censo**, no mediciones longitudinales

**Aclaración**: La división temporal (Ene-Jun / Jul-Ago / Sep-Dic) es una **estrategia de validación de Machine Learning** para evitar data leakage, NO un diseño longitudinal. No se mide la evolución de las mismas transacciones en el tiempo.

#### 4.3 Direccionalidad Temporal

**Clasificación**: **RETROSPECTIVO**

**Justificación**:
- Los datos corresponden a transacciones **ya ocurridas** (gestión 2025)
- Las etiquetas de fraude fueron asignadas **después** de los eventos
- El investigador no genera nuevos datos; analiza históricos

#### 4.4 Propósito Analítico

**Clasificación**: **CORRELACIONAL-PREDICTIVO**

**Justificación**:
- Se busca **predecir** VD (fraude) a partir de VI (modelo con features)
- Se establece **correlación** entre características y resultado
- El modelo aprende patrones **asociativos** en los datos

---

### Diseño de Investigación Completo

> **Diseño**: No experimental, transversal, retrospectivo, correlacional-predictivo

**Notación resumida**: Diseño no experimental de corte transversal con análisis correlacional-predictivo sobre datos retrospectivos.

**Diagrama del diseño**:

```
                    GESTIÓN 2025 (Datos Históricos)
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
   Ene-Jun 2025          Jul-Ago 2025         Sep-Dic 2025
   (Training Set)       (Validation Set)      (Test Set)
      50%                   17%                  33%
   7,835,756 tx         2,664,157 tx         5,171,599 tx
        │                     │                     │
        ▼                     ▼                     ▼
   Entrenamiento    Optimización de        Evaluación
   del modelo       hiperparámetros         final
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
                              ▼
                    Métricas de Desempeño
                (F1, Recall, Precision, AUC-ROC)
```

---

# SECCIÓN V: HIPÓTESIS DE INVESTIGACIÓN

## Según Sampieri (2018)

Sampieri (2018, p. 107) define: *"Las hipótesis son explicaciones tentativas del fenómeno investigado que se formulan como proposiciones"*.

Para investigaciones correlacionales-explicativas, las hipótesis deben especificar la **relación esperada** entre variables.

---

## Hipótesis General

> **La implementación de un modelo de Machine Learning supervisado basado en Random Forest alcanza un F1-Score ≥85%, Recall ≥90% y Precision ≥80% en la detección de fraude transaccional del dataset de TechSport (gestión 2025), demostrando desempeño comparable a benchmarks reportados en literatura científica (F1-Scores de 85-94% según Hafez et al., 2025).**

### Estructura de la Hipótesis
- **VI**: Modelo de Machine Learning (Random Forest)
- **VD**: Detección de fraude transaccional
- **Relación**: La implementación de VI produce niveles específicos de VD
- **Métricas**: F1 ≥85%, Recall ≥90%, Precision ≥80%
- **Contexto**: Dataset TechSport, gestión 2025
- **Comparación**: Benchmarks de literatura científica

---

## Hipótesis Específicas

### HE1 – Fundamentación Teórica
> La revisión sistemática de literatura científica del periodo 2020-2025 identifica al menos 20 estudios que validan que los modelos de Machine Learning supervisados, particularmente Random Forest y enfoques de ensemble learning, constituyen un marco teórico-técnico respaldado para la detección de fraude en pagos digitales, reportando F1-Scores entre 85-94% y demostrando superioridad sobre sistemas basados en reglas estáticas en términos de adaptabilidad, precisión y escalabilidad.

**Tipo**: Hipótesis descriptiva
**Vinculación**: OE1, PE1

### HE2 – Diagnóstico
> El análisis exploratorio del dataset histórico de TechSport (gestión 2025) revela que el sistema actual basado en reglas estáticas presenta limitaciones operativas evidenciadas por: (i) transacciones fraudulentas detectadas post-mortem mediante chargebacks con retraso de 0-5 meses, (ii) ausencia de capacidad de aprendizaje automático, y (iii) al menos 3 patrones de fraude recurrentes no detectados eficazmente: tarjetas robadas/clonadas, transacciones duplicadas sospechosas, y comportamientos anómalos de usuarios.

**Tipo**: Hipótesis descriptiva-diagnóstica
**Vinculación**: OE2, PE2

### HE3 – Desarrollo
> Un modelo de Machine Learning supervisado basado en Random Forest, entrenado con dataset balanceado (SMOTE o class weights) y al menos 15 features comportamentales evitando data leakage, clasifica transacciones fraudulentas en el validation set temporal con Recall ≥90%, Precision ≥80% y AUC-ROC ≥0.92.

**Tipo**: Hipótesis correlacional-predictiva
**Vinculación**: OE3, PE3

### HE4 – Evaluación
> El modelo de Machine Learning implementado alcanza en el test set temporal independiente (Sep-Dic 2025, n=5,171,599 transacciones):
> - F1-Score: 85-90%
> - Recall: ≥90%
> - Precision: ≥80%
> - AUC-ROC: ≥0.92
> - Tiempo de inferencia: <200ms por transacción
>
> Los intervalos de confianza del 95% (bootstrap, 1000 muestras) confirman la robustez estadística de las métricas, y el desempeño es comparable o superior a benchmarks de literatura científica.

**Tipo**: Hipótesis correlacional-explicativa con componente comparativo
**Vinculación**: OE4, PE4

---

# SECCIÓN VI: OBJETIVOS DE INVESTIGACIÓN

## Objetivo General

> **Implementar un modelo de Machine Learning supervisado basado en Random Forest para la detección de fraude transaccional en pagos digitales de TechSport, logrando F1-Score ≥85%, Recall ≥90% y Precision ≥80% en el test set temporal independiente (gestión 2025), y demostrando desempeño comparable a benchmarks de literatura científica.**

### Estructura del Objetivo
- **Verbo en infinitivo**: Implementar
- **Qué**: Modelo de Machine Learning (Random Forest)
- **Para qué**: Detección de fraude transaccional
- **Dónde**: Pagos digitales de TechSport
- **Cuándo**: Gestión 2025
- **Métricas de éxito**: F1 ≥85%, Recall ≥90%, Precision ≥80%

---

## Objetivos Específicos

### OE1 – Fundamentación Teórica
> **Fundamentar teóricamente** los modelos de Machine Learning supervisados aplicados a detección de fraude en pagos digitales, con énfasis en Random Forest y ensemble learning, mediante revisión sistemática de literatura científica del periodo 2020-2025, identificando métricas de evaluación, técnicas de feature engineering y estrategias de balanceo de clases.

**Verbo**: Fundamentar
**Capítulo asociado**: Marco Teórico (Cap. 1)
**Entregable**: Revisión de al menos 20 estudios científicos

### OE2 – Diagnóstico
> **Diagnosticar** la situación actual del sistema de detección de fraude de TechSport mediante análisis exploratorio del dataset histórico (gestión 2025), documentando el proceso de etiquetado de transacciones fraudulentas y caracterizando los principales patrones de fraude presentes.

**Verbo**: Diagnosticar
**Capítulo asociado**: Diagnóstico (Cap. 2)
**Entregable**: EDA completo, identificación de patrones de fraude

### OE3 – Desarrollo
> **Desarrollar e implementar** un modelo de Machine Learning supervisado basado en Random Forest mediante pipeline que incluya: preprocesamiento, feature engineering (≥15 features), balanceo de clases, división temporal del dataset, y optimización de hiperparámetros.

**Verbo**: Desarrollar e implementar
**Capítulo asociado**: Propuesta y Validación (Cap. 3, Sección 3.2)
**Entregable**: Modelo entrenado y documentado

### OE4 – Evaluación
> **Evaluar** el desempeño del modelo implementado mediante métricas de clasificación (F1-Score, Recall, Precision, AUC-ROC) aplicadas sobre el test set temporal independiente, calculando intervalos de confianza del 95% (bootstrap) y comparando con benchmarks de literatura científica.

**Verbo**: Evaluar
**Capítulo asociado**: Propuesta y Validación (Cap. 3, Sección 3.3)
**Entregable**: Métricas de evaluación, comparación con benchmarks

---

# SECCIÓN VII: MATRIZ DE CONSISTENCIA

| Problema | Objetivo | Hipótesis | Variables | Indicadores |
|----------|----------|-----------|-----------|-------------|
| **PG**: ¿En qué medida un modelo de Machine Learning supervisado basado en Random Forest permite mejorar la detección de fraude transaccional en los pagos digitales de TechSport durante la gestión 2025? | **OG**: Implementar un modelo de Machine Learning supervisado basado en Random Forest para la detección de fraude transaccional en pagos digitales de TechSport (gestión 2025), evaluando su desempeño mediante métricas de clasificación estándar y comparándolo con benchmarks de literatura  científica. | **HG**: El modelo alcanza F1≥85%, Recall≥90%, Precision≥80%, comparable a benchmarks (85-94%) | **VI**: Modelo de ML (Random Forest) | n_estimators, max_depth, class_weight, num_features |
| | | | **VD**: Detección de fraude transaccional | F1-Score, Recall, Precision, AUC-ROC, FPR, Tiempo inferencia |
| **PE1**: ¿Cuál es el fundamento teórico que respalda Random Forest para detección de fraude? | **OE1**: Fundamentar teóricamente modelos de ML para detección de fraude | **HE1**: La literatura (2020-2025) valida ML con F1 85-94% | VD: Marco teórico | Número de estudios revisados, F1-Scores reportados |
| **PE2**: ¿Cuáles son las limitaciones del sistema actual y patrones de fraude? | **OE2**: Diagnosticar situación actual del sistema de TechSport | **HE2**: Sistema presenta limitaciones y ≥3 patrones de fraude | VD: Diagnóstico | Patrones identificados, limitaciones documentadas |
| **PE3**: ¿Cómo desarrollar modelo con Recall≥90%, Precision≥80%? | **OE3**: Desarrollar modelo con pipeline completo | **HE3**: Modelo logra Recall≥90%, Precision≥80%, AUC-ROC≥0.92 en validation | VI: Modelo RF | Features, balanceo, hiperparámetros |
| **PE4**: ¿Qué desempeño alcanza el modelo en test set? | **OE4**: Evaluar desempeño con métricas y bootstrap | **HE4**: F1 85-90%, Recall≥90%, Precision≥80%, tiempo<200ms | VD: Métricas | F1, Recall, Precision, AUC-ROC, IC 95% |

---

# SECCIÓN VIII: JUSTIFICACIÓN DE LA INVESTIGACIÓN

## Justificación Teórica
El estudio contribuye al cuerpo de conocimientos en **Machine Learning aplicado a seguridad financiera**, validando empíricamente la efectividad de Random Forest en un contexto real de pagos digitales multicanal. Los hallazgos aportan evidencia sobre la aplicabilidad de técnicas de ensemble learning en plataformas SaaS del sector deportivo, ampliando el alcance de la literatura existente que se concentra principalmente en banca tradicional y e-commerce.

## Justificación Práctica
Responde a una **necesidad operativa concreta** de TechSport, que requiere mejorar su capacidad de detección de fraude para reducir pérdidas económicas, disminuir falsos positivos, y cumplir con normativas internacionales (PCI DSS, NIST). El modelo desarrollado es implementable en producción y transferible a organizaciones similares.

## Justificación Económica
La detección efectiva de fraude **previene pérdidas financieras** directas (fraudes consumados) e indirectas (chargebacks, disputas, multas regulatorias, daño reputacional). Un modelo con Recall ≥90% implica detectar 90% de fraudes que actualmente pasan desapercibidos.

## Justificación Metodológica
El estudio aplica **rigurosidad metodológica** según Sampieri (2018) en un contexto de ciencias computacionales, demostrando que las investigaciones de Machine Learning pueden estructurarse con el mismo rigor que investigaciones en ciencias sociales. El pipeline reproducible y la validación estadística (bootstrap) aportan un modelo metodológico replicable.

## Justificación Social
Protege a **usuarios finales** (atletas, clubes deportivos) de ser víctimas de fraude o de ver rechazados sus pagos legítimos. Contribuye a un ecosistema de pagos digitales más seguro y confiable.

---

# SECCIÓN IX: ALCANCES Y DELIMITACIONES

## Alcance Temático
- Detección de fraude en pagos digitales mediante Machine Learning supervisado
- Algoritmo específico: Random Forest (ensemble learning)
- Tipos de fraude incluidos:
  - Tarjetas robadas o clonadas
  - Transacciones duplicadas sospechosas
  - Comportamientos anómalos de usuarios

**Exclusiones**:
- Lavado de dinero
- Detección en tiempo real (streaming)
- Modelos de Deep Learning
- Análisis de imágenes o documentos de identidad

## Alcance Espacial
- **Empresa**: TechSport Inc.
- **Sede**: Miami, Florida, USA
- **Operación**: Internacional (múltiples países)

## Alcance Temporal
- **Período de datos**: Gestión 2025 (enero-diciembre)
- **Duración del estudio**: 2 meses

## Delimitaciones
1. **Acceso a datos**: Limitado a lo autorizado por TechSport
2. **Etiquetado**: Dependiente del proceso de contabilidad (chargebacks 0-5 meses)
3. **Recursos computacionales**: Según disponibilidad de infraestructura
4. **Generalización**: Resultados aplicables a contextos similares (SaaS fintech), con precaución en banca tradicional o criptomonedas

## Viabilidad
- ✅ Acceso autorizado a datos
- ✅ Infraestructura computacional disponible
- ✅ Plazo de 2 meses factible para los entregables definidos
- ✅ Conocimiento técnico del investigador en ML

---

# SECCIÓN X: TÍTULO DE LA INVESTIGACIÓN

## Fórmula del Título (según método)
> Implementación de **[APORTE]** para **[MEJORAR PROBLEMA]** en **[QUIÉNES]** de **[ADÓNDE]**, **[CUÁNDO]**

## Título Propuesto

> **"Modelo de Machine Learning basado en Random Forest para la Detección de Fraude Transaccional en Pagos Digitales de la Empresa TechSport, Gestión 2025"**

### Análisis del Título
- **Aporte**: Modelo de Machine Learning basado en Random Forest
- **Problema (VD)**: Detección de fraude transaccional
- **Quiénes**: Pagos digitales (transacciones)
- **Adónde**: Empresa TechSport
- **Cuándo**: Gestión 2025

---

# RESUMEN EJECUTIVO

| Elemento | Definición |
|----------|------------|
| **Título** | Modelo de Machine Learning basado en Random Forest para la Detección de Fraude Transaccional en Pagos Digitales de la Empresa TechSport, Gestión 2025 |
| **Enfoque** | Cuantitativo |
| **Tipo** | Aplicada |
| **Alcance** | Correlacional-Explicativo |
| **Diseño** | No experimental, transversal, retrospectivo, correlacional-predictivo |
| **Población** | 15,671,512 transacciones (censo completo) |
| **VI** | Modelo de Machine Learning (Random Forest) |
| **VD** | Detección de fraude transaccional |
| **Métricas objetivo** | F1≥85%, Recall≥90%, Precision≥80%, AUC-ROC≥0.92 |
| **Plazo** | 2 meses |

---

**Documento base para desarrollo de tesis**
**Metodología**: Sampieri (2018) + Método de los Cuadrados (AQP/CCA)
**Fecha**: Diciembre 2025
