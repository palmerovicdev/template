# Flutter Template

Un template completo y profesional para comenzar proyectos Flutter multiplataforma creado por **Victor Palmero**.

Este template incluye una arquitectura limpia, configuración de flavors (dev/staging/prod), internacionalización, gestión de temas, autenticación completa con email/password, y todas las herramientas necesarias para comenzar un proyecto Flutter de forma rápida y eficiente.

## 🚀 Características

### 🏗️ Arquitectura y Calidad de Código
- ✅ **Arquitectura limpia** con separación de capas (features, core, domain)
- ✅ **Principios SOLID** implementados
- ✅ **Patrón Repository** para acceso a datos
- ✅ **Inyección de dependencias** con GetIt e Injectable
- ✅ **Estructura modular** para fácil escalabilidad
- ✅ **Código type-safe** con null safety

### 🎨 UI/UX
- ✅ **Material Design 3** (Material You)
- ✅ **Tema claro/oscuro** con soporte completo
- ✅ **Diseño responsivo** para todos los tamaños de pantalla
- ✅ **Animaciones personalizadas** y transiciones suaves
- ✅ **Snackbars animados** con efectos de fade y slide
- ✅ **Estados de carga** con indicadores personalizados
- ✅ **Validación de formularios** con feedback en tiempo real
- ✅ **Campos de entrada** con iconos personalizados y validación visual

### 🔐 Autenticación
- ✅ **Autenticación Email/Contraseña** completa
- ✅ **Validación de email** con regex
- ✅ **Validación de contraseña** (mínimo 6 caracteres)
- ✅ **Mostrar/ocultar contraseña** con toggle
- ✅ **Gestión segura de sesiones**
- ✅ **Auto-login** al reiniciar la app
- ✅ **Rutas protegidas** con guards de autenticación
- ✅ **Funcionalidad de logout**
- ✅ **Opción de "¿Olvidaste tu contraseña?"**
- ✅ **Enlace a registro** desde login

### 🌐 Internacionalización (i18n)
- ✅ **Soporte multi-idioma** (inglés, español)
- ✅ **Gestión fácil de traducciones** con archivos JSON
- ✅ **Código de traducción auto-generado**
- ✅ **Traducciones type-safe**

### 📦 Gestión de Estado
- ✅ **Patrón BLoC** para estado predecible
- ✅ **Arquitectura basada en eventos**
- ✅ **Actualizaciones reactivas de UI**
- ✅ **Manejo de errores** en el estado

### 🧭 Navegación
- ✅ **Enrutamiento declarativo** con GoRouter
- ✅ **Soporte de deep linking**
- ✅ **Guards de rutas** para autenticación
- ✅ **Navegación tipada** para type safety

### 🛠️ Herramientas de Desarrollo
- ✅ **Generación de código** para reducir boilerplate
- ✅ **Linting** con reglas estrictas
- ✅ **Configuración de entornos** (Dev, Staging, Prod)
- ✅ **Script automatizado de renombrado** para personalización de la app

### 📱 Soporte Multiplataforma
- ✅ **iOS** (iPhone, iPad)
- ✅ **Android** (teléfonos, tablets)
- ✅ **macOS** (escritorio)
- ✅ **Windows** (escritorio)
- ✅ **Linux** (escritorio)
- ✅ **Web** (Chrome, Firefox, Safari, Edge)

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

