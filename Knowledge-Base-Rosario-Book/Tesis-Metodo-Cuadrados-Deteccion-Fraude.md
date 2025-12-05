# MÉTODO DE LOS CUADRADOS - TESIS DE MAESTRÍA

---

## TÍTULO

**"Evaluación de la capacidad predictiva de un modelo basado en Random Forest para la detección de fraude en transacciones de pago digital. Caso TechSport Inc., gestión 2025"**

---

## AQP

### A – Adónde?

**TechSport Inc.**
- Sede principal: Miami, Florida, Estados Unidos
- Alcance operacional: Internacional (América y Europa)
- Sector: Plataforma SaaS para gestión de instalaciones deportivas de raqueta (tenis, pádel, pickleball, basketball)
- Infraestructura: Base de datos ClickHouse, arquitectura multicanal (Web, App Móvil, POS)
- Pasarelas de pago integradas: Stripe, CardConnect, Kushki, AzulPay, RazorPay, BAC (+10 gateways)

### Q – Quiénes?

**Transacciones de pago digital**

Definición: Evento único de pago procesado a través de cualquier pasarela de pago integrada en TechSport.

Características de cada transacción:
- Identificador único (transaction_id)
- Monto y moneda
- Timestamp (fecha y hora)
- Canal de origen (Web, App, POS)
- Gateway utilizado
- Usuario asociado (user_id)
- Resultado (aprobada, rechazada, fraudulenta)
- Etiqueta de fraude (is_fraud: 0 o 1)

**Población total:** 15.671.512 transacciones (gestión 2025)

| Canal | Porcentaje | Transacciones |
|-------|------------|---------------|
| Web | 64,59% | 10.122.305 |
| App Móvil | 12,83% | 2.010.635 |
| Transferencia bancaria | 12,61% | 1.976.198 |
| POS | 8,44% | 1.322.656 |
| Terminal móvil | 0,87% | 136.340 |
| Otros | 0,66% | 103.378 |
| **Total** | **100%** | **15.671.512** |

### Criterios de Inclusión y Exclusión de Transacciones

**Criterios de Inclusión:**
1. Transacciones procesadas entre el 01 de enero y 31 de diciembre de 2025
2. Transacciones con estado final definido (aprobada, rechazada o fraudulenta)
3. Transacciones con etiqueta `is_fraud` validada por el equipo de contabilidad
4. Transacciones con campos mínimos requeridos completos (transaction_id, monto, timestamp, user_id, gateway)
5. Transacciones procesadas a través de cualquiera de los gateways integrados en TechSport

**Criterios de Exclusión:**
1. Transacciones de prueba o sandbox (ambientes de desarrollo)
2. Transacciones con estado pendiente o incompleto al cierre del período
3. Transacciones con datos corruptos o inconsistentes
4. Transacciones internas de la empresa (transferencias entre cuentas TechSport)
5. Transacciones con monto igual a cero (cortesías, promociones 100%)
6. Transacciones duplicadas por error de sistema

### P – Qué problema?

**Variable Madre: FRAUDE TRANSACCIONAL**

> Nota metodológica: Según el método, la variable madre es un sustantivo sin adjetivos. NO es "transacciones fraudulentas" ni "falta de detección". El problema es el FRAUDE TRANSACCIONAL como fenómeno. Esta denominación se mantiene consistente en todo el documento.

Manifestaciones del problema en TechSport:

1. **Detección tardía:** Los fraudes se identifican post-mortem mediante chargebacks, entre 0 y 5 meses después de la transacción original

2. **Sistema reactivo:** Dependencia de reglas estáticas sin capacidad de aprendizaje automático

3. **Alta tasa de falsos positivos:** Rechazos incorrectos de pagos legítimos que afectan la experiencia del usuario

4. **Arquitectura fragmentada:** Múltiples gateways operando de forma aislada sin correlación cruzada de comportamientos

