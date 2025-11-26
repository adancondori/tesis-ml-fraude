# 📘 Guía de Comandos Reutilizables - Normas UAGRM

Esta guía documenta los comandos personalizados creados para cumplir con los lineamientos de formato de la UAGRM siguiendo el principio DRY (Don't Repeat Yourself).

---

## ✅ Configuraciones Globales Aplicadas

### 1. Interlineado Global: 1.5

```latex
% En config/paquetes.tex
\setstretch{1.5}  % Interlineado 1.5 líneas (~0.64cm de espaciado)
```

**Aplica a:** Todo el documento (texto principal, índices, capítulos)

### 2. Fuente: Times New Roman 12pt

```latex
% En config/paquetes.tex
\usepackage{newtxtext,newtxmath}  % Times New Roman

% En main.tex
\documentclass[12pt,a4paper,oneside]{book}  % Tamaño 12pt
```

**Aplica a:** Todo el texto del documento

### 3. Captions de Figuras y Tablas ARRIBA

```latex
% En config/formato.tex
\captionsetup[figure]{
    position=top,      % Caption arriba (UAGRM)
    font=normalsize    % Tamaño 12pt
}

\captionsetup[table]{
    position=top,      % Caption arriba (UAGRM)
    font=normalsize    % Tamaño 12pt
}
```

### 4. Títulos de Capítulos Centrados y en MAYÚSCULAS (Una Sola Línea)

```latex
% En config/formato.tex - Formato en el cuerpo del documento
\titleformat{\chapter}[block]
    {\normalfont\Large\bfseries\centering}
    {\MakeUppercase{\chaptertitlename\ \thechapter.}}
    {0.5em}
    {\MakeUppercase}

% Formato en el índice (Table of Contents)
\renewcommand{\cftchappresnum}{CAPÍTULO\ }
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftchapfont}{\bfseries\MakeUppercase}
\renewcommand{\cftchappagefont}{\bfseries}
\setlength{\cftchapnumwidth}{7.5em}  % Espacio para "CAPÍTULO X." o "APÉNDICE A."
\renewcommand{\cftdot}{.}  % Puntos guía
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}  % Puntos hasta número de página

% En main.tex, después de \appendix:
% \addtocontents{toc}{\protect\renewcommand{\protect\cftchappresnum}{APÉNDICE\ }}
```

**Resultado:**
- En el cuerpo: `CAPÍTULO 3. PROPUESTA Y VALIDACIÓN` (centrado, en mayúsculas, **una sola línea**)
- En el índice (capítulos): `CAPÍTULO 3. PROPUESTA Y VALIDACIÓN .......... 134`
- En el índice (apéndices): `APÉNDICE A. MATRICES METODOLÓGICAS ............. 157`

---

## 🔧 Comandos Reutilizables Creados

### 1. `\fuente{texto}` - Agregar Fuente Obligatoria

**Requisito UAGRM:** Todas las tablas y figuras deben incluir "Fuente:" en la parte inferior.

**Uso:**

```latex
\begin{table}[H]
    \centering
    \caption{Métricas de evaluación del modelo}
    \label{tab:metricas}
    \begin{tabular}{@{}lcc@{}}
        \toprule
        Métrica & Valor & Interpretación \\
        \midrule
        Accuracy & 94.2\% & Excelente \\
        \bottomrule
    \end{tabular}
\end{table}
\fuente{Elaboración propia}
```

**Opciones comunes:**
- `\fuente{Elaboración propia}`
- `\fuente{Autor, año}`
- `\fuente{Adaptado de Autor, año}`
- `\fuente{Datos de la empresa TechSport, 2025}`

**Resultado visual:**
```
[Tabla aparece aquí]

Fuente: Elaboración propia
```

---

### 2. `\iniciotabla` y `\fintabla` - Formato de Tablas Pequeñas

**Requisito UAGRM:** Interior de tablas con tamaño 10pt e interlineado 1.5.

**Uso:**

```latex
\begin{table}[H]
    \centering
    \caption{Distribución de transacciones por canal}
    \label{tab:distribucion}
    \iniciotabla  % ← Activa tamaño 10pt e interlineado 1.5
    \begin{tabular}{@{}lcc@{}}
        \toprule
        Canal & Frecuencia & Porcentaje \\
        \midrule
        Web & 45,250 & 45.2\% \\
        Móvil & 38,500 & 38.5\% \\
        POS & 16,250 & 16.3\% \\
        \bottomrule
    \end{tabular}
    \fintabla  % ← Restaura tamaño normal
\end{table}
\fuente{Elaboración propia basada en datos de TechSport, 2025}
```

**Equivalente manual (NO recomendado):**
```latex
% En lugar de \iniciotabla y \fintabla, podrías usar:
{\small\setstretch{1.5}
    \begin{tabular}...
    \end{tabular}
}
% Pero los comandos son más limpios y reutilizables
```

---

### 3. `\tablainterlineado` - Solo Interlineado 1.5

**Uso:** Cuando quieres mantener tamaño normal pero cambiar interlineado.

```latex
{\tablainterlineado
    Texto con interlineado 1.5
}
```

---

## 📊 Ejemplos Completos

### Ejemplo 1: Tabla con Números (TABLA según UAGRM)

```latex
\begin{table}[H]
    \centering
    \caption{Resultados de evaluación del modelo Random Forest}
    \label{tab:resultados}
    \iniciotabla
    \begin{tabular}{@{}lccc@{}}
        \toprule
        Métrica & Train & Validation & Test \\
        \midrule
        Accuracy & 95.3\% & 94.1\% & 94.2\% \\
        Precision & 92.5\% & 91.8\% & 92.1\% \\
        Recall & 93.2\% & 92.9\% & 93.1\% \\
        F1-Score & 92.8\% & 92.3\% & 92.6\% \\
        \bottomrule
    \end{tabular}
    \fintabla
\end{table}
\fuente{Elaboración propia}
```

**Características:**
- ✅ Caption arriba (automático)
- ✅ Interior 10pt, interlineado 1.5 (`\iniciotabla`)
- ✅ Solo líneas horizontales (booktabs: `\toprule`, `\midrule`, `\bottomrule`)
- ✅ Contiene números
- ✅ Fuente abajo (`\fuente{}`)

---

### Ejemplo 2: Cuadro con Texto (CUADRO según UAGRM)

**NOTA:** UAGRM distingue entre TABLA (números) y CUADRO (texto con todas las celdas definidas).

Si necesitas crear un **cuadro** (con todas las líneas de celdas):

```latex
% En formato.tex, agrega antes de compilar:
\captionsetup[table]{name=Cuadro}  % Solo si UAGRM lo requiere

\begin{table}[H]
    \centering
    \caption{Descripción de variables del dataset}
    \label{cuadro:variables}
    \iniciotabla
    \begin{tabular}{|p{3cm}|p{8cm}|p{2cm}|}
        \hline
        \textbf{Variable} & \textbf{Descripción} & \textbf{Tipo} \\
        \hline
        transaction\_id & Identificador único & Numérico \\
        \hline
        monto & Valor en USD & Numérico \\
        \hline
        fraude & 0=legítimo, 1=fraude & Binario \\
        \hline
    \end{tabular}
    \fintabla
\end{table}
\fuente{Dataset TechSport, 2025}
```

**Diferencia clave:**
- **Tabla:** Solo `\toprule`, `\midrule`, `\bottomrule` (horizontal)
- **Cuadro:** Usa `|` y `\hline` (todas las celdas delimitadas)

---

### Ejemplo 3: Figura con Caption Arriba

```latex
\begin{figure}[H]
    \centering
    \caption{Arquitectura del modelo Random Forest}
    \label{fig:arquitectura}
    \includegraphics[width=0.8\textwidth]{imagenes/diagramas/arquitectura.png}
\end{figure}
\fuente{Elaboración propia}
```

**Características:**
- ✅ Caption arriba (automático por `position=top`)
- ✅ Tamaño 12pt en caption
- ✅ Fuente abajo con `\fuente{}`

---

## 🎯 Reglas de Uso según UAGRM

### Tablas y Figuras

1. **Siempre referenciar ANTES de aparecer en el texto:**
   ```latex
   Como se observa en la Tabla~\ref{tab:resultados}, el modelo alcanza...

   \begin{table}[H]
       % La tabla aparece DESPUÉS de ser referenciada
   ```

2. **Caption siempre ARRIBA** (ya configurado automáticamente)

3. **Fuente siempre ABAJO** (usar `\fuente{}`)

4. **Interior de tablas: 10pt, interlineado 1.5** (usar `\iniciotabla` ... `\fintabla`)

### Índices

Los índices ya están configurados globalmente:
- Tamaño: 12pt ✅
- Interlineado: 1.5 ✅
- No requieres hacer nada adicional

---

## 🔄 Migración de Tablas/Figuras Existentes

### Antes (sin UAGRM):
```latex
\begin{table}[H]
    \centering
    \caption{Datos}
    \label{tab:datos}
    \small  % ← Antiguo
    \begin{tabular}{lcc}
        ...
    \end{tabular}
\end{table}
```

### Después (con UAGRM):
```latex
\begin{table}[H]
    \centering
    \caption{Datos}  % ← Caption arriba (automático)
    \label{tab:datos}
    \iniciotabla  % ← Nuevo: 10pt + interlineado 1.5
    \begin{tabular}{@{}lcc@{}}
        \toprule
        ...
        \bottomrule
    \end{tabular}
    \fintabla  % ← Restaura tamaño normal
\end{table}
\fuente{Elaboración propia}  % ← OBLIGATORIO según UAGRM
```

---

## 📝 Resumen de Cambios Aplicados

| Elemento | Antes | Ahora (UAGRM) | Automático |
|----------|-------|---------------|------------|
| Interlineado global | 1.5 (defecto) | 1.5 | ✅ Sí |
| Fuente | Latin Modern | Times New Roman | ✅ Sí |
| Títulos capítulos | Izquierda, normal | Centrado, MAYÚSCULAS | ✅ Sí |
| Caption figuras | Abajo | Arriba | ✅ Sí |
| Caption tablas | Arriba | Arriba | ✅ Sí |
| Tamaño caption | small | normalsize (12pt) | ✅ Sí |
| Fuente en tablas/figuras | No | Sí (usar `\fuente{}`) | ❌ Manual |
| Interior tablas | Variado | 10pt, 1.5 (usar `\iniciotabla`) | ❌ Manual |

---

## ⚠️ Notas Importantes

1. **Todos los cambios son compatibles con el código existente** - No rompe nada actual.

2. **Los comandos son OPCIONALES para código viejo** - Las tablas/figuras existentes seguirán funcionando.

3. **Usa los comandos en NUEVAS tablas/figuras** para cumplir con UAGRM.

4. **Para migrar gradualmente:** Busca todas las tablas/figuras y agrega `\fuente{}` debajo de cada una.

---

## 🔍 Verificación de Cumplimiento

Ejecuta estos comandos para verificar:

```bash
# Compilar con nuevas normas
make clean && make pdf

# Verificar tamaño del PDF
make stats

# Ver advertencias de compilación
cat main.log | grep -i warning
```

---

**Última actualización:** Noviembre 2025
**Autor:** Ing. Adan Condori Callisaya
**Universidad:** UAGRM - Maestría en Dirección Estratégica en Ingeniería de Software
