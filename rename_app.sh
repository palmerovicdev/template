#!/bin/bash

# Script para renombrar la app de "template" a un nuevo nombre
# Uso: ./rename_app.sh "Nuevo Nombre"

set -e  # Detener el script si hay algún error

# Verificar que se proporcionó un nombre
if [ -z "$1" ]; then
    echo "❌ Error: Debes proporcionar un nombre para la app"
    echo "Uso: ./rename_app.sh \"Nuevo Nombre\""
    exit 1
fi

NEW_NAME="$1"
NEW_NAME_LOWER=$(echo "$NEW_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
NEW_NAME_TITLE=$(echo "$NEW_NAME" | sed 's/\b\(.\)/\u\1/g')  # Title case
NEW_NAME_UPPER=$(echo "$NEW_NAME" | tr '[:lower:]' '[:upper:]')

echo "🚀 Renombrando app de 'template' a '$NEW_NAME'"
echo "   - Nombre normal: $NEW_NAME"
echo "   - Minúsculas (sin espacios): $NEW_NAME_LOWER"
echo "   - Title case: $NEW_NAME_TITLE"
echo ""

# Obtener el directorio del script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Función para reemplazar recursivamente en archivos
replace_recursive() {
    local pattern="$1"
    local replacement="$2"
    local file_pattern="$3"

    echo "🔍 Buscando '$pattern' en archivos $file_pattern..."

    find . -type f -name "$file_pattern" ! -path "./.git/*" ! -path "./build/*" ! -path "./.dart_tool/*" ! -path "*/.idea/*" | while read file; do
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/$pattern/$replacement/g" "$file"
        else
            sed -i "s/$pattern/$replacement/g" "$file"
        fi
        echo "   ✅ $file"
    done
}

# Función para reemplazar con regex más compleja
replace_recursive_regex() {
    local pattern="$1"
    local replacement="$2"
    local file_pattern="$3"

    echo "🔍 Buscando '$pattern' en archivos $file_pattern..."

    find . -type f -name "$file_pattern" ! -path "./.git/*" ! -path "./build/*" ! -path "./.dart_tool/*" ! -path "*/.idea/*" | while read file; do
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' -E "$pattern" "$file"
        else
            sed -i -r "$pattern" "$file"
        fi
        echo "   ✅ $file"
    done
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 REEMPLAZOS AUTOMÁTICOS RECURSIVOS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 1. Reemplazar "template" (minúsculas) en todos los archivos
echo "1️⃣  Reemplazando 'template' → '$NEW_NAME_LOWER'"
replace_recursive "template" "$NEW_NAME_LOWER" "*"
echo ""

# 2. Reemplazar "Template" (Title case) en todos los archivos
echo "2️⃣  Reemplazando 'Template' → '$NEW_NAME_TITLE'"
replace_recursive "Template" "$NEW_NAME_TITLE" "*"
echo ""

# 3. Reemplazar "TEMPLATE" (mayúsculas) en todos los archivos
echo "3️⃣  Reemplazando 'TEMPLATE' → '$NEW_NAME_UPPER'"
replace_recursive "TEMPLATE" "$NEW_NAME_UPPER" "*"
echo ""

# 4. Reemplazos específicos para package names (com.palmerodev.template)
echo "4️⃣  Reemplazando 'com.palmerodev.template' → 'com.palmerodev.$NEW_NAME_LOWER'"
replace_recursive "com\.palmerodev\.template" "com.palmerodev.$NEW_NAME_LOWER" "*"
echo ""

# 5. Reemplazos específicos para package:template/
echo "5️⃣  Reemplazando 'package:template/' → 'package:$NEW_NAME_LOWER/'"
replace_recursive "package:template/" "package:$NEW_NAME_LOWER/" "*.dart"
echo ""

# 6. Reemplazos específicos para nombres de app con espacios
echo "6️⃣  Reemplazando 'Template Dev' → '$NEW_NAME_TITLE Dev'"
replace_recursive "Template Dev" "$NEW_NAME_TITLE Dev" "*"
echo ""

echo "7️⃣  Reemplazando 'Template Staging' → '$NEW_NAME_TITLE Staging'"
replace_recursive "Template Staging" "$NEW_NAME_TITLE Staging" "*"
echo ""

echo "8️⃣  Reemplazando 'Template Prod' → '$NEW_NAME_TITLE Prod'"
replace_recursive "Template Prod" "$NEW_NAME_TITLE Prod" "*"
echo ""

# 9. Renombrar archivos .iml
echo "9️⃣  Renombrando archivos de proyecto..."
if [ -f "template.iml" ]; then
    mv "template.iml" "$NEW_NAME_LOWER.iml"
    echo "   ✅ template.iml → $NEW_NAME_LOWER.iml"
fi

if [ -f "android/template_android.iml" ]; then
    mv "android/template_android.iml" "android/${NEW_NAME_LOWER}_android.iml"
    echo "   ✅ android/template_android.iml → android/${NEW_NAME_LOWER}_android.iml"
fi

echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✨ ¡Renombrado completado!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Resumen de cambios:"
echo "   - Nombre del paquete: $NEW_NAME_LOWER"
echo "   - Bundle ID (Android/iOS/macOS): com.palmerodev.$NEW_NAME_LOWER"
echo "   - Nombre de la app: $NEW_NAME_TITLE"
echo ""
echo "📁 Archivos modificados:"
echo "   ✅ Todos los archivos en el proyecto (recursivo)"
echo "   ✅ Archivos Dart (*.dart)"
echo "   ✅ Configuraciones Android (*.gradle.kts, *.kt, *.java, AndroidManifest.xml)"
echo "   ✅ Configuraciones iOS (*.plist, *.pbxproj)"
echo "   ✅ Configuraciones macOS (*.xcconfig, *.pbxproj)"
echo "   ✅ Configuraciones Linux (CMakeLists.txt, *.cc)"
echo "   ✅ Configuraciones Windows (CMakeLists.txt, *.cpp, *.rc)"
echo "   ✅ Configuraciones Web (manifest.json, index.html)"
echo "   ✅ Archivos i18n (*.i18n.json)"
echo "   ✅ README.md"
echo "   ✅ Archivos .iml renombrados"
echo ""
echo "🔧 Pasos recomendados después:"
echo "   1. Ejecuta: flutter clean"
echo "   2. Ejecuta: flutter pub get"
echo "   3. Ejecuta: dart run build_runner build --delete-conflicting-outputs"
echo "      (para regenerar archivos i18n y otros generados)"
echo "   4. Reconstruye la app para cada plataforma"
echo ""
echo "⚠️  Nota: Si usas Git, verifica los cambios con: git status"

echo "⚠️  Nota: Los reemplazos son automáticos y recursivos en toda la carpeta"
echo "⚠️  Nota: Se excluyen carpetas: .git, build, .dart_tool, .idea"
