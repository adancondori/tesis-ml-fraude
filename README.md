# 📚 Tesis de Maestría - TechSport Fraud Detection

## 📋 Información General

**Título:** Implementación de un Modelo de Machine Learning para la detección de Anomalías y fraude en pagos transaccionales en la empresa TechSport

**Autor:** [Tu Nombre]
**Tutor:** [Nombre del Tutor]
**Universidad:** Universidad Autónoma Gabriel René Moreno (UAGRM)
**Programa:** Maestría en Ciencias de la Computación
**Gestión:** 2024-2025

---

## 📁 Estructura del Proyecto

```
Tesis-Latex/
├── main.tex                    # Archivo principal de LaTeX
├── setup_latex_packages.sh     # Script para instalar paquetes LaTeX
├── README.md                   # Este archivo
│
├── config/                     # Configuración del documento
│   ├── paquetes.tex           # Todos los paquetes necesarios
│   ├── formato.tex            # Estilos y formato general
│   ├── comandos.tex           # Comandos personalizados
│   ├── informacion.tex        # Datos del autor y tesis
│   ├── portada.tex            # Portada de la tesis
│   ├── dedicatoria.tex        # Dedicatoria
│   ├── agradecimientos.tex    # Agradecimientos
│   ├── resumen.tex            # Resumen en español
│   └── abstract.tex           # Abstract en inglés
│
├── capitulos/                  # Capítulos de la tesis
│   ├── 00_introduccion.tex    # Introducción
│   ├── 01_antecedentes.tex    # Antecedentes del problema
│   ├── 02_marco_teorico.tex   # Marco teórico
│   ├── 03_metodologia.tex     # Diseño metodológico
│   ├── 04_desarrollo.tex      # Desarrollo e implementación
│   ├── 05_resultados.tex      # Resultados y análisis
│   └── 06_conclusiones.tex    # Conclusiones y recomendaciones
│
├── bibliografia/               # Referencias bibliográficas
│   └── referencias.bib        # Archivo BibTeX con 20 referencias
│
├── imagenes/                   # Recursos gráficos
│   ├── figuras/               # Figuras generales
│   ├── diagramas/             # Diagramas de flujo, arquitectura
│   ├── graficos/              # Gráficos y plots
│   └── logos/                 # Logos institucionales
│
├── tablas/                     # Archivos de tablas complejas
│
├── codigo/                     # Código fuente de ejemplo
│
└── apendices/                  # Apéndices
    ├── apendice_a.tex         # Código fuente completo
    ├── apendice_b.tex         # Datos adicionales
    └── apendice_c.tex         # Documentación técnica
```

---

## 🚀 Instalación de LaTeX

### Paso 1: Instalar BasicTeX

```bash
# Instalar BasicTeX con Homebrew
brew install --cask basictex

# Actualizar PATH
eval "$(/usr/libexec/path_helper)"

# Verificar instalación
pdflatex --version
```

### Paso 2: Instalar Paquetes LaTeX

```bash
# Dar permisos al script
chmod +x setup_latex_packages.sh

# Ejecutar instalación (requiere contraseña de administrador)
./setup_latex_packages.sh
```

**Tiempo estimado:** 10-15 minutos

---

## ✏️ Edición con Cursor

### Extensión Instalada
- ✅ **LaTeX Workshop** - Ya instalada en Cursor

### Atajos de Teclado

| Atajo | Acción |
|-------|--------|
| `Cmd + Alt + B` | Compilar el documento |
| `Cmd + Alt + V` | Ver PDF |
| `Cmd + Alt + C` | Limpiar archivos auxiliares |
| `Cmd + Alt + J` | Sincronizar PDF con código |

### Flujo de Trabajo

1. **Abrir el proyecto:**
   ```bash
   cursor /path/to/Tesis-Latex
   ```

2. **Editar archivos:**
   - Modifica los capítulos en `capitulos/`
   - Actualiza información personal en `config/informacion.tex`
   - Agrega imágenes en `imagenes/`

3. **Compilar:**
   - Abre `main.tex`
   - Presiona `Cmd + Alt + B`
   - El PDF se genera automáticamente

4. **Ver resultado:**
   - Presiona `Cmd + Alt + V` para ver el PDF
   - Los cambios se reflejan automáticamente

---

## 📝 Guía de Uso

### Personalizar Información

Edita `config/informacion.tex` y modifica:

