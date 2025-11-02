# Proyecto de Tesis en LaTeX

## Descripción General
Este es un proyecto de tesis académica escrito en LaTeX, configurado para seguir las normas APA 7ª edición.

## Estructura del Proyecto

```
.
├── main.tex                 # Archivo principal de la tesis
├── config/                  # Configuraciones y paquetes
├── capitulos/              # Capítulos de la tesis
├── apendices/              # Apéndices
├── bibliografia/           # Referencias bibliográficas (.bib)
└── setup_latex_packages.sh # Script de instalación de paquetes
```

## Archivos Principales

- **main.tex**: Documento principal que incluye todos los capítulos
- **config/**: Contiene la configuración de formato APA7, paquetes y definiciones
- **capitulos/**: Cada capítulo está en un archivo separado
- **bibliografia/**: Archivos .bib con las referencias bibliográficas

## Normas y Estándares

- **Formato**: APA 7ª edición
- **Sangría**: Primera línea de cada párrafo
- **Interlineado**: Doble espacio
- **Fuente**: Times New Roman o similar
- **Márgenes**: 2.54 cm (1 pulgada) en todos los lados

## Comandos de Compilación

```bash
# Compilación completa
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex

# O usar latexmk (recomendado)
latexmk -pdf main.tex
```

## Verificación

- `verificar_instalacion.sh`: Verifica que todos los paquetes necesarios estén instalados
- Scripts de verificación de sangría y formato APA7

## Notas Importantes

- Todos los archivos auxiliares (.aux, .log, .bbl, etc.) están en .gitignore
- Los capítulos se incluyen con `\include{}` o `\input{}`
- Las citas se manejan con BibLaTeX y Biber
- El formato APA7 requiere configuraciones específicas de sangría y espaciado

## Workflow Típico

1. Editar archivos .tex en capitulos/
2. Actualizar bibliografia/ con nuevas referencias
3. Compilar con latexmk o pdflatex
4. Verificar formato y sangría
5. Revisar PDF generado

## Paquetes Clave

- `biblatex-apa`: Citas y referencias APA7
- `setspace`: Control de interlineado
- `geometry`: Configuración de márgenes
- `indentfirst`: Sangría en primer párrafo
- `csquotes`: Comillas contextuales