5. **Ausencia de predicción:** No existe modelo predictivo que alerte sobre transacciones sospechosas antes de su aprobación

---

## CCA

### Causas

**Causas Técnicas:**
1. Ausencia de arquitectura unificada para gestión de riesgo transaccional
2. Dependencia de reglas estáticas sin aprendizaje automático
3. Carencia de gobernanza sobre integraciones API

**Causas Operativas:**
4. Proceso de etiquetado post-mortem (fraudes identificados 0-5 meses después por chargebacks)
5. Fragmentación del ecosistema de pagos (10+ pasarelas con lógicas diferentes)

**Causas Organizacionales:**
6. Ausencia de equipo especializado en fraud analytics

### Consecuencias

Si el problema persiste:

**Consecuencias Económicas:**
1. Pérdidas financieras directas por fraudes consumados
2. Costos de chargebacks y disputas con bancos emisores
3. Multas regulatorias por incumplimiento de PCI DSS / NIST
4. Incremento de primas en seguros de procesamiento

**Consecuencias Operativas:**
5. Alta tasa de falsos positivos que rechaza pagos legítimos
6. Carga operativa excesiva en equipos de soporte y contabilidad
7. Incapacidad de escalar el sistema de detección

**Consecuencias Estratégicas:**
8. Deterioro de la confianza de usuarios institucionales (clubes deportivos)
9. Pérdida de competitividad frente a plataformas con IA
10. Riesgo reputacional por brechas de seguridad

### Aportes

**Tipo de estudio:** Correlacional-Explicativo (no experimental)

> Según el método CCA: Como este estudio NO implementa el aporte en producción real, sino que EVALÚA su capacidad predictiva sobre datos históricos, el aporte es una EVALUACIÓN EMPÍRICA.

**Aporte:** Evaluación de la capacidad predictiva de un modelo de Machine Learning supervisado basado en Random Forest para la detección de fraude transaccional.

El aporte incluye:

1. **Pipeline de preprocesamiento:**
   - Manejo de valores faltantes y outliers
   - Normalización de variables numéricas
   - Codificación de variables categóricas

2. **Feature Engineering (mínimo 15 características):**
   - Monto normalizado
   - Frecuencia transaccional del usuario
   - Velocidad transaccional (tiempo entre transacciones)
   - Hora del día y día de la semana
   - Ratio monto/promedio histórico del usuario
   - Historial de chargebacks previos
   - Canal y gateway utilizados
   - Geolocalización IP

3. **Estrategia de balanceo de clases:**
   - SMOTE o class_weight='balanced'

4. **Validación temporal:**

| Conjunto | Período | % | Transacciones |
|----------|---------|---|---------------|
| Training | Ene-Jun 2025 | 50% | 7.835.756 |
| Validation | Jul-Ago 2025 | 17% | 2.664.157 |
| Test | Sep-Dic 2025 | 33% | 5.171.599 |

5. **Métricas de evaluación:**
   - F1-Score ≥ 85%
   - Recall ≥ 90%
   - Precision ≥ 80%
   - AUC-ROC ≥ 0,92
   - Tiempo de inferencia < 200ms

---

## Variables

De acuerdo con el método:

### Variable Madre (VD) - Fraude transaccional

**Definición conceptual:**
Actividad ilícita que ocurre cuando una transacción de pago digital es realizada de manera engañosa, sin autorización legítima del titular de la cuenta o método de pago, con el propósito de obtener un beneficio económico indebido.

**Operacionalización para el estudio:**
El fraude transaccional se mide a través de la capacidad del modelo para identificar correctamente transacciones fraudulentas, distinguiéndolas de las legítimas.

**Definición operacional:**
Clasificación binaria de transacciones donde:
- Fraude (is_fraud = 1): Transacción identificada como fraudulenta
- No Fraude (is_fraud = 0): Transacción legítima

**Dimensiones e Indicadores:**

