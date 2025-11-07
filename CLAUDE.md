# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Descripción General
Tesis de Maestría en Ciencias de la Computación (UAGRM) sobre detección de fraude en pagos transaccionales usando Machine Learning. Proyecto LaTeX configurado para normas APA 7ª edición con estructura modular.

## Arquitectura del Documento

### Documento Principal (main.tex)
- Clase: `book` (12pt, a4paper, oneside)
- Estructura: `\frontmatter` → `\mainmatter` → `\appendix`
- Incluye archivos con `\input{}` (no usar `\include{}` para mejor control)
- Capítulos comentados temporalmente por problemas UTF-8 en código Python

### Sistema de Configuración (config/)
El proyecto separa configuraciones en archivos modulares:

1. **paquetes.tex**: Todos los paquetes LaTeX y sus configuraciones
   - BibLaTeX con backend=biber, style=apa
   - Geometría: márgenes de 3cm (izq), 2.5cm (resto)
   - Interlineado: 1.5 (`\onehalfspacing`)
   - Listings configurado para Python con soporte UTF-8

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

## Comandos de Compilación

### Compilación Completa (con bibliografía)
```bash
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

### Atajo en Cursor
- **Compilar**: Cmd+Alt+B
- **Ver PDF**: Cmd+Alt+V
- **Limpiar**: Cmd+Alt+C

## Normas APA 7 Implementadas

- **Sangría**: 1.27cm (0.5") en primera línea de cada párrafo
- **Interlineado**: 1.5 (configurado en formato.tex con `\onehalfspacing`)
- **Márgenes**: 3cm izquierda, 2.5cm resto
- **Fuente**: Latin Modern (lmodern) - similar a Times New Roman
- **Citas**: Sistema autor-fecha con biblatex-apa

## Problemas Conocidos

### UTF-8 en Código Python
Archivos comentados en main.tex debido a problemas con caracteres especiales en listings:
- capitulos/04_desarrollo.tex
- capitulos/05_resultados.tex
- capitulos/06_conclusiones.tex
- apendices/apendice_a.tex
- apendices/apendice_c.tex

**Solución**: Usar estilo `python` definido en formato.tex:67-79 con tabla `literate` para caracteres españoles.

### Estructura de Capítulos
El proyecto tiene tanto `00_perfil.tex` como capítulos numerados (02-06). Revisar con el usuario si la numeración es intencional o necesita reordenamiento.

## Verificación del Proyecto

### Script de Instalación
```bash
./setup_latex_packages.sh    # Instala paquetes necesarios
```

### Script de Verificación
```bash
./verificar_instalacion.sh   # Verifica instalación completa
```

Verifica: LaTeX, Biber, tlmgr, estructura de archivos, paquetes esenciales, y compilación básica.

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

### Tablas
```latex
\begin{table}[H]
    \centering
    \caption{Descripción}
    \label{tab:etiqueta}
    \begin{tabular}{@{}lcc@{}}
        \toprule
        ... contenido ...
        \bottomrule
    \end{tabular}
\end{table}
```

### Código Python
```latex
\begin{lstlisting}[style=python, caption=Descripción]
# Código aquí
\end{lstlisting}
```

### Citas Bibliográficas
```latex
\textcite{clave}      % Autor (año)
\parencite{clave}     % (Autor, año)
```

## Archivos a Ignorar
Todos los auxiliares están en .gitignore: *.aux, *.log, *.bbl, *.bcf, *.out, *.toc, etc.
Los PDFs NO están ignorados (verificar según workflow del usuario).
