# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Descripción General
Tesis de Maestría en Ciencias de la Computación (UAGRM) sobre **detección de fraude en pagos transaccionales usando Machine Learning**. Proyecto LaTeX configurado para normas APA 7ª edición con estructura modular siguiendo la **estructura oficial UAGRM**.

**Autor**: Ing. Adan Condori Callisaya
**Universidad**: Universidad Autónoma Gabriel René Moreno (UAGRM)
**Programa**: Maestría en Ciencias de la Computación
**Año**: 2024-2025

## Estructura Oficial UAGRM

Este proyecto sigue estrictamente la estructura definida en `.claude/commands/tutor-tesis.md`:

### Estructura Completa:
1. **Secciones Preliminares** (00_*)
   - Introducción
   - Perfil (Antecedentes, Formulación, Objetivos, Justificación, Hipótesis, Diseño Metodológico)

2. **Capítulos Principales** (01-04)
   - **Capítulo 1**: Marco Teórico Conceptual
   - **Capítulo 2**: Diagnóstico y Análisis de Resultados
   - **Capítulo 3**: Propuesta y Validación
   - **Conclusiones y Recomendaciones**

3. **Secciones Finales**
   - Bibliografía (APA 7)
   - Apéndices

**IMPORTANTE**: Esta estructura NO incluye Capítulos 4 ni 5 separados. El desarrollo está integrado en el Capítulo 3 (Propuesta y Validación).

## Arquitectura del Documento

### Documento Principal (main.tex)
- **Clase**: `book` (12pt, a4paper, oneside)
- **Estructura**: `\frontmatter` → `\mainmatter` → `\appendix`
- **Método de inclusión**: `\input{}` (no usar `\include{}` para mejor control)
- **Estado actual**: ✅ Todos los capítulos activos y compilando correctamente

### Estructura de Archivos en capitulos/

```
capitulos/
├── 00_introduccion.tex          (5.8K)  - Introducción general
├── 00_perfil.tex               (44K)   - Perfil completo (Antecedentes/Objetivos/Hipótesis/Metodología)
├── 01_marco_teorico.tex        (22K)   - Capítulo 1: Marco Teórico Conceptual
├── 02_diagnostico.tex          (63K)   - Capítulo 2: Diagnóstico y Análisis de Resultados
├── 03_propuesta_validacion.tex (58K)   - Capítulo 3: Propuesta y Validación (OE3, OE4)
├── 04_conclusiones.tex         (42K)   - Conclusiones y Recomendaciones
└── _obsoletos/                         - Archivos respaldados (NO usar)
    ├── 01_antecedentes_OBSOLETO.tex
    ├── 03_metodologia.tex
    ├── 04_desarrollo.tex
    └── 05_resultados.tex
```

**Última limpieza**: 24 nov 2025 - Se movieron 4 archivos obsoletos a `_obsoletos/`

### Sistema de Configuración (config/)

El proyecto separa configuraciones en archivos modulares:

1. **paquetes.tex**: Todos los paquetes LaTeX y sus configuraciones
   - BibLaTeX con backend=biber, style=apa
   - Geometría: márgenes de 3cm (izq), 2.5cm (resto)
   - Interlineado: 1.5 (`\onehalfspacing`)
   - Listings configurado para Python con soporte UTF-8
   - **Colores definidos** (nov 2025):
     - `headerblue` RGB(41,128,185) - Encabezados de tablas
     - `lightblue` RGB(174,214,241) - Diagramas
     - `lightgreen` RGB(200,230,201) - Resaltar resultados

2. **formato.tex**: Estilos visuales del documento
   - Headers/footers con fancyhdr
   - Formato de títulos con titlesec
   - Captions personalizados para Figura/Tabla
   - Sangría de párrafo: 1.27cm (estándar APA)

3. **informacion.tex**: Metadatos (autor, tutor, universidad, etc.)

4. **comandos.tex**: Comandos personalizados definidos por el usuario

### Gestión de Bibliografía
- **Sistema**: BibLaTeX + Biber (NO BibTeX)
- **Estilo**: APA 7ª edición con `biblatex-apa`
- **Archivo**: `bibliografia/referencias.bib`
- **Comandos de cita**: `\textcite{}`, `\parencite{}` (NO usar `\cite{}`)
- **Estado actual**: 14 citekeys activos

## Metodología de la Investigación

### Información Clave del Proyecto:

**Objetivo General**:
Implementar un modelo de Machine Learning supervisado basado en Random Forest para la detección de transacciones fraudulentas y anómalas en pagos digitales de TechSport.

**Objetivos Específicos**:
- **OE1**: Revisión de literatura científica (Cap 1)
- **OE2**: Diagnóstico del sistema actual (Cap 2)
- **OE3**: Desarrollo del modelo Random Forest (Cap 3, Sección 3.2)
- **OE4**: Evaluación del modelo (Cap 3, Sección 3.3)

**Hipótesis General**:
El modelo alcanzará F1-Score ≥85%, Recall ≥90%, Precision ≥80%

**Dataset**:
- 15,671,512 transacciones (gestión 2025)
- División temporal: Train 50% (Ene-Jun), Validation 17% (Jul-Ago), Test 33% (Sep-Dic)
- Variable target: `is_fraud` (binaria)

**Enfoque Metodológico**:
Cuantitativo según Sampieri (2014), diseño cuasiexperimental retrospectivo

## Comandos de Compilación

### Compilación Completa (con bibliografía)
```bash
cd /Users/eidan/Documentation/Personal/Master/Perfil/Tesis-Latex
pdflatex main.tex
biber main           # NO usar bibtex
pdflatex main.tex
pdflatex main.tex
```

### Con latexmk (recomendado)
```bash
latexmk -pdf main.tex
```

### Limpiar Archivos Auxiliares
```bash
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.bcf *.run.xml *.fls *.fdb_latexmk *.synctex.gz
```

### Atajos en Cursor
- **Compilar**: Cmd+Alt+B
- **Ver PDF**: Cmd+Alt+V
- **Limpiar**: Cmd+Alt+C

### Verificación de Compilación
```bash
# Estado actual (24 nov 2025):
# ✅ Compilación exitosa: 121 páginas, 738KB
# ✅ Bibliografía procesada: 14 referencias
# ✅ Estructura UAGRM completa
```

## Normas APA 7 Implementadas