| Dimensión | Indicador | Fórmula | Meta |
|-----------|-----------|---------|------|
| Sensibilidad | Recall | TP / (TP + FN) | ≥ 90% |
| Exactitud | Precision | TP / (TP + FP) | ≥ 80% |
| Balance | F1-Score | 2×(Prec×Rec)/(Prec+Rec) | ≥ 85% |
| Discriminación | AUC-ROC | Área bajo curva ROC | ≥ 0,92 |
| Errores | Tasa Falsos Positivos | FP / (FP + TN) | < 5% |
| Eficiencia | Tiempo inferencia | ms/transacción | < 200ms |

**Escala de medición:** Nominal dicotómica + Razón (porcentajes)

### Segunda Variable (VI) - Modelo de Machine Learning (Random Forest)

**Definición conceptual:**
Algoritmo de aprendizaje automático supervisado de tipo ensemble que combina múltiples árboles de decisión entrenados con subconjuntos aleatorios de datos y características, generando predicciones por votación mayoritaria.

**Definición operacional:**
Modelo de clasificación binaria implementado con scikit-learn de Python, que produce:
1. Probabilidad de fraude (score entre 0 y 1)
2. Clasificación final (0 o 1) basada en umbral optimizado

**Dimensiones e Indicadores:**

| Dimensión | Indicador | Valores |
|-----------|-----------|---------|
| Arquitectura | Algoritmo | Random Forest |
| Complejidad | n_estimators | 100 - 500 árboles |
| Profundidad | max_depth | 10 - 20 niveles |
| Regularización | min_samples_split | 2 - 10 muestras |
| Balanceo | class_weight | 'balanced' o SMOTE |
| Características | Número de features | ≥ 15 variables |

---

## Título

**Fórmula aplicada (según base de conocimiento):**

Para estudios correlacionales-explicativos (no experimentales):
> *Evaluación de [Segunda Variable] para [Variable Madre] en [Q] de [A]. Temporalidad*

**Título resultante:**

> **"Evaluación de la capacidad predictiva de un modelo basado en Random Forest para la detección de fraude en transacciones de pago digital. Caso TechSport Inc., gestión 2025"**

**Desglose:**

| Componente | Contenido |
|------------|-----------|
| Acción investigativa | Evaluación de la capacidad predictiva |
| Segunda Variable (VI) | Modelo basado en Random Forest |
| Variable Madre (VD) | Detección de fraude |
| Q (Quiénes) | Transacciones de pago digital |
| A (Adónde) | Caso TechSport Inc. |
| Temporalidad | Gestión 2025 |

---

## Investigación Científica - según Sampieri

### 1. Enfoque (Paradigma): ¿Cómo conozco la realidad?

**[X] Cuantitativo**
[ ] Cualitativo
[ ] Mixto

**Justificación:**
- Se analizan datos numéricos (15.671.512 transacciones)
- Se utilizan métricas cuantitativas (Precision, Recall, F1-Score, AUC-ROC)
- Se aplican técnicas estadísticas (intervalos de confianza, bootstrap)
- Se prueban hipótesis con umbrales específicos
- Los resultados son replicables y verificables

---

### 2. Tipo (Propósito): ¿Para qué investigo?

[ ] Básica (Pura)
**[X] Aplicada**

**Justificación:**
- Resuelve un problema concreto de la empresa TechSport
- Genera una solución evaluable (modelo de ML)
- Los resultados tienen utilidad práctica
- El modelo puede transferirse a organizaciones similares

---

### 3. Alcance (Nivel): ¿Hasta dónde quiero llegar?

[ ] Exploratorio
[ ] Descriptivo
**[X] Correlacional**
**[X] Explicativo**

**Alcance: CORRELACIONAL-EXPLICATIVO**

**Componente Correlacional:**
- Se establece relación entre VI (Modelo Random Forest) ↔ VD (Detección de fraude)
- Se correlacionan features transaccionales ↔ Probabilidad de fraude

