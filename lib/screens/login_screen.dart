// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
// Importamos los datos falsos para validar usuario/contraseña
import '../data/mock_users.dart';
// Importamos la pantalla de destino para navegar si el login es exitoso
import 'ticket_list_screen.dart';

/// Pantalla de Autenticación.
/// Es un StatefulWidget porque, aunque la UI parece estática, necesitamos manejar
/// el estado de los controladores de texto y el contexto para mostrar mensajes (SnackBars).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // --- GESTIÓN DE ESTADO (INPUTS) ---
  // Los TextEditingController son los "puentes" entre la interfaz visual y la lógica.
  // Nos permiten leer lo que el usuario escribió en el momento que queramos.
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  /// Función principal que contiene la lógica de validación
  void _login() {
    // 1. Captura y Limpieza:
    // .trim() es VITAL en móviles. A veces el teclado agrega un espacio al final
    // por el autocompletar. Si no lo quitamos, "admin " no es igual a "admin".
    String inputUser = userController.text.trim();
    String inputPass = passController.text.trim();

    // 2. Validación contra la "Base de Datos" (Lista en memoria):
    // Usamos el método funcional .any().
    // Recorre la lista 'mockUsers' y devuelve TRUE si encuentra AL MENOS UN usuario
    // que coincida tanto en username como en password.
    bool credencialesValidas = mockUsers.any(
      (user) => user['username'] == inputUser && user['password'] == inputPass,
    );

    // 3. Toma de decisión:
    if (credencialesValidas) {
      // CASO ÉXITO:
      // Usamos pushReplacement en lugar de push.
      // ¿Por qué? Porque al loguearse, NO queremos que el usuario pueda volver
      // a la pantalla de Login presionando el botón "Atrás" de Android.
      // Esto "mata" la pantalla de Login y pone la lista encima.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TicketListScreen()),
      );
    } else {
      // CASO ERROR:
      // Mostramos un SnackBar (mensaje flotante inferior).
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Usuario o contraseña incorrectos"),
          backgroundColor:
              Colors.red.shade800, // Rojo oscuro para indicar error/peligro
          behavior: SnackBarBehavior
              .floating, // Flota sobre el contenido en vez de pegarse al borde
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Center: Centra el contenido vertical y horizontalmente
      body: Center(
        // SingleChildScrollView: ES CRÍTICO EN PANTALLAS DE LOGIN.
        // Cuando el usuario toca un input, el teclado virtual sube y ocupa la mitad de la pantalla.
        // Si no tienes scroll, Flutter lanzará un error de "Overflow" (rayas amarillas y negras)
        // porque no cabe el contenido. Esto permite hacer scroll si falta espacio.
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alineación vertical
            children: [
              // --- LOGO Y TÍTULOS ---
              const Icon(Icons.support_agent, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              const Text(
                'ServiceDesk Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Prototipo v1.0',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // --- FORMULARIO ---

              // Input de Usuario
              TextField(
                controller: userController, // Conectamos el controlador
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border:
                      OutlineInputBorder(), // Borde cuadrado estilo Material
                  prefixIcon: Icon(Icons.person), // Icono a la izquierda
                  hintText: 'Ej: soporte1', // Texto de ayuda fantasma
                ),
              ),
              const SizedBox(height: 15),

              // Input de Contraseña
              TextField(
                controller: passController,
                obscureText:
                    true, // ESTO ES IMPORTANTE: Convierte el texto en puntos (••••)
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),

              // --- BOTÓN DE ACCIÓN ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ), // Ancho máximo posible
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed:
                    _login, // Al presionar, ejecuta la función _login definida arriba
                child: const Text('INGRESAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