- **Sangría**: 1.27cm (0.5") en primera línea de cada párrafo
- **Interlineado**: 1.5 (configurado en formato.tex con `\onehalfspacing`)
- **Márgenes**: 3cm izquierda, 2.5cm resto
- **Fuente**: Latin Modern (lmodern) - similar a Times New Roman
- **Citas**: Sistema autor-fecha con biblatex-apa
- **Formato de títulos**: Según normas APA 7 (titlesec)

## Agregar Contenido

### Figuras
```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{nombre_archivo.png}
    \caption{Descripción}
    \label{fig:etiqueta}
\end{figure}
```

### Tablas con Colores
```latex
\begin{longtable}{|p{3cm}|p{4cm}|p{5cm}|}
\hline
\rowcolor{headerblue}
\textcolor{white}{\textbf{Columna 1}} &
\textcolor{white}{\textbf{Columna 2}} &
\textcolor{white}{\textbf{Columna 3}} \\
\hline
\endfirsthead

\hline
\rowcolor{headerblue}
\textcolor{white}{\textbf{Col 1}} &
\textcolor{white}{\textbf{Col 2}} &
\textcolor{white}{\textbf{Col 3}} \\
\hline
\endhead

Dato 1 & Dato 2 & Dato 3 \\
\hline

\rowcolor{lightgreen}
\textbf{Total} & Resultado & Valor \\
\hline
\end{longtable}
```

### Código Python
```latex
\begin{lstlisting}[style=python, caption=Descripción]
# Código aquí
import pandas as pd
df = pd.read_csv('data.csv')
\end{lstlisting}
```

### Diagramas TikZ
```latex
\begin{figure}[h]
\centering
\begin{tikzpicture}[node distance=2cm, auto,
    block/.style={rectangle, draw, fill=lightblue, text width=5em, text centered, rounded corners, minimum height=3em},
    data/.style={rectangle, draw, fill=lightgreen, text width=5em, text centered, rounded corners, minimum height=3em},
    line/.style={draw, -latex}]

\node [data] (input) {Input};
\node [block, below of=input] (process) {Process};
\node [data, below of=process] (output) {Output};

\path [line] (input) -- (process);
\path [line] (process) -- (output);

\end{tikzpicture}
\caption{Descripción del diagrama}
\label{fig:diagrama}
\end{figure}
```

### Citas Bibliográficas
```latex
\textcite{clave}      % Autor (año) - en el texto
\parencite{clave}     % (Autor, año) - entre paréntesis
```

## Vinculación Metodológica (CRÍTICO)

**Toda sección debe vincularse explícitamente a objetivos e hipótesis:**

```latex
% Ejemplo de vinculación correcta:
\textbf{Vinculación con OE3 y validación de HE3:}

Esta sección desarrolla el \textbf{Objetivo Específico 3}: \textit{"..."}

Asimismo, valida la \textbf{Hipótesis Específica 3 (HE3)}...
```

**Mapeo Capítulo → Objetivo → Hipótesis**:
- Cap 1 → OE1 → HE1 (Fundamentación teórica)
- Cap 2 → OE2 → HE2 (Diagnóstico)
- Cap 3 Sec 3.2 → OE3 → HE3 (Desarrollo)
- Cap 3 Sec 3.3 → OE4 → HE4 (Validación)

## Problemas Resueltos ✅

### ✅ UTF-8 en Código Python
**Estado**: Resuelto - Se implementó tabla `literate` en formato.tex para caracteres españoles

### ✅ Estructura de Capítulos
**Estado**: Resuelto - Estructura renumerada y alineada con UAGRM
- ~~Numeración inconsistente (02, 02, 03, 06)~~ → Ahora: 00, 00, 01, 02, 03, 04
- ~~Capítulos duplicados (desarrollo, resultados)~~ → Movidos a `_obsoletos/`

### ✅ Colores en Tablas
**Estado**: Resuelto - Definidos en paquetes.tex (líneas 119-122)

## Advertencias Importantes ⚠️

### NO Hacer:
- ❌ NO usar archivos de `capitulos/_obsoletos/` - están respaldados únicamente
- ❌ NO crear Capítulos 4 o 5 separados - no están en estructura UAGRM
- ❌ NO usar `\cite{}` - usar `\textcite{}` o `\parencite{}` (APA 7)
- ❌ NO usar BibTeX - usar Biber
- ❌ NO agregar contenido sin vincularlo a objetivos/hipótesis

### SÍ Hacer:
- ✅ Seguir estructura UAGRM (3 capítulos principales)
- ✅ Vincular TODO contenido a OE/HE correspondiente
- ✅ Usar colores definidos: headerblue, lightblue, lightgreen
- ✅ Mantener formato APA 7 estricto
- ✅ Compilar con ciclo completo: pdflatex → biber → pdflatex → pdflatex

## Referencias de Consulta

### Documentación Interna:
- **Estructura oficial**: `.claude/commands/tutor-tesis.md`
- **Archivos obsoletos**: `capitulos/_obsoletos/README.md`
- **Perfil completo**: `capitulos/00_perfil.tex` (objetivos, hipótesis, metodología)

### Scripts Útiles:
```bash
./setup_latex_packages.sh    # Instala paquetes necesarios
./verificar_instalacion.sh   # Verifica instalación completa
```

Verifica: LaTeX, Biber, tlmgr, estructura de archivos, paquetes esenciales, y compilación básica.

## Estado del Proyecto

**Última actualización**: 24 noviembre 2025

**Estado de compilación**: ✅ Funcional
- **Páginas**: 121
- **Tamaño PDF**: 738 KB
- **Referencias bibliográficas**: 14 citekeys procesados
- **Estructura**: Completa según normativa UAGRM

**Capítulos completados**:
- ✅ Introducción y Perfil
- ✅ Capítulo 1: Marco Teórico (OE1)
- ✅ Capítulo 2: Diagnóstico (OE2)
- ✅ Capítulo 3: Propuesta y Validación (OE3, OE4)
- ⏳ Conclusiones (pendiente completar secciones finales)

**Trabajo pendiente**:
- Completar secciones marcadas con `[CONTENIDO A DESARROLLAR]` en Cap 3
- Agregar imágenes faltantes (curva_roc.png, feature_importance.png)
- Completar referencias bibliográficas faltantes (Hosmer2013, Carcillo2018, VanVlasselaer2015)

## Archivos a Ignorar

Todos los auxiliares están en .gitignore:
```
*.aux *.log *.bbl *.bcf *.out *.toc *.lof *.lot
*.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz
```

**NOTA**: Los PDFs NO están ignorados - considerar según workflow del usuario.

---

**Última revisión**: 24 noviembre 2025
**Mantenido por**: Claude Code
**Versión**: 2.0 (post-limpieza y reestructuración UAGRM)