**Componente Explicativo:**
- La hipótesis establece relación causal: "SI se aplica el modelo Random Forest, ENTONCES se detectará fraude con F1 ≥ 85%"

---

### 4. Diseño de Investigación: ¿Cómo voy a recolectar los datos?

#### 4.1 Experimental vs No Experimental

[ ] Experimental (Manipula la VI)
   [ ] Pre-Experimental
   [ ] Cuasi-Experimental
   [ ] Experimento Puro

**[X] No Experimental (No manipula VI)**

**Justificación:**
- NO hay intervención sobre sujetos en tiempo real
- NO hay pre-test → tratamiento → post-test
- Los datos son observacionales retrospectivos
- El modelo NO altera las transacciones; las clasifica post-hoc sobre datos históricos

#### 4.2 Temporalidad

**[X] Transversal**
[ ] Longitudinal

**Justificación:**
- Los datos se extraen una sola vez (snapshot de gestión 2025)
- No hay mediciones repetidas sobre los mismos sujetos en diferentes momentos
- La división Train/Validation/Test es partición del censo, NO mediciones longitudinales

#### 4.3 Direccionalidad

**[X] Retrospectivo**
[ ] Prospectivo

**Justificación:**
- Los datos corresponden a transacciones ya ocurridas (gestión 2025)
- Las etiquetas de fraude fueron asignadas después de los eventos
- El investigador no genera nuevos datos; analiza históricos

---

### Diseño de Investigación Completo

> **No experimental, transversal, retrospectivo, correlacional-predictivo**

---

## Formulación del Problema

### Problema General

> ¿Cuál es la capacidad predictiva de un modelo basado en Random Forest para la detección de fraude en transacciones de pago digital de TechSport Inc. durante la gestión 2025?

### Problemas Específicos

**PE1 (Fundamentación teórica):**
> ¿Cuál es el fundamento teórico-técnico que respalda el uso de modelos de Machine Learning supervisados, particularmente Random Forest, para la detección de fraude en pagos digitales según la literatura científica 2020-2025?

**PE2 (Diagnóstico):**
> ¿Cuáles son las características y patrones de fraude presentes en el dataset histórico de transacciones de TechSport (gestión 2025)?

**PE3 (Desarrollo):**
> ¿Cómo estructurar un modelo de Machine Learning basado en Random Forest que clasifique transacciones fraudulentas mediante pipeline de preprocesamiento, feature engineering y optimización de hiperparámetros?

**PE4 (Evaluación):**
> ¿Qué nivel de desempeño (F1-Score, Recall, Precision, AUC-ROC) alcanza el modelo en el test set temporal independiente, y cómo se compara con benchmarks de literatura científica?

---

## Objetivos

### Objetivo General

> **Evaluar** la capacidad predictiva de un modelo basado en Random Forest para la detección de fraude en transacciones de pago digital de TechSport Inc. (gestión 2025), mediante métricas de clasificación binaria y comparación con benchmarks de literatura científica.

**Estructura del objetivo:**
- **Verbo en infinitivo:** Evaluar
- **Qué:** Capacidad predictiva del modelo Random Forest
- **Para qué:** Detección de fraude
- **Dónde:** Transacciones de pago digital de TechSport Inc.
- **Cuándo:** Gestión 2025

### Objetivos Específicos

**OE1 – Fundamentación Teórica:**
> **Fundamentar teóricamente** los modelos de Machine Learning supervisados aplicados a detección de fraude en pagos digitales, con énfasis en Random Forest, mediante revisión de literatura científica del periodo 2020-2025.

**OE2 – Diagnóstico:**
> **Caracterizar** los patrones de fraude presentes en el dataset histórico de TechSport (gestión 2025) mediante análisis exploratorio de datos.

**OE3 – Desarrollo:**
> **Desarrollar** un modelo de Machine Learning basado en Random Forest mediante pipeline de preprocesamiento, feature engineering, balanceo de clases y optimización de hiperparámetros.

