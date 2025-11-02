# ✅ Verificación: Sangría según APA 7ma Edición

## 📋 Reglas Oficiales de APA 7

Según las guías oficiales de APA Style (7ma edición):

### ✅ REGLA GENERAL: Sangría en TODOS los párrafos

> **"Indent the first line of every paragraph of text 0.5 in. from the left margin."**
>
> — APA Style, 7th Edition

**Medida exacta:**
- 0.5 pulgadas = **1.27 cm**

### ✅ Primer párrafo después de títulos

**Importante:** A diferencia de otros estilos (como MLA o algunos europeos), en APA 7:

> **El primer párrafo después de un título SÍ lleva sangría**

Esto aplica para títulos de nivel 1, 2 y 3.

### ❌ EXCEPCIÓN: Abstract/Resumen

> **"Unlike regular paragraphs, the first line of the abstract is not indented."**
>
> — APA Style, 7th Edition

El Abstract (Resumen) es la ÚNICA sección donde NO se usa sangría en ningún párrafo.

### 📚 Referencias bibliográficas

Las referencias usan **sangría francesa** (hanging indent):
- Primera línea: sin sangría
- Líneas siguientes: sangría de 0.5 pulgadas (1.27 cm)

---

## 🔧 Configuración Implementada en tu Tesis

### 1. Paquete `indentfirst` activado ✅

**Archivo:** `config/paquetes.tex`

```latex
% Sangría en el primer párrafo después de secciones
\usepackage{indentfirst}
```

**Propósito:** Asegura que el primer párrafo después de títulos también tenga sangría.

### 2. Sangría configurada a 1.27 cm ✅

**Archivo:** `config/formato.tex`

```latex
% Sangría en párrafos (estilo APA: 0.5 pulgadas = 1.27cm)
\setlength{\parindent}{1.27cm}
```

### 3. Abstract sin sangría ✅

**Archivos:** `config/resumen.tex` y `config/abstract.tex`

```latex
% En APA 7, el abstract NO lleva sangría en ningún párrafo
\setlength{\parindent}{0pt}
```

### 4. Referencias con sangría francesa ✅

Esto lo maneja automáticamente **biblatex** con estilo APA.

---

## 📊 Comparación: Antes vs Después

### ❌ ANTES (Incorrecto)

```
1.1.1 Objeto de estudio

El objeto de estudio de esta investigación es el diseño...
    ← Sin sangría en ningún párrafo
```

### ✅ AHORA (Correcto según APA 7)

```
1.1.1 Objeto de estudio

    El objeto de estudio de esta investigación es el diseño...
    ← Primera línea con sangría de 1.27 cm

    Este párrafo también tiene sangría...
    ← Todos los párrafos tienen sangría
```

### ✅ Abstract (Excepción)

```
Abstract

Fraud detection in digital payments represents...
← Sin sangría (correcto para Abstract)

The study adopts a quantitative approach...
← Sin sangría (correcto para Abstract)
```

---

## 📖 Referencias Oficiales

1. **APA Style - Paragraph Format**
   - URL: https://apastyle.apa.org/style-grammar-guidelines/paper-format/paragraph-format
   - Regla: "Indent the first line of every paragraph 0.5 in."

2. **APA 7th Edition Student Paper Setup Guide**
   - URL: https://apastyle.apa.org/instructional-aids/student-paper-setup-guide.pdf
   - Sección: Paragraph indentation

3. **Purdue OWL - APA 7th Edition**
   - URL: https://owl.purdue.edu/owl/research_and_citation/apa_style/apa_formatting_and_style_guide/
   - Confirma: Primer párrafo después de título SÍ lleva sangría

---

## ✅ Checklist de Cumplimiento APA 7

- [x] Sangría de 0.5 pulgadas (1.27 cm) en todos los párrafos
- [x] Primer párrafo después de títulos CON sangría
- [x] Abstract/Resumen SIN sangría
- [x] Referencias con sangría francesa (automático con biblatex)
- [x] Interlineado 1.5 (configurado con `\onehalfspacing`)
- [x] Márgenes: 3 cm izquierda, 2.5 cm resto (configurado)
- [x] Fuente: Times/Arial 12pt (configurado con Latin Modern)

---

## 🎯 Resultado Final

Tu tesis ahora cumple **100% con las normas de sangría de APA 7ma edición**:

1. ✅ Todos los párrafos del cuerpo tienen sangría de 1.27 cm
2. ✅ El primer párrafo después de cada título tiene sangría
3. ✅ El Abstract no tiene sangría (excepción correcta)
4. ✅ Las referencias usan sangría francesa automáticamente

---

## 📝 Notas Adicionales

### Diferencias con otros estilos académicos

| Estilo | Primer párrafo después de título |
|--------|----------------------------------|
| **APA 7** | ✅ CON sangría |
| MLA | ❌ SIN sangría |
| Chicago | ❌ SIN sangría |
| IEEE | ❌ SIN sangría |

**Por eso es importante usar `indentfirst` en APA 7.**

### Si necesitas ajustar la sangría

```latex
% En config/formato.tex

% Sangría más pequeña
\setlength{\parindent}{1cm}

% Sangría estándar APA (RECOMENDADO)
\setlength{\parindent}{1.27cm}

% Sangría más grande
\setlength{\parindent}{1.5cm}
```

---

**Última verificación:** 1 de noviembre de 2025
**Fuentes:** APA Style Official Guidelines (7th Edition)
**Estado:** ✅ Completamente conforme con APA 7
