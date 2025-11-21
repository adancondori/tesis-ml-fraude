Libro basado en el libro de la Dra Rosario Martines 


Implementación de un Modelo de Machine Learning para la detección de Anomalías y fraude en pagos transaccionales en la empresa PlaybyPoint 


✅ AQP (Método aplicado correctamente a tu investigación)
🅰️ A = ADÓNDE
PlaybyPoint: Empresa tecnológica especializada en la gestión de instalaciones deportivas, que maneja pagos a través de múltiples pasarelas (gateways) como Stripe, CardConnect, Kushki, entre otras. La investigación se centra en el entorno digital de procesamiento de pagos y en sus módulos internos de detección de fraude, tokenización de pagos, y eventos transaccionales.
🔍 Justificación A: Tienes acceso pleno a los datos y a la infraestructura técnica de la empresa, lo que permite la implementación práctica del modelo ML. Esto cumple con el criterio de accesibilidad del método AQP.

🎯 Q = QUIÉNES o QUÉ
Las transacciones de pago procesadas dentro del ecosistema digital de PlaybyPoint, específicamente aquellas relacionadas con:
Reservas de canchas
Membresías
Clínicas deportivas
Cargos recurrentes o one-time
Procesamiento de tarjetas, ACH y créditos pre pagados


🔍 Justificación Q: No trabajas directamente con personas, sino con datos transaccionales históricos y en tiempo real, lo cual es completamente válido según el método AQP. El “qué” aquí son los registros de pago multicanal, estructurados y registrados dentro del sistema.

🚨 P = PROBLEMA
Dificultades actuales en la detección de anomalías y  riesgos en pagos transaccionales
Dificultades actuales en la detección de riesgos, anomalías y fraude en pagos transaccionales, debido a:
Limitaciones del sistema actual basado en reglas estáticas
Ausencia de modelos predictivos de ML
Imposibilidad de detección temprana de fraude (detección post-mortem)
No existencia de correlación entre gateways
Falta de aprendizaje continuo del sistema


🔍 Justificación P: El problema está centrado en la incapacidad del sistema actual para identificar actividades fraudulentas y riesgos en tiempo real. Este problema técnico afecta directamente la seguridad financiera de la empresa y genera pérdidas económicas (fraude, chargebacks, etc.).

🔬 Variable Madre
ANOMALÍAS Y FRAUDE EN PAGOS TRANSACCIONALES
Riesgos en pagos transaccionales
Sub componentes incluidos:
Análisis de patrones anómalos en comportamientos de pago
Detección de fraude financiero en tiempo real
Riesgos transaccionales multicanal
Optimización del scoring de riesgo
Prevención de pérdidas económicas


✅ Esta variable es válida como variable madre porque:
Es el objeto central de análisis
Está alineada con tu campo profesional (tecnología, ingeniería de software, IA)
Tiene viabilidad técnica y operativa en el entorno que estás estudiando
Es observable, medible y susceptible de mejora a través de Machine Learning



🧩 En resumen:
Elemento
Descripción
A
PlaybyPoint (plataforma multicanal de pagos deportivos)
Q
Transacciones de pago (datos procesados en gateways como Stripe, CardConnect, etc.)
P
Dificultad para detectar anomalías y fraude con los métodos actuales (reglas estáticas, sin aprendizaje automático)
Variable Madre
Anomalías y Fraude en Pagos Transaccionales





🎯 VARIABLE MADRE (VARIABLE DEPENDIENTE)

🧪 Variable dependiente (lo que quieres mejorar/medir):
Detección de anomalías y fraude en pagos transaccionales
📏 ¿Cómo se mide?
Puedes operacionalizarla con indicadores de performance típicos en ML para clasificación binaria:
Precisión (Precision): % de predicciones correctas entre las que fueron clasificadas como fraude


Recall (Sensibilidad): % de fraudes detectados respecto a todos los fraudes reales


F1-score: Promedio ponderado de precisión y recall


Tasa de falsos positivos/negativos


Tiempo de respuesta (detección en tiempo real vs. post-transacción)



