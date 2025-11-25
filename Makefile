# ==================================================================================
# Makefile para Tesis de Maestría - UAGRM
# ==================================================================================
# Autor: Ing. Adan Condori Callisaya
# Proyecto: Detección de Anomalías y Fraude en Pagos Transaccionales
# ==================================================================================

# ==================== CONFIGURACIÓN ====================

# Nombre del documento principal (sin extensión)
MAIN = main

# Directorios de salida
BUILD_DIR = build
OUTPUT_DIR = output
WORD_DIR = $(OUTPUT_DIR)/word
CSV_DIR = $(OUTPUT_DIR)/csv
IMG_DIR = $(OUTPUT_DIR)/imagenes
BACKUP_DIR = backup

# Herramientas
LATEX = pdflatex
BIBER = biber
PANDOC = pandoc
PDFTOTEXT = pdftotext
PDFTOPPM = pdftoppm
PDFIMAGES = pdfimages

# Opciones de compilación
LATEX_FLAGS = -interaction=nonstopmode
PANDOC_FLAGS = --from=latex --to=docx --standalone --number-sections --toc
PANDOC_FLAGS += --reference-doc=config/plantilla_word.docx --fail-if-warnings=false

# Archivos a limpiar
CLEAN_EXT = aux bbl blg bcf run.xml log out toc lof lot fls fdb_latexmk synctex.gz

# Colores para output
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
MAGENTA = \033[0;35m
CYAN = \033[0;36m
NC = \033[0m # No Color

# ==================== TARGETS PRINCIPALES ====================

.PHONY: all pdf word csv images clean cleanall help setup backup view

# Target por defecto
all: pdf

# Ayuda
help:
	@echo "$(CYAN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(CYAN)║       Makefile - Tesis UAGRM - Detección de Fraude      ║$(NC)"
	@echo "$(CYAN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(GREEN)Targets principales:$(NC)"
	@echo "  $(YELLOW)make pdf$(NC)         - Generar PDF completo (3 pasadas + biber)"
	@echo "  $(YELLOW)make word$(NC)        - Convertir a formato Word (.docx)"
	@echo "  $(YELLOW)make csv$(NC)         - Extraer tablas a archivos CSV"
	@echo "  $(YELLOW)make images$(NC)      - Extraer todas las imágenes del PDF"
	@echo "  $(YELLOW)make all-exports$(NC) - Generar PDF + Word + CSV + Imágenes"
	@echo ""
	@echo "$(GREEN)Compilación rápida:$(NC)"
	@echo "  $(YELLOW)make quick$(NC)       - Compilación rápida (1 pasada, sin biber)"
	@echo "  $(YELLOW)make draft$(NC)       - Modo borrador (compilación ultra-rápida)"
	@echo ""
	@echo "$(GREEN)Utilidades:$(NC)"
	@echo "  $(YELLOW)make clean$(NC)       - Limpiar archivos auxiliares LaTeX"
	@echo "  $(YELLOW)make cleanall$(NC)    - Limpiar todo (incluye PDF y outputs)"
	@echo "  $(YELLOW)make setup$(NC)       - Crear estructura de directorios"
	@echo "  $(YELLOW)make backup$(NC)      - Crear backup timestamped del proyecto"
	@echo "  $(YELLOW)make view$(NC)        - Abrir PDF con visor por defecto"
	@echo "  $(YELLOW)make stats$(NC)       - Estadísticas del documento"
	@echo "  $(YELLOW)make check$(NC)       - Verificar herramientas instaladas"
	@echo ""
	@echo "$(GREEN)Ejemplos:$(NC)"
	@echo "  make pdf && make view       # Generar y abrir PDF"
	@echo "  make cleanall && make pdf   # Compilación limpia completa"
	@echo "  make backup && make pdf     # Backup antes de compilar"
	@echo ""

# ==================== COMPILACIÓN PDF ====================

# Compilación completa (recomendado)
pdf: setup
	@echo "$(BLUE)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║  Generando PDF completo con bibliografía...             ║$(NC)"
	@echo "$(BLUE)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(CYAN)[1/5]$(NC) Primera pasada de pdflatex..."
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).tex > /dev/null 2>&1 || echo "$(YELLOW)⚠ Warnings en primera pasada (PDF generado)$(NC)"
	@echo "$(GREEN)✓$(NC) Primera pasada completada"
	@echo ""
	@echo "$(CYAN)[2/5]$(NC) Procesando bibliografía con biber..."
	@if [ -f $(MAIN).bcf ]; then \
		$(BIBER) $(MAIN) > /dev/null 2>&1 && echo "$(GREEN)✓$(NC) Bibliografía procesada" || echo "$(YELLOW)⚠ Warnings en biber (continuando)$(NC)"; \
	else \
		echo "$(RED)✗ Error: archivo .bcf no generado$(NC)" && exit 1; \
	fi
	@echo ""
	@echo "$(CYAN)[3/5]$(NC) Segunda pasada de pdflatex..."
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).tex > /dev/null 2>&1 || echo "$(YELLOW)⚠ Warnings en segunda pasada (PDF generado)$(NC)"
	@echo "$(GREEN)✓$(NC) Segunda pasada completada"
	@echo ""
	@echo "$(CYAN)[4/5]$(NC) Tercera pasada de pdflatex (referencias cruzadas)..."
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).tex > /dev/null 2>&1 || echo "$(YELLOW)⚠ Warnings en tercera pasada (PDF generado)$(NC)"
	@echo "$(GREEN)✓$(NC) Tercera pasada completada"
	@echo ""
	@echo "$(CYAN)[5/5]$(NC) Copiando PDF a directorio de salida..."
	@cp $(MAIN).pdf $(OUTPUT_DIR)/$(MAIN)_$(shell date +%Y%m%d_%H%M%S).pdf
	@cp $(MAIN).pdf $(OUTPUT_DIR)/$(MAIN)_latest.pdf
	@echo "$(GREEN)✓$(NC) PDF copiado"
	@echo ""
	@echo "$(GREEN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(GREEN)║  ✓ PDF generado exitosamente                            ║$(NC)"
	@echo "$(GREEN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@ls -lh $(MAIN).pdf | awk '{print "  Archivo: $(MAIN).pdf\n  Tamaño:  " $$5}'
	@echo "  Ubicación: $(OUTPUT_DIR)/$(MAIN)_latest.pdf"
	@echo ""