```latex
\newcommand{\nombreautor}{Tu Nombre Completo}
\newcommand{\emailautor}{tu.email@example.com}
\newcommand{\ciautor}{Tu CI}
\newcommand{\nombretutor}{Nombre del Tutor}
```

### Agregar Imágenes

```latex
% En cualquier capítulo
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{figuras/arquitectura.png}
    \caption{Arquitectura del sistema propuesto}
    \label{fig:arquitectura}
\end{figure}

% Referenciar
Como se observa en la \figref{fig:arquitectura}...
```

### Agregar Tablas

```latex
\begin{table}[H]
    \centering
    \caption{Métricas de evaluación del modelo}
    \label{tab:metricas}
    \begin{tabular}{@{}lcccc@{}}
        \toprule
        Modelo & Precisión & Recall & F1-Score & AUC \\
        \midrule
        Random Forest & 94.2\% & 92.1\% & 93.1\% & 0.96 \\
        XGBoost & 95.3\% & 93.5\% & 94.4\% & 0.97 \\
        \bottomrule
    \end{tabular}
\end{table}
```

### Agregar Código Python

```latex
\begin{lstlisting}[language=Python, caption=Entrenamiento del modelo]
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

# Dividir datos
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Entrenar modelo
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Evaluar
accuracy = model.score(X_test, y_test)
print(f"Precisión: {accuracy:.2%}")
\end{lstlisting}
```

### Citar Referencias

```latex
% Cita textual
Según \textcite{Hafez2025}, los modelos de ML...

% Cita entre paréntesis
Los estudios recientes \parencite{HernandezAros2024} demuestran...

% Múltiples citas
Diversos autores \parencite{Hafez2025,Feng2024,AlKhasawneh2025}...
```

---

## 📊 Compilación

### Método 1: Con Cursor (Recomendado)

1. Abrir `main.tex`
2. Presionar `Cmd + Alt + B`
3. El PDF se genera automáticamente en el mismo directorio

### Método 2: Terminal

```bash
# Compilación completa (con bibliografía)
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex

# Limpiar archivos temporales
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.bcf *.run.xml
```

---

## 🎨 Personalización

### Cambiar Márgenes

Edita `config/paquetes.tex`:

```latex
\usepackage[left=3cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
```

### Cambiar Interlineado

Edita `config/formato.tex`:

```latex
\onehalfspacing  % 1.5 (actual)
\doublespacing   % 2.0
\singlespacing   % 1.0
```

### Cambiar Estilo de Referencias

Edita `config/paquetes.tex`:

```latex
% APA (actual)
\usepackage[backend=biber,style=apa,sorting=nyt]{biblatex}

% IEEE
\usepackage[backend=biber,style=ieee,sorting=none]{biblatex}

% Numérico
\usepackage[backend=biber,style=numeric,sorting=none]{biblatex}
```

---

## 🐛 Solución de Problemas

### Error: "pdflatex not found"

```bash
# Ejecutar nuevamente
eval "$(/usr/libexec/path_helper)"

# Reiniciar terminal y Cursor
```

### Error: "Package not found"

```bash
# Instalar paquete específico
sudo tlmgr install <nombre-del-paquete>
```

### Error en compilación

```bash
# Limpiar todo
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.bcf *.run.xml *.fls *.fdb_latexmk

# Compilar nuevamente
pdflatex main.tex
```

### PDF no se actualiza

- Cerrar el visor de PDF
- Limpiar archivos temporales
- Compilar nuevamente

---

## 📚 Recursos

### Documentación
- [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [CTAN](https://www.ctan.org/)

### Herramientas Online
- [Tables Generator](https://www.tablesgenerator.com/)
- [Mathcha - Equation Editor](https://www.mathcha.io/)
- [Detexify - Symbol Search](http://detexify.kirelabs.org/classify.html)

---

## ✅ Checklist Pre-Entrega

- [ ] Actualizar información personal en `config/informacion.tex`
- [ ] Completar todos los capítulos
- [ ] Agregar todas las figuras y tablas
- [ ] Verificar todas las referencias bibliográficas
- [ ] Revisar ortografía y gramática
- [ ] Compilar sin errores
- [ ] Verificar numeración de páginas
- [ ] Revisar índices (contenidos, figuras, tablas)
- [ ] Eliminar comandos de notas/pendientes
- [ ] Exportar PDF final

---

## 📧 Contacto y Soporte

**Autor:** [Tu Nombre]
**Email:** [tu.email@example.com]
**Universidad:** UAGRM
**Programa:** Maestría en Ciencias de la Computación

---

**¡Éxito con tu tesis! 🎓**
