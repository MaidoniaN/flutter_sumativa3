# flutter_sumativa3

A new Flutter project.
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