🧪 Variable independiente (lo que tú manipulas/introduces):
Modelo de Machine Learning aplicado a las transacciones
📌 Es la intervención que tú introduces para modificar el comportamiento del sistema actual (basado en reglas estáticas).
¿Cómo se manipula?
Diseño e implementación del modelo ML
Entrenamiento con dataset de pagos (etiquetados como normales o fraudulentos)
Comparación contra el sistema actual basado en reglas
Análisis de resultados en un entorno simulado o sandbox



⚙️ Variables intervinientes (de apoyo o contexto técnico)
Estas no las manipulas directamente, pero pueden influir en la relación entre tus variables principal y dependiente.
Variable
Tipo
Rol en el sistema
Arquitectura de pagos multicanal
Independiente secundaria
Medio técnico donde ocurre la intervención
Motor de reglas actual (FraudScorecard, etc.)
Independiente secundaria
Punto de comparación vs. ML
Tipo de transacción (reserva, membresía, compra, etc.)
Interviniente
Puede influir en la tasa de fraude
Canal de pago (web, POS, app)
Interviniente
Modula la complejidad del análisis
Origen IP, gateway, país, moneda
Interviniente
Afectan patrones de comportamiento, útiles como features
Volumen de transacciones
Interviniente
A mayor volumen, mayor necesidad de precisión y rendimiento en tiempo real


🧩 Esquema final de tus variables (para tesis experimental)
Tipo de variable
Nombre
Descripción
Cómo se mide
Dependiente (Madre)
Detección de anomalías y fraude
Capacidad del sistema para identificar pagos fraudulentos
Accuracy, Precision, Recall, F1, tiempo de detección
Independiente principal
Modelo de ML
Algoritmo que analiza y clasifica pagos como normales o fraudulentos
Entrenamiento, validación y desempeño en dataset
Independiente secundaria
Arquitectura actual de pagos
Infraestructura multicanal que procesa transacciones
No se mide directamente, pero se describe técnicamente
Interviniente
Canal de pago
Medio por el que se realiza la transacción
Web, App, POS, API
Interviniente
Tipo de transacción
Naturaleza del pago (reserva, membresía, producto)
Clasificación previa del sistema
Interviniente
Sistema de reglas actuales
Sistema existente de scoring y flags
Tasa de acierto comparativa con el nuevo modelo
Interviniente
Gateway de pago
Gateway por donde pasa el pago (Stripe, CardConnect, etc.)
Variable categórica para el modelo



























🧠 MÉTODO CCA 
Para la tesis:
 "Implementación de un Modelo de Machine Learning para la detección de Anomalías y Fraude en pagos transaccionales en la empresa PlaybyPoint"

🔍 C = CAUSAS
¿Por qué PlayByPoint no detecta eficazmente fraude en pagos transaccionales multicanal?
🔧 Causas Técnicas y Arquitectónicas:
Arquitectura monolítica y legacy, con baja modularidad y pobre escalabilidad, que limita la implementación de sistemas inteligentes distribuidos.
Ausencia de componentes especializados en detección de fraude; el enfoque actual se basa en reglas estáticas y scoring básico sin capacidades predictivas.
Falta de observabilidad técnica: No se dispone de sistemas de trazabilidad avanzada, logs inteligentes o monitoreo en tiempo real para evaluar riesgo dinámico.
No existe un pipeline de datos en tiempo real que permita extraer, procesar y analizar transacciones conforme ocurren.
Desconexión entre gateways: Cada pasarela opera de forma aislada, sin unificación de criterios de riesgo ni correlación cruzada entre comportamientos multicanal.
Procesamiento asincrónico sin inteligencia contextual, que impide capturar patrones anómalos cuando la transacción está en curso.


🏢 Causas Organizacionales:
El desarrollo de la plataforma se ha centrado en la expansión funcional y experiencia del usuario, dejando la seguridad transaccional como tarea secundaria.
No hay un equipo dedicado a ciencia de datos o ingeniería de riesgos financieros, lo que impide el diseño de modelos avanzados de detección.
Falta de políticas de seguridad proactiva y prevención de fraude, con un enfoque reactivo basado en parches y correcciones post-evento.


