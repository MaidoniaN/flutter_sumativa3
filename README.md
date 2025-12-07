# ServiceDesk Lite - Prototipo de Gestión de Tickets 🛠️

Este proyecto es un prototipo de **Alta Fidelidad Funcional** desarrollado en **Flutter**. Simula una aplicación móvil para mesas de ayuda (Help Desk), permitiendo a los técnicos visualizar, crear y gestionar incidencias de soporte.

El objetivo de esta etapa (Sumativa 3) es validar el flujo de navegación (UX/UI) y la lógica de estado local, preparando la arquitectura para una futura integración con un backend en **Flask**.

## 📋 Características Principales

* **Autenticación Simulada:** Validación de credenciales contra un registro de usuarios local.
* **Listado de Tickets:** Visualización de incidencias con indicadores de estado, prioridad y fecha de creación.
* **Gestión de Estados:** Capacidad de cerrar tickets, con actualización inmediata en la interfaz.
* **Creación de Tickets:** Formulario funcional con generación automática de fecha y ID.
* **Navegación Asíncrona:** Refresco automático de listados tras acciones de usuario.

## ⚙️ Requisitos Previos

Antes de clonar el proyecto, asegúrate de tener instalado el siguiente software en tu equipo:

1.  **Visual Studio Code (Recomendado):** El entorno de desarrollo principal. [Descargar VS Code](https://code.visualstudio.com/)
    * *Extensión recomendada:* Instalar las extensiones "Flutter" y "Dart" dentro de VS Code.
2.  **Android Studio:** Necesario para compilar en Android y utilizar el Emulador virtual. [Descargar Android Studio](https://developer.android.com/studio)
3.  **Flutter SDK:** El framework de desarrollo.
    * 📥 **Descarga oficial:** Para descargar e instalar Flutter según tu sistema operativo, dirígete al sitio oficial: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

## 🔐 Credenciales de Prueba (Demo)

Para probar la aplicación, utilice cualquiera de los siguientes usuarios configurados en `mock_users.dart`:

| Usuario | Contraseña | Rol |
| :--- | :--- | :--- |
| **soporte1** | `password1` | Técnico Nivel 1 |
| **soporte2** | `password2` | Supervisor TI |

> **Nota:** En este prototipo, las contraseñas se almacenan en texto plano solo para fines de demostración académica.

## 🚀 Instalación y Ejecución en VS Code

Sigue estos pasos para poner en marcha el proyecto:

1.  **Clonar el repositorio:**
    Abre tu terminal (Git Bash, PowerShell o CMD) y ejecuta:
    ```bash
    git clone [https://github.com/MaidoniaN/flutter_sumativa3.git](https://github.com/MaidoniaN/flutter_sumativa3.git)
    ```

2.  **Abrir el proyecto:**
    * Abre **Visual Studio Code**.
    * Ve a `File` > `Open Folder...` (Archivo > Abrir Carpeta).
    * Selecciona la carpeta `flutter_sumativa3` que se acaba de descargar.

3.  **Instalar dependencias:**
    Abre la terminal integrada de VS Code (`Ctrl + ñ` o `Ver > Terminal`) y ejecuta:
    ```bash
    flutter pub get
    ```

4.  **Ejecutar la aplicación:**
    * Asegúrate de tener un emulador Android corriendo o tu celular conectado por USB.
    * Presiona `F5` para iniciar la depuración o ejecuta en la terminal:
    ```bash
    flutter run
    ```

## 📂 Estructura del Proyecto

El código ha sido modularizado para facilitar la mantenibilidad y la futura conexión a API:

```text
lib/
├── data/
│   ├── mock_data.dart    # Simulación de BD (Tickets en formato JSON)
│   └── mock_users.dart   # Simulación de tabla de Usuarios
├── screens/
│   ├── login_screen.dart        # Pantalla de acceso
│   ├── ticket_list_screen.dart  # Dashboard principal
│   ├── ticket_detail_screen.dart # Vista detallada y cierre de ticket
│   └── create_ticket_screen.dart # Formulario de nuevo ticket
└── main.dart             # Configuración global y Tema
```

## ✒️ Autores
### Grupo 1 - Integrantes

- **Alonso Cid R.**
- **Scarlett Espinoza C.**
- **Christian Mattioni A.**

## Universidad Andres Bello
### Carrera: Ingeniería Civil en Informática
### Curso: Taller de Programacion Web APTC106

#### Proyecto desarrollado con fines académicos - 2025
