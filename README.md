# 📚 Tesis de Maestría - Detección de Fraude en Pagos Transaccionales

## 📋 Información General

**Título:** Implementación de un Modelo de Machine Learning para la Detección de Anomalías y Fraude en Pagos Transaccionales en la Empresa TechSport 2024 - 2025

**Autor:** Ing. Adan Condori Callisaya
**Email:** adancondori@gmail.com
**Tutor:** [Nombre del Tutor]
**Universidad:** Universidad Autónoma Gabriel René Moreno (UAGRM)
**Facultad:** Facultad de Ingeniería en Ciencias de la Computación y Telecomunicaciones
**Programa:** Maestría en Dirección Estratégica en Ingeniería de Software
**Línea de Investigación:** Sistemas Inteligentes - Sistemas Cognitivos
**Gestión:** 2024-2025
**Ciudad:** Santa Cruz, Bolivia

---

## 🎯 Objetivo del Proyecto

Implementar un modelo de Machine Learning (Random Forest) para detectar anomalías y fraude en transacciones de pagos digitales en la empresa TechSport, mejorando la seguridad financiera y reduciendo pérdidas por actividades fraudulentas.

**Palabras Clave:** Machine Learning, Detección de fraude, Pagos transaccionales, Anomalías, Seguridad financiera, Aprendizaje supervisado, Fintech, Random Forest

---

## 📁 Estructura del Proyecto

```
Tesis-Latex/
├── main.tex                    # Documento principal LaTeX
├── main.pdf                    # PDF generado (799KB, 136 páginas)
├── Makefile                    # Sistema de automatización de compilación
├── MAKEFILE_README.md          # Guía completa del Makefile
├── README.md                   # Este archivo
├── CLAUDE.md                   # Instrucciones para Claude Code
│
├── config/                     # Configuración del documento
│   ├── paquetes.tex           # Paquetes LaTeX (BibLaTeX, APA7, geometry)
│   ├── formato.tex            # Estilos (títulos, headers, captions)
│   ├── comandos.tex           # Comandos personalizados
│   ├── informacion.tex        # Metadatos del autor y tesis
│   ├── portada.tex            # Portada oficial UAGRM
│   ├── dedicatoria.tex        # Dedicatoria
│   ├── agradecimientos.tex    # Agradecimientos
│   ├── resumen.tex            # Resumen en español
│   └── abstract.tex           # Abstract en inglés
│
├── capitulos/                  # Capítulos de la tesis
│   ├── 00_introduccion.tex    # Introducción general
│   ├── 00_perfil.tex          # Perfil (antecedentes, objetivos, justificación)
│   ├── 01_marco_teorico.tex   # Marco Teórico Conceptual
│   ├── 02_diagnostico.tex     # Diagnóstico y Análisis de Resultados
│   ├── 03_propuesta_validacion.tex  # Propuesta y Validación
│   └── 04_conclusiones.tex    # Conclusiones y Recomendaciones
│
├── bibliografia/               # Referencias bibliográficas
│   └── referencias.bib        # 65 referencias en formato BibTeX (APA 7)
│
├── imagenes/                   # Recursos gráficos
│   ├── figuras/               # Figuras generales
│   ├── diagramas/             # Diagramas de flujo, arquitectura
│   ├── graficos/              # Gráficos y plots
│   └── logos/                 # Logos institucionales
│
├── tablas/                     # Archivos de tablas complejas (CSV)
│
├── apendices/                  # Apéndices
│   ├── apendice_a.tex         # Código fuente completo
│   ├── apendice_b.tex         # Datos adicionales
│   └── apendice_c.tex         # Documentación técnica
│
├── build/                      # Archivos temporales de compilación (ignorado)
├── output/                     # Archivos generados
│   ├── main_latest.pdf        # Última versión del PDF
│   ├── main_YYYYMMDD.pdf      # PDFs timestamped
│   ├── word/                  # Conversiones a Word (.docx)
│   ├── csv/                   # Tablas exportadas
│   └── imagenes/              # Imágenes extraídas
│
└── backup/                     # Backups timestamped (.tar.gz)
```

---

## 🚀 Inicio Rápido

### Prerrequisitos