🌍 Causas del Entorno Externo:
Diversidad de gateways y canales (Stripe, CardConnect, Kushki, QR, POS, App) con distintos estándares de riesgo, lo que incrementa la complejidad del análisis.
Crecimiento exponencial del fraude digital post-pandemia, con técnicas más automatizadas y sofisticadas.
Regulaciones internacionales exigentes (PCI DSS, GDPR, AML/KYC) que requieren capacidades técnicas que la arquitectura actual no puede cumplir cabalmente.
Ausencia de normativas sectoriales específicas en el ecosistema digital deportivo, lo que deja a plataformas como PlaybyPoint sin referencias para mitigar riesgos.



⚠️ C = CONSECUENCIAS
¿Qué puede pasar si no se aborda el problema técnico y organizacional identificado?
📉 Corto Plazo (0–12 meses):
Aumento de transacciones fraudulentas, con pérdidas económicas directas.
Mayor cantidad de falsos positivos, afectando pagos legítimos y generando rechazo por parte de usuarios.
Fuga de clientes institucionales (clubes deportivos), que buscan plataformas con mayor confiabilidad.
Carga operativa elevada: más tiempo y recursos para manejar reclamos, chargebacks y atención a disputas.


🧨 Mediano Plazo (1–2 años):
Pérdida progresiva de confianza en el ecosistema digital de pagos deportivos.
Sanciones regulatorias y legales por incumplimientos de normativas de seguridad financiera.
Degradación de la reputación empresarial, que afecta captación de clientes, alianzas estratégicas e inversión tecnológica.


💣 Largo Plazo (2–5 años):
Estancamiento tecnológico por destinar recursos únicamente a contención de incidentes y mantenimiento.
Pérdida de competitividad frente a empresas fintech que sí aplican modelos de IA para detección de fraudes en tiempo real.
Reducción de ingresos operativos por fuga de clientes y baja retención.
Barrera para la inclusión financiera digital: usuarios desconfiados podrían migrar al uso de efectivo u opciones manuales, debilitando la digitalización del sector.



💡 A = APORTES
¿Qué aporta esta investigación? ¿Cómo busca mitigar el problema identificado?
🎯 Aporte Central (Acción que se implementará en la tesis):
Implementación de un modelo experimental basado en Machine Learning para detectar anomalías y fraude de pagos transaccionales por pagos multicanal procesados por PlaybyPoint.
Este modelo incluirá:
Entrenamiento supervisado con datos históricos de transacciones etiquetadas (fraudulentas y legítimas).
Integración de un sistema de scoring de riesgo dinámico, ajustable por tipo de canal, comportamiento del usuario y contexto transaccional.
Aplicación de algoritmos de aprendizaje automático que permiten detección temprana de patrones inusuales (ej. Isolation Forest, Autoencoders, Random Forest).
Combinación híbrida de reglas de negocio + ML, para mantener trazabilidad y explicabilidad de decisiones de bloqueo o alerta.
Rediseño parcial de la arquitectura de pagos, incorporando microservicios especializados, pipelines de datos en tiempo real y herramientas de observabilidad técnica.


🛠️ Aportes Complementarios:
Desarrollo de un modelo replicable para otras plataformas SaaS deportivas con similares necesidades de seguridad transaccional.
Contribución técnica a la industria: generación de buenas prácticas para la detección de fraude en pagos deportivos digitales.
Posibilidad de crear una certificación interna o estándar de ciberseguridad financiera para este tipo de ecosistemas.


📐 Tipo de estudio:
Experimental-aplicado, orientado a validar una solución técnica concreta en un entorno real (PlaybyPoint), mediante el análisis comparativo de desempeño entre el sistema actual y el nuevo modelo propuesto.
📊 Impacto Esperado:
Reducción de al menos 80% en el fraude no detectado
Incremento significativo en la precisión y recall del sistema
Disminución de tiempos de respuesta en más del 90%
Mejora en la percepción de seguridad por parte de usuarios institucionales
Mayor cumplimiento de normativas regulatorias nacionales e internacionales

