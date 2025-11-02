# 🚀 INSTRUCCIONES DE INSTALACIÓN - LaTeX + Cursor

## ⚠️ IMPORTANTE: Ejecuta estos comandos en tu Terminal

### Paso 1: Instalar BasicTeX

Abre tu **Terminal** (no Cursor) y ejecuta:

```bash
brew install --cask basictex
```

Te pedirá tu contraseña de administrador. Espera a que termine la instalación.

---

### Paso 2: Actualizar PATH

Después de instalar, ejecuta:

```bash
eval "$(/usr/libexec/path_helper)"
```

---

### Paso 3: Verificar Instalación

```bash
pdflatex --version
```

Deberías ver algo como:
```
pdfTeX 3.141592653-2.6-1.40.25 (TeX Live 2025)
```

---

### Paso 4: Instalar Paquetes LaTeX

Navega a la carpeta de la tesis:

```bash
cd "/Users/eidan/Documentation/Personal/Master/Perfil/Tesis-Latex"
```

Ejecuta el script de instalación:

```bash
./setup_latex_packages.sh
```

**NOTA:** Este paso tomará 10-15 minutos. Te pedirá tu contraseña varias veces.

---

### Paso 5: Abrir en Cursor

```bash
cursor .
```

O simplemente abre Cursor y selecciona la carpeta `Tesis-Latex`.

---

### Paso 6: Compilar

1. Abre el archivo `main.tex` en Cursor
2. Presiona `Cmd + Alt + B` para compilar
3. Si todo está bien, se generará `main.pdf`

---

## ✅ Checklist de Instalación

- [ ] BasicTeX instalado
- [ ] PATH actualizado
- [ ] `pdflatex --version` funciona
- [ ] Paquetes LaTeX instalados
- [ ] Cursor abierto en el proyecto
- [ ] LaTeX Workshop activado en Cursor
- [ ] Primera compilación exitosa

---

## 🐛 Si algo falla...

### Error: "brew: command not found"
Instala Homebrew primero:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Error: "pdflatex: command not found" después de instalar
Cierra y vuelve a abrir la Terminal, luego:
```bash
eval "$(/usr/libexec/path_helper)"
```

### Error al compilar: "Package XXX not found"
```bash
sudo tlmgr install XXX
```

Reemplaza XXX con el nombre del paquete.

---

## 📞 ¿Necesitas ayuda?

Si encuentras errores durante la instalación, copia el mensaje de error completo y consulta.

---

**¡Listo para empezar! 🎓**