- **MacTeX o BasicTeX** instalado
- **Homebrew** (opcional, para herramientas adicionales)

### Compilación Rápida

```bash
# Ver todos los comandos disponibles
make help

# Generar PDF completo
make pdf

# Generar PDF y abrirlo
make pdf && make view

# Exportar a todos los formatos (PDF, Word, CSV, Imágenes)
make all-exports
```

---

## 📊 Compilación del Documento

### Método 1: Makefile (Recomendado)

El proyecto incluye un **Makefile completo** con múltiples opciones:

```bash
# Compilación completa (3 pasadas + biber)
make pdf

# Compilación rápida (sin bibliografía)
make quick

# Modo borrador (ultra-rápido)
make draft

# Limpiar archivos temporales
make clean

# Limpieza completa (incluye PDFs)
make cleanall
```

**Exportación a otros formatos:**

```bash
# Exportar a Word (.docx)
make word

# Exportar tablas a CSV
make csv

# Extraer imágenes del PDF
make images

# Exportar todo
make all-exports
```

**Utilidades:**

```bash
# Ver estadísticas del documento
make stats

# Crear backup timestamped
make backup

# Abrir PDF
make view

# Verificar instalación de herramientas
make check
```

**Consulta la guía completa:** [`MAKEFILE_README.md`](MAKEFILE_README.md)

### Método 2: Compilación Manual

```bash
# Compilación completa (con bibliografía)
pdflatex main.tex
biber main           # NO usar bibtex
pdflatex main.tex
pdflatex main.tex

# Limpiar archivos temporales
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.bcf *.run.xml *.fls *.fdb_latexmk
```

### Método 3: Con latexmk

```bash
latexmk -pdf main.tex
```

### Método 4: Cursor/VSCode (LaTeX Workshop)

1. Abrir `main.tex`
2. Usar atajos de teclado:
   - **Cmd + Alt + B** - Compilar
   - **Cmd + Alt + V** - Ver PDF
   - **Cmd + Alt + C** - Limpiar

---

## 📚 Sistema de Referencias Bibliográficas

### Estadísticas Actuales

- **Total de referencias:** 65
- **Estilo:** APA 7ª edición (biblatex-apa)
- **Sistema:** BibLaTeX + Biber (NO BibTeX)
- **Archivo:** `bibliografia/referencias.bib`

### Tipos de Referencias

- Artículos científicos (journals IEEE, Springer, MDPI, etc.)
- Libros especializados (Machine Learning, Data Mining, Metodología)
- Tesis de maestría/doctorado
- Reportes técnicos (ENISA, PCI DSS, etc.)
- Preprints (arXiv)

### Cómo Citar

```latex
% Cita textual: Autor (año)
Según \textcite{Breiman2001}, los bosques aleatorios...

% Cita entre paréntesis: (Autor, año)
Los estudios recientes \parencite{James2021} demuestran...

% Múltiples citas
Diversos autores \parencite{Chawla2002,Chen2004,Kuhn2013}...
```

**IMPORTANTE:** NO usar `\cite{}`, usar siempre `\textcite{}` o `\parencite{}`.

---

## 📐 Normas APA 7 Implementadas

El documento cumple con las normas APA 7ª edición:

- ✅ **Sangría:** 1.27cm (0.5") en primera línea de párrafos
- ✅ **Interlineado:** 1.5 (`\onehalfspacing`)
- ✅ **Márgenes:** 3cm izquierda, 2.5cm resto
- ✅ **Fuente:** Latin Modern 12pt (similar a Times New Roman)
- ✅ **Citas:** Sistema autor-fecha con biblatex-apa
- ✅ **Referencias:** Ordenadas alfabéticamente

---

## ✏️ Edición y Personalización

### Actualizar Información Personal

Edita `config/informacion.tex`:

```latex
\newcommand{\nombreautor}{Tu Nombre Completo}
\newcommand{\emailautor}{tu.email@example.com}
\newcommand{\ciautor}{Tu CI}
\newcommand{\nombretutor}{Nombre del Tutor}
```

### Agregar Figuras

```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{figuras/arquitectura.png}
    \caption{Arquitectura del sistema propuesto}
    \label{fig:arquitectura}
\end{figure}

% Referenciar
Como se observa en la Figura \ref{fig:arquitectura}...
```

### Agregar Tablas

```latex
\begin{table}[H]
    \centering
    \caption{Métricas de evaluación del modelo Random Forest}
    \label{tab:metricas}
    \begin{tabular}{@{}lcccc@{}}
        \toprule
        Métrica & Valor & Interpretación \\
        \midrule
        Accuracy & 94.2\% & Excelente \\
        Precision & 92.1\% & Muy bueno \\
        Recall & 93.1\% & Muy bueno \\
        F1-Score & 92.6\% & Muy bueno \\
        AUC-ROC & 0.96 & Excelente \\
        \bottomrule
    \end{tabular}
\end{table}
```

### Agregar Código Python

```latex
\begin{lstlisting}[style=python, caption=Entrenamiento del modelo Random Forest]
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

# Dividir datos
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

# Entrenar modelo
rf_model = RandomForestClassifier(
    n_estimators=100,
    max_depth=10,
    random_state=42
)
rf_model.fit(X_train, y_train)

# Evaluar
accuracy = rf_model.score(X_test, y_test)
print(f"Accuracy: {accuracy:.2%}")
\end{lstlisting}
```

---

## 🔧 Instalación de Dependencias

### 1. Instalar LaTeX (MacTeX/BasicTeX)

```bash
# Opción 1: BasicTeX (ligero, recomendado)
brew install --cask basictex

# Opción 2: MacTeX (completo, ~4GB)
brew install --cask mactex

# Actualizar PATH
eval "$(/usr/libexec/path_helper)"

# Verificar instalación
pdflatex --version
biber --version
```

### 2. Instalar Paquetes LaTeX

```bash
# Dar permisos al script
chmod +x setup_latex_packages.sh

# Ejecutar instalación (requiere sudo)
./setup_latex_packages.sh
```

**Paquetes instalados:** biblatex-apa, csquotes, babel-spanish, titlesec, fancyhdr, caption, listings, booktabs, geometry, setspace, graphicx, hyperref, entre otros.

### 3. Herramientas Opcionales (para exportación)

```bash
# Para conversión a Word (.docx)
brew install pandoc

# Para extracción de imágenes/texto del PDF
brew install poppler

# Verificar instalación completa
make check
```

---

## 🐛 Solución de Problemas

### Error: "pdflatex not found"

```bash
# Actualizar PATH
eval "$(/usr/libexec/path_helper)"

# Reiniciar terminal y editor
```

### Error: "Package not found"

```bash
# Instalar paquete específico
sudo tlmgr install <nombre-paquete>

# Actualizar tlmgr
sudo tlmgr update --self
sudo tlmgr update --all
```

### Error en compilación: "main.bcf is malformed"

```bash
# Limpiar todo y recompilar
make cleanall && make pdf
```

### Warnings en compilación

El proyecto tiene un error conocido en `capitulos/02_diagnostico.tex:909` pero **el PDF se genera correctamente**. Los warnings que aparecen durante `make pdf` son esperados y no impiden la generación del documento.

```bash
# Esto es NORMAL:
⚠ Warnings en primera pasada (PDF generado)
✓ Primera pasada completada
```

### PDF no se actualiza

```bash
# Cerrar visor de PDF
# Limpiar y recompilar
make clean && make pdf
```

---

## 📊 Estadísticas del Proyecto

**Estado Actual (generado con `make stats`):**

- **PDF:** 799KB, 136 páginas
- **Referencias:** 65 totales en bibliografía
- **Capítulos:** 6 archivos .tex
- **Imágenes:** 8 figuras
- **Compilación:** 0 errores críticos, warnings menores esperados

---

## 📚 Recursos y Herramientas

### Documentación LaTeX

- [CTAN - Comprehensive TeX Archive Network](https://www.ctan.org/)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [BibLaTeX Documentation](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf)

### Herramientas Online

- [Tables Generator](https://www.tablesgenerator.com/) - Generador de tablas LaTeX
- [Mathcha - Equation Editor](https://www.mathcha.io/) - Editor de ecuaciones
- [Detexify](http://detexify.kirelabs.org/classify.html) - Búsqueda de símbolos LaTeX
- [Overleaf](https://www.overleaf.com/) - Editor LaTeX online (colaboración)

### Gestión Bibliográfica

- [Zotero](https://www.zotero.org/) - Gestor de referencias (gratis)
- [Mendeley](https://www.mendeley.com/) - Gestor de referencias
- [JabRef](https://www.jabref.org/) - Editor de archivos .bib

---

## ✅ Checklist Pre-Entrega

### Contenido

- [x] Actualizar información personal en `config/informacion.tex`
- [ ] Completar todos los capítulos
- [ ] Agregar todas las figuras y tablas
- [x] Verificar todas las referencias bibliográficas (65 referencias APA7)
- [ ] Revisar ortografía y gramática
- [ ] Verificar todas las citas estén en el texto

### Formato

- [x] Compilar sin errores críticos
- [ ] Verificar numeración de páginas
- [x] Revisar índices (contenidos, figuras, tablas)
- [x] Verificar márgenes y sangría (APA 7)
- [x] Verificar interlineado 1.5

### Exportación

- [x] Generar PDF final (`make pdf`)
- [ ] Exportar a Word si es requerido (`make word`)
- [x] Crear backup del proyecto (`make backup`)
- [ ] Revisar PDF en diferentes visores

### Entrega

- [ ] Imprimir documento (si es requerido)
- [ ] Preparar presentación de defensa
- [ ] Revisar con tutor
- [ ] Subir a repositorio institucional

---

## 🔄 Workflow de Trabajo Recomendado

### Edición Diaria

```bash
# 1. Abrir editor (Cursor/VSCode)
cursor .

# 2. Editar capítulos en capitulos/*.tex

# 3. Compilar y revisar
make pdf && make view

# 4. Verificar estadísticas
make stats
```

### Antes de Commit a Git

```bash
# 1. Crear backup
make backup

# 2. Limpiar archivos temporales
make clean

# 3. Generar PDF final
make pdf

# 4. Revisar cambios
git status

# 5. Commit
git add .
git commit -m "Actualización de [descripción]"
git push
```

### Preparación para Entrega

```bash
# 1. Compilación limpia
make cleanall && make pdf

# 2. Exportar a todos los formatos
make all-exports

# 3. Crear backup final
make backup

# 4. Verificar outputs
ls -lh output/
```

---

## 📧 Contacto y Soporte

**Autor:** Ing. Adan Condori Callisaya
**Email:** adancondori@gmail.com
**Universidad:** UAGRM
**Programa:** Maestría en Dirección Estratégica en Ingeniería de Software
**Línea de Investigación:** Sistemas Inteligentes - Sistemas Cognitivos

---

## 📄 Archivos de Documentación Adicional

- **[MAKEFILE_README.md](MAKEFILE_README.md)** - Guía completa del sistema de compilación
- **[CLAUDE.md](CLAUDE.md)** - Instrucciones para Claude Code
- **[GUIA_APA7_CITAS.md](GUIA_APA7_CITAS.md)** - Guía de citas APA 7
- **[COMO_VERIFICAR_SANGRIA.md](COMO_VERIFICAR_SANGRIA.md)** - Verificación de formato APA
- **[INSTRUCCIONES_INSTALACION.md](INSTRUCCIONES_INSTALACION.md)** - Instalación paso a paso

---

## 🎓 Estructura Metodológica UAGRM

Este proyecto sigue la estructura de tesis requerida por la UAGRM:

1. **Introducción** - Contexto general del problema
2. **Perfil de Tesis** - Antecedentes, objetivos, justificación, hipótesis
3. **Capítulo 1: Marco Teórico** - Fundamentos teóricos y conceptuales
4. **Capítulo 2: Diagnóstico** - Análisis de la situación actual
5. **Capítulo 3: Propuesta y Validación** - Diseño, implementación y validación del modelo
6. **Conclusiones y Recomendaciones** - Resultados, conclusiones y trabajo futuro

---

**¡Éxito con tu tesis! 🎓**

---

**Última actualización:** Noviembre 2024
**Versión del documento:** 1.0
**Estado:** En desarrollo