✅ SÍNTESIS FINAL DEL MÉTODO CCA (MEJORADO)
Elemento
Contenido
C (Causas)
Deficiencias técnicas (arquitectura legacy, sin ML, sin trazabilidad), prioridades organizacionales equivocadas, complejidad del entorno multicanal y falta de estandarización.
C (Consecuencias)
Pérdidas económicas, sanciones regulatorias, deterioro de la confianza, estancamiento tecnológico, exclusión financiera.
A (Aportes)
Modelo de ML para detección de fraude en tiempo real, rediseño arquitectónico, sistema replicable, impacto medible.






























🎓 Elección del Diseño Metodológico
El diseño metodológico adoptado en esta investigación es de tipo experimental-aplicado, con un enfoque cuantitativo y tecnológico.
Se considera experimental, porque se implementará un modelo de Machine Learning como intervención concreta sobre el problema identificado: la limitada capacidad del sistema actual de PlaybyPoint para detectar anomalías y fraudes en pagos transaccionales. La investigación comparará el desempeño del sistema existente —basado en reglas estáticas— con el nuevo modelo predictivo propuesto, evaluando las mejoras alcanzadas en términos de precisión, recall, F1-score, tasa de falsos positivos y velocidad de detección.
Es también un estudio aplicado, ya que busca generar un artefacto tecnológico funcional: un modelo de detección de fraude soportado en una arquitectura multicanal, validado sobre datos históricos y transacciones reales de la empresa PlaybyPoint. La finalidad es resolver un problema técnico-operativo con impacto directo en la seguridad financiera y en la confianza de los usuarios institucionales.
El enfoque adoptado es cuantitativo, sustentado en el paradigma empírico-analítico, porque se fundamenta en la recolección, procesamiento y análisis estadístico-computacional de datos transaccionales. Esto permite medir objetivamente el desempeño del modelo en escenarios controlados (sandbox o preproducción) y establecer comparaciones con el sistema vigente.
El estudio se desarrollará en el periodo 2024–2025, mediante un proceso de entrenamiento, validación cruzada y pruebas de efectividad en condiciones controladas, lo que garantiza la rigurosidad de los resultados sin comprometer la operación en producción.
En síntesis, este diseño metodológico asegura una evaluación integral, contrastando el problema existente con la efectividad de la solución implementada, en coherencia con los objetivos, hipótesis y variables planteadas en la matriz de consistencia.