# Compilación rápida (1 pasada, sin biber)
quick:
	@echo "$(YELLOW)⚡ Compilación rápida (sin biber)...$(NC)"
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).tex > /dev/null 2>&1
	@echo "$(GREEN)✓ Compilación rápida completada$(NC)"

# Modo borrador (ultra-rápido)
draft:
	@echo "$(YELLOW)⚡ Modo borrador (draft)...$(NC)"
	@$(LATEX) -draftmode $(LATEX_FLAGS) $(MAIN).tex > /dev/null 2>&1
	@echo "$(GREEN)✓ Compilación borrador completada$(NC)"

# ==================== CONVERSIÓN A WORD ====================

word: pdf setup
	@echo "$(BLUE)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║  Convirtiendo PDF a Word (.docx)...                     ║$(NC)"
	@echo "$(BLUE)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@if ! command -v $(PANDOC) &> /dev/null; then \
		echo "$(RED)✗ Error: pandoc no está instalado$(NC)"; \
		echo "$(YELLOW)Instalar con: brew install pandoc$(NC)"; \
		exit 1; \
	fi
	@echo "$(CYAN)[1/2]$(NC) Convirtiendo LaTeX a Word con pandoc..."
	@$(PANDOC) $(PANDOC_FLAGS) $(MAIN).tex -o $(WORD_DIR)/$(MAIN)_$(shell date +%Y%m%d_%H%M%S).docx 2>/dev/null || \
		$(PANDOC) --from=latex --to=docx $(MAIN).tex -o $(WORD_DIR)/$(MAIN)_$(shell date +%Y%m%d_%H%M%S).docx
	@echo "$(GREEN)✓$(NC) Conversión completada"
	@echo ""
	@echo "$(CYAN)[2/2]$(NC) Creando versión latest..."
	@cp $(WORD_DIR)/$(MAIN)_*.docx $(WORD_DIR)/$(MAIN)_latest.docx 2>/dev/null || true
	@echo "$(GREEN)✓$(NC) Archivo Word generado"
	@echo ""
	@echo "$(GREEN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(GREEN)║  ✓ Conversión a Word exitosa                            ║$(NC)"
	@echo "$(GREEN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@ls -lh $(WORD_DIR)/$(MAIN)_latest.docx 2>/dev/null | awk '{print "  Archivo: " $$9 "\n  Tamaño:  " $$5}' || echo "  Ubicación: $(WORD_DIR)/"
	@echo ""

# ==================== EXTRACCIÓN DE TABLAS A CSV ====================