**OE4 – Evaluación:**
> **Evaluar** el desempeño del modelo mediante métricas de clasificación (F1-Score, Recall, Precision, AUC-ROC) en el test set temporal independiente, comparando con benchmarks de literatura científica.

---

## Hipótesis

### Hipótesis General

> El modelo de Machine Learning basado en Random Forest posee capacidad predictiva significativa para la detección de fraude transaccional, alcanzando F1-Score ≥85%, Recall ≥90% y Precision ≥80% en el dataset de TechSport (gestión 2025), comparable a benchmarks reportados en literatura científica.

**Tipo de hipótesis:** Correlacional-causal

### Hipótesis Específicas

**HE1 – Fundamentación Teórica:**
> Al menos el 70% de los estudios científicos revisados del periodo 2020-2025 reportan que Random Forest alcanza F1-Score ≥80% en detección de fraude financiero, lo que constituye evidencia empírica suficiente para justificar su aplicación en el contexto de TechSport.

*Tipo: Hipótesis descriptiva cuantificable y falseable*
*Criterio de validación: Se revisarán mínimo 15 estudios; si <70% reportan F1≥80%, la hipótesis se rechaza*

**HE2 – Diagnóstico:**
> El análisis exploratorio del dataset de TechSport revela al menos 3 patrones de fraude recurrentes: tarjetas robadas/clonadas, transacciones duplicadas sospechosas, y comportamientos anómalos de usuarios.

**HE3 – Desarrollo:**
> Un modelo de Random Forest, entrenado con dataset balanceado y al menos 15 features comportamentales (transaccionales, temporales y de usuario), clasifica transacciones fraudulentas en el validation set temporal (Jul-Ago 2025) con Recall ≥90%, Precision ≥80% y AUC-ROC ≥0,90.

*Especificaciones técnicas migradas desde OE3:*
- *Mínimo 15 features derivadas del feature engineering*
- *Balanceo mediante SMOTE o class_weight='balanced'*
- *Optimización de hiperparámetros mediante GridSearchCV o RandomizedSearchCV*

**HE4 – Evaluación:**
> El modelo alcanza en el test set temporal independiente (Sep-Dic 2025, n=5.171.599 transacciones): F1-Score 85-90%, Recall ≥90%, Precision ≥80%, AUC-ROC ≥0,92, tiempo de inferencia <200ms. Los intervalos de confianza del 95% calculados mediante bootstrap confirman la robustez estadística de las métricas.

*Validación estadística especificada:*
- *Método: Bootstrap con reemplazo*
- *Iteraciones: 1.000 muestras aleatorias del test set*
- *Nivel de confianza: 95%*
- *Cálculo: Percentiles 2.5 y 97.5 de la distribución bootstrap para cada métrica*
- *Criterio de robustez: El límite inferior del IC95% debe superar los umbrales mínimos establecidos*

---

## Justificación

### Justificación Teórica
El estudio contribuye al conocimiento en Machine Learning aplicado a seguridad financiera, validando empíricamente la efectividad de Random Forest en un contexto real de pagos digitales multicanal del sector SaaS deportivo (nicho poco estudiado en literatura).

### Justificación Práctica
Responde a una necesidad operativa concreta de TechSport para mejorar la detección de fraude, reducir pérdidas económicas y cumplir con normativas internacionales (PCI DSS, NIST).

### Justificación Económica
Un modelo con Recall ≥90% implica detectar 90% de fraudes que actualmente pasan desapercibidos, generando ROI positivo mediante reducción de chargebacks y pérdidas directas.

**Estimación de ahorro proyectado:**

