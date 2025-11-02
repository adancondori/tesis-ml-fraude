# 📘 GUÍA COMPLETA PARA PRINCIPIANTES EN LATEX

## 👋 ¡Bienvenido a LaTeX!

Esta es tu primera vez usando LaTeX. No te preocupes, te voy a guiar paso a paso.

---

## 🤔 ¿Qué es LaTeX?

LaTeX es un sistema de preparación de documentos que:
- ✅ Genera PDFs de calidad profesional
- ✅ Maneja automáticamente numeración, índices y referencias
- ✅ Es el estándar para tesis académicas
- ✅ Separa contenido de formato

**NO es como Word:**
- No ves el resultado mientras escribes (pero compilas para verlo)
- Usas "comandos" en lugar de botones
- El resultado es mucho más profesional

---

## 📋 CHECKLIST DE INSTALACIÓN

Sigue estos pasos EN ORDEN:

### ☐ Paso 1: Instalar BasicTeX (5-10 minutos)

1. **Abre Terminal** (búscala en Spotlight con Cmd+Espacio)

2. **Copia y pega este comando:**
   ```bash
   brew install --cask basictex
   ```

3. **Presiona Enter** y espera. Te pedirá tu contraseña.

4. **Actualiza el PATH** (muy importante):
   ```bash
   eval "$(/usr/libexec/path_helper)"
   ```

5. **Verifica que funcionó:**
   ```bash
   pdflatex --version
   ```

   ✅ Si ves algo como "pdfTeX 3.141592..." = **ÉXITO**
   ❌ Si dice "command not found" = cierra Terminal y vuelve a abrirla

---

### ☐ Paso 2: Instalar Paquetes LaTeX (10-15 minutos)

1. **Navega a tu carpeta de tesis:**
   ```bash
   cd "/Users/eidan/Documentation/Personal/Master/Perfil/Tesis-Latex"
   ```

2. **Ejecuta el instalador:**
   ```bash
   ./setup_latex_packages.sh
   ```

   ⏳ Esto tomará 10-15 minutos
   🔐 Te pedirá tu contraseña varias veces (es normal)

3. **Espera a que termine** - Verás "✅ Instalación completada!"

---

### ☐ Paso 3: Abrir en Cursor

1. **Opción A - Desde Terminal:**
   ```bash
   cursor "/Users/eidan/Documentation/Personal/Master/Perfil/Tesis-Latex"
   ```

2. **Opción B - Desde Cursor:**
   - Abre Cursor
   - File → Open Folder
   - Selecciona la carpeta `Tesis-Latex`

---

### ☐ Paso 4: Primera Compilación

1. **Abre el archivo `main.tex`** (en el explorador de archivos de Cursor)

2. **Presiona `Cmd + Alt + B`** (o busca "LaTeX Workshop: Build" en Cmd+Shift+P)

3. **Espera 30-60 segundos** en la primera compilación

4. **Si todo va bien:**
   - Verás un archivo `main.pdf` generado
   - Presiona `Cmd + Alt + V` para verlo en Cursor

5. **Si hay error:**
   - Lee el mensaje en "Output" (abajo)
   - Revisa la sección de errores más abajo

---

## 🎓 CONCEPTOS BÁSICOS DE LATEX

### 1. Estructura de un Documento

```latex
\documentclass{book}              % Tipo de documento
\usepackage{babel}                % Paquetes (como plugins)

\begin{document}                   % Inicio del contenido
    Hola mundo
\end{document}                     % Fin del contenido
```

### 2. Comandos Básicos

```latex
% Comentario (no aparece en PDF)

\textbf{texto en negrita}
\textit{texto en cursiva}
\section{Título de sección}
\subsection{Subtítulo}

\begin{itemize}                    % Lista con viñetas
    \item Punto 1
    \item Punto 2
\end{itemize}
```

### 3. Citas Bibliográficas

```latex
% Cita en el texto
Según \textcite{Hafez2025}, los modelos...

% Cita entre paréntesis
Los estudios recientes \parencite{Hafez2025} muestran...
```

### 4. Figuras

```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{figuras/imagen.png}
    \caption{Descripción de la imagen}
    \label{fig:mi_imagen}
\end{figure}

% Referenciar después
Como se ve en la \figref{fig:mi_imagen}...
```

### 5. Tablas

```latex
\begin{table}[H]
    \centering
    \caption{Título de la tabla}
    \label{tab:mi_tabla}
    \begin{tabular}{lcc}
        \toprule
        Columna 1 & Columna 2 & Columna 3 \\
        \midrule
        Dato 1 & Dato 2 & Dato 3 \\
        \bottomrule
    \end{tabular}
\end{table}
```

---

## 🗂️ ESTRUCTURA DE TU TESIS

