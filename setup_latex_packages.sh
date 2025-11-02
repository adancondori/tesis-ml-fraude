#!/bin/bash

# Script para instalar paquetes LaTeX necesarios para tesis académica
# Ejecutar después de instalar BasicTeX

echo "=============================================="
echo "Instalando paquetes LaTeX para tesis académica"
echo "=============================================="

# Actualizar tlmgr (gestor de paquetes de TeX)
echo "Actualizando tlmgr..."
sudo tlmgr update --self

# Paquetes esenciales para tesis
echo "Instalando paquetes esenciales..."

# Idioma español
sudo tlmgr install babel-spanish

# Bibliografía y referencias
sudo tlmgr install biblatex
sudo tlmgr install biber
sudo tlmgr install csquotes

# Formato y estructura
sudo tlmgr install geometry
sudo tlmgr install fancyhdr
sudo tlmgr install setspace
sudo tlmgr install titlesec
sudo tlmgr install tocloft

# Matemáticas y símbolos
sudo tlmgr install amsmath
sudo tlmgr install amssymb
sudo tlmgr install amsfonts
sudo tlmgr install mathtools

# Gráficos y figuras
sudo tlmgr install graphicx
sudo tlmgr install float
sudo tlmgr install caption
sudo tlmgr install subcaption

# Tablas
sudo tlmgr install booktabs
sudo tlmgr install multirow
sudo tlmgr install longtable
sudo tlmgr install array

# Colores y enlaces
sudo tlmgr install xcolor
sudo tlmgr install hyperref
sudo tlmgr install url

# Listados de código (para tesis de CS)
sudo tlmgr install listings
sudo tlmgr install lstaddons

# Algoritmos (para machine learning)
sudo tlmgr install algorithm2e
sudo tlmgr install algorithmicx
sudo tlmgr install algpseudocode

# Fuentes
sudo tlmgr install fontenc
sudo tlmgr install inputenc
sudo tlmgr install lmodern

# Apéndices
sudo tlmgr install appendix

# Glosarios y acrónimos
sudo tlmgr install glossaries
sudo tlmgr install glossaries-extra

# Herramientas adicionales
sudo tlmgr install etoolbox
sudo tlmgr install xifthen
sudo tlmgr install ifmtarg

# Paquetes para formato APA (común en tesis)
sudo tlmgr install apacite

# Soporte para UTF-8
sudo tlmgr install ucs

# Índices
sudo tlmgr install makeidx

# Paquetes de colecciones importantes
sudo tlmgr install collection-fontsrecommended
sudo tlmgr install collection-latex
sudo tlmgr install collection-latexrecommended

echo "=============================================="
echo "✅ Instalación completada!"
echo "=============================================="
echo ""
echo "Para compilar tu tesis usa:"
echo "  pdflatex tu_tesis.tex"
echo "  biber tu_tesis"
echo "  pdflatex tu_tesis.tex"
echo "  pdflatex tu_tesis.tex"
echo ""
echo "O simplemente usa Cursor con LaTeX Workshop (Ctrl+Alt+B)"
