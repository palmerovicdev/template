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

# Función para reemplazar en archivos (macOS y Linux compatible)
replace_in_file() {
    local file="$1"
    local old="$2"
    local new="$3"

    if [ -f "$file" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/$old/$new/g" "$file"
        else
            sed -i "s/$old/$new/g" "$file"
        fi
        echo "✅ Actualizado: $file"
    fi
}

# 1. pubspec.yaml - nombre del paquete (minúsculas)
echo "📝 Actualizando pubspec.yaml..."
replace_in_file "pubspec.yaml" "^name: template$" "name: $NEW_NAME_LOWER"
replace_in_file "pubspec.yaml" "Template for my projects" "$NEW_NAME_TITLE for my projects"

# 2. Android - build.gradle.kts
echo ""
echo "📱 Actualizando Android..."
replace_in_file "android/app/build.gradle.kts" "namespace = \"com.palmerodev.template\"" "namespace = \"com.palmerodev.$NEW_NAME_LOWER\""
replace_in_file "android/app/build.gradle.kts" "applicationId = \"com.palmerodev.template\"" "applicationId = \"com.palmerodev.$NEW_NAME_LOWER\""
replace_in_file "android/app/build.gradle.kts" "resValue(\"string\", \"app_name\", \"Template Dev\")" "resValue(\"string\", \"app_name\", \"$NEW_NAME_TITLE Dev\")"
replace_in_file "android/app/build.gradle.kts" "resValue(\"string\", \"app_name\", \"Template Staging\")" "resValue(\"string\", \"app_name\", \"$NEW_NAME_TITLE Staging\")"
replace_in_file "android/app/build.gradle.kts" "resValue(\"string\", \"app_name\", \"Template Prod\")" "resValue(\"string\", \"app_name\", \"$NEW_NAME_TITLE Prod\")"

# 3. iOS - Info.plist
echo ""
echo "🍎 Actualizando iOS..."
replace_in_file "ios/Runner/Info.plist" "<string>template</string>" "<string>$NEW_NAME_LOWER</string>"

# 4. Web - manifest.json
echo ""
echo "🌐 Actualizando Web..."
replace_in_file "web/manifest.json" "\"name\": \"template\"" "\"name\": \"$NEW_NAME_LOWER\""
replace_in_file "web/manifest.json" "\"short_name\": \"template\"" "\"short_name\": \"$NEW_NAME_LOWER\""
replace_in_file "web/manifest.json" "\"description\": \"Template for my projects.\"" "\"description\": \"$NEW_NAME_TITLE for my projects.\""

# 5. i18n - archivos de traducción
echo ""
echo "🌍 Actualizando archivos de internacionalización..."
replace_in_file "lib/i18n/en.i18n.json" "Welcome to Template" "Welcome to $NEW_NAME_TITLE"
replace_in_file "lib/i18n/es.i18n.json" "Bienvenido a Template" "Bienvenido a $NEW_NAME_TITLE"

# 6. Archivos Dart - imports y referencias
echo ""
echo "🎯 Actualizando archivos Dart..."
find lib -name "*.dart" -type f | while read file; do
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Actualizar imports de package:template/
        sed -i '' "s/package:template\//package:$NEW_NAME_LOWER\//g" "$file"
        # Actualizar title: 'Template' en MaterialApp
        sed -i '' "s/title: 'Template'/title: '$NEW_NAME_TITLE'/g" "$file"
    else
        sed -i "s/package:template\//package:$NEW_NAME_LOWER\//g" "$file"
        sed -i "s/title: 'Template'/title: '$NEW_NAME_TITLE'/g" "$file"
    fi
done
echo "✅ Actualizados imports y referencias en archivos Dart"

# 7. Android - archivos Kotlin/Java
echo ""
echo "📱 Actualizando archivos Android (Kotlin/Java)..."
find android/app/src/main -name "*.kt" -o -name "*.java" | while read file; do
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "$file"
    else
        sed -i "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "$file"
    fi
done
echo "✅ Actualizados archivos Kotlin/Java"

# 8. Android - AndroidManifest.xml
echo ""
echo "📱 Actualizando AndroidManifest.xml..."
find android/app/src -name "AndroidManifest.xml" -type f | while read file; do
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "$file"
    else
        sed -i "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "$file"
    fi
done
echo "✅ Actualizados AndroidManifest.xml"

# 9. iOS - project.pbxproj (incluyendo variantes con sufijos)
echo ""
echo "🍎 Actualizando configuraciones iOS..."
if [ -f "ios/Runner.xcodeproj/project.pbxproj" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Bundle identifiers (preservando sufijos como .dev, .staging, .RunnerTests)
        sed -i '' "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "ios/Runner.xcodeproj/project.pbxproj"
        # APP_DISPLAY_NAME para cada flavor
        sed -i '' "s/APP_DISPLAY_NAME = \"Template Dev\"/APP_DISPLAY_NAME = \"$NEW_NAME_TITLE Dev\"/g" "ios/Runner.xcodeproj/project.pbxproj"
        sed -i '' "s/APP_DISPLAY_NAME = \"Template Staging\"/APP_DISPLAY_NAME = \"$NEW_NAME_TITLE Staging\"/g" "ios/Runner.xcodeproj/project.pbxproj"
        sed -i '' "s/APP_DISPLAY_NAME = \"Template Prod\"/APP_DISPLAY_NAME = \"$NEW_NAME_TITLE Prod\"/g" "ios/Runner.xcodeproj/project.pbxproj"
    else
        sed -i "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "ios/Runner.xcodeproj/project.pbxproj"
        sed -i "s/APP_DISPLAY_NAME = \"Template Dev\"/APP_DISPLAY_NAME = \"$NEW_NAME_TITLE Dev\"/g" "ios/Runner.xcodeproj/project.pbxproj"
        sed -i "s/APP_DISPLAY_NAME = \"Template Staging\"/APP_DISPLAY_NAME = \"$NEW_NAME_TITLE Staging\"/g" "ios/Runner.xcodeproj/project.pbxproj"
        sed -i "s/APP_DISPLAY_NAME = \"Template Prod\"/APP_DISPLAY_NAME = \"$NEW_NAME_TITLE Prod\"/g" "ios/Runner.xcodeproj/project.pbxproj"
    fi
    echo "✅ Actualizado project.pbxproj"
fi

# 10. Linux - CMakeLists.txt
if [ -f "linux/CMakeLists.txt" ]; then
    echo ""
    echo "🐧 Actualizando Linux..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/set(BINARY_NAME \"template\")/set(BINARY_NAME \"$NEW_NAME_LOWER\")/g" "linux/CMakeLists.txt"
        sed -i '' "s/set(APPLICATION_ID \"com.palmerodev.template\")/set(APPLICATION_ID \"com.palmerodev.$NEW_NAME_LOWER\")/g" "linux/CMakeLists.txt"
    else
        sed -i "s/set(BINARY_NAME \"template\")/set(BINARY_NAME \"$NEW_NAME_LOWER\")/g" "linux/CMakeLists.txt"
        sed -i "s/set(APPLICATION_ID \"com.palmerodev.template\")/set(APPLICATION_ID \"com.palmerodev.$NEW_NAME_LOWER\")/g" "linux/CMakeLists.txt"
    fi
    echo "✅ Actualizado CMakeLists.txt"
fi

# 11. Linux - my_application.cc
if [ -f "linux/runner/my_application.cc" ]; then
    echo ""
    echo "🐧 Actualizando my_application.cc..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/gtk_header_bar_set_title(header_bar, \"template\")/gtk_header_bar_set_title(header_bar, \"$NEW_NAME_TITLE\")/g" "linux/runner/my_application.cc"
        sed -i '' "s/gtk_window_set_title(window, \"template\")/gtk_window_set_title(window, \"$NEW_NAME_TITLE\")/g" "linux/runner/my_application.cc"
    else
        sed -i "s/gtk_header_bar_set_title(header_bar, \"template\")/gtk_header_bar_set_title(header_bar, \"$NEW_NAME_TITLE\")/g" "linux/runner/my_application.cc"
        sed -i "s/gtk_window_set_title(window, \"template\")/gtk_window_set_title(window, \"$NEW_NAME_TITLE\")/g" "linux/runner/my_application.cc"
    fi
    echo "✅ Actualizado my_application.cc"
fi

# 12. macOS - configuraciones
if [ -f "macos/Runner/Configs/AppInfo.xcconfig" ]; then
    echo ""
    echo "💻 Actualizando macOS..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/PRODUCT_NAME = template/PRODUCT_NAME = $NEW_NAME_LOWER/g" "macos/Runner/Configs/AppInfo.xcconfig"
        sed -i '' "s/PRODUCT_BUNDLE_IDENTIFIER = com.palmerodev.template/PRODUCT_BUNDLE_IDENTIFIER = com.palmerodev.$NEW_NAME_LOWER/g" "macos/Runner/Configs/AppInfo.xcconfig"
    else
        sed -i "s/PRODUCT_NAME = template/PRODUCT_NAME = $NEW_NAME_LOWER/g" "macos/Runner/Configs/AppInfo.xcconfig"
        sed -i "s/PRODUCT_BUNDLE_IDENTIFIER = com.palmerodev.template/PRODUCT_BUNDLE_IDENTIFIER = com.palmerodev.$NEW_NAME_LOWER/g" "macos/Runner/Configs/AppInfo.xcconfig"
    fi
    echo "✅ Actualizado AppInfo.xcconfig"
fi

if [ -f "macos/Runner.xcodeproj/project.pbxproj" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "macos/Runner.xcodeproj/project.pbxproj"
    else
        sed -i "s/com\.palmerodev\.template/com.palmerodev.$NEW_NAME_LOWER/g" "macos/Runner.xcodeproj/project.pbxproj"
    fi
    echo "✅ Actualizado project.pbxproj de macOS"
fi

# 13. Windows - CMakeLists.txt
if [ -f "windows/CMakeLists.txt" ]; then
    echo ""
    echo "🪟 Actualizando Windows..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/project(template LANGUAGES CXX)/project($NEW_NAME_LOWER LANGUAGES CXX)/g" "windows/CMakeLists.txt"
        sed -i '' "s/set(BINARY_NAME \"template\")/set(BINARY_NAME \"$NEW_NAME_LOWER\")/g" "windows/CMakeLists.txt"
    else
        sed -i "s/project(template LANGUAGES CXX)/project($NEW_NAME_LOWER LANGUAGES CXX)/g" "windows/CMakeLists.txt"
        sed -i "s/set(BINARY_NAME \"template\")/set(BINARY_NAME \"$NEW_NAME_LOWER\")/g" "windows/CMakeLists.txt"
    fi
    echo "✅ Actualizado CMakeLists.txt de Windows"
fi

# 14. Windows - main.cpp
if [ -f "windows/runner/main.cpp" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/window\.Create(L\"template\"/window.Create(L\"$NEW_NAME_TITLE\"/g" "windows/runner/main.cpp"
    else
        sed -i "s/window\.Create(L\"template\"/window.Create(L\"$NEW_NAME_TITLE\"/g" "windows/runner/main.cpp"
    fi
    echo "✅ Actualizado main.cpp de Windows"
fi

# 15. Windows - Runner.rc (con formato correcto incluyendo "\0")
if [ -f "windows/runner/Runner.rc" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' 's/VALUE "FileDescription", "template" "\\0"/VALUE "FileDescription", "'"$NEW_NAME_TITLE"'" "\\0"/g' "windows/runner/Runner.rc"
        sed -i '' 's/VALUE "InternalName", "template" "\\0"/VALUE "InternalName", "'"$NEW_NAME_LOWER"'" "\\0"/g' "windows/runner/Runner.rc"
        sed -i '' 's/VALUE "OriginalFilename", "template\.exe" "\\0"/VALUE "OriginalFilename", "'"$NEW_NAME_LOWER"'.exe" "\\0"/g' "windows/runner/Runner.rc"
        sed -i '' 's/VALUE "ProductName", "template" "\\0"/VALUE "ProductName", "'"$NEW_NAME_TITLE"'" "\\0"/g' "windows/runner/Runner.rc"
    else
        sed -i 's/VALUE "FileDescription", "template" "\\0"/VALUE "FileDescription", "'"$NEW_NAME_TITLE"'" "\\0"/g' "windows/runner/Runner.rc"
        sed -i 's/VALUE "InternalName", "template" "\\0"/VALUE "InternalName", "'"$NEW_NAME_LOWER"'" "\\0"/g' "windows/runner/Runner.rc"
        sed -i 's/VALUE "OriginalFilename", "template\.exe" "\\0"/VALUE "OriginalFilename", "'"$NEW_NAME_LOWER"'.exe" "\\0"/g' "windows/runner/Runner.rc"
        sed -i 's/VALUE "ProductName", "template" "\\0"/VALUE "ProductName", "'"$NEW_NAME_TITLE"'" "\\0"/g' "windows/runner/Runner.rc"
    fi
    echo "✅ Actualizado Runner.rc de Windows"
fi

# 16. Web - index.html
if [ -f "web/index.html" ]; then
    echo ""
    echo "🌐 Actualizando index.html..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/<meta name=\"description\" content=\"Template for my projects.\">/<meta name=\"description\" content=\"$NEW_NAME_TITLE for my projects.\">/g" "web/index.html"
        sed -i '' "s/<meta name=\"apple-mobile-web-app-title\" content=\"template\">/<meta name=\"apple-mobile-web-app-title\" content=\"$NEW_NAME_LOWER\">/g" "web/index.html"
        sed -i '' "s/<title>template<\/title>/<title>$NEW_NAME_TITLE<\/title>/g" "web/index.html"
    else
        sed -i "s/<meta name=\"description\" content=\"Template for my projects.\">/<meta name=\"description\" content=\"$NEW_NAME_TITLE for my projects.\">/g" "web/index.html"
        sed -i "s/<meta name=\"apple-mobile-web-app-title\" content=\"template\">/<meta name=\"apple-mobile-web-app-title\" content=\"$NEW_NAME_LOWER\">/g" "web/index.html"
        sed -i "s/<title>template<\/title>/<title>$NEW_NAME_TITLE<\/title>/g" "web/index.html"
    fi
    echo "✅ Actualizado index.html"
fi

# 17. README.md
if [ -f "README.md" ]; then
    echo ""
    echo "📖 Actualizando README.md..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/^# template$/# $NEW_NAME_TITLE/g" "README.md"
        sed -i '' "s/Template for my projects\./$NEW_NAME_TITLE for my projects./g" "README.md"
    else
        sed -i "s/^# template$/# $NEW_NAME_TITLE/g" "README.md"
        sed -i "s/Template for my projects\./$NEW_NAME_TITLE for my projects./g" "README.md"
    fi
    echo "✅ Actualizado README.md"
fi

# 18. Renombrar archivos .iml
echo ""
echo "📂 Renombrando archivos de proyecto..."
if [ -f "template.iml" ]; then
    mv "template.iml" "$NEW_NAME_LOWER.iml"
    echo "✅ Renombrado template.iml -> $NEW_NAME_LOWER.iml"
fi

if [ -f "android/template_android.iml" ]; then
    mv "android/template_android.iml" "android/${NEW_NAME_LOWER}_android.iml"
    echo "✅ Renombrado android/template_android.iml -> android/${NEW_NAME_LOWER}_android.iml"
fi

echo ""
echo "✨ ¡Renombrado completado!"
echo ""
echo "📋 Resumen de cambios:"
echo "   - Nombre del paquete: $NEW_NAME_LOWER"
echo "   - Bundle ID (Android/iOS/macOS): com.palmerodev.$NEW_NAME_LOWER"
echo "   - Nombre de la app: $NEW_NAME_TITLE"
echo ""
echo "📱 Plataformas actualizadas:"
echo "   ✅ Android (build.gradle.kts, Kotlin/Java, AndroidManifest.xml)"
echo "   ✅ iOS (Info.plist, project.pbxproj, APP_DISPLAY_NAME)"
echo "   ✅ macOS (AppInfo.xcconfig, project.pbxproj)"
echo "   ✅ Linux (CMakeLists.txt, my_application.cc)"
echo "   ✅ Windows (CMakeLists.txt, main.cpp, Runner.rc)"
echo "   ✅ Web (manifest.json, index.html)"
echo "   ✅ Archivos Dart (imports, main.dart title, etc.)"
echo "   ✅ i18n (en.i18n.json, es.i18n.json)"
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