| Concepto | Cálculo | Estimación Anual |
|----------|---------|------------------|
| Transacciones totales | 15.671.512 | - |
| Tasa de fraude estimada | ~0,5% | ~78.357 fraudes |
| Monto promedio por fraude | ~$150 USD | - |
| Pérdida potencial total | 78.357 × $150 | ~$11.753.550 USD |
| Detección actual (estimada) | ~40% | ~$4.701.420 USD recuperados |
| Detección con modelo (Recall 90%) | 90% | ~$10.578.195 USD recuperados |
| **Ahorro incremental proyectado** | 90% - 40% | **~$5.876.775 USD/año** |

*Nota: Estimaciones basadas en benchmarks de la industria fintech. Los valores reales serán calculados con datos de TechSport durante el diagnóstico (OE2).*

**Costos adicionales evitados:**
- Reducción de chargebacks (~$25-100 USD por disputa)
- Disminución de multas por incumplimiento PCI DSS
- Menor carga operativa en equipos de soporte

### Justificación Metodológica
El estudio aplica rigurosidad metodológica según Sampieri en ciencias computacionales. El pipeline reproducible y la validación estadística (bootstrap) aportan un modelo metodológico replicable.

### Justificación Social
Protege a usuarios finales (atletas, clubes deportivos) de ser víctimas de fraude o de ver rechazados sus pagos legítimos.

### Justificación Investigativa
Deja abierta la posibilidad de que otros investigadores amplíen los hallazgos, aplicando el modelo a otros contextos fintech o comparando con otros algoritmos.

---

## Alcances y Delimitaciones

### Alcance Social
- **Unidad de análisis:** 15.671.512 transacciones de pago digital
- **Usuarios indirectamente beneficiados:** Atletas, clubes deportivos, operadores de instalaciones

### Alcance Temporal
- **Período de datos:** Gestión 2025 (enero-diciembre)
- **Duración del estudio:** 3 meses

### Alcance Geográfico
- **Empresa:** TechSport Inc.
- **Sede:** Miami, Florida, Estados Unidos
- **Operación:** Internacional (múltiples países de América y Europa)

### Delimitaciones
1. **Acceso a datos:** Limitado a lo autorizado por TechSport
2. **Etiquetado:** Dependiente del proceso de contabilidad (chargebacks 0-5 meses)
3. **Recursos computacionales:** Según disponibilidad de infraestructura
4. **Generalización:** Resultados aplicables a contextos SaaS fintech similares

### Exclusiones
- Lavado de dinero
- Detección en tiempo real (streaming)
- Modelos de Deep Learning
- Análisis de imágenes o documentos de identidad

### Viabilidad
- [X] Acceso autorizado a datos
- [X] Infraestructura computacional disponible
- [X] Plazo de 3 meses factible
- [X] Conocimiento técnico del investigador en ML

---

## Población y Muestra

### Población
Totalidad de transacciones de pago procesadas por TechSport durante la gestión 2025: **15.671.512 registros**

### Muestra
**CENSO COMPLETO** (no muestreo)

**Justificación del censo:**
1. Disponibilidad técnica (datos almacenados y accesibles)
2. Capacidad computacional suficiente
3. Desbalance de clases (fraude <1%) requiere máximo volumen
4. Etiquetas verificadas por equipo de contabilidad

### Partición Temporal del Dataset

| Conjunto | Período | % | Transacciones |
|----------|---------|---|---------------|
| Training | Ene-Jun 2025 | 50% | 7.835.756 |
| Validation | Jul-Ago 2025 | 17% | 2.664.157 |
| Test | Sep-Dic 2025 | 33% | 5.171.599 |
| **Total** | **Ene-Dic 2025** | **100%** | **15.671.512** |

---

## Técnicas e Instrumentos de Recolección

### Técnica
- **Extracción de datos históricos:** Consultas SQL a base de datos ClickHouse
- **Análisis documental:** Revisión de documentación técnica interna
- **Revisión de literatura:** Búsqueda en bases académicas (IEEE, ACM, Scopus)

