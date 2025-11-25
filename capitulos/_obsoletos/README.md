# Archivos Obsoletos - Respaldo

Este directorio contiene archivos de capítulos que fueron **removidos de la estructura principal** de la tesis el **24 de noviembre de 2025**.

## Razón de la limpieza

La tesis fue reestructurada para seguir estrictamente la **estructura oficial UAGRM** según la documentación en `.claude/commands/tutor-tesis.md`:

### Estructura UAGRM (oficial):
- Introducción
- Perfil (Antecedentes, Formulación, Objetivos, Hipótesis)
- **Capítulo 1**: Marco Teórico Conceptual
- **Capítulo 2**: Diagnóstico y Análisis de Resultados
- **Capítulo 3**: Propuesta y Validación
- Conclusiones y Recomendaciones
- Bibliografía
- Anexos

## Archivos en este directorio

### 1. `01_antecedentes_OBSOLETO.tex` (918 bytes)
- **Razón de eliminación**: Archivo ya marcado explícitamente como obsoleto
- **Contenido absorbido en**: `00_perfil.tex`
- **Fecha original**: Nov 1, 2024

### 2. `03_metodologia.tex` (32K)
- **Razón de eliminación**: Contenido duplicado - la metodología ya está incluida en `00_perfil.tex` (sección "Diseño Metodológico")
- **Contenido**: Tipo de investigación, enfoque cuantitativo, diseño metodológico
- **Fecha original**: Nov 20, 2024

### 3. `04_desarrollo.tex` (29K)
- **Razón de eliminación**: Contenido integrado en `03_propuesta_validacion.tex` (Sección 3.2 - Desarrollo de la Propuesta)
- **Contenido**: EDA, preprocesamiento, feature engineering, entrenamiento del modelo Random Forest
- **Fecha original**: Nov 19, 2024

### 4. `05_resultados.tex` (30K)
- **Razón de eliminación**: Contenido distribuido entre `02_diagnostico.tex` (resultados del diagnóstico) y `03_propuesta_validacion.tex` (Sección 3.3 - Validación)
- **Contenido**: Análisis de resultados, métricas de desempeño, validación del modelo
- **Fecha original**: Nov 20, 2024

## Estructura actual (después de limpieza)

### Archivos activos en `capitulos/`:
```
00_introduccion.tex          (5.8K)  - Introducción
00_perfil.tex               (44K)   - Perfil completo
02_marco_teorico.tex        (22K)   - Cap 1: Marco Teórico
02_diagnostico.tex          (63K)   - Cap 2: Diagnóstico
03_propuesta_validacion.tex (58K)   - Cap 3: Propuesta y Validación
06_conclusiones.tex         (42K)   - Conclusiones y Recomendaciones
```

## Notas importantes

- **Estos archivos NO se eliminaron permanentemente**: están respaldados en este directorio
- **La tesis compila correctamente** sin estos archivos (121 páginas en PDF)
- **Si necesitas recuperar contenido** de alguno de estos archivos, puedes consultarlos aquí
- **No se recomienda volver a integrarlos** ya que duplicarían contenido que ya existe en la estructura actual

## Próximos pasos (opcional)

Si después de varios meses no has necesitado estos archivos, puedes eliminar este directorio completo para reducir el tamaño del proyecto.

---
*Limpieza realizada por: Claude Code*
*Fecha: 24 de noviembre de 2025*
