# 📘 Guía de Uso del Makefile - Tesis UAGRM

## 🚀 Inicio Rápido

```bash
# Ver todos los comandos disponibles
make help

# Generar PDF completo
make pdf

# Generar PDF y abrirlo
make pdf && make view

# Exportar a todos los formatos
make all-exports
```

---

## 📋 Comandos Principales

### 🔨 Compilación de PDF

| Comando | Descripción |
|---------|-------------|
| `make pdf` | Compilación completa (3 pasadas + biber) - **RECOMENDADO** |
| `make quick` | Compilación rápida (1 pasada, sin bibliografía) |
| `make draft` | Modo borrador (ultra-rápido, para pruebas) |

**Ejemplo:**
```bash
make pdf
# Output: main.pdf (136 páginas, ~800KB)
```

---

### 📄 Exportación a Otros Formatos

#### 📝 Word (.docx)
```bash
make word
```
- **Requisito:** `pandoc` (instalar con `brew install pandoc`)
- **Output:** `output/word/main_latest.docx`
- **Incluye:** Tabla de contenidos, numeración de secciones, formato APA

#### 📊 Tablas CSV
```bash
make csv
```
- **Output:** `output/csv/*.csv`
- **Incluye:**
  - Copia de todas las tablas CSV del directorio `tablas/`
  - Extracción de texto del PDF (`contenido_texto.txt`)

#### 🖼️ Imágenes
```bash
make images
```
- **Requisito:** `poppler` (instalar con `brew install poppler`)
- **Output:** `output/imagenes/`
- **Incluye:**
  - Imágenes embebidas del PDF
  - Copia de imágenes originales del proyecto
  - Índice de todas las imágenes

#### 🎁 Exportación Completa
```bash
make all-exports
```
Genera: PDF + Word + CSV + Imágenes en una sola ejecución.

---

## 🛠️ Utilidades

### 🧹 Limpieza

| Comando | Descripción |
|---------|-------------|
| `make clean` | Elimina archivos auxiliares LaTeX (.aux, .log, .bbl, etc.) |
| `make cleanall` | Limpieza completa (incluye PDF y outputs) |

**Ejemplo - Compilación limpia:**
```bash
make cleanall && make pdf
```

### 💾 Backup

```bash
make backup
```
- **Output:** `backup/backup_YYYYMMDD_HHMMSS.tar.gz`
- **Incluye:** Todo el proyecto excepto PDFs, auxiliares y directorios de salida
- **Uso:** Crear respaldo antes de cambios importantes

### 👁️ Visualización

```bash
make view
```
Abre `main.pdf` con el visor PDF por defecto del sistema.

### 📊 Estadísticas

```bash
make stats
```
Muestra:
- Tamaño del PDF
- Total de referencias bibliográficas
- Referencias citadas
- Número de capítulos
- Total de imágenes

### ✅ Verificar Instalación

```bash
make check
```
Verifica que todas las herramientas necesarias estén instaladas:
- `pdflatex` ✓
- `biber` ✓
- `pandoc` (opcional para Word)
- `pdfimages`, `pdftotext` (opcional para imágenes/CSV)

---

## 📁 Estructura de Directorios

```
Tesis-Latex/
├── Makefile                  # Archivo principal de automatización
├── main.tex                  # Documento principal
├── main.pdf                  # PDF generado
│
├── build/                    # Archivos temporales de compilación
├── backup/                   # Backups timestamped
│   └── backup_*.tar.gz
│
├── output/                   # Directorio de salidas
│   ├── main_latest.pdf       # Última versión del PDF
│   ├── main_YYYYMMDD.pdf     # PDFs timestamped
│   │
│   ├── word/                 # Conversiones a Word
│   │   ├── main_latest.docx
│   │   └── main_*.docx
│   │
│   ├── csv/                  # Tablas exportadas
│   │   ├── *.csv
│   │   └── contenido_texto.txt
│   │
│   └── imagenes/             # Imágenes extraídas
│       ├── imagen-*.png
│       ├── imagen-*.jpg
│       └── INDICE_IMAGENES.txt
│
├── capitulos/                # Capítulos de la tesis
├── bibliografia/             # Referencias bibliográficas
├── imagenes/                 # Imágenes originales
├── tablas/                   # Archivos de tablas
└── config/                   # Configuración LaTeX
```

---

## 🔧 Instalación de Dependencias

### macOS (con Homebrew)

```bash
# Herramientas opcionales para exportación
brew install pandoc          # Para conversión a Word
brew install poppler         # Para extracción de imágenes/texto
```

### Verificar Instalación

```bash
make check
```

---

## 💡 Ejemplos de Uso Común

### Workflow Típico de Compilación

```bash
# 1. Ver estado actual
make stats

# 2. Limpiar archivos antiguos
make clean

# 3. Generar PDF
make pdf

# 4. Abrir para revisión
make view
```

### Preparar Entrega Final

```bash
# 1. Crear backup
make backup

# 2. Compilación limpia
make cleanall && make pdf

# 3. Exportar a todos los formatos
make all-exports

# 4. Verificar outputs
ls -lh output/
```

### Trabajo con Borrador

```bash
# Compilación rápida para pruebas
make draft

# Revisar cambios
make view

# Compilación completa cuando esté listo
make pdf
```

### Antes de Commit a Git

```bash
# 1. Crear backup
make backup

# 2. Limpiar archivos temporales
make clean

# 3. Generar PDF final
make pdf

# 4. Revisar qué se va a commitear
git status
```

---

## 🎨 Personalización

### Cambiar Nombre del Documento

Edita el `Makefile` línea 11:
```makefile
MAIN = mi_tesis  # Cambiar de "main" a tu preferencia
```

### Añadir Plantilla Word Personalizada

1. Crear archivo: `config/plantilla_word.docx`
2. El Makefile la usará automáticamente

### Modificar Flags de Compilación

Edita el `Makefile` líneas 24-25:
```makefile
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error
PANDOC_FLAGS = --from=latex --to=docx --standalone
```

---

## ❓ Resolución de Problemas

### Error: "pdflatex: command not found"

**Solución:** Instalar MacTeX o TeX Live
```bash
brew install --cask mactex
```

### Error: "pandoc: command not found"

**Solución:**
```bash
brew install pandoc
```

### Error: "pdfimages: command not found"

**Solución:**
```bash
brew install poppler
```

### Compilación Falla con Errores de Bibliografía

```bash
# Limpieza profunda y recompilación
make cleanall
make pdf
```

### PDF No Se Abre con make view

Verificar que existe:
```bash
ls -lh main.pdf
```

Si no existe, compilar primero:
```bash
make pdf
```

---

## 📝 Notas

- ✅ **Archivos .gitkeep** mantienen estructura de directorios en Git
- ✅ **Backups** se crean con timestamp para evitar sobrescrituras
- ✅ **PDFs** en `output/` se versionan automáticamente
- ✅ **Colores** en terminal para mejor legibilidad
- ✅ **Mensajes** claros de progreso en cada paso

---

## 🆘 Soporte

Para ver ayuda rápida:
```bash
make help
```

Para ver este README:
```bash
cat MAKEFILE_README.md
```

---

**Autor:** Ing. Adan Condori Callisaya
**Proyecto:** Detección de Anomalías y Fraude en Pagos Transaccionales
**Universidad:** UAGRM - Universidad Autónoma Gabriel René Moreno
**Fecha:** Noviembre 2025
