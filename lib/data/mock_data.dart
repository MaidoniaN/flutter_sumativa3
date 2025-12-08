// lib/data/mock_data.dart

/// ARCHIVO DE DATOS SIMULADOS (MOCK DATA)
///
/// Este archivo actúa como una "Base de Datos en Memoria" temporal para el prototipo.
/// Su propósito es desacoplar el desarrollo de la interfaz (Frontend) del desarrollo
/// del servidor (Backend).
///
/// Estructuralmente, esta lista es idéntica al formato JSON que entregará Flask
/// en la siguiente etapa del proyecto.

// Definimos una variable global para simular persistencia mientras la app está abierta.
//
// Tipo de dato: List<Map<String, dynamic>>
// 1. List: Representa el array de objetos "[]".
// 2. Map<String, dynamic>: Representa cada objeto "{}" con claves de texto.
// 3. dynamic: Permite valores variados (enteros para ID, texto para descripción).

List<Map<String, dynamic>> tickets = [
  {
    'id': 1, // Simula la Primary Key de la base de datos
    'titulo': 'Falla de Impresora RRHH',
    'descripcion':
        'La impresora no conecta a la red wifi y parpadea una luz roja.',
    'estado':
        'Abierto', // Este campo controla la lógica visual (Colores/Iconos)
    'autor': 'Juan Perez',
    'fecha': '2025-12-01',
  },
  {
    'id': 2,
    'titulo': 'Instalar Python',
    'descripcion':
        'Necesito entorno de desarrollo configurado en mi equipo nuevo.',
    'estado': 'Cerrado',
    'autor': 'Ana Gomez',
    'fecha': '2025-12-02',
  },
  {
    'id': 3,
    'titulo': 'Pantalla Azul (BSOD)',
    'descripcion':
        'Mi laptop se reinicia sola cada vez que abro Excel. Error de memoria.',
    'estado': 'Abierto',
    'autor': 'Carlos Ruiz',
    'fecha': '2025-12-01',
  },
  {
    'id': 4,
    'titulo': 'Solicitud Acceso VPN',
    'descripcion':
        'Requiero credenciales para trabajar remoto este fin de semana.',
    'estado': 'Abierto',
    'autor': 'Maria Torres',
    'fecha': '2025-12-02',
  },
  {
    'id': 5,
    'titulo': 'Cambio de Mouse',
    'descripcion': 'El click izquierdo dejó de funcionar.',
    'estado': 'Cerrado',
    'autor': 'Pedro Lira',
    'fecha': '2025-12-03',
  },
];
