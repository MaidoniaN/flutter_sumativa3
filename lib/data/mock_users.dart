// lib/data/mock_users.dart

/// ARCHIVO DE USUARIOS SIMULADOS (MOCK USERS)
///
/// Simula la tabla de 'Usuarios' de una base de datos.
/// Se utiliza exclusivamente para validar la lógica de la pantalla de Login
/// antes de tener la autenticación real conectada al Backend Flask.

// Definimos la lista como 'final' porque en este prototipo no vamos a
// registrar usuarios nuevos, solo leeremos los existentes.
final List<Map<String, String>> mockUsers = [
  {
    // Simulación de columnas de la tabla de base de datos
    "username": "soporte1",

    // NOTA DE SEGURIDAD ACADÉMICA:
    // En un entorno de producción real, las contraseñas NUNCA se guardan
    // en texto plano. Se guardarían como un HASH en la base de datos.
    // Para este prototipo de baja/alta fidelidad, usamos texto plano
    // para facilitar las pruebas de ingreso.
    "password": "password1",

    "nombre":
        "Técnico Nivel 1", // Dato extra para personalizar la UI si fuera necesario
  },
  {"username": "soporte2", "password": "password2", "nombre": "Supervisor TI"},
];
