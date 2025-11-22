#!/bin/bash
# Script de compilación rápida para documentos de la Tarea 4
# Uso: ./compilar.sh [nombre_archivo_sin_extension]

if [ -z "$1" ]; then
    echo "Uso: ./compilar.sh [nombre_archivo_sin_extension]"
    echo "Ejemplo: ./compilar.sh instrumentos_constatacion_MEJORADO"
    exit 1
fi

ARCHIVO="$1"

echo "======================================"
echo "Compilando: ${ARCHIVO}.tex"
echo "======================================"

# Primera pasada
echo "[1/2] Primera compilación..."
pdflatex -interaction=nonstopmode "${ARCHIVO}.tex" > /dev/null 2>&1

# Segunda pasada (para referencias cruzadas)
echo "[2/2] Segunda compilación (referencias)..."
pdflatex -interaction=nonstopmode "${ARCHIVO}.tex" > /dev/null 2>&1

# Limpiar archivos auxiliares
echo "Limpiando archivos auxiliares..."
rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz

# Verificar generación del PDF
if [ -f "${ARCHIVO}.pdf" ]; then
    SIZE=$(ls -lh "${ARCHIVO}.pdf" | awk '{print $5}')
    echo "======================================"
    echo "✅ PDF generado exitosamente:"
    echo "   ${ARCHIVO}.pdf (${SIZE})"
    echo "======================================"
else
    echo "❌ Error: No se pudo generar el PDF"
    exit 1
fi
