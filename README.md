# ServiceDesk Lite - Prototipo de Gestión de Tickets 🛠️

Este proyecto es un prototipo de **Alta Fidelidad Funcional** desarrollado en **Flutter**. Simula una aplicación móvil para mesas de ayuda (Help Desk), permitiendo a los técnicos visualizar, crear y gestionar incidencias de soporte.

El objetivo de esta etapa es validar el flujo de navegación (UX/UI) y la lógica de estado local, preparando la arquitectura para una futura integración con un backend en **Flask**.

## 📋 Características Principales

* **Autenticación Simulada:** Validación de credenciales contra un registro de usuarios local.
* **Listado de Tickets:** Visualización de incidencias con indicadores de estado (Abierto/Cerrado) y fecha.
* **Gestión de Estados:** Capacidad de cerrar tickets, con actualización inmediata en la interfaz.
* **Creación de Tickets:** Formulario funcional con generación automática de fecha y ID.
* **Navegación Asíncrona:** Uso de `Navigator` y `await` para refrescar listados tras acciones de usuario.

## 🔐 Credenciales de Prueba (Demo)

Para probar la aplicación, utilice cualquiera de los siguientes usuarios configurados en `mock_users.dart`:

| Usuario | Contraseña | Rol |
| :--- | :--- | :--- |
| **soporte1** | `password1` | Técnico Nivel 1 |
| **soporte2** | `password2` | Supervisor TI |

> **Nota:** En este prototipo, las contraseñas se almacenan en texto plano solo para fines de demostración académica.

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

🚀 Instalación y Ejecución
Este proyecto requiere tener instalado el Flutter SDK.

Clonar el repositorio:

Bash

git clone [https://github.com/TU_USUARIO/service-desk-flutter.git](https://github.com/TU_USUARIO/service-desk-flutter.git)
cd service-desk-flutter
Obtener dependencias:

Bash

flutter pub get
Ejecutar la aplicación: Selecciona tu emulador o dispositivo y corre:

Bash

flutter run
🔮 Próximos Pasos (Roadmap)
Este prototipo está diseñado para evolucionar. La siguiente fase de desarrollo incluye:

[ ] Reemplazo de mock_data.dart por servicios HTTP (http package).

[ ] Conexión a Backend desarrollado en Python (Flask).

[ ] Implementación de persistencia real en Base de Datos.

✒️ Autor
[Tu Nombre Completo] - Desarrollo y Diseño - [Tu Link a LinkedIn opcional]

Curso: Ingeniería Civil en Informática - [Nombre de la Asignatura]

Proyecto desarrollado con fines académicos - 2025


### Consejos para este README:

1.  **Personalízalo:** Donde dice `[Tu Nombre Completo]`, `[Tu Link a LinkedIn]` y `[Nombre de la Asignatura]`, pon tus datos reales. También cambia la URL del `git clone` por la tuya.
2.  **La tabla de credenciales:** Es lo más útil para el profesor. Le ahorras tener que buscar en el código cómo entrar.
3.  **La estructura:** Muestra que no tiraste todo el código en un solo archivo, sino que pensaste en una arquitectura.

Una vez creado el archivo, no olvides hacer el commit y push:

```bash
git add README.md
git commit -m "Agregado README con documentacion del proyecto"
git push
```