### Instrumentos
- Scripts de extracción de datos (Python/SQL)
- Pipeline de preprocesamiento (pandas, numpy, scikit-learn)
- Framework de modelado (scikit-learn: RandomForestClassifier)
- Herramientas de análisis exploratorio (matplotlib, seaborn)

---

## Operacionalización de Variables

### Variable Dependiente: Fraude transaccional

| Dimensión | Indicador | Instrumento | Escala |
|-----------|-----------|-------------|--------|
| Sensibilidad | Recall | Matriz de confusión | Razón (0-100%) |
| Exactitud | Precision | Matriz de confusión | Razón (0-100%) |
| Balance | F1-Score | Cálculo armónico | Razón (0-100%) |
| Discriminación | AUC-ROC | Curva ROC | Razón (0-1) |
| Errores | Falsos Positivos | Matriz de confusión | Razón (0-100%) |

### Variable Independiente: Modelo Random Forest

| Dimensión | Indicador | Instrumento | Escala |
|-----------|-----------|-------------|--------|
| Arquitectura | Tipo algoritmo | Configuración | Nominal |
| Complejidad | n_estimators | GridSearchCV | Razón |
| Profundidad | max_depth | GridSearchCV | Razón |
| Features | Cantidad | Feature engineering | Razón |
| Balanceo | Estrategia | SMOTE/class_weight | Nominal |

---

## Matriz de Consistencia

| Problema | Objetivo | Hipótesis | Variable | Indicadores |
|----------|----------|-----------|----------|-------------|
| **PG:** ¿Cuál es la capacidad predictiva de RF para detección de fraude? | **OG:** Evaluar capacidad predictiva del modelo RF | **HG:** Modelo alcanza F1≥85%, Recall≥90%, Precision≥80% | VI: Modelo RF / VD: Fraude transaccional | F1, Recall, Precision, AUC-ROC |
| **PE1:** ¿Fundamento teórico de RF? | **OE1:** Fundamentar teóricamente | **HE1:** ≥70% de estudios reportan F1≥80% | Marco teórico | % estudios, métricas reportadas |
| **PE2:** ¿Patrones de fraude en dataset? | **OE2:** Caracterizar patrones | **HE2:** ≥3 patrones identificados | Diagnóstico | Patrones, distribuciones |
| **PE3:** ¿Cómo desarrollar modelo? | **OE3:** Desarrollar pipeline | **HE3:** ≥15 features, Recall≥90%, Precision≥80% | Modelo RF | Features, hiperparámetros |
| **PE4:** ¿Desempeño en test set? | **OE4:** Evaluar métricas con IC95% | **HE4:** F1 85-90%, IC95% bootstrap | Métricas | IC 95%, benchmarks |

---

## Estructura de Capítulos

### Capítulo 1: Marco Teórico Conceptual
- Antecedentes de investigación (nacionales e internacionales)
- Bases teóricas: Machine Learning, Random Forest, Detección de fraude
- Marco conceptual (definiciones técnicas)
- Vinculación con OE1 y HE1

### Capítulo 2: Diagnóstico y Análisis Exploratorio
- Descripción del sistema actual de TechSport
- Análisis exploratorio del dataset (EDA)
- Caracterización de patrones de fraude
- Vinculación con OE2 y HE2

### Capítulo 3: Propuesta y Validación
- **Sección 3.1:** Pipeline de preprocesamiento y feature engineering
- **Sección 3.2:** Desarrollo del modelo Random Forest (OE3, HE3)
- **Sección 3.3:** Evaluación y métricas de desempeño (OE4, HE4)
- Comparación con benchmarks de literatura

### Conclusiones y Recomendaciones
- Respuesta a cada objetivo específico
- Validación/refutación de hipótesis
- Recomendaciones para TechSport
- Líneas de investigación futura

---

*Documento elaborado según Método de los Cuadrados y Metodología Sampieri (2018)*
*Maestría en Ciencias de la Computación - UAGRM*
*Gestión 2025*