📊 MATRIZ DE CONSISTENCIA
Problemas
Objetivos
Hipótesis
Variables
Problema General 
¿Cómo mejorar la detección de anomalías y fraude en pagos transaccionales en la empresa PlaybyPoint?
Objetivo General 
Implementar un modelo de Machine Learning para la detección de anomalías y fraude en pagos transaccionales, mediante el análisis de datos históricos y patrones de comportamiento, con el fin de mejorar la seguridad financiera y la confiabilidad del sistema de pagos en la empresa PlaybyPoint.
Hipótesis General 
La implementación de un modelo de Machine Learning para la detección de anomalías y fraude en pagos transaccionales permite anticipar comportamientos fraudulentos con mayor precisión y rapidez que el sistema actual, mejorando significativamente la seguridad y confiabilidad del sistema de pagos en la empresa PlaybyPoint.
Variable Independiente (VI):
Modelo de Machine Learning implementado.
Variable Dependiente (VD):
Detección de anomalías y fraude en pagos transaccionales. Indicadores: precisión, recall, F1-score, tasa de falsos positivos, tiempo de detección, tasa de fraude no detectado.
Problema Específico 1 
¿Qué fundamentos teóricos sustentan el uso de modelos de Machine Learning en la detección de anomalías y fraude en sistemas de pago?
Objetivo Específico 1 
Fundamentar teóricamente las principales concepciones sobre detección de anomalías y fraude en sistemas de pago, así como los modelos de Machine Learning aplicados a la seguridad transaccional, para sustentar la base conceptual de la investigación.
Hipótesis Específica 1 
Los modelos de Machine Learning constituyen un enfoque teórico y práctico adecuado para la detección de anomalías y fraude en sistemas de pago, al superar las limitaciones de los sistemas basados en reglas estáticas.
Variable de Apoyo (teórica): 
Concepciones teóricas sobre ML, anomalias y fraude transaccional.
Problema Específico 2 
¿Cuál es la situación actual del sistema de detección de fraude de PlaybyPoint y cuáles son sus limitaciones técnicas y operativas?
Objetivo Específico 2 
Determinar la situación actual del sistema de detección de fraude de PlaybyPoint, identificando sus limitaciones técnicas y operativas basadas en reglas estáticas.
Hipótesis Específica 2 
El sistema actual de PlaybyPoint presenta limitaciones significativas al basarse en reglas estáticas, lo cual dificulta la detección temprana de fraude y genera altos índices de falsos positivos y pérdidas económicas.
Variable Interviniente: 
Sistema actual de reglas estáticas (baseline para comparación).
Problema Específico 3 
¿Cómo implementar un modelo de Machine Learning que permita mejorar la detección de anomalías y fraude en PlaybyPoint?
Objetivo Específico 3 
Implementar un modelo de Machine Learning para la detección de anomalías y fraude en los pagos transaccionales procesados por PlaybyPoint.
Hipótesis Específica 3 
La implementación del modelo de Machine Learning permitirá detectar patrones anómalos y fraudulentos superando las limitaciones del sistema basado en reglas.
Variable Independiente (VI): 
Modelo de Machine Learning aplicado (algoritmo elegido y entrenado).
Problema Específico 4 
¿Qué nivel de efectividad presenta el modelo de Machine Learning en comparación con el sistema actual de PlaybyPoint?
Objetivo Específico 4 
Evaluar la efectividad del modelo de Machine Learning en términos de precisión, recall, F1-score, tasa de falsos positivos y reducción del fraude no detectado, comparando sus resultados con el sistema actual de reglas estáticas.
Hipótesis Específica 4 
El modelo de Machine Learning presenta una mejora significativa en precisión, recall, F1-score y reducción del fraude no detectado, en comparación con el sistema de reglas estáticas de PlaybyPoint.
Variable Dependiente (VD): 
Detección de anomalías y fraude en pagos transaccionales (medida con métricas ML).






📌 Diagrama de Ishikawa – Problema central
Efecto (cabeza del pez):
 ❌ Limitada capacidad de PlaybyPoint para detectar anomalías y fraude en pagos transaccionales

🐟 Ramas principales y causas
1. Tecnología / Arquitectura
Arquitectura monolítica y poco modular.
Procesamiento asincrónico sin inteligencia contextual.
Falta de microservicios especializados en detección de fraude.
Integración fragmentada de múltiples pasarelas (Stripe, CardConnect, Kushki).
Ausencia de observabilidad avanzada (logs, métricas de riesgo, trazabilidad).


2. Datos y Algoritmos
Sistema actual basado en reglas estáticas (no aprende de patrones nuevos).
Falta de un pipeline de datos en tiempo real.
No existe correlación multicanal entre gateways.
Ausencia de modelos predictivos de ML y scoring dinámico.
Alta tasa de falsos positivos/negativos.


3. Organización / Recursos
Prioridad histórica en crecimiento funcional sobre seguridad.
Carencia de un equipo especializado en ciencia de datos y riesgos financieros.
Estrategia reactiva de seguridad (corrección post-fraude).
Escasos recursos asignados a innovación en seguridad.


4. Entorno Externo / Mercado
Incremento del fraude digital post-pandemia.
Modalidades de ataque cada vez más sofisticadas y automatizadas.
Competencia fintech que implementa IA para prevención proactiva.
Mayor volumen de transacciones en plataformas SaaS deportivas.


5. Regulación / Normativas
Presión de normativas internacionales (PCI DSS, GDPR, AML/KYC).
Limitaciones de la infraestructura actual para cumplir estándares.
Ausencia de regulaciones sectoriales específicas en SaaS deportivos.