El script `rename_app.sh` actualiza automáticamente de forma recursiva:
- ✅ Nombre del paquete en `pubspec.yaml`
- ✅ Bundle IDs en Android, iOS y macOS
- ✅ Nombres de aplicación en todas las plataformas
- ✅ Referencias en archivos Dart
- ✅ Configuraciones de i18n
- ✅ Archivos de configuración de todas las plataformas
- ✅ README.md
- ✅ Todos los archivos en el proyecto (búsqueda recursiva)

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
├── core/                   # Código core compartido
│   ├── config/             # Configuración de la app
│   ├── di/                 # Inyección de dependencias
│   ├── env/                # Variables de entorno
│   ├── error/              # Manejo de errores
│   ├── router/             # Configuración de rutas
│   ├── theme/              # Temas y gestión de tema
│   ├── utils/              # Utilidades
│   └── widgets/            # Widgets reutilizables
├── features/               # Módulos de features
│   ├── auth/               # Feature de autenticación
│   │   ├── data/           # Capa de datos
│   │   ├── domain/         # Capa de dominio
│   │   └── presentation/   # Capa de presentación
│   │       ├── bloc/       # BLoC de autenticación
│   │       ├── pages/      # Páginas
│   │       └── sections/   # Secciones reutilizables
│   └── home/               # Feature de home
└── i18n/                   # Archivos de internacionalización
    ├── en.i18n.json        # Traducciones en inglés
    └── es.i18n.json        # Traducciones en español
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
   Text(t.email_hint) // "Email"
   ```

## 🎨 Gestión de Temas

El proyecto incluye gestión de temas claro/oscuro con soporte completo:

```dart
// Cambiar tema
context.read<ThemeBloc>().add(ChangeThemeEvent(AppThemeMode.dark));
```

**Características:**
- Tema claro y oscuro completamente configurados
- Colores consistentes en ambos temas
- Bordes, sombras y espaciados uniformes
- Soporte para Material Design 3
- Transiciones suaves entre temas

## 🔐 Sistema de Autenticación

El template incluye un sistema de autenticación completo:

**Características:**
- Login con email y contraseña
- Validación de email con regex
- Validación de contraseña (mínimo 6 caracteres)
- Toggle para mostrar/ocultar contraseña
- Indicadores visuales de error
- Mensajes de error claros
- Gestión de sesiones segura
- Auto-login al reiniciar
- Rutas protegidas
- Logout funcional

**Uso:**
```dart
// Login
context.read<AuthBloc>().add(
  SignInEvent(
    email: emailController.text,
    password: passwordController.text,
  ),
);

// Logout
context.read<AuthBloc>().add(SignOutEvent());
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

### Core
- **flutter_bloc**: Gestión de estado con BLoC
- **go_router**: Navegación declarativa
- **get_it + injectable**: Inyección de dependencias
- **slang**: Internacionalización type-safe

### UI
- **gap**: Espaciado fácil y consistente
- **iconic**: Iconos personalizados
- **flutter_svg**: Soporte para SVG

### Data
- **dio**: Cliente HTTP
- **dartz**: Programación funcional (Either type)
- **freezed**: Generación de código para modelos inmutables
- **json_serializable**: Serialización JSON

### Utils
- **envied**: Variables de entorno
- **flutter_secure_storage**: Almacenamiento seguro
- **logger**: Logging avanzado
- **equatable**: Igualdad de valores

## 🧪 Testing

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con cobertura
flutter test --coverage
```

## 📱 Plataformas Soportadas

- ✅ Android 5.0+ (API 21+)
- ✅ iOS 12.0+
- ✅ Web (Chrome, Firefox, Safari, Edge)
- ✅ Linux (Ubuntu, Fedora, Debian)
- ✅ macOS 10.14+
- ✅ Windows 10+

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
- El script de renombrado busca recursivamente en toda la carpeta y subcarpetas

## 🎨 Componentes UI Incluidos

- **InputFormField**: Campo de entrada con validación y estilos personalizados
- **AnimatedIcon**: Iconos con animaciones de fade
- **Custom Snackbars**: Snackbars con animaciones de entrada y salida
- **Loading States**: Indicadores de carga personalizados
- **Form Validation**: Validación de formularios con feedback visual

## 👤 Autor

**Victor Palmero**

Template creado para facilitar el inicio de nuevos proyectos Flutter con una arquitectura sólida, mejores prácticas y componentes UI profesionales.

## 📄 Licencia

Este template es de uso libre para proyectos personales y comerciales.

---

**¿Necesitas ayuda?** Revisa la documentación de Flutter en [flutter.dev](https://flutter.dev) o el archivo FEATURES.md para más detalles sobre las funcionalidades.
