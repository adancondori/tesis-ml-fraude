#!/bin/bash

# ==================================================================================
# SCRIPT DE VERIFICACIÓN DE INSTALACIÓN DE LATEX
# Para tesis de maestría - UAGRM
# ==================================================================================

echo ""
echo "=========================================="
echo "  VERIFICACIÓN DE INSTALACIÓN DE LATEX"
echo "=========================================="
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Contador de errores
ERRORS=0
WARNINGS=0

# ==================== VERIFICAR LATEX ====================
echo "1. Verificando LaTeX..."

if command -v pdflatex &> /dev/null; then
    VERSION=$(pdflatex --version | head -1)
    echo -e "${GREEN}✓${NC} pdflatex encontrado: $VERSION"
else
    echo -e "${RED}✗${NC} pdflatex NO encontrado"
    echo "   → Instala con: brew install --cask basictex"
    ((ERRORS++))
fi

# ==================== VERIFICAR BIBER ====================
echo ""
echo "2. Verificando Biber (para bibliografía)..."

if command -v biber &> /dev/null; then
    VERSION=$(biber --version | head -1)
    echo -e "${GREEN}✓${NC} biber encontrado: $VERSION"
else
    echo -e "${RED}✗${NC} biber NO encontrado"
    echo "   → Se instalará automáticamente con los paquetes"
    ((WARNINGS++))
fi

# ==================== VERIFICAR TLMGR ====================
echo ""
echo "3. Verificando gestor de paquetes (tlmgr)..."

if command -v tlmgr &> /dev/null; then
    echo -e "${GREEN}✓${NC} tlmgr encontrado"
else
    echo -e "${RED}✗${NC} tlmgr NO encontrado"
    echo "   → Viene con BasicTeX"
    ((ERRORS++))
fi

# ==================== VERIFICAR ESTRUCTURA ====================
echo ""
echo "4. Verificando estructura de archivos..."

