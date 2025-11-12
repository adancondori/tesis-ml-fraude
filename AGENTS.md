# Repository Guidelines

## Project Structure & Module Organization
- `main.tex` orients the build; adjust metadata in `config/informacion.tex` and packages in `config/paquetes.tex` before editing chapters.
- Place chapter content in `capitulos/NN_titulo.tex`; keep the numeric prefix zero-padded to preserve compilation order.
- Store citations in `bibliografia/referencias.bib`, media under `imagenes/<categoria>/`, and reusable tables in `tablas/`.
- Append supplementary material in `apendices/` and commit demonstrative scripts or notebooks to `codigo/` with brief README notes.

## Build, Test, and Development Commands
- `latexmk -pdf main.tex` — incremental build that reruns `pdflatex`/`biber` as needed; default for daily work.
- `pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex` — full rebuild ensuring bibliography sync before deliveries.
- `./verificar_instalacion.sh` — sanity-checks the local LaTeX toolchain after package updates.
- `rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.bcf *.run.xml *.fls *.fdb_latexmk *.synctex.gz` — hard reset for stubborn build errors.

## Coding Style & Naming Conventions
- Indent environments with two spaces and wrap text near 100 characters to keep diffs readable.
- Use descriptive, lowercase snake_case for assets (`imagenes/diagramas/modelo_fraude_flow.pdf`) and uppercase scoped labels (`\label{fig:RESULTADOS_CASO1}`).
- Centralize new macros in `config/comandos.tex`; avoid redefining built-ins inline.
- Prefer semantic sectioning (`\section`, `\subsection`) over manual spacing commands.

## Testing Guidelines
- Every change must compile via `latexmk -pdf main.tex` without errors; treat new warnings as blockers.
- After editing citations or glossary entries, rerun `biber main` and inspect `main.log` for unresolved references.
- Review the generated `main.pdf` for TOC, list of figures, and numbering regressions before sharing drafts.
- Capture screenshots or cite page numbers when reporting layout issues to streamline review.

## Commit & Pull Request Guidelines
- Write commit subjects in imperative mood (`git commit -m "Add confusion matrix appendix"`) and limit scope to one logical change set.
- Reference touched files in commit bodies (`capitulos/04_desarrollo.tex`, `imagenes/graficos/roc_curve.pdf`) for easier auditing.
- Pull requests should summarize intent, note build status (`latexmk` result), and attach the updated `main.pdf` or key figure diffs.
- Link related tasks from `Tareas/` and flag open questions or pending approvals before requesting review.