```
main.tex                    ← Archivo PRINCIPAL (empieza aquí)
│
├── config/                 ← CONFIGURACIÓN (no toques mucho)
│   ├── informacion.tex    ← ✏️ EDITA: Tus datos personales
│   ├── portada.tex
│   ├── resumen.tex
│   └── ...
│
├── capitulos/             ← ✏️ AQUÍ TRABAJARÁS MÁS
│   ├── 00_introduccion.tex
│   ├── 01_antecedentes.tex
│   ├── 02_marco_teorico.tex
│   └── ...
│
├── bibliografia/          ← Referencias (ya están cargadas)
│   └── referencias.bib
│
├── imagenes/             ← ✏️ GUARDA AQUÍ TUS IMÁGENES
│   ├── figuras/
│   ├── diagramas/
│   └── graficos/
│
└── apendices/            ← Código, datos extra
```

---

## 🎯 FLUJO DE TRABAJO DIARIO

### Para EDITAR tu tesis:

1. **Abre Cursor** en la carpeta `Tesis-Latex`

2. **Edita un capítulo**, por ejemplo `capitulos/02_marco_teorico.tex`

3. **Guarda** (Cmd+S)

4. **Compila** (Cmd+Alt+B) para ver los cambios

5. **Repite** los pasos 2-4

### Tips:
- ✅ Guarda y compila frecuentemente
- ✅ Trabaja un capítulo a la vez
- ✅ Lee los errores con calma (suelen ser simples)
- ✅ NO borres los archivos de configuración

---

## 🐛 SOLUCIÓN DE ERRORES COMUNES

### Error 1: "pdflatex: command not found"

**Solución:**
```bash
# Cierra y vuelve a abrir Terminal
eval "$(/usr/libexec/path_helper)"
```

---

### Error 2: "Package XXX not found"

**Solución:**
```bash
sudo tlmgr install XXX
```
(Reemplaza XXX con el nombre del paquete)

---

### Error 3: "Undefined control sequence"

**Causa:** Usaste un comando que no existe o falta un paquete

**Solución:**
- Lee la línea del error
- Busca typos (errores de escritura)
- Ejemplo: `\tetxbf` debería ser `\textbf`

---

### Error 4: "Missing $ inserted"

**Causa:** Olvidaste cerrar un modo matemático

**Solución:**
```latex
% Incorrecto:
Usa la ecuación $x + y

% Correcto:
Usa la ecuación $x + y$
```

---

### Error 5: La imagen no aparece

**Causas comunes:**
1. La imagen no está en la carpeta correcta
2. El nombre del archivo está mal escrito
3. La extensión es incorrecta

**Solución:**
```latex
% Verifica que el archivo exista en:
% imagenes/figuras/mi_imagen.png

\includegraphics[width=0.8\textwidth]{figuras/mi_imagen.png}
```

---

### Error 6: Referencias bibliográficas no aparecen

**Solución - Compilar 3 veces:**
```bash
pdflatex main.tex
biber main
pdflatex main.tex
```

O en Cursor: Compila 3 veces seguidas (Cmd+Alt+B tres veces)

---

## 📚 RECURSOS PARA APRENDER MÁS

### Tutoriales:
- [Overleaf Learn LaTeX in 30 minutes](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)

### Herramientas Online:
- [Tables Generator](https://www.tablesgenerator.com/) - Crea tablas visualmente
- [Mathcha](https://www.mathcha.io/) - Editor de ecuaciones
- [Detexify](http://detexify.kirelabs.org/) - Dibuja un símbolo para encontrar su comando

### Cheatsheets:
- [LaTeX Cheat Sheet](https://wch.github.io/latexsheet/)

---

## ✅ CHECKLIST ANTES DE EMPEZAR A ESCRIBIR

- [ ] BasicTeX instalado (`pdflatex --version` funciona)
- [ ] Paquetes instalados (script ejecutado sin errores)
- [ ] Cursor abierto en la carpeta `Tesis-Latex`
- [ ] `main.tex` compila correctamente (genera PDF)
- [ ] Actualizaste `config/informacion.tex` con tus datos
- [ ] Entiendes la estructura de carpetas
- [ ] Guardaste esta guía en favoritos

---

## 🎓 CONSEJOS FINALES

### DO ✅
- Guarda frecuentemente (Cmd+S)
- Compila cada 5-10 minutos para verificar
- Lee los mensajes de error completos
- Usa comentarios para organizar (`% Este es un comentario`)
- Haz backups regulares

### DON'T ❌
- No borres archivos de `config/` si no sabes qué hacen
- No copies código directamente de Word (pégalo como texto plano)
- No uses caracteres especiales sin escapar (`$`, `%`, `&`, `#`)
- No edites `main.tex` directamente (edita los capítulos)
- No te frustres - LaTeX tiene curva de aprendizaje pero vale la pena

---

## 🆘 ¿NECESITAS AYUDA?

1. **Lee el error completo** en la ventana "Output" de Cursor
2. **Busca en Google** el error exacto
3. **Revisa esta guía** para errores comunes
4. **Consulta con tu tutor** o compañeros

---

## 🎉 ¡ESTÁS LISTO!

Ahora ejecuta la instalación y empieza a escribir tu tesis.

**Recuerda:** LaTeX es como aprender a manejar - al principio parece complicado, pero después se vuelve natural.

---

**¡Éxito con tu tesis! 🎓**

*Universidad Autónoma Gabriel René Moreno*
*Maestría en Ciencias de la Computación*