REQUIRED_FILES=(
    "main.tex"
    "config/paquetes.tex"
    "config/formato.tex"
    "config/informacion.tex"
    "bibliografia/referencias.bib"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $file"
    else
        echo -e "${RED}✗${NC} $file faltante"
        ((ERRORS++))
    fi
done

# ==================== VERIFICAR CARPETAS ====================
echo ""
echo "5. Verificando carpetas..."

REQUIRED_DIRS=(
    "capitulos"
    "imagenes"
    "bibliografia"
    "apendices"
    "config"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "${GREEN}✓${NC} $dir/"
    else
        echo -e "${RED}✗${NC} $dir/ faltante"
        ((ERRORS++))
    fi
done

# ==================== CONTAR ARCHIVOS ====================
echo ""
echo "6. Estadísticas del proyecto..."

TEX_FILES=$(find . -name "*.tex" | wc -l | tr -d ' ')
echo "   → Archivos .tex: $TEX_FILES"

if [ -f "bibliografia/referencias.bib" ]; then
    BIB_ENTRIES=$(grep -c "@" bibliografia/referencias.bib)
    echo "   → Referencias bibliográficas: $BIB_ENTRIES"
fi

# ==================== VERIFICAR CURSOR ====================
echo ""
echo "7. Verificando Cursor..."

if command -v cursor &> /dev/null; then
    echo -e "${GREEN}✓${NC} Cursor encontrado"

    # Verificar extensión LaTeX Workshop
    if cursor --list-extensions | grep -q "latex-workshop"; then
        echo -e "${GREEN}✓${NC} LaTeX Workshop instalado en Cursor"
    else
        echo -e "${YELLOW}⚠${NC} LaTeX Workshop NO instalado"
        echo "   → Se instaló previamente, verifica en Extensions"
        ((WARNINGS++))
    fi
else
    echo -e "${YELLOW}⚠${NC} Cursor no encontrado en PATH"
    echo "   → Verifica que Cursor esté instalado"
    ((WARNINGS++))
fi

# ==================== VERIFICAR PAQUETES LATEX ====================
echo ""
echo "8. Verificando paquetes LaTeX esenciales..."

if command -v tlmgr &> /dev/null; then
    ESSENTIAL_PACKAGES=(
        "babel-spanish"
        "biblatex"
        "geometry"
        "graphicx"
        "hyperref"
    )

    MISSING_PACKAGES=()

    for pkg in "${ESSENTIAL_PACKAGES[@]}"; do
        if tlmgr info $pkg &> /dev/null; then
            echo -e "${GREEN}✓${NC} $pkg"
        else
            echo -e "${RED}✗${NC} $pkg faltante"
            MISSING_PACKAGES+=($pkg)
        fi
    done

    if [ ${#MISSING_PACKAGES[@]} -gt 0 ]; then
        echo ""
        echo "Paquetes faltantes: ${MISSING_PACKAGES[@]}"
        echo "→ Ejecuta: ./setup_latex_packages.sh"
        ((ERRORS++))
    fi
else
    echo -e "${YELLOW}⚠${NC} No se puede verificar paquetes (tlmgr no disponible)"
    ((WARNINGS++))
fi

# ==================== PRUEBA DE COMPILACIÓN ====================
echo ""
echo "9. Probando compilación básica..."

if command -v pdflatex &> /dev/null && [ -f "main.tex" ]; then
    echo "   Intentando compilar main.tex..."

    # Crear archivo de prueba simple
    cat > test_compile.tex << 'EOF'
\documentclass{article}
\usepackage[utf8]{inputenc}
\begin{document}
Test de compilación
\end{document}
EOF

    if pdflatex -interaction=nonstopmode test_compile.tex > /dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} Compilación básica exitosa"
        rm -f test_compile.* 2>/dev/null
    else
        echo -e "${YELLOW}⚠${NC} Compilación básica con advertencias"
        echo "   → Esto puede mejorar después de instalar los paquetes"
        rm -f test_compile.* 2>/dev/null
        ((WARNINGS++))
    fi
else
    echo -e "${YELLOW}⚠${NC} No se puede probar compilación aún"
    ((WARNINGS++))
fi

# ==================== RESUMEN ====================
echo ""
echo "=========================================="
echo "           RESUMEN"
echo "=========================================="
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ TODO PERFECTO${NC}"
    echo ""
    echo "Tu instalación está completa y lista para usar."
    echo ""
    echo "Próximos pasos:"
    echo "1. Abre Cursor: cursor ."
    echo "2. Abre main.tex"
    echo "3. Presiona Cmd+Alt+B para compilar"
    echo ""
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ CASI LISTO${NC} (${WARNINGS} advertencia(s))"
    echo ""
    echo "Tu instalación funciona pero hay algunas advertencias."
    echo "Revisa los mensajes arriba."
    echo ""
elif [ $ERRORS -le 2 ]; then
    echo -e "${YELLOW}⚠ INSTALACIÓN INCOMPLETA${NC}"
    echo "   ${RED}Errores: ${ERRORS}${NC}"
    echo "   ${YELLOW}Advertencias: ${WARNINGS}${NC}"
    echo ""
    echo "Pasos recomendados:"
    echo "1. Instala BasicTeX: brew install --cask basictex"
    echo "2. Actualiza PATH: eval \"\$(/usr/libexec/path_helper)\""
    echo "3. Ejecuta: ./setup_latex_packages.sh"
    echo "4. Vuelve a ejecutar este script"
    echo ""
else
    echo -e "${RED}✗ INSTALACIÓN NO COMPLETADA${NC}"
    echo "   ${RED}Errores: ${ERRORS}${NC}"
    echo "   ${YELLOW}Advertencias: ${WARNINGS}${NC}"
    echo ""
    echo "Lee los mensajes arriba y sigue las instrucciones."
    echo ""
    echo "Consulta: GUIA_PRINCIPIANTES_LATEX.md"
    echo ""
fi

echo "=========================================="
echo ""

exit $ERRORS
