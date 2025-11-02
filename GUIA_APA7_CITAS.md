# Guía para Usar APA 7ma Edición en LaTeX

## ✅ Configuración Completada

Tu tesis ya está configurada para usar **APA 7ma edición** con biblatex. La configuración incluye:

```latex
\usepackage[
    backend=biber,
    style=apa,
    sorting=nyt,
    maxbibnames=99,
    uniquename=false,
    uniquelist=false,
    apamaxprtauth=99
]{biblatex}
\DeclareLanguageMapping{spanish}{spanish-apa}
```

## 📝 Cómo Citar en el Texto

### 1. Citas Narrativas (autor parte de la oración)

**Usar:** `\textcite{clave}`

```latex
❌ INCORRECTO (manual):
Según Hernández Sampieri et al. (2024), el enfoque cuantitativo...

✅ CORRECTO (comando LaTeX):
Según \textcite{Hernandez2023}, el enfoque cuantitativo...
```

**Resultado:** Según Hernández Sampieri et al. (2023), el enfoque cuantitativo...

### 2. Citas Parentéticas (entre paréntesis)

**Usar:** `\parencite{clave}`

```latex
❌ INCORRECTO (manual):
Los modelos ML superan a los tradicionales (Hafez et al., 2025).

✅ CORRECTO (comando LaTeX):
Los modelos ML superan a los tradicionales \parencite{Hafez2025}.
```

**Resultado:** Los modelos ML superan a los tradicionales (Hafez et al., 2025).

### 3. Múltiples Citas

```latex
\parencite{Hafez2025,HernandezAros2024,Bello2024}
```

**Resultado:** (Bello, 2024; Hafez et al., 2025; Hernández Aros et al., 2024)

### 4. Cita con Número de Página

```latex
\parencite[p. 45]{Geron2022}
\textcite[pp. 120-125]{Goodfellow2016}
```

**Resultado:** (Géron, 2022, p. 45)

## 📚 Formato de Referencias Bibliográficas

Tu archivo `bibliografia/referencias.bib` ya está bien estructurado. Aquí los tipos principales:

### Artículo de Revista

```bibtex
@article{Hafez2025,
    author   = {Hafez, Ibrahim Y. and Hafez, Ahmed Y.},
    title    = {A systematic review of AI-enhanced techniques},
    journal  = {Journal of Big Data},
    year     = {2025},
    volume   = {12},
    number   = {6},
    doi      = {10.1186/s40537-024-01048-8}
}
```

### Libro

```bibtex
@book{Geron2022,
    author    = {Géron, Aurélien},
    title     = {Hands-On Machine Learning},
    publisher = {O'Reilly Media},
    year      = {2022},
    edition   = {3}
}
```

### Reporte Técnico

```bibtex
@techreport{NIST2024,
    author      = {{National Institute of Standards and Technology}},
    title       = {The NIST Cybersecurity Framework (CSF) 2.0},
    institution = {NIST},
    year        = {2024},
    doi         = {10.6028/NIST.CSWP.29}
}
```

## 🔄 Proceso de Compilación

Para que las referencias aparezcan correctamente, debes compilar en este orden:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

O puedes usar este comando completo:

```bash
pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex
```

## ⚙️ Comandos Importantes

| Comando | Uso | Ejemplo |
|---------|-----|---------|
| `\textcite{}` | Cita narrativa | Según \textcite{Autor2024}... |
| `\parencite{}` | Cita parentética | ...resultado \parencite{Autor2024}. |
| `\cite{}` | **NO usar** | Deprecado en APA |
| `\autocite{}` | Automático | Se adapta al contexto |

## 📋 Ejemplos Completos

### Ejemplo 1: Introducción de Idea

```latex
Los sistemas de detección de fraude requieren técnicas avanzadas de IA
que puedan adaptarse y aprender de nuevos datos \parencite{Bello2024}.
```

### Ejemplo 2: Autor como Sujeto

```latex
\textcite{HernandezAros2024} demuestran que el crecimiento exponencial
de las transacciones digitales ha generado un aumento proporcional en
las actividades fraudulentas.
```

### Ejemplo 3: Múltiples Fuentes

```latex
Diversos estudios han demostrado la efectividad de los modelos de ML
en la detección de fraude \parencite{Hafez2025,Feng2024,Cheng2025}.
```

## 🚫 Errores Comunes a Evitar

### ❌ NO hagas esto:

```latex
Según (Autor et al., 2024)
(Autor, 2024) menciona que...
Autor (2024) señala...
```

### ✅ Haz esto:

```latex
Según \textcite{Autor2024}
\parencite{Autor2024} menciona que...
\textcite{Autor2024} señala...
```

## 📖 Referencias al Final

Las referencias se generan automáticamente con:

```latex
\printbibliography[heading=bibintoc,title={Referencias Bibliográficas}]
```

Ya está incluido en tu `main.tex`.

## 🔍 Verificar Formato APA 7

Las citas deben aparecer así en el PDF:

- **En el texto:** (Autor, 2024) o Autor et al. (2024)
- **En referencias:**
  - Apellido, I. (2024). *Título del artículo*. *Revista*, *volumen*(número), páginas. https://doi.org/...

## 💡 Consejo Final

**Siempre usa comandos de LaTeX (`\textcite`, `\parencite`) en lugar de escribir las citas manualmente.** Esto garantiza:

1. ✅ Formato correcto según APA 7
2. ✅ Enlaces automáticos (clicables en el PDF)
3. ✅ Actualización automática si cambias la referencia
4. ✅ Orden alfabético correcto en la bibliografía
5. ✅ Manejo correcto de "et al."
6. ✅ Cursivas automáticas en títulos

---

**Nota:** Si necesitas agregar una nueva referencia, añádela al archivo `bibliografia/referencias.bib` y luego cítala con `\textcite{}` o `\parencite{}`.
