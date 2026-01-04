# Flutter Template

Un template completo y profesional para comenzar proyectos Flutter multiplataforma creado por **Victor Palmero**.

Este template incluye una arquitectura limpia, configuración de flavors (dev/staging/prod), internacionalización, gestión de temas, y todas las herramientas necesarias para comenzar un proyecto Flutter de forma rápida y eficiente.

## 🚀 Características

- ✅ **Arquitectura limpia** con separación de capas (features, core, domain)
- ✅ **Gestión de estado** con BLoC pattern
- ✅ **Navegación** con GoRouter
- ✅ **Inyección de dependencias** con GetIt e Injectable
- ✅ **Internacionalización** (i18n) con Slang (soporte para inglés y español)
- ✅ **Gestión de temas** (claro/oscuro) con BLoC
- ✅ **Manejo de errores** centralizado
- ✅ **Configuración de flavors** (dev, staging, prod) para todas las plataformas
- ✅ **Variables de entorno** con Envied
- ✅ **Almacenamiento seguro** con Flutter Secure Storage
- ✅ **Networking** con Dio
- ✅ **Análisis de código** con Very Good Analysis
- ✅ **Multiplataforma**: Android, iOS, Web, Linux, macOS, Windows

## 📋 Requisitos Previos

- Flutter SDK (versión 3.10.0 o superior)
- Dart SDK (versión 3.10.0 o superior)
- Android Studio / VS Code con extensiones de Flutter
- Xcode (para desarrollo iOS/macOS)
- CocoaPods (para iOS)

## 🛠️ Instalación

1. **Clona este repositorio**:
   ```bash
   git clone <url-del-repositorio>
   cd template
   ```

2. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Genera los archivos necesarios**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## 🎯 Uso del Template

### Renombrar el Proyecto

Este template incluye un script automatizado para renombrar toda la aplicación de "template" a tu nombre de proyecto:

```bash
./rename_app.sh "Mi Nueva App"
```

**¿Qué hace el script?**

El script `rename_app.sh` actualiza automáticamente:
- ✅ Nombre del paquete en `pubspec.yaml`
- ✅ Bundle IDs en Android, iOS y macOS
- ✅ Nombres de aplicación en todas las plataformas
- ✅ Referencias en archivos Dart
- ✅ Configuraciones de i18n
- ✅ Archivos de configuración de todas las plataformas
- ✅ README.md

**Ejemplo de uso:**

```bash
# Dar permisos de ejecución (solo la primera vez)
chmod +x rename_app.sh

# Renombrar el proyecto
./rename_app.sh "Mi App"

# Seguir las instrucciones que aparecen al final
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Estructura del Proyecto

```
lib/
├── bloc_init.dart          # Inicialización de BLoCs
├── main.dart               # Punto de entrada de la aplicación
├── core/                   # Código core compartido
│   ├── di/                 # Inyección de dependencias
│   ├── env/                # Variables de entorno
│   ├── error/              # Manejo de errores
│   ├── router/             # Configuración de rutas
│   ├── theme/              # Temas y gestión de tema
│   └── utils/              # Utilidades
├── features/               # Módulos de features
│   ├── auth/               # Feature de autenticación
│   ├── home/               # Feature de home
│   └── splash_page.dart    # Página de splash
└── i18n/                   # Archivos de internacionalización
    ├── en.i18n.json        # Traducciones en inglés
    ├── es.i18n.json        # Traducciones en español
    └── strings.g.dart      # Archivos generados
```

## 🏗️ Configuración de Flavors

El proyecto está configurado con tres flavors:

- **dev**: Entorno de desarrollo
- **staging**: Entorno de pruebas/staging
- **prod**: Entorno de producción

### Ejecutar con un flavor específico

**Android:**
```bash
flutter run --flavor dev --dart-define=FLAVOR=dev -t lib/main.dart
flutter run --flavor staging --dart-define=FLAVOR=staging -t lib/main.dart
flutter run --flavor prod --dart-define=FLAVOR=prod -t lib/main.dart
```

**iOS:**
```bash
flutter run --flavor dev --dart-define=FLAVOR=dev -t lib/main.dart
flutter run --flavor staging --dart-define=FLAVOR=staging -t lib/main.dart
flutter run --flavor prod --dart-define=FLAVOR=prod -t lib/main.dart
```

### Build para producción

**Android:**
```bash
flutter build apk --flavor prod --dart-define=FLAVOR=prod --release
flutter build appbundle --flavor prod --dart-define=FLAVOR=prod --release
```

**iOS:**
```bash
flutter build ios --flavor prod --dart-define=FLAVOR=prod --release
```

## 🌍 Internacionalización

El proyecto usa [Slang](https://pub.dev/packages/slang) para la internacionalización.

### Agregar nuevas traducciones

1. Edita los archivos JSON en `lib/i18n/`:
   - `en.i18n.json` para inglés
   - `es.i18n.json` para español

2. Regenera los archivos:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. Usa las traducciones en tu código:
   ```dart
   import 'package:template/i18n/strings.g.dart';
   
   Text(t.auth_title) // "Welcome to Template"
   ```

## 🎨 Gestión de Temas

El proyecto incluye gestión de temas claro/oscuro usando BLoC:

```dart
// Cambiar tema
context.read<ThemeBloc>().add(ChangeThemeEvent(AppThemeMode.dark));
```

## 🔐 Variables de Entorno

El proyecto usa [Envied](https://pub.dev/packages/envied) para gestionar variables de entorno de forma segura.

1. Crea un archivo `.env` en la raíz del proyecto
2. Define tus variables en `lib/core/env/env.dart`
3. Regenera los archivos:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## 📦 Dependencias Principales

- **flutter_bloc**: Gestión de estado
- **go_router**: Navegación
- **get_it + injectable**: Inyección de dependencias
- **slang**: Internacionalización
- **dio**: Cliente HTTP
- **freezed**: Generación de código para modelos inmutables
- **envied**: Variables de entorno
- **flutter_secure_storage**: Almacenamiento seguro

## 🧪 Testing

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con cobertura
flutter test --coverage
```

## 📱 Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Linux
- ✅ macOS
- ✅ Windows

## 🔧 Comandos Útiles

```bash
# Limpiar el proyecto
flutter clean

# Obtener dependencias
flutter pub get

# Generar archivos (i18n, freezed, injectable, etc.)
dart run build_runner build --delete-conflicting-outputs

# Analizar el código
flutter analyze

# Formatear el código
dart format .

# Verificar el código
flutter doctor
```

## 📝 Notas Importantes

- Después de renombrar el proyecto, asegúrate de ejecutar `flutter clean` y `flutter pub get`
- Los archivos generados (`*.g.dart`) se regeneran automáticamente con `build_runner`
- Para iOS, ejecuta `pod install` en la carpeta `ios/` después de clonar
- Configura tus variables de entorno antes de ejecutar la app

## 👤 Autor

**Victor Palmero**

Template creado para facilitar el inicio de nuevos proyectos Flutter con una arquitectura sólida y mejores prácticas.

## 📄 Licencia

Este template es de uso libre para proyectos personales y comerciales.

---

**¿Necesitas ayuda?** Revisa la documentación de Flutter en [flutter.dev](https://flutter.dev)