csv: pdf setup
	@echo "$(BLUE)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║  Extrayendo tablas a formato CSV...                     ║$(NC)"
	@echo "$(BLUE)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(CYAN)[1/3]$(NC) Buscando archivos de tablas..."
	@TABLAS=$$(find tablas/ -name "*.csv" 2>/dev/null | wc -l | xargs); \
	echo "$(GREEN)✓$(NC) Encontradas $$TABLAS tablas CSV en tablas/"
	@echo ""
	@echo "$(CYAN)[2/3]$(NC) Copiando tablas al directorio de salida..."
	@cp tablas/*.csv $(CSV_DIR)/ 2>/dev/null || echo "$(YELLOW)  No hay archivos CSV en tablas/$(NC)"
	@echo "$(GREEN)✓$(NC) Tablas copiadas"
	@echo ""
	@echo "$(CYAN)[3/3]$(NC) Extrayendo texto de PDF para análisis..."
	@if command -v $(PDFTOTEXT) &> /dev/null; then \
		$(PDFTOTEXT) -layout $(MAIN).pdf $(CSV_DIR)/contenido_texto.txt 2>/dev/null; \
		echo "$(GREEN)✓$(NC) Texto extraído a contenido_texto.txt"; \
	else \
		echo "$(YELLOW)  pdftotext no disponible (instalar con: brew install poppler)$(NC)"; \
	fi
	@echo ""
	@echo "$(GREEN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(GREEN)║  ✓ Tablas exportadas a CSV                              ║$(NC)"
	@echo "$(GREEN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo "  Ubicación: $(CSV_DIR)/"
	@ls -1 $(CSV_DIR)/*.csv 2>/dev/null | wc -l | xargs -I {} echo "  Total archivos CSV: {}"
	@echo ""

# ==================== EXTRACCIÓN DE IMÁGENES ====================

images: pdf setup
	@echo "$(BLUE)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║  Extrayendo imágenes del PDF...                         ║$(NC)"
	@echo "$(BLUE)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(CYAN)[1/4]$(NC) Verificando herramientas..."
	@if ! command -v $(PDFIMAGES) &> /dev/null; then \
		echo "$(RED)✗ pdfimages no está instalado$(NC)"; \
		echo "$(YELLOW)Instalar con: brew install poppler$(NC)"; \
		exit 1; \
	fi
	@echo "$(GREEN)✓$(NC) Herramientas disponibles"
	@echo ""
	@echo "$(CYAN)[2/4]$(NC) Extrayendo imágenes embebidas con pdfimages..."
	@cd $(IMG_DIR) && $(PDFIMAGES) -all ../../$(MAIN).pdf imagen 2>/dev/null || true
	@IMGS=$$(ls -1 $(IMG_DIR)/imagen-* 2>/dev/null | wc -l | xargs); \
	echo "$(GREEN)✓$(NC) Extraídas $$IMGS imágenes embebidas"
	@echo ""
	@echo "$(CYAN)[3/4]$(NC) Copiando imágenes originales del proyecto..."
	@cp -r imagenes/* $(IMG_DIR)/ 2>/dev/null || echo "$(YELLOW)  No hay imágenes en imagenes/$(NC)"
	@echo "$(GREEN)✓$(NC) Imágenes originales copiadas"
	@echo ""
	@echo "$(CYAN)[4/4]$(NC) Generando índice de imágenes..."
	@ls -lh $(IMG_DIR)/ > $(IMG_DIR)/INDICE_IMAGENES.txt
	@echo "$(GREEN)✓$(NC) Índice generado"
	@echo ""
	@echo "$(GREEN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(GREEN)║  ✓ Imágenes extraídas exitosamente                      ║$(NC)"
	@echo "$(GREEN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo "  Ubicación: $(IMG_DIR)/"
	@ls -1 $(IMG_DIR)/ 2>/dev/null | grep -v INDICE | wc -l | xargs -I {} echo "  Total archivos: {}"
	@echo ""

# ==================== EXPORTACIÓN COMPLETA ====================

all-exports: pdf word csv images
	@echo "$(GREEN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(GREEN)║  ✓ EXPORTACIÓN COMPLETA FINALIZADA                      ║$(NC)"
	@echo "$(GREEN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(CYAN)Archivos generados:$(NC)"
	@echo "  📄 PDF:      $(OUTPUT_DIR)/$(MAIN)_latest.pdf"
	@echo "  📝 Word:     $(WORD_DIR)/$(MAIN)_latest.docx"
	@echo "  📊 CSV:      $(CSV_DIR)/"
	@echo "  🖼️  Imágenes: $(IMG_DIR)/"
	@echo ""

# ==================== UTILIDADES ====================

# Crear estructura de directorios
setup:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OUTPUT_DIR)
	@mkdir -p $(WORD_DIR)
	@mkdir -p $(CSV_DIR)
	@mkdir -p $(IMG_DIR)
	@mkdir -p $(BACKUP_DIR)

# Limpiar archivos auxiliares de LaTeX
clean:
	@echo "$(YELLOW)🧹 Limpiando archivos auxiliares de LaTeX...$(NC)"
	@for ext in $(CLEAN_EXT); do \
		find . -maxdepth 1 -name "*.$$ext" -delete 2>/dev/null; \
	done
	@find . -name "*.bak" -delete 2>/dev/null
	@echo "$(GREEN)✓ Archivos auxiliares eliminados$(NC)"

# Limpieza completa
cleanall: clean
	@echo "$(YELLOW)🧹 Limpieza completa (incluye PDF y outputs)...$(NC)"
	@rm -f $(MAIN).pdf
	@rm -rf $(BUILD_DIR)
	@rm -rf $(OUTPUT_DIR)
	@echo "$(GREEN)✓ Limpieza completa finalizada$(NC)"

# Backup del proyecto
backup:
	@echo "$(CYAN)💾 Creando backup del proyecto...$(NC)"
	@BACKUP_NAME="backup_$(shell date +%Y%m%d_%H%M%S).tar.gz"; \
	tar -czf $(BACKUP_DIR)/$$BACKUP_NAME \
		--exclude='$(BUILD_DIR)' \
		--exclude='$(OUTPUT_DIR)' \
		--exclude='*.pdf' \
		--exclude='*.aux' \
		--exclude='*.log' \
		--exclude='.git' \
		. 2>/dev/null; \
	echo "$(GREEN)✓ Backup creado: $(BACKUP_DIR)/$$BACKUP_NAME$(NC)"; \
	ls -lh $(BACKUP_DIR)/$$BACKUP_NAME | awk '{print "  Tamaño: " $$5}'

# Ver PDF
view:
	@echo "$(CYAN)👁️  Abriendo PDF...$(NC)"
	@if [ -f $(MAIN).pdf ]; then \
		open $(MAIN).pdf 2>/dev/null || xdg-open $(MAIN).pdf 2>/dev/null || echo "$(RED)No se pudo abrir el PDF$(NC)"; \
	else \
		echo "$(RED)✗ Error: $(MAIN).pdf no existe. Ejecuta 'make pdf' primero.$(NC)"; \
	fi

# Estadísticas del documento
stats: pdf
	@echo "$(CYAN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(CYAN)║  Estadísticas del Documento                             ║$(NC)"
	@echo "$(CYAN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(GREEN)Archivo PDF:$(NC)"
	@ls -lh $(MAIN).pdf | awk '{print "  Tamaño:  " $$5}'
	@echo ""
	@echo "$(GREEN)Bibliografía:$(NC)"
	@echo "  Total referencias: $$(grep -c '^@' bibliografia/referencias.bib)"
	@echo "  Referencias citadas: $$(grep -o '\\cite' $(MAIN).aux 2>/dev/null | wc -l | xargs)"
	@echo ""
	@echo "$(GREEN)Capítulos:$(NC)"
	@ls -1 capitulos/*.tex | wc -l | xargs -I {} echo "  Archivos .tex: {}"
	@echo ""
	@echo "$(GREEN)Imágenes:$(NC)"
	@ls -1 imagenes/* 2>/dev/null | wc -l | xargs -I {} echo "  Total imágenes: {}"
	@echo ""

# Verificar herramientas instaladas
check:
	@echo "$(CYAN)╔══════════════════════════════════════════════════════════╗$(NC)"
	@echo "$(CYAN)║  Verificando Herramientas Instaladas                    ║$(NC)"
	@echo "$(CYAN)╚══════════════════════════════════════════════════════════╝$(NC)"
	@echo ""
	@printf "  pdflatex:  "; command -v pdflatex >/dev/null 2>&1 && echo "$(GREEN)✓ Instalado$(NC)" || echo "$(RED)✗ No encontrado$(NC)"
	@printf "  biber:     "; command -v biber >/dev/null 2>&1 && echo "$(GREEN)✓ Instalado$(NC)" || echo "$(RED)✗ No encontrado$(NC)"
	@printf "  pandoc:    "; command -v pandoc >/dev/null 2>&1 && echo "$(GREEN)✓ Instalado$(NC)" || echo "$(RED)✗ No encontrado (brew install pandoc)$(NC)"
	@printf "  pdfimages: "; command -v pdfimages >/dev/null 2>&1 && echo "$(GREEN)✓ Instalado$(NC)" || echo "$(RED)✗ No encontrado (brew install poppler)$(NC)"
	@printf "  pdftotext: "; command -v pdftotext >/dev/null 2>&1 && echo "$(GREEN)✓ Instalado$(NC)" || echo "$(RED)✗ No encontrado (brew install poppler)$(NC)"
	@echo ""

# ==================== INFORMACIÓN ====================

.DEFAULT_GOAL := help
