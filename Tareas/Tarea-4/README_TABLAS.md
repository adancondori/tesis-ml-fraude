# Tablas Exportadas - Variable Independiente

## Archivos Generados

### 1. `tabla_variable_independiente.csv` (4.1 KB)
**Formato:** CSV (Comma-Separated Values)
**Uso:** Importar a Excel, Google Sheets, Python, R, SPSS, etc.
**Codificación:** UTF-8
**Separador:** Coma (,)
**Delimitador de texto:** Comillas dobles (")

**Columnas:**
- `Dimensión`: Dimensión de la variable independiente (1.1 o 1.2)
- `Indicador`: Código y nombre del indicador (ej: "1.1.1. Feature Importance por variable")
- `Técnica`: Técnica cuantitativa empleada
- `Instrumento`: Herramientas/instrumentos específicos
- `Actividades Concretas`: Pasos detallados (1-8 pasos por indicador)

**Filas:** 10 (1 encabezado + 9 indicadores)

---

### 2. `tabla_variable_independiente.md` (5.2 KB)
**Formato:** Markdown
**Uso:** Visualización en GitHub, editores markdown, conversión a HTML/PDF
**Ventajas:**
- Formato legible en texto plano
- Se renderiza automáticamente en GitHub
- Incluye resumen ejecutivo con estadísticas

**Contenido adicional:**
- Tablas separadas por dimensión (1.1 y 1.2)
- Resumen ejecutivo con:
  - Total de indicadores: 9
  - Técnicas empleadas
  - Instrumentos principales
  - Información del dataset (15.7M transacciones)
  - Objetivos de desempeño del modelo

---

## Estructura de los Datos

### Dimensión 1.1: Feature Engineering y Entrenamiento Inicial
**5 indicadores:**
1. Feature Importance por variable
2. Distribución de features transformadas
3. Métricas de entrenamiento (F1, Precision, Recall)
4. Ratio de balanceo de clases
5. Tiempo de inferencia (ms)

### Dimensión 1.2: Selección y Optimización de Algoritmo
**4 indicadores:**
1. Comparación RF vs. XGBoost vs. SVM
2. Hiperparámetros optimizados
3. Gap overfitting (train vs. validation)
4. Tamaño modelo serializado (MB)

---

## Cómo Usar los Archivos

### Importar CSV a Excel
1. Abrir Excel
2. Datos → Obtener datos externos → Desde texto/CSV
3. Seleccionar `tabla_variable_independiente.csv`
4. Configurar:
   - Delimitador: Coma
   - Origen del archivo: UTF-8
   - Calificador de texto: " (comillas dobles)

### Importar CSV a Google Sheets
1. Archivo → Importar
2. Subir `tabla_variable_independiente.csv`
3. Separador: Detectar automáticamente o Coma

### Leer en Python (pandas)
```python
import pandas as pd

df = pd.read_csv('tabla_variable_independiente.csv')
print(df.head())
print(f"Total indicadores: {len(df)}")
```

### Leer en R
```r
library(readr)

df <- read_csv("tabla_variable_independiente.csv")
head(df)
nrow(df)  # Total indicadores
```

---

## Notas Importantes

1. **Codificación UTF-8:** Los archivos usan UTF-8 para soportar caracteres especiales (≥, %, etc.)

2. **Comillas en CSV:** Las actividades concretas contienen comas, por eso están entre comillas dobles

3. **Actividades detalladas:** Cada indicador tiene entre 5-8 pasos concretos numerados

4. **Contexto del proyecto:**
   - Empresa: TechSport (ficticia)
   - Dataset: 15.7M transacciones (gestión 2025)
   - Base de datos: ClickHouse
   - Modelo: Random Forest para detección de fraude

5. **Objetivos cuantitativos:**
   - F1-Score ≥ 85%
   - Recall ≥ 90%
   - Precision ≥ 80%
   - AUC-ROC ≥ 0.92
   - Tiempo inferencia < 200ms

---

## Actualización

**Fecha de generación:** 21 de noviembre de 2025
**Fuente:** `instrumentos_constatacion_MEJORADO.tex` (Sección 6.1)
**Versión del documento:** v3.0 (Final con TechSport)

---

## Para Crear Excel Manualmente

Si necesitas un archivo Excel (.xlsx):

**Opción 1 - Desde Excel:**
1. Abrir el CSV en Excel (seguir pasos arriba)
2. Guardar como → Excel Workbook (.xlsx)

**Opción 2 - Desde Python:**
```python
import pandas as pd

df = pd.read_csv('tabla_variable_independiente.csv')
df.to_excel('tabla_variable_independiente.xlsx',
            index=False,
            engine='openpyxl')
```

**Opción 3 - Desde Google Sheets:**
1. Importar el CSV
2. Archivo → Descargar → Microsoft Excel (.xlsx)

---

## Contacto

Para preguntas sobre estos archivos, consultar el documento principal:
`instrumentos_constatacion_MEJORADO.pdf` (316 KB)
